require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/apartments/new' do
  erb :"apartments/new"

end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"

end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end


delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments")
end
