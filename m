Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C7DCA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:23:53 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7411.1791372231785639171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KaTQPSMm;
 spf=pass (domain: mvista.com, ip: 74.125.82.174, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33c2520ad38so3926261eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791372231; x=1791977031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2zQGPtyR8BNZr8GtzK2wgtzOp14xfULq/DSs+mnWh8=;
        b=KaTQPSMm2CeP4XiQCjw9PLidQifcYVLfkKV9LfcsBDPXrOqYubvKmwzvpIMs9aHdo2
         +/ZWl1C9nag/szBPDgMQtFvjJYlY/TCW8CTbOAgQ4w7f7YLdsFXHEsuAvLNk7fe3h30Y
         o8vD1JwB0uz8xYjRO8VJkhulAmb+kjwq6bEjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372231; x=1791977031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2zQGPtyR8BNZr8GtzK2wgtzOp14xfULq/DSs+mnWh8=;
        b=kFYCroZT8KoX8Eb7RH/YvJGp0DPfgfaboW6DTroAWVE1neNr6NiWNkJoJS1U7o3HQn
         I2vplJKMsUammKyB93MuteIP7LmfrVGQB7IfejdApc+JvZzqH4/oYk8naSNMjt8SAzDU
         osT6/2UL7xwKgUkTUBnN6k8t/acJeq1ccaTPKEmx++GO/NbSzrUQvZXxhFbDx8BVFAD6
         ESh6Ieblb4PtaO3E3c+dEw+mFio/RhlUSpglVN2SsAOqscodEDu3N1L3ONdQPmlUxFMa
         /sbRPUGuJHELZ8eMPRfywXvxtUvAjsPEFOMqBlUm/5YYeJE+0FfwpjXfK6n1UPpApEmm
         BX9w==
X-Gm-Message-State: AFq9FYJLCkiGfUWQROUmm+x9a1aSd3gt58l9oQyLV7e6v85aBs8IBTNS
	NE6ygX0/iOyyJcFXjNNp+Dpt+LpLwikXr8gCHIImtIqalFqr1UB0OT8ZATB9ubs7ngDhPtp81nI
	k7Mvv
X-Gm-Gg: AYBFou3v/3H5KMTzU47DMxj99eBgxwbE13QMmaG/HSVAQCoVh57SMQRhQa+FjFkLJsv
	m/C5U0+B6OCbA+9OM6AYePpeKd2R+0GVXW7Dl+sFJQChuVfebTOVAhLjKDLdh6lboguIOwT0ShN
	9Ls4jg4itURiZD85OUbXlfMpHg9iuVh82X3tD+qY0BUhHnjJt3PUUM2K0efwEPNg/IIjJwJIqTb
	w9wa5mdSaltXW8Yb9+UrMfaNHkIfHrtI7UUMuu1UsAPrgA4kbR+8E6JmvZ2bJlCG5gEWl6zAqbM
	6t7M2W70us+XQkIM2hr0n0AQ97RN5CbeK2ZGLgRcxSFZosQCyLhsUlNFK+8WByPzt6scTTCkppf
	LLAVqMzoHEBE8Z87OJijRJBP5bp0fo5omjz00OANUyAXzo/OwcQJxtKRs4Z2wh3XpIjZHY3zLM/
	1fPvpVCepA5iIpQ7IsXj1SFr5Lzoz3iV3tJmozDfOwgq2VHiTRb6l9M3AkRkMwTdwIEQ==
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr2159166eec.30.1791372230789;
        Wed, 07 Oct 2026 04:23:50 -0700 (PDT)
Received: from MVIN00013 ([27.121.101.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515a8b7c5dsm8387950eec.0.2026.10.07.04.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:23:50 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] vim: Fix for CVE-2026-73076
Date: Wed,  7 Oct 2026 16:53:43 +0530
Message-ID: <20261007112343.774232-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247386

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73076.patch            | 136 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
new file mode 100644
index 0000000000..9ef6aec99a
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
@@ -0,0 +1,136 @@
+From 581a2f3ac9c6f96a26324f6b2c8c11415fd0d452 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Fri, 24 Jul 2026 17:43:51 +0200
+Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
+ .VimballRecord file
+
+Problem:  [security]: vimball: code execution via .VimballRecord file
+          (tdjackey)
+Solution: Forbid arbitrary commands, fix broken directory deletion code,
+          refactor code
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73076
+Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/vimball.vim | 58 ++++++++++++++++++++++--------------
+ 1 file changed, 35 insertions(+), 23 deletions(-)
+
+diff --git a/runtime/autoload/vimball.vim b/runtime/autoload/vimball.vim
+index 6456984411..b206abef10 100644
+--- a/runtime/autoload/vimball.vim
++++ b/runtime/autoload/vimball.vim
+@@ -270,6 +270,13 @@ fun! vimball#Vimball(really,...)
+    let fenc    = substitute(getline(linenr+1),'^\d\+\s*\(\S\{-}\)$','\1','')
+    let filecnt = filecnt + 1
+ "   call Decho("fname<".fname."> fsize=".fsize." filecnt=".filecnt. " fenc=".fenc)
++   if fname =~? '\%(^\|/\)\.VimballRecord$'
++     echomsg "(Vimball) Forbidding .VimballRecord filename, aborting..."
++     exe "tabn ".curtabnr
++     bw! Vimball
++     call s:ChgDir(curdir)
++     return
++   endif
+ 
+    if a:really
+     echomsg "extracted <".fname.">: ".fsize." lines"
+@@ -309,7 +316,7 @@ fun! vimball#Vimball(really,...)
+       else
+        call mkdir(dirname)
+       endif
+-	  call s:RecordInVar(home,"rmdir('".dirname."')")
++	  call s:RecordDirInVar(dirname)
+      endif
+     endwhile
+    endif
+@@ -343,7 +350,7 @@ fun! vimball#Vimball(really,...)
+ 	 exe "silent w! ".fnameescape(fnamepath)
+ 	endif
+ 	echo "wrote ".fnameescape(fnamepath)
+-	call s:RecordInVar(home,"call delete('".fnamepath."')")
++	call s:RecordInVar(fnamepath)
+     endif
+ 
+     " return to tab with vimball
+@@ -464,11 +471,17 @@ fun! vimball#RmVimball(...)
+     let s:VBRstring= substitute(exestring,'call delete(','','g')
+     let s:VBRstring= substitute(s:VBRstring,"[')]",'','g')
+ "	call Decho("exe ".exestring)
+-	sil! keepalt keepjumps exe exestring
++	let nr_files= 0
++    for line in split(exestring, '|')
++      if line !~ '^call delete(''[^'']\{-}''\(,"d"\)\?)$'
++        echomsg "ignoring .VimballRecord entry: " line
++      else
++        sil! keepalt keepjumps exe line
++        let nr_files+= 1
++      endif
++    endfor
+ 	sil! keepalt keepjumps d
+-	let exestring= strlen(substitute(exestring,'call delete(.\{-})|\=',"D","g"))
+-"	call Decho("exestring<".exestring.">")
+-	echomsg "removed ".exestring." files"
++	 echomsg "removed ".nr_files." files"
+    else
+     let s:VBRstring= ''
+ 	let curfile    = substitute(curfile,'\.vmb','','')
+@@ -622,23 +635,22 @@ fun! s:ChgDir(newdir)
+ endfun
+ 
+ " ---------------------------------------------------------------------
+-" s:RecordInVar: record a un-vimball command in the .VimballRecord file {{{2
+-fun! s:RecordInVar(home,cmd)
+-"  call Dfunc("RecordInVar(home<".a:home."> cmd<".a:cmd.">)")
+-  if a:cmd =~ '^rmdir'
+-"   if !exists("s:recorddir")
+-"    let s:recorddir= substitute(a:cmd,'^rmdir',"call s:Rmdir",'')
+-"   else
+-"    let s:recorddir= s:recorddir."|".substitute(a:cmd,'^rmdir',"call s:Rmdir",'')
+-"   endif
+-  elseif !exists("s:recordfile")
+-   let s:recordfile= a:cmd
+-  else
+-   let s:recordfile= s:recordfile."|".a:cmd
++" s:RecordInVar: record a un-vimball file deletion in the .VimballRecord file {{{2
++fun! s:RecordInVar(file)
++  if !exists("s:recordfile")
++    let s:recordfile=[]
+   endif
+-"  call Dret("RecordInVar : s:recordfile<".(exists("s:recordfile")? s:recordfile : "")."> s:recorddir<".(exists("s:recorddir")? s:recorddir : "").">")
++  call add(s:recordfile, $'call delete({string(a:file)})')
+ endfun
+ 
++" s:RecordDirInVar: record a un-vimball dir deletion in the .VimballRecord file {{{2
++fun! s:RecordDirInVar(dir)
++  if !exists("s:recorddir")
++    let s:recorddir = []
++   endif
++  call add(s:recorddir, $'call delete({string(a:dir)},"d")')
++ endfun
++
+ " ---------------------------------------------------------------------
+ " s:RecordInFile: {{{2
+ fun! s:RecordInFile(home)
+@@ -660,11 +672,11 @@ fun! s:RecordInFile(home)
+    setlocal ma
+    $
+    if exists("s:recordfile") && exists("s:recorddir")
+-   	let cmd= cmd.s:recordfile."|".s:recorddir
++        let cmd= cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
+    elseif exists("s:recorddir")
+-   	let cmd= cmd.s:recorddir
++        let cmd= cmd.join(s:recorddir, '|')
+    elseif exists("s:recordfile")
+-   	let cmd= cmd.s:recordfile
++        let cmd= cmd.join(s:recordfile, '|')
+    else
+ "    call Dret("s:RecordInFile : neither recordfile nor recorddir exist")
+ 	return
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index bd2ce2f6ab..596425ceea 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -58,6 +58,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73077.patch \
            file://CVE-2026-73078.patch \
+           file://CVE-2026-73076.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


