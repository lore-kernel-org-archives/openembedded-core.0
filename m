Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95598C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43771.1785193007669706619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BrAw+9Un;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49550ec592cso2473245e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193006; x=1785797806; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WvF8ID8cSF83mM1b46EuZ/P66IYFTGCrk39pp4ggxU=;
        b=BrAw+9UnxQXynE0TbL1vs3iRqe9+fUJQjvGM/+H/M021moG2eWBPtRCYyvbUtnkCeG
         Cc4Zar6yT8wqn9B1yWNCwjikKDteGaNNchNcBBNxczbaXT84KxpMipBsmMWbY5rLaZSY
         pPRaLt7/PEZLFlsMpvJzA0y/meLID8mrrNSIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193006; x=1785797806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WvF8ID8cSF83mM1b46EuZ/P66IYFTGCrk39pp4ggxU=;
        b=Zf5wWHoWRPFkLuhXKSriS9M5HgYq8gFt0T2TLHawE2W9eFG9dmk0Zgn4yT55+Ny9bI
         jVX9TLwyC7RlfjCc/R4/+y90bleXlR3GJWPhG+hslmfXCJH6ElboWrxUTrmMIucjRykM
         tZK8hPnzO6Cww8RWp3ssg4Kjj+92pYRiDz+H/LQ5czLn6SYbkp8SIl+cUxSI6q3kpAyx
         KgWE+LEbNTKtP5R3p4byZ6q1g8Kmyv27bc99bigxl1YSLmojK00TNoglJ2U8KPn484SR
         ULYB1QvqypNVtkp/wzBSPW+Gx+tEhpoaS/ulfdpGcvYHjLKwKQfeLyFdjIdOM5+lAuIN
         1kiQ==
X-Gm-Message-State: AOJu0YwWe60L9ldjmwOopmvI+yhiMDUEBcbYXVhZpblMQGpmi4IsgcOH
	3oxXAn4fWjdiHQtGRaWIlB9kEmdkYRnhQ/H/uwIvrVQtmjE+X59EECMwLmqjCN38l5i/GyLdTFS
	r9mvfB0I=
X-Gm-Gg: AR+sD12mcdcVI2WlNUtek0uGwKBvahSby9Fh0bf9FXWnqQVM68g7rqqwKqB/v/sMEMX
	8VMBCW8bH4yeGi5aEbT9TzLJ3cJY9JOcnj7yZEfyWLzrEW0infi2t7a8kV0Q2Fy9J/JAmdwSJjM
	jMluN7UQ1p8a4u675bh6aoYLxazwoi72MCTMkvkNLOKoOOvo8T3qFjS6IbGYWmRmoZpI6r/gqh0
	eaVs9fYnSA+lK5u+hdzeT9kGITJlR6OCOt7y1JBoMwb99wXGZ+hRGmRvGS70o4L1JJgLoelZsBd
	6ytvxSbZjvGiYallCppWMmBmgCfKdfz1yK2xzMhMfELxTNIXWinn+S1zwKKBc/QcGSywYONc4kx
	GeyOnoT5acwcjmqbR9IkVZ/YPKRgxgc+mFTNdGLLjxRMCKwQrCqPsdH4j8mVfiQztizmkPlKY5G
	HzetGW8jc5Epov6xQI4l1/qUoK8LBIWG8L7eGQBLuW0tKPNoYgernI010v1GHXSaVeaM/360ZXl
	zDmQw==
X-Received: by 2002:a05:600c:4654:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-496c568ada1mr2657095e9.18.1785193005702;
        Mon, 27 Jul 2026 15:56:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/36] vim: Security Fix for CVE-2026-42307
