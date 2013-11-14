"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable vi fallback
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme jellybeans

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin on
" Tabs
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
" Indents
set autoindent
set smartindent
" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
" Color overides
hi LineNr ctermfg=15
hi LineNr ctermbg=235
" Status line
set statusline=
set statusline +=%F%m%r%h%w%<\         "full path
set statusline +=%h%=[type=%Y]\        "file type
set statusline +=%h%=[%p%%]\           "file %
set statusline +=%h%=%l%*              "curr line
set statusline +=%h/%L%*               "tot  lines
set statusline +=%h%=\ [col=%c]\       "column number
set laststatus=2
" Others
set number
set autoread
set cursorline
set pastetoggle=<F2>
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Centralize backups, swapfiles and undo history
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
" Stop hls
nmap <silent> <leader>/ :nohlsearch<CR>
" Quickly edit/reload the vimrc file
nmap <leader>ev :tabnew $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab switch 
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap td  :tabclose<CR>
" Save & Quit
nmap W :w!<CR>
nmap Q :q!<CR>
" Sudo save
cmap w!! %!sudo tee > /dev/null %
" Enter <cr> to :
nnoremap <cr> :
" Jump to start & end of line
noremap H ^
noremap L $
" Split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Insert/Visual mode to Command mode
inoremap i <esc>
vnoremap i <esc>
inoremap I <esc>
vnoremap I <esc>
inoremap <m-i> <esc>
vnoremap <m-i> <esc>
inoremap <m-I> <esc>
vnoremap <m-I> <esc>
" Indent WIth Tab & Shift-Tab
nnoremap <tab> >>_
nnoremap <s-tab> <<_
inoremap <s-tab> <c-d>
vnoremap <tab> >gv
vnoremap <s-tab> <gv
" Re-select visual block after indent
vnoremap < <gv
vnoremap > >gv
" Screen navigation (insert mode)
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-f> <c-o><c-f>
inoremap <c-b> <c-o><c-b>
" Move current line vertically (GVim only)
nnoremap <silent> <m-j> :m+<CR>
nnoremap <silent> <m-k> :m-2<CR>
inoremap <silent> <m-j> <c-o>:m+<CR>
inoremap <silent> <m-k> <c-o>:m-2<CR>
vnoremap <silent> <m-j> :m'>+<CR>gv
vnoremap <silent> <m-k> :m-2<CR>gv
" Standard ctrl-c and ctrl-v functionality
vmap <c-c> "zy
vmap <c-x> "zc
vmap <c-v> c<esc>"zp
imap <c-v> <c-r><c-o>z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set nopaste on leaving insert mode
autocmd InsertLeave * set nopaste

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Source '~/.vimrc.local' for local customizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTreeTab
nmap <silent> <leader>. :NERDTreeTabsToggle<CR>
" GitGutter
nmap cm <Plug>GitGutterNextHunk
nmap mc <Plug>GitGutterPrevHunk
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '~-'
highlight GitGutterDelete guifg=#ff0000 guibg=NONE ctermfg=1 ctermbg=NONE
" EasyMotion
let g:EasyMotion_leader_key = ';'
" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
