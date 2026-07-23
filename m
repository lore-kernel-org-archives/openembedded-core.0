Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C1BC531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:07 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19526.1784798766083113223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M/EkuQMI;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so169371a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798765; x=1785403565; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0u/yVdG4DJPtUs7GRkeutaKl+06hoQAlOyYNbLlDADk=;
        b=M/EkuQMIruamYW/D3aqNzN8zFlSamI6J6K0TIorwLdKsjEsEvepU1bEveZmTeiN6jj
         uKqx+I7SpvtBxFaGx5DBhH7isuxCWnZ7Okq5cdk6Zy5C+4Hptvt9hgtrCEbtSyd/og8u
         AktyuaeCQ6lvZDClj7PddLFwrgdM/C7YzCHYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798765; x=1785403565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0u/yVdG4DJPtUs7GRkeutaKl+06hoQAlOyYNbLlDADk=;
        b=aMUpVm17wwElAtP39rN+oxQTSD8Zx2JPq/zza9dplAsP68cpIrgmHz11mT7euy2CTs
         l5XY9TwJJRlExfsH+iAT13l3eajpD8aTFEMd6eerJiN+KO9iyfjKgL1UmOBHclIHmM44
         4QaP76hThde7RpjO8Y7uybqEi6cKrhu3D8vcC8aKige5xLKnwDq3nKv3jrMMPiD8PYSx
         VK8Ot2/m+ax+tQvnewDINOVu7q6DuxrpIj+2CKHNj+c7whniP+bHTd1s/V0QrvXx5e8l
         vms2icDiYbqsl9aD6QLfkJIn3Qog3NgFT2FudpTiIepoFceoYHoZ+mk2rRNGmLkLh+LS
         DXaQ==
X-Gm-Message-State: AOJu0YxWLMxlJ9yyVaJEGwEvPcLSbWAVRuDvqths1U6xHs53WL+AIRL9
	0fQnVUwdNkCy79I2p1UF+iXktxMeDZolMk7PI2CA5hvQOyjBCsdOe0Vcy60nn/U/X57IccBaFFB
	m89XzZJM=
X-Gm-Gg: AR+sD10rmb23pKHrEKu97eC7NHP1liHXlsIefszFiPAvyOZQMsLcrOKC8ASPuykEIrk
	3vlSMTP1jk2x70UDLwKe/d3l5ifPBa3/zlCaGXmprZQuvBF47Nvy5qJPC079+nQNpEaMCAKKYPW
	EeFkWL4m7NVNJ3YNjarWqqYkfMaE6XHapLRMbno7jw0l1Cwk18gu+sdHVjUErmpiDn+wFSvzMtQ
	4WK00m2fUj9sAy3ETjQWeBMr4KeNQCW48Jqx6h/kfMN0NkG4OBruRWc3v+CmkLQLZmhGMl6JLoQ
	fBEnHTsxmIOIpbMx9TD7QkSXo9lsAgZyzQlCCruUrbmrLq9OeTJN2ZKO+CeIXt7otSCT8ZdCezD
	EaqfsiIgBxLS+za7q8HiFZ6FbOLKvzeRsaZOPxwUAdLbt1ZqCdA5AQ2FuE6tWGdKF0/+N7gN65B
	yERGSZA4VpcwA=
X-Received: by 2002:a05:6a21:4cc3:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3c44c95a55dmr2225833637.6.1784798765405;
        Thu, 23 Jul 2026 02:26:05 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:04 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 02/13] vim: Security Fix for CVE-2026-42307
Date: Thu, 23 Jul 2026 14:53:43 +0530
Message-Id: <20260723092354.54697-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241806

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42307
[2] https://security-tracker.debian.org/tracker/CVE-2026-42307

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-42307.patch            | 121 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-42307.patch b/meta/recipes-support/vim/files/CVE-2026-42307.patch
new file mode 100644
index 0000000000..03acd436a0
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
index 485eedb061..7a865f122e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-28422.patch \
+           file://CVE-2026-42307.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