Date: Tue, 28 Jul 2026 00:55:45 +0200
Message-ID: <ab3a13942fc54010e38a17dec4420b197ef99389.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242148

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42307
[2] https://security-tracker.debian.org/tracker/CVE-2026-42307

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-42307.patch            | 177 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-42307.patch b/meta/recipes-support/vim/files/CVE-2026-42307.patch
new file mode 100644
index 00000000000..037f6cba273
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-42307.patch
@@ -0,0 +1,177 @@
+From 405e2fb6d54d5653523809e2853d99d1c000a5fc Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 21 Apr 2026 19:03:02 +0000
+Subject: [PATCH] patch 9.2.0383: [security]: runtime(netrw): shell-injection
+ via sftp: and file: URLs
+
+Problem:  runtime(netrw): shell-injection via sftp: and file: URLs
+          (Joshua Rogers)
+Solution: Escape temporary file names, harden filename suffix regex,
+          drop unused g:netrw_tmpfile_escape variable
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/405e2fb6d54d5653523809e2853d99d1c000a5fc]
+CVE: CVE-2026-42307
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/doc/pi_netrw.txt                      |  4 ---
+ runtime/doc/tags                              |  1 -
+ .../pack/dist/opt/netrw/autoload/netrw.vim    | 16 +++++-----
+ runtime/pack/dist/opt/netrw/doc/netrw.txt     |  4 ---
+ src/testdir/test_plugin_netrw.vim             | 30 +++++++++++++++++++
+ src/version.c                                 |  2 ++
+ 6 files changed, 41 insertions(+), 16 deletions(-)
+
+diff --git a/runtime/doc/pi_netrw.txt b/runtime/doc/pi_netrw.txt
+index a86cac36ba..2d98a8407b 100644
+--- a/runtime/doc/pi_netrw.txt
++++ b/runtime/doc/pi_netrw.txt
+@@ -2854,10 +2854,6 @@ your browsing preferences.  (see also: |netrw-settings|)
+ 				such as listing, file removal, etc.
+ 				 default: ssh
+ 
+-  *g:netrw_tmpfile_escape*	=' &;'
+-				escape() is applied to all temporary files
+-				to escape these characters.
+-
+   *g:netrw_timefmt*		specify format string to vim's strftime().
+ 				The default, "%c", is "the preferred date
+ 				and time representation for the current
+diff --git a/runtime/doc/tags b/runtime/doc/tags
+index 1e0720b21a..023996c0eb 100644
+--- a/runtime/doc/tags
++++ b/runtime/doc/tags
+@@ -7966,7 +7966,6 @@ g:netrw_ssh_browse_reject	pi_netrw.txt	/*g:netrw_ssh_browse_reject*
+ g:netrw_ssh_cmd	pi_netrw.txt	/*g:netrw_ssh_cmd*
+ g:netrw_sshport	pi_netrw.txt	/*g:netrw_sshport*
+ g:netrw_timefmt	pi_netrw.txt	/*g:netrw_timefmt*
+-g:netrw_tmpfile_escape	pi_netrw.txt	/*g:netrw_tmpfile_escape*
+ g:netrw_uid	pi_netrw.txt	/*g:netrw_uid*
+ g:netrw_use_noswf	pi_netrw.txt	/*g:netrw_use_noswf*
+ g:netrw_use_nt_rcp	pi_netrw.txt	/*g:netrw_use_nt_rcp*
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 8e5fdb5397..78ce0cbc3c 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -398,7 +398,6 @@ else
+   call s:NetrwInit("g:netrw_glob_escape",'*[]?`{~$\')
+ endif
+ call s:NetrwInit("g:netrw_menu_escape",'.&? \')
+-call s:NetrwInit("g:netrw_tmpfile_escape",' &;')
+ call s:NetrwInit("s:netrw_map_escape","<|\n\r\\\<C-V>\"")
+ if has("gui_running") && (&enc == 'utf-8' || &enc == 'utf-16' || &enc == 'ucs-4')
+   let s:treedepthstring= "│ "
+@@ -1819,14 +1818,14 @@ function netrw#NetRead(mode,...)
+             ".........................................
+         " NetRead: (sftp) NetRead Method #9 {{{3
+         elseif     b:netrw_method  == 9
+-            call netrw#os#Execute(s:netrw_silentxfer."!".g:netrw_sftp_cmd." ".netrw#os#Escape(g:netrw_machine.":".b:netrw_fname,1)." ".tmpfile)
++            call netrw#os#Execute(s:netrw_silentxfer."!".g:netrw_sftp_cmd." ".netrw#os#Escape(g:netrw_machine.":".b:netrw_fname,1)." ".netrw#os#Escape(tmpfile,1))
+             let result          = s:NetrwGetFile(readcmd, tmpfile, b:netrw_method)
+             let b:netrw_lastfile = choice
+ 
+             ".........................................
+         " NetRead: (file) NetRead Method #10 {{{3
+         elseif      b:netrw_method == 10 && exists("g:netrw_file_cmd")
+-            call netrw#os#Execute(s:netrw_silentxfer."!".g:netrw_file_cmd." ".netrw#os#Escape(b:netrw_fname,1)." ".tmpfile)
++            call netrw#os#Execute(s:netrw_silentxfer."!".g:netrw_file_cmd." ".netrw#os#Escape(b:netrw_fname,1)." ".netrw#os#Escape(tmpfile,1))
+             let result           = s:NetrwGetFile(readcmd, tmpfile, b:netrw_method)
+             let b:netrw_lastfile = choice
+ 
+@@ -8959,14 +8958,17 @@ function s:GetTempfile(fname)
+     endif
+ 
+     " use fname's suffix for the temporary file
++    " Restrict the suffix to word characters so shell metacharacters in a
++    " remote filename (e.g. sftp://host/foo.txt;id) cannot ride along into
++    " the tempfile name and out into a downstream shell command.
+     if a:fname != ""
+-        if a:fname =~ '\.[^./]\+$'
++        if a:fname =~ '\.\w\+$'
+             if a:fname =~ '\.tar\.gz$' || a:fname =~ '\.tar\.bz2$' || a:fname =~ '\.tar\.xz$'
+-                let suffix = ".tar".substitute(a:fname,'^.*\(\.[^./]\+\)$','\1','e')
++                let suffix = ".tar".substitute(a:fname,'^.*\(\.\w\+\)$','\1','e')
+             elseif a:fname =~ '.txz$'
+-                let suffix = ".txz".substitute(a:fname,'^.*\(\.[^./]\+\)$','\1','e')
++                let suffix = ".txz".substitute(a:fname,'^.*\(\.\w\+\)$','\1','e')
+             else
+-                let suffix = substitute(a:fname,'^.*\(\.[^./]\+\)$','\1','e')
++                let suffix = substitute(a:fname,'^.*\(\.\w\+\)$','\1','e')
+             endif
+             let tmpfile= substitute(tmpfile,'\.tmp$','','e')
+             let tmpfile .= suffix
+diff --git a/runtime/pack/dist/opt/netrw/doc/netrw.txt b/runtime/pack/dist/opt/netrw/doc/netrw.txt
+index 01a5bda597..144bab5fb3 100644
+--- a/runtime/pack/dist/opt/netrw/doc/netrw.txt
++++ b/runtime/pack/dist/opt/netrw/doc/netrw.txt
+@@ -2854,10 +2854,6 @@ your browsing preferences.  (see also: |netrw-settings|)
+ 				such as listing, file removal, etc.
+ 				 default: ssh
+ 
+-  *g:netrw_tmpfile_escape*	=' &;'
+-				escape() is applied to all temporary files
+-				to escape these characters.
+-
+   *g:netrw_timefmt*		specify format string to vim's strftime().
+ 				The default, "%c", is "the preferred date
+ 				and time representation for the current
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index b234670928..6be32911ce 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -604,6 +604,36 @@ func Test_netrw_FileUrlEdit_pipe_injection()
+   call assert_false(filereadable(fname), 'Command injection via pipe in file URL')
+ endfunc
+ 
++" The remote filename after '.' was allowed to contain shell metacharacters
++" and rode unescaped into the tempfile name passed to sftp/file_cmd, giving a
++" shell injection on :e sftp://host/foo.txt;<cmd>.
++func Test_netrw_tempfile_suffix_injection()
++  CheckUnix
++  CheckExecutable id
++  let save_sftp = g:netrw_sftp_cmd
++  let save_file = exists('g:netrw_file_cmd') ? g:netrw_file_cmd : v:null
++  let g:netrw_sftp_cmd = 'true'
++  let g:netrw_file_cmd = 'true'
++  let fname = 'Xrce_marker'
++  try
++    call delete(fname)
++    sil! call netrw#NetRead(2, 'sftp://localhost/foo.txt;id>'..fname)
++    call assert_false(filereadable(fname), 'Command injection via sftp:// tempfile suffix')
++
++    call delete(fname)
++    sil! call netrw#NetRead(2, 'file://localhost/foo.txt;id>'..fname)
++    call assert_false(filereadable(fname), 'Command injection via file:// tempfile suffix')
++  finally
++    call delete(fname)
++    let g:netrw_sftp_cmd = save_sftp
++    if save_file is v:null
++      unlet! g:netrw_file_cmd
++    else
++      let g:netrw_file_cmd = save_file
++    endif
++  endtry
++endfunc
++
+ func Test_netrw_RFC2396()
+   let fname = 'a%20b'
+   call assert_equal('a b', netrw#RFC2396(fname))
+diff --git a/src/version.c b/src/version.c
+index 560233fafc..4508ae3f18 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    383,
+ /**/
+     340,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e34cc17fe57..0ad78ab4f08 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52858.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
+           file://CVE-2026-42307.patch \
            "
 
 PV .= ".0340"

