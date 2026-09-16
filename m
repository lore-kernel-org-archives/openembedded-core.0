Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A37C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:00:08 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14214.1789563591246104941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CUArCSuv;
 spf=pass (domain: mvista.com, ip: 74.125.228.42, mailfrom: hprajapati@mvista.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so713395a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789563590; x=1790168390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCIAoHX4ephBj8w5A1slhiX1VcUcabSYN2wQO9WxXN8=;
        b=CUArCSuvRsPIGqu5BeY7ojvif1lMcGRPqjXm+AuqtjadsVI8gQuptAw25wH27ZqK7h
         hHmOEvwkIt15ECRrKiyvS6Tov1GuJYMLQejkD9bisnW1Kevh2DaG88rkwEKv//xcg6wi
         nHlCxlYbmUReVWPkY+D2xX/1EzkwfbTzHemVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563590; x=1790168390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCIAoHX4ephBj8w5A1slhiX1VcUcabSYN2wQO9WxXN8=;
        b=Erp/Ra08UTsvMClQy8P65ofId9Hc+eYXrs9gz0SZ/1ove2EV09nxEeVcRpiH1tWx2P
         pHrS+thtz8ZDbeCzr/Aje2ou38TEfm6eymDNNmuMTVdO4zpP3dGnJY/52oTURLzaRIIJ
         Quwjk5+cpGFdBiQediyqx3qgWb3H0qW0vgd5eO8rDzIrUn5QG/D4aR3O8+M8uR7jGc7D
         0nGmL85yeUKOaW+s7HdQEFNNRDzcagqz1zY1S/VbRYglf4mQxWgihqhdg8aChewn7mZ1
         q81Aw3CSvSFkEizpJII0ud4CKIWa7MMjOC+5nO+H6s5htwW7Kgdm7XAp+YT4DjzplK/A
         0Bhg==
X-Gm-Message-State: AFuF++kVNNFOrvU8SFxwgvSiY3NWf1TkMO89mPOw229O8eI5+BmNSdZb
	m6ZZSgIA45WBhJsFymDy2eedqa0oL1V5GzI0zpo2e1nnTV8qNjKc5Vo29rAanilPxIq95xjevYE
	suOMPcrE=
X-Gm-Gg: AYBFou36JMkyFdVEsvZOJwL29NgMUN/P4iboNtUAQDDbzsawVu6n8DA67yV+Qg0pngE
	rW4BbE4/k0kY/yLWH7FOf/5mUUzy0AHGlIXDfSjzEY3mBqJ8VEdAhBhcHUoE+V8kutT/YprEm9l
	9f5DQEPO9bpOrBaC2pBlNPXlylt6933ZD9e2F4FHlLTGCFOPe4yBm6bSKobBkpDS/6sstTM3C/j
	2y2nIUKWiO/tAJgDpygPyEk08r3Ru+Db7SD0S7lHCN0lcLY47pOz8IIAniWqnxH2FewZRCdDU9u
	YAJfPwnDbFq8l9uO7j7NGthdrZYVrOyLJn2s1vm6Tni2ShovkUMGQG+Cv2Wolpd1vks4owOOP2u
	zN+glYxBReNjptNrHARNmnZeMBlL5fr+3VrDAdMg0Dim2PRKZq8VGs8Wf4kMnyR8hghnJf60o2u
	FdNUy9GICZgtpgo3hYPCmFypAnxAHzMqFIyBx4NVfEYbx6ABYMuNEBlRNCPOFAI8evHY1QyOiLU
	oxeF0n0TYcN
X-Received: by 2002:a05:6a20:7355:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3dd5f73b6a9mr6423958637.24.1789563590618;
        Wed, 16 Sep 2026 05:59:50 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.175])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4a48fsm6640315c88.10.2026.09.16.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:59:50 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix for CVE-2026-73076
Date: Wed, 16 Sep 2026 18:29:25 +0530
Message-ID: <20260916125925.241119-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 13:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245971

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
index 0000000000..92c9e10c4a
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
+Upstream-Status: Backport from https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
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
index 0acf8247b7..5a6520b078 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -55,6 +55,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73077.patch \
            file://CVE-2026-73078.patch \
+           file://CVE-2026-73076.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


