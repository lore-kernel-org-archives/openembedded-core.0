Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1842C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2703.1785277332914562446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TOxwMGo/;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso2483385e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277331; x=1785882131; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYg32YGImZscpQIf8KMycN99YW4sAFn0CT+mGPG/jBw=;
        b=TOxwMGo/dskpVNUkAyILf1kLlizhfZFbWZXR2ZZFDzDfN5OETCw0DYLK2eImeHi+Y0
         e3pov1zueMdM8YhbNLYmIjf2FfuJ0WwZx8+E74wKsVo6ir0e1Oo/t2MUlloqIKyoNG8n
         fqfjAhRGFskr7kqdZ5QqhLln7T/6NYHTBRYhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277331; x=1785882131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYg32YGImZscpQIf8KMycN99YW4sAFn0CT+mGPG/jBw=;
        b=SAaG1j2xUImuk2rYN5yuvRaxr/qj1QEWYtFQLZDAbZ04r9tPft8xkDkr/X1DTsZI9L
         AsFwt7LnB3fIeY1YFgW34k8LKRQDQbZ/8kdOE+evPTIHj9SU67Pq3PDOa71MlNMAYkhS
         e0rr6kJGIOZczKrTvgwojcjC3uQ76RAoiwSPAbdLHrhkbrM3nTjS9uGv6tccNgpF7sFv
         LWe3qveuGPj7cUVfnhZKwEVPulWEJoaI5+8heQxmLr9DBES3cbAWtIzOeuNHQGyTZwej
         tclebQFqwEFJQSK2wChVxrzWukt23P5BZcV9NJ8iOgYKjGb0tICOonJwsm2acFspRMYo
         L4Yw==
X-Gm-Message-State: AOJu0Yy3rxx6Z0YZdZSylw2O6qCe9Y8cPU4pLyWRzCSeEvjwcZpFYWGW
	O2xfnHOahkrjdHJF8rcc57mvfhx6lmsNAgDYZTckQ4oJtCM2dqLhx8xgX+7/M3OpeOHp9dF9bbU
	7w/WoXLU=
X-Gm-Gg: AR+sD12PlceKYoWKjvXsISlXHq3GvkIC6cTzsZmZs0fZ/retesN14N955tBEdkUWWyv
	smysYOZieiiYl105aG3VKBCz9HKQnZbueRQ0AOb6QEfzQ1H1uF9khYs9s6+CdbIntXqNLqfwpwl
	cQ+k7UJ//6kV9Yl2nzXcUfPnG/w25MA/ulvD2i5s4vetUlx9aYlrvbUJ2cF8VsrQdDl1rSdWBHy
	rZdJwXn3cX43bBljXo/kr56mqzCbkCIc7Slke8fIMdH6N8tgAMPB24kmNYnDu1INjzupG5LyRf0
	h/36rotunPo44BHiJuO7OMU8tR4toyfmW6EJ3BHNv7lghmi/iqougv+6ezn0Nro1/FVgawr1LCF
	jZBtcvNRSiOkdpPNR1msJRjzHOsLk8j0EzvU66QOTXQn/iv+gbPUBb14TtQVejQ8+2bkxuzLUqH
	TF4VeJb3dVnVfo2T51CEWcDsmyhbn/kU4IaSft9kah4p47YuSMrTTosWk9XqMrrMPW0l5Ss25NZ
	7Kxc8oJIDLTueF1Ggr0fOF/ZpezL4jbjXaibZu+IKanlkyaSFoO3dDhx06B41o8
X-Received: by 2002:a05:600c:1388:b0:496:c249:ddb7 with SMTP id 5b1f17b1804b1-496c653a69cmr44111875e9.6.1785277331128;
        Tue, 28 Jul 2026 15:22:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/19] vim: Security Fix for CVE-2026-42307
Date: Wed, 29 Jul 2026 00:21:47 +0200
Message-ID: <ce14ca9604dfa13c619f17282273eb279a79a3ac.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242215

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42307
[2] https://security-tracker.debian.org/tracker/CVE-2026-42307

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-42307.patch            | 121 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-42307.patch b/meta/recipes-support/vim/files/CVE-2026-42307.patch
new file mode 100644
index 00000000000..03acd436a05
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-42307.patch
@@ -0,0 +1,121 @@
+From 936634660e3836e1a495965b48a0dc913e9d0deb Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 21 Apr 2026 19:03:02 +0000
+Subject: [PATCH 02/17] patch 9.2.0383: [security]: runtime(netrw):
+ shell-injection via sftp: and file: URLs
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
+ runtime/doc/pi_netrw.txt                       |  4 ----
+ runtime/doc/tags                               |  1 -
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 16 +++++++++-------
+ runtime/pack/dist/opt/netrw/doc/netrw.txt      |  4 ----
+ 4 files changed, 9 insertions(+), 16 deletions(-)
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
+index 300dfd18a6..7ce3b63075 100644
+--- a/runtime/doc/tags
++++ b/runtime/doc/tags
+@@ -7863,7 +7863,6 @@ g:netrw_ssh_browse_reject	pi_netrw.txt	/*g:netrw_ssh_browse_reject*
+ g:netrw_ssh_cmd	pi_netrw.txt	/*g:netrw_ssh_cmd*
+ g:netrw_sshport	pi_netrw.txt	/*g:netrw_sshport*
+ g:netrw_timefmt	pi_netrw.txt	/*g:netrw_timefmt*
+-g:netrw_tmpfile_escape	pi_netrw.txt	/*g:netrw_tmpfile_escape*
+ g:netrw_uid	pi_netrw.txt	/*g:netrw_uid*
+ g:netrw_use_noswf	pi_netrw.txt	/*g:netrw_use_noswf*
+ g:netrw_use_nt_rcp	pi_netrw.txt	/*g:netrw_use_nt_rcp*
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 1c98104d00..805474616d 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -378,7 +378,6 @@ else
+   call s:NetrwInit("g:netrw_glob_escape",'*[]?`{~$\')
+ endif
+ call s:NetrwInit("g:netrw_menu_escape",'.&? \')
+-call s:NetrwInit("g:netrw_tmpfile_escape",' &;')
+ call s:NetrwInit("s:netrw_map_escape","<|\n\r\\\<C-V>\"")
+ if has("gui_running") && (&enc == 'utf-8' || &enc == 'utf-16' || &enc == 'ucs-4')
+   let s:treedepthstring= "│ "
+@@ -1799,14 +1798,14 @@ function netrw#NetRead(mode,...)
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
+@@ -8927,14 +8926,17 @@ function s:GetTempfile(fname)
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
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 485eedb0615..7a865f122ee 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-28422.patch \
+           file://CVE-2026-42307.patch \
            "
 
 PV .= ".1683"

