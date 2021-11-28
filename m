Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B656AC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:39 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.53220.1638136718896518482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aayrBy2I;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id s137so13894193pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r7NWm6DmZ5/gYDj7fNp3qKzQoSLY7uNlzy4jIlGO324=;
        b=aayrBy2IzmCC2suSau34xxo4iFnH+j//FYgsRO6upGZZFCKVDTFY6aLixkFH8lxRJD
         d7+T74ttevfyiMfQcIrpeGIKnuXTCxrmV1kr76O61JHktUaGOAO4BhGxRfHAN/vVVwLj
         ibRqWl2CaZuMaJ7Cc++z7bEzu4/GCIBDlUcorYDs1HBlXL1WXBYTq/d2w1hLrlZzQddz
         G7m1u2UILccNaLqSt6wCO+6iFuhd9zuh1b4L2PMFuq8YovFVWzVtQRPDgr3W1tW0HSuK
         tgfaR795VxCL/ojpSULumndcY0HNVsreLMwT5mg5n8BxIykK9O9k6/i5kB3Ny7OwoPJC
         LkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7NWm6DmZ5/gYDj7fNp3qKzQoSLY7uNlzy4jIlGO324=;
        b=oO7i0SUy6wveyfUhFQRGoTAEStDRKlVbJIbXmHxhMEnNSP2cayzv5h/ZThPqqXeVud
         91Ms6aFM2kDjcfGB9WZB/JHTK2Br7NMH6tf6c4QxXdj9KBR6L+xpKTKNRH6QabWRZzf/
         JbyThnBE0pMte9EWR+BpyxkMRfffOd00U5epvguRGkavQSb927LFVVepPSeRCRhgkqk4
         ieOY7CKkoSPq3UVnZqN4u7U9zpTt1HGRzRJ2JZb+2ljQVTSzGSfDOs8Vq4kop3AJlqry
         ixz26zOm7Y7f/drEyqQg2eGWBk3cPBW3vnFzWkhq5vY0212K5QLpUNJChxq/1CLh++2u
         nTjg==
X-Gm-Message-State: AOAM531HJ7Ua56B0lMzyk8erkCHYrpoDvHtZfiZtIcVnCchXJeOhIR0H
	js8OJikZsXrhNSNqoZYYp9gAURSuDzomQ5GcCPE=
X-Google-Smtp-Source: 
 ABdhPJwiHmcxm20/Iwf7cjRXUUs0ep6K2DPhzaKoLNEvRKHFAkHP/ZGX1Qm0uHg4hFD/7Gk//UKXYw==
X-Received: by 2002:a63:4c45:: with SMTP id m5mr20169697pgl.105.1638136717539;
        Sun, 28 Nov 2021 13:58:37 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/42] vim: fix CVE-2021-3796, CVE-2021-3872,
 and CVE-2021-3875
Date: Sun, 28 Nov 2021 11:57:20 -1000
Message-Id: 
 <5b69e1116a553a38506b75f5d455ff52d57ce70b.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158890

From: Ross Burton <ross@burtonini.com>

Backport patches from upstream to fix these CVEs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b493eb4f9a6bb75a2f01a53b6c70762845bf79f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...28-using-freed-memory-when-replacing.patch | 83 ++++++++++++++++
 ...llegal-memory-access-if-buffer-name-.patch | 86 ++++++++++++++++
 ...ml_get-error-after-search-with-range.patch | 72 ++++++++++++++
 ...nvalid-memory-access-when-scrolling-.patch | 97 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  8 +-
 5 files changed, 344 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
 create mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
 create mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
 create mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch

diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch b/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
new file mode 100644
index 0000000000..ecfae0301e
--- /dev/null
+++ b/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
@@ -0,0 +1,83 @@
+CVE: CVE-2021-3796
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 1160e5f74b229336502fc376416f21108d36cfc2 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Sat, 11 Sep 2021 21:14:20 +0200
+Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
+
+Problem:    Using freed memory when replacing. (Dhiraj Mishra)
+Solution:   Get the line pointer after calling ins_copychar().
+---
+ src/normal.c              | 10 +++++++---
+ src/testdir/test_edit.vim | 14 ++++++++++++++
+ src/version.c             |  2 ++
+ 3 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/src/normal.c b/src/normal.c
+index c4963e621..d6333b948 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
+ 	    {
+ 		/*
+ 		 * Get ptr again, because u_save and/or showmatch() will have
+-		 * released the line.  At the same time we let know that the
+-		 * line will be changed.
++		 * released the line.  This may also happen in ins_copychar().
++		 * At the same time we let know that the line will be changed.
+ 		 */
+-		ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+ 		if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
+ 		{
+ 		  int c = ins_copychar(curwin->w_cursor.lnum
+ 					   + (cap->nchar == Ctrl_Y ? -1 : 1));
++
++		  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+ 		  if (c != NUL)
+ 		    ptr[curwin->w_cursor.col] = c;
+ 		}
+ 		else
++		{
++		    ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+ 		    ptr[curwin->w_cursor.col] = cap->nchar;
++		}
+ 		if (p_sm && msg_silent == 0)
+ 		    showmatch(cap->nchar);
+ 		++curwin->w_cursor.col;
+diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim
+index 4e29e7fe1..f94e6c181 100644
+--- a/src/testdir/test_edit.vim
++++ b/src/testdir/test_edit.vim
+@@ -1519,3 +1519,17 @@ func Test_edit_noesckeys()
+   bwipe!
+   set esckeys
+ endfunc
++
++" Test for getting the character of the line below after "p"
++func Test_edit_put_CTRL_E()
++  set encoding=latin1
++  new
++  let @" = ''
++  sil! norm orggRx
++  sil! norm pr
++  call assert_equal(['r', 'r'], getline(1, 2))
++  bwipe!
++  set encoding=utf-8
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 85bdfc601..1046993d6 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3428,
+ /**/
+     3409,
+ /**/
diff --git a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch b/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
new file mode 100644
index 0000000000..576664f436
--- /dev/null
+++ b/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
@@ -0,0 +1,86 @@
+CVE: CVE-2021-3872
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 61629ea24a2fff1f89c37479d3fb52f17c3480fc Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 8 Oct 2021 18:39:28 +0100
+Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is very
+ long
+
+Problem:    Illegal memory access if buffer name is very long.
+Solution:   Make sure not to go over the end of the buffer.
+---
+ src/drawscreen.c                | 10 +++++-----
+ src/testdir/test_statusline.vim | 11 +++++++++++
+ src/version.c                   |  2 ++
+ 3 files changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/drawscreen.c b/src/drawscreen.c
+index 3a88ee979..9acb70552 100644
+--- a/src/drawscreen.c
++++ b/src/drawscreen.c
+@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
+ 	    *(p + len++) = ' ';
+ 	if (bt_help(wp->w_buffer))
+ 	{
+-	    STRCPY(p + len, _("[Help]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Help]"));
+ 	    len += (int)STRLEN(p + len);
+ 	}
+ #ifdef FEAT_QUICKFIX
+ 	if (wp->w_p_pvw)
+ 	{
+-	    STRCPY(p + len, _("[Preview]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Preview]"));
+ 	    len += (int)STRLEN(p + len);
+ 	}
+ #endif
+@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
+ #endif
+ 		)
+ 	{
+-	    STRCPY(p + len, "[+]");
+-	    len += 3;
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", "[+]");
++	    len += (int)STRLEN(p + len);
+ 	}
+ 	if (wp->w_buffer->b_p_ro)
+ 	{
+-	    STRCPY(p + len, _("[RO]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[RO]"));
+ 	    len += (int)STRLEN(p + len);
+ 	}
+ 
+diff --git a/src/testdir/test_statusline.vim b/src/testdir/test_statusline.vim
+index 1f705b847..91bce1407 100644
+--- a/src/testdir/test_statusline.vim
++++ b/src/testdir/test_statusline.vim
+@@ -393,3 +393,14 @@ func Test_statusline_visual()
+   bwipe! x1
+   bwipe! x2
+ endfunc
++" Used to write beyond allocated memory.  This assumes MAXPATHL is 4096 bytes.
++func Test_statusline_verylong_filename()
++  let fname = repeat('x', 4090)
++  exe "new " .. fname
++  set buftype=help
++  set previewwindow
++  redraw
++  bwipe!
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 1046993d6..2b5de5ccf 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3487,
+ /**/
+     3428,
+ /**/
diff --git a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch b/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
new file mode 100644
index 0000000000..045081579c
--- /dev/null
+++ b/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
@@ -0,0 +1,72 @@
+CVE: CVE-2021-3875
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b8968e26d7508e7d64bfc86808142818b0a9288c Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Sat, 9 Oct 2021 13:58:55 +0100
+Subject: [PATCH] patch 8.2.3489: ml_get error after search with range
+
+Problem:    ml_get error after search with range.
+Solution:   Limit the line number to the buffer line count.
+---
+ src/ex_docmd.c              |  6 ++++--
+ src/testdir/test_search.vim | 17 +++++++++++++++++
+ src/version.c               |  2 ++
+ 3 files changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index fb07450f8..fde726477 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -3586,8 +3586,10 @@ get_address(
+ 
+ 		    // When '/' or '?' follows another address, start from
+ 		    // there.
+-		    if (lnum != MAXLNUM)
+-			curwin->w_cursor.lnum = lnum;
++		    if (lnum > 0 && lnum != MAXLNUM)
++			curwin->w_cursor.lnum =
++				lnum > curbuf->b_ml.ml_line_count
++					   ? curbuf->b_ml.ml_line_count : lnum;
+ 
+ 		    // Start a forward search at the end of the line (unless
+ 		    // before the first line).
+diff --git a/src/testdir/test_search.vim b/src/testdir/test_search.vim
+index 187671305..e142c3547 100644
+--- a/src/testdir/test_search.vim
++++ b/src/testdir/test_search.vim
+@@ -1366,3 +1366,20 @@ func Test_searchdecl()
+ 
+   bwipe!
+ endfunc
++
++func Test_search_with_invalid_range()
++  new
++  let lines =<< trim END
++    /\%.v
++    5/
++    c
++  END
++  call writefile(lines, 'Xrangesearch')
++  source Xrangesearch
++
++  bwipe!
++  call delete('Xrangesearch')
++endfunc
++
++
++" vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 2b5de5ccf..092864bbb 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3489,
+ /**/
+     3487,
+ /**/
diff --git a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch b/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
new file mode 100644
index 0000000000..7184b37cad
--- /dev/null
+++ b/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
@@ -0,0 +1,97 @@
+CVE: CVE-2021-3903
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b15919c1fe0f7fc3d98ff5207ed2feb43c59009d Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Mon, 25 Oct 2021 17:07:04 +0100
+Subject: [PATCH] patch 8.2.3564: invalid memory access when scrolling without
+ valid screen
+
+Problem:    Invalid memory access when scrolling without a valid screen.
+Solution:   Do not set VALID_BOTLINE in w_valid.
+---
+ src/move.c                  |  1 -
+ src/testdir/test_normal.vim | 23 ++++++++++++++++++++---
+ src/version.c               |  2 ++
+ 3 files changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/src/move.c b/src/move.c
+index 8e53d8bcb..10165ef4d 100644
+--- a/src/move.c
++++ b/src/move.c
+@@ -198,7 +198,6 @@ update_topline(void)
+     {
+ 	curwin->w_topline = curwin->w_cursor.lnum;
+ 	curwin->w_botline = curwin->w_topline;
+-	curwin->w_valid |= VALID_BOTLINE|VALID_BOTLINE_AP;
+ 	curwin->w_scbind_pos = 1;
+ 	return;
+     }
+diff --git a/src/testdir/test_normal.vim b/src/testdir/test_normal.vim
+index d45cf4159..ca87928f5 100644
+--- a/src/testdir/test_normal.vim
++++ b/src/testdir/test_normal.vim
+@@ -33,14 +33,14 @@ func CountSpaces(type, ...)
+   else
+     silent exe "normal! `[v`]y"
+   endif
+-  let g:a=strlen(substitute(@@, '[^ ]', '', 'g'))
++  let g:a = strlen(substitute(@@, '[^ ]', '', 'g'))
+   let &selection = sel_save
+   let @@ = reg_save
+ endfunc
+ 
+ func OpfuncDummy(type, ...)
+   " for testing operatorfunc
+-  let g:opt=&linebreak
++  let g:opt = &linebreak
+ 
+   if a:0  " Invoked from Visual mode, use gv command.
+     silent exe "normal! gvy"
+@@ -51,7 +51,7 @@ func OpfuncDummy(type, ...)
+   endif
+   " Create a new dummy window
+   new
+-  let g:bufnr=bufnr('%')
++  let g:bufnr = bufnr('%')
+ endfunc
+ 
+ fun! Test_normal00_optrans()
+@@ -718,6 +718,23 @@ func Test_normal17_z_scroll_hor2()
+   bw!
+ endfunc
+ 
++
++func Test_scroll_in_ex_mode()
++  " This was using invalid memory because w_botline was invalid.
++  let lines =<< trim END
++      diffsplit
++      norm os00(
++      call writefile(['done'], 'Xdone')
++      qa!
++  END
++  call writefile(lines, 'Xscript')
++  call assert_equal(1, RunVim([], [], '--clean -X -Z -e -s -S Xscript'))
++  call assert_equal(['done'], readfile('Xdone'))
++
++  call delete('Xscript')
++  call delete('Xdone')
++endfunc
++
+ func Test_normal18_z_fold()
+   " basic tests for foldopen/folddelete
+   if !has("folding")
+diff --git a/src/version.c b/src/version.c
+index 092864bbb..a9e8be0e7 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3564,
+ /**/
+     3489,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index dc7c37a93c..c715f346ac 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,12 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            file://racefix.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
-	   file://CVE-2021-3778.patch \
-"
+           file://CVE-2021-3778.patch \
+           file://0002-patch-8.2.3428-using-freed-memory-when-replacing.patch \
+           file://0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch \
+           file://0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch \
+           file://0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch \
+           "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
-- 
2.25.1


