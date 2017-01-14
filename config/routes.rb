Rails.application.routes.draw do
  devise_for :clients, controllers: {
          registrations: 'clients/registrations'
        }

  devise_for :users
        
 
  get 'companies/index'
  get 'mytrucks' => 'trucks#mytrucks'


  resources :trucks
  resources :companies
  resources :products
  

  resources :products, only: [:index, :show] do
    resources :requests, only: [:create]
  end

  resources :requests, except: [:create]
  root 'products#index'

 # devise_for :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
