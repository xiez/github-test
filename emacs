;;;;code style
(add-hook 'c-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) )
(add-hook 'c++-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) )

;;;;color
(set-cursor-color "wheat")
(set-foreground-color "white")
(set-background-color "Black")

;;;;backup file
;(setq make-backup-files t)
;(setq version-control t)
;(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;;;; send email
;(setq smtpmail-default-smtp-server "smtp.gmail.com") ; needs to be specified before the (require)
;(require 'smtpmail)
;(setq send-mail-function 'smtpmail-send-it)
;(setq user-full-name "xiez1989")
;(setq smtpmail-local-domain "gmail.com")
;(setq user-mail-address (concat "xiez1989@" smtpmail-local-domain))

;;;;font
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8") 
(set-default-font "WenQuanYi Micro Hei Mono-10")

;;;;GUI config
(tool-bar-mode nil)
(menu-bar-mode nil)
(scroll-bar-mode nil)

;;;;show-paren-mode
(show-paren-mode 1)
;(setq show-paren-style 'parenthesis) ; highlight just parens
(setq show-paren-style 'expression) ; highlight entire expression

;;;;mode line
(column-number-mode t)
(display-time-mode t)
(display-battery-mode t)

;;;;set C-z, as command prefix
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z")'ctl-z-map)

;;;shift+space set mark
(global-set-key [?\S- ] 'set-mark-command)

;;;;mark
(transient-mark-mode nil)

;;;;highlighting line mode
(global-hl-line-mode 1)

;;;backword kill
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;;;M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;;;; ido mode settings
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;;; org mode settings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"))

;;;;解决org mode下中文表格错乱
;(if (and (fboundp 'daemonp) (daemonp))
;    (add-hook 'after-make-frame-functions
;              (lambda (frame)
;                (with-selected-frame frame
;                  (set-fontset-font "fontset-default"
;                                    'chinese-gbk "WenQuanYi Micro Hei Mono 12"))))
;  (set-fontset-font "fontset-default" 'chinese-gbk "WenQuanYi Micro Hei Mono 12"))

;;;;multi-web-mode
;(add-to-list 'load-path "~/.emacs.d/site-lisp")
;(require 'multi-web-mode)
;(setq mweb-default-major-mode 'html-mode)
;(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;(multi-web-global-mode 1)

;;;nXhtml
(load "~/.emacs.d/site-lisp/nxhtml/autostart.el")
(defun my-html-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (define-key html-mode-map (kbd "<tab>") 'my-insert-tab)
  (define-key html-mode-map (kbd "C->") 'sgml-close-tag))
 
(defun my-insert-tab (&optional arg)
  (interactive "P")
  (insert-tab arg))
 
(add-hook 'html-mode-hook 'my-html-mode-hook)

;;;;markdown
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;;;;template
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'template)
(template-initialize)

;;;;xcscope
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'xcscope)

;;;;revbufs
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'revbufs)

;;;;browse kill ring
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'browse-kill-ring)
(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))

;;;;autopair
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;(add-to-list 'load-path "~/.emacs.d/site-lisp")
;(require 'js2)
;(autoload 'js2-mode "js2" nil t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;;;copy/paset
(global-set-key "\C-z\C-c" 'clipboard-kill-ring-save)
(global-set-key "\C-z\C-v" 'clipboard-yank)
(setq-default indent-tabs-mode nil)
(setq tab-width 4 c-basic-offset 4)

;;;;session
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-save-mode)

;;;;code 
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'ess-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'sh-mode-hook 'hs-minor-mode)

;;;;代码折叠
(global-set-key [M-left] 'hs-hide-block)
(global-set-key [M-right] 'hs-show-block)
(global-set-key [M-S-left] 'hs-hide-all)
(global-set-key [M-S-right] 'hs-show-all)

;;;;yasnippet
(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet")
(require 'yasnippet)
(yas/initialize)
;;;; Load the snippet files themselves
(yas/load-directory "~/.emacs.d/site-lisp/yasnippet/snippets")

;;;;auto complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(ac-config-default)
;resolve conflict with yasnippet
(auto-complete-mode 1)
(add-hook 'c-mode-common-hook 'auto-complete-mode)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'sh-mode-hook 'auto-complete-mode)
(add-hook 'css-mode-hook 'auto-complete-mode)
(add-hook 'nXhtml-mode-hook 'auto-complete-mode)

; Let's have snippets in the auto-complete dropdown
;(add-to-list 'ac-sources 'ac-source-yasnippet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; custom key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f2] 'rename-buffer) ;;F2 rename buffer
(global-set-key [f3] 'open-in-desktop) ;;F3 open directory in window
(global-set-key [f4] 'ansi-term) ;;F4 open directory in shell
(global-set-key [f5] 'gud-step) ;;F5 step into
(global-set-key [f6] 'gud-next) ;;F6 next
(global-set-key [f7] 'gud-go) ;;F7 go
(setq compile-command "make -f Makefile")
(global-set-key [f8] 'do-compile) ;;F8 compile
(global-set-key [f9] 'other-window) ;;F9 window switch
(global-set-key [f10] 'browse-kill-ring) ;;F10 browse kill ring
(global-set-key [f11] 'my-fullscreen) ;;F11 full screen

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; custom functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;open ~/.emacs
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs"))
(global-set-key "\C-z\C-e" 'open-init-file)

;;;;非交互式编译
(defun do-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (setq compilation-read-command nil)
  (compile compile-command)
  (setq compilation-read-command t))

;;;; scroll functions
(defun hold-line-scroll-up()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-up 1)
    (line-move-to-column tmp)
    (forward-line 1)
    )
  )
(defun hold-line-scroll-down()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-down 1)
    (line-move-to-column tmp)
    (forward-line -1)
    )
  )
(global-set-key (kbd "M-n") 'hold-line-scroll-up)
(global-set-key (kbd "M-p") 'hold-line-scroll-down)

;full screen
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

;maximize 
(defun my-maximized-horz ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(defun my-maximized-vert ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;maximize after start up
;(my-maximized)

; buffer switch
(defun next-user-buffer ()
  "Switch to the next user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))
(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))
(global-set-key (kbd "C-<prior>") 'previous-user-buffer) ; Ctrl+PageDown
(global-set-key (kbd "C-<next>") 'next-user-buffer) ; Ctrl+PageUp

; random number
(defun insert-random-number ()
  "Insert a random number between 0 to 65536."
  (interactive)
  (insert (number-to-string (random 65536)))  )

; column counter
(defun insert-column-counter (n)
  "Insert a sequence of numbers vertically.
For example, if your text is:

a b
c d
e f

and your cursor is after “a”, then calling this function with argument
3 will change it to become:

a1 b
c2 d
e3 f

If there are not enough existing lines after the cursor
when this function is called, it aborts at the last line.

This command is conveniently used together with `kill-rectangle' and `string-rectangle'."  
  (interactive "nEnter the max integer:")
  (let ((i 1) colpos)
  (setq colpos (- (point) (line-beginning-position)))
  (while (<= i n)
    (insert (number-to-string i))
    (forward-line) (beginning-of-line) (forward-char colpos)
    (setq i (1+ i))))  )

; open current directory
(defun open-in-desktop ()
  "Open the current file in desktop.
Works in Microsoft Windows, Mac OS X, Linux."
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux") (shell-command "xdg-open ."))
   ) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "dark magenta"))))
 '(show-paren-match ((((class color) (background dark)) (:background "light slate blue"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))

