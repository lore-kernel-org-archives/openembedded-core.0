Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128C1CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:40:45 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30221.1792399239514568092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Kx61app9;
 spf=pass (domain: mvista.com, ip: 74.125.82.182, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5364561eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792399239; x=1793004039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8oUb2VIxWugGTX1zu2fxtrp3NE28tR8Y3ZzUzPWCvaA=;
        b=Kx61app92uOARBQCywKV/j345TJAQw3pvjXan/u6BGyS60WR+bCPwZ1KGiRTwU84UW
         KeCnkDgjmkaBGdVh3ixP9JWE6ZGZ1lgB2fLsAERMWsI1TJ+CVa7cki0yvJXTDjk2M8ud
         so1d3tU5XMAN1EU1ZfhSACQU9XOb6DZg4au40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399239; x=1793004039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oUb2VIxWugGTX1zu2fxtrp3NE28tR8Y3ZzUzPWCvaA=;
        b=ZItOMH+wAmTaPx0z84YibiP1vsoiCwagcmxhNCmBwtVCEHRByZaO3grMjFLZZTEmMX
         ZLa7O4eLHE+Iv4CVkk6l/60Zc3EX2mWtfJoscjpvIVJ7/MFFCGlnnGt7t/rz3CJLturI
         3K4+gRTRIxh29HNAC39la//0ZQx8e8ieWxaT4niuUH8VixM1yO+K2D9b3jUh3+RKzBNY
         J5LsH2yq+3j07cgZWfV3kJRHXp2mXb/dqtHB6T0ESD7gRDlOtrJhDX89JFact9i0IerZ
         GD90KAj7iVxzTU4LYowMHF/mr5I9zaavPYsah+wrmwY4orYCa2YH5drz8Iz90/XNyq0q
         dTdQ==
X-Gm-Message-State: AFq9FYI+SFiFENe9prpOehj3da1sPJ8hVCMZhHIWnXf97Bh6FVcVPBli
	qyfNtvx2bxxxfN2jguZiFuG+j231PDSRHNJ/FyFlQYKIcIVlJF4f+swRgmAFt8CErjGsqmr4pEZ
	zYVWOwzM=
X-Gm-Gg: AYBFou3ChZkf1b4O6p+aXRZ384415LohhTd4i7MzC522ktVlObjpXRNuGlwHFWm8z92
	3euACp8xIlHk1/9Sfd5/qYn7a7hH7pKjAbP0/RK5Rp6FwZJuxMfEjPRZi8KbyB0sTlYWfoYKHFN
	LhdOcxOLe9HdyHPlJokKmyqyomhi8VgL9Gsapx239D7qyNunNLpMxwax8rYkjTbqhjW9n+gA9WU
	j2bun3znYBy7pFaob+Ft7Sqs6iyntUobxHnUl+DLxCaaPOE2t6yFOqvueYJoOCYgmQzH4PCSxbc
	NKAiw6dxSkeJIANGsxEgE4tysfyUWsIsnxMrsGiwcSunTLQqehezDu9DOMClT8Gfa7RCLrN2kti
	JtLgyK7eoxulCTqEMTAzZiHBYoTVD19j9ML+TEFspJUVFmeRuI7AaD6A2SQtX0dDtpzK6nFRjsk
	rmKqYpy0MXQUP/1iEDvwm65gXTCflMH5JlzNYseDCFGgl/Q2nzKmRSbKmlSbXG/QZimRRSR4NXm
	F0OJGnwHaW5XkSnXrG5
X-Received: by 2002:a05:7023:c00e:b0:182:2feb:a170 with SMTP id a92af1059eb24-185120a8abemr11231110c88.11.1792399238349;
        Mon, 19 Oct 2026 01:40:38 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm25583384c88.3.2026.10.19.01.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:40:37 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv3] vim: Fix for CVE-2026-73076
Date: Mon, 19 Oct 2026 14:10:26 +0530
Message-ID: <20261019084027.640800-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248148

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73076.patch            | 141 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
new file mode 100644
index 0000000000..04c8e07d9d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
@@ -0,0 +1,141 @@
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
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Backport Changes:
+Modify runtime/autoload/vimball.vim file as per vim source code v9.1.1683 which is
+little different from vim v9.2.
+Omitted src/testdir/test_plugin_vimball.vim because the current vim source
+archive does not include it.
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
index f84d2a9688..3a8b67085a 100644
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


