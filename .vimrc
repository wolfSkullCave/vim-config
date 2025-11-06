" ============================================
" VIM MARKDOWN EDITOR CONFIGURATION
" Add this to your ~/.vimrc file
" ============================================

" BASIC VIM SETTINGS
" ============================================
set nocompatible              " Use Vim settings, not Vi
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection

" APPEARANCE
" ============================================
set number                    " Show line numbers
set relativenumber           " Show relative line numbers
set cursorline               " Highlight current line
set showcmd                  " Show command in bottom bar
set wildmenu                 " Visual autocomplete for command menu
set showmatch                " Highlight matching brackets
colorscheme desert           " Change to your preferred colorscheme

" MARKDOWN-SPECIFIC SETTINGS
" ============================================
" Auto-detect markdown files
autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown

" Markdown file settings
autocmd FileType markdown setlocal wrap          " Wrap long lines
autocmd FileType markdown setlocal linebreak     " Break at word boundaries
autocmd FileType markdown setlocal textwidth=80  " Set text width
autocmd FileType markdown setlocal spell         " Enable spell check
autocmd FileType markdown setlocal spelllang=en_us
autocmd FileType markdown setlocal conceallevel=2 " Conceal markdown syntax

" WRITING ENHANCEMENTS
" ============================================
set autoindent               " Auto-indent new lines
set smartindent              " Smart indenting
set expandtab                " Use spaces instead of tabs
set tabstop=2                " Number of spaces per tab
set shiftwidth=2             " Auto-indent amount
set softtabstop=2            " Backspace removes X spaces

" Better text wrapping
set formatoptions+=t         " Auto-wrap text using textwidth
set formatoptions+=c         " Auto-wrap comments
set formatoptions+=q         " Allow formatting comments with gq
set formatoptions+=n         " Recognize numbered lists

" NAVIGATION IMPROVEMENTS
" ============================================
" Move by visual line (useful for wrapped text)
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

" MARKDOWN SHORTCUTS
" ============================================
" Bold text: Select text in visual mode, press ,b
vnoremap <leader>b c**<C-r>"**<Esc>

" Italic text: Select text in visual mode, press ,i
vnoremap <leader>i c*<C-r>"*<Esc>

" Code: Select text in visual mode, press ,c
vnoremap <leader>c c`<C-r>"`<Esc>

" Create link: Select text in visual mode, press ,l
vnoremap <leader>l c[<C-r>"]()<Esc>i

" Insert code block (in normal mode, press ,cb)
nnoremap <leader>cb i```<CR>```<Esc>O

" Insert horizontal rule
nnoremap <leader>hr i---<CR><CR><Esc>

" Create header level 1-6 (in normal mode)
nnoremap <leader>1 I# <Esc>
nnoremap <leader>2 I## <Esc>
nnoremap <leader>3 I### <Esc>
nnoremap <leader>4 I#### <Esc>
nnoremap <leader>5 I##### <Esc>
nnoremap <leader>6 I###### <Esc>

" QUALITY OF LIFE IMPROVEMENTS
" ============================================
set backspace=indent,eol,start  " Backspace works on everything
set mouse=a                     " Enable mouse support
set clipboard=unnamedplus       " Use system clipboard
set incsearch                   " Search as you type
set hlsearch                    " Highlight search results
set ignorecase                  " Case-insensitive search
set smartcase                   " Case-sensitive if uppercase used
let g:auto_save=0               " Sets auto save to off by default

" Activates autosave when editing a js file
autocmd FileType javascript let g:auto_save = 1

" Clear search highlighting with ,/
nnoremap <leader>/ :nohlsearch<CR>

" Save file with Ctrl+S (in normal and insert mode)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quit with Ctrl+Q
nnoremap <C-q> :q<CR>

" DISTRACTION-FREE WRITING MODE
" ============================================
" Toggle distraction-free mode with F12
function! DistractionFreeMode()
    if &number
        set nonumber
        set norelativenumber
        set laststatus=0
        set noshowmode
        set noshowcmd
        echo "Distraction-free mode ON"
    else
        set number
        set relativenumber
        set laststatus=2
        set showmode
        set showcmd
        echo "Distraction-free mode OFF"
    endif
endfunction
nnoremap <F12> :call DistractionFreeMode()<CR>

" AUTO-SAVE (optional - uncomment if desired)
" ============================================
" Auto-save when leaving insert mode or after 1 second of inactivity
" autocmd InsertLeave,TextChanged * silent! write
" set updatetime=1000

" PLUGIN RECOMMENDATIONS (optional)
" ============================================
" Install vim-plug first: https://github.com/junegunn/vim-plug
" Then uncomment and install these plugins:
"
call plug#begin('~/.vim/plugged')
Plug 'preservim/vim-markdown'        " Enhanced markdown support
Plug 'godlygeek/tabular'             " Required by vim-markdown
Plug 'junegunn/goyo.vim'             " Distraction-free writing
Plug 'tpope/vim-surround'            " Easy surrounding with quotes/brackets
Plug 'preservim/vim-pencil'          " Better text wrapping
Plug 'iamcco/markdown-preview.nvim'  " Live markdown preview
Plug 'vim-scripts/vim-auto-save'     " Enables auto save

" JS PLUGINS
" 
" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" File tree
Plug 'preservim/nerdtree'

" Autocompletion (needs Python support)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Status line
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-fugitive'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Commenting
Plug 'tpope/vim-commentary'

call plug#end()

" CHEAT SHEET
" ============================================
" ,b     = Bold selected text
" ,i     = Italic selected text
" ,c     = Code selected text
" ,l     = Create link from selected text
" ,cb    = Insert code block
" ,hr    = Insert horizontal rule
" ,1-6   = Make current line a header (level 1-6)
" ,/     = Clear search highlighting
" F12    = Toggle distraction-free mode
" Ctrl+S = Save file
" gqip   = Reflow/wrap current paragraph

" JS CONFIG TWEAKS
" =============================================

" NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" Format current file with Prettier
nmap <leader>p :CocCommand prettier.formatFile<CR>

" Autocomplete
inoremap <silent><expr> <C-Space> coc#refresh()

" Terminal split (if Vim supports +terminal)
"nnoremap <leader>t :10split | terminal<CR>
