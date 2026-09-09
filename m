Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AA6C88E43
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6321.1788939004278536346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l6D2kLXp;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba14so4610104f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939002; x=1789543802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4FJqMTXToMhskUMnsWj4T0NzNhRv0TdrEX7bqpUkrO0=;
        b=l6D2kLXpMC8lrvk717KSTqis5PX+LRlyGE3K2Wc7E0ysM3azYnFNybUJYYfnvColgC
         glEqCQwfYlhOdwNbDc//o/tzvytAIvAknI0W+I3XsT0Wll+E7ubjDyMZ2xDgdOXB+vnZ
         iPH+ZhVgIIPKSzKbHiBqVSHEG95DaNihS57SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939002; x=1789543802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4FJqMTXToMhskUMnsWj4T0NzNhRv0TdrEX7bqpUkrO0=;
        b=gInkPwOsp8M1gmdHTP8vf9kwWSGkdk1XNWrYEu3ueqdxwJps/QOZY5jYCqWTkKt95M
         nCK/COAvPZQFj4HLrmWFN17fMOABnb5ILf0o05Q90k+uPEwIQRioc2eXejBb0UjQOyaD
         O35Ym3mKGGl0JRs/lCDiP0ye7iUAohaxJeeVykdJ/gRzJMSTnHgfHr3z2vu15aBZcPyj
         XUAbD95BrTNXtDo+ou2ggVAVsolx0Q9jJauwztCRwVDtSvx/nPhuRJkuESvnpjUDG5u4
         E8fPwZQjeXWsyFcYhsanbg4Y5r1yaLcuLHoiLxH3NiNWW2KTQOk8fzKyZOlbVCiZM8o6
         QMxg==
X-Gm-Message-State: AFuF++kL5rgxjGq5KmDEEncrkK8BoC4Uuk0ND4vTxUZcRZ09ukOyVrjb
	w0yNUsh5r8U3RD3AtVF6tD+7Jt616n87hbg2ged2G3F/wil2TRdTkBYULEgflKsX13GEdT5jNcm
	agblPVt0=
X-Gm-Gg: AYBFou1cfh5IVcJFQ2dpnO+IHXfhOAw2wwX5OTC/LTQCUI6mqW6NNth3dVvJrJKtmMK
	LuvAPzm3Ig4mQkm0dND0mIbvJlTt4cQuFYuAvvefNXnYBXdP9pbReTC8FNWAdj6/io5s61uUIIE
	/fD/OfGPpSxlZPjGZC9wjJrt1yeSLnUZvr6MQ174WHUIxKPyM2tSr2eUDgoNtyx0UC098NvQEtj
	XM5ShmXEAh9PX7+bLARwtWncuYA0qsC4AQ4i5p2QLZsBPetY1MUXKj8kqmktcqRAAjA0V9ltY3H
	dokmgQP3RvuiWQcyw4poF7JgafFJtkWRsky0VysgoconLC4UVpg6YyZnEGNmLchGD7M5BURaI1v
	KgQNGIkru1nsJK0T9AsR8Ait7MFtoOh9ukzUk/7DMdVK5yooPZHT7YYQ6nCDuZEa3jtf1T7PMPM
	C08swFo5oL+fIY48k1WOPftTe6xx3DhZrDvDcaX81J8iWLWJjKbJB+aWS/laTNq7iYPo1RxZGGZ
	t6IW6OjhSuTmHRLim4UTZDj5Lih4qkoSAGtHIGbKq76E3gEfpgSsbEOohdQCdldtD/BOPAxqS3j
	yPCjnjlssA==
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr33046018f8f.36.1788939002323;
        Wed, 09 Sep 2026 00:30:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/38] vim: Fix for CVE-2026-73076
Date: Wed,  9 Sep 2026 09:29:14 +0200
Message-ID: <0de4221b4a87e66966e0bcc98d4f42a1d6704a74.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245424

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-73076.patch            | 167 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
new file mode 100644
index 00000000000..5f5c92b1681
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
@@ -0,0 +1,167 @@
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
+ runtime/autoload/vimball.vim        | 50 ++++++++++++++++++++---------
+ src/testdir/test_plugin_vimball.vim | 16 ++++++++-
+ 2 files changed, 50 insertions(+), 16 deletions(-)
+
+diff --git a/runtime/autoload/vimball.vim b/runtime/autoload/vimball.vim
+index d661ded631..20ce55cd69 100644
+--- a/runtime/autoload/vimball.vim
++++ b/runtime/autoload/vimball.vim
+@@ -20,9 +20,9 @@ if &cp || exists("g:loaded_vimball")
+  finish
+ endif
+ let g:loaded_vimball = "v37"
+-if v:version < 704
++if v:version < 900
+  echohl WarningMsg
+- echo "***warning*** this version of vimball needs vim 7.4"
++ echo "***warning*** this version of vimball needs vim 9.0"
+  echohl Normal
+  finish
+ endif
+@@ -237,6 +237,12 @@ fun! vimball#Vimball(really,...)
+      bw! Vimball
+      call s:ChgDir(curdir)
+      return
++   elseif fname =~? '\%(^\|/\)\.VimballRecord$'
++     echomsg "(Vimball) Forbidding .VimballRecord filename, aborting..."
++     exe "tabn ".curtabnr
++     bw! Vimball
++     call s:ChgDir(curdir)
++     return
+    endif
+ 
+    if a:really
+@@ -264,7 +270,7 @@ fun! vimball#Vimball(really,...)
+      let fnamebuf = substitute(fnamebuf,'^.\{-}/\(.*\)$','\1','')
+      if !isdirectory(dirname)
+       call mkdir(dirname)
+-      call s:RecordInVar(home,"rmdir('".dirname."')")
++      call s:RecordDirInVar(dirname)
+      endif
+     endwhile
+    endif
+@@ -295,7 +301,7 @@ fun! vimball#Vimball(really,...)
+       exe "silent w! ".fnameescape(fnamepath)
+     endif
+     echo "wrote ".fnameescape(fnamepath)
+-    call s:RecordInVar(home,"call delete('".fnamepath."')")
++    call s:RecordInVar(fnamepath)
+     endif
+ 
+     " return to tab with vimball
+@@ -394,10 +400,17 @@ fun! vimball#RmVimball(...)
+     endif
+     let s:VBRstring= substitute(exestring,'call delete(','','g')
+     let s:VBRstring= substitute(s:VBRstring,"[')]",'','g')
+-    sil! keepalt keepjumps exe exestring
++    let nr_files= 0
++    for line in split(exestring, '|')
++      if line !~ '^call delete(''[^'']\{-}''\(,"d"\)\?)$'
++        echomsg "ignoring .VimballRecord entry: " line
++      else
++        sil! keepalt keepjumps exe line
++        let nr_files+= 1
++      endif
++    endfor
+     sil! keepalt keepjumps d
+-    let exestring= strlen(substitute(exestring,'call delete(.\{-})|\=',"D","g"))
+-    echomsg "removed ".exestring." files"
++    echomsg "removed ".nr_files." files"
+    else
+     let s:VBRstring= ''
+     let curfile    = substitute(curfile,'\.vmb','','')
+@@ -539,13 +552,20 @@ fun! s:ChgDir(newdir)
+ endfun
+ 
+ " ---------------------------------------------------------------------
+-" s:RecordInVar: record a un-vimball command in the .VimballRecord file {{{2
+-fun! s:RecordInVar(home,cmd)
++" s:RecordInVar: record a un-vimball file deletion in the .VimballRecord file {{{2
++fun! s:RecordInVar(file)
+   if !exists("s:recordfile")
+-   let s:recordfile= a:cmd
+-  else
+-   let s:recordfile= s:recordfile."|".a:cmd
++    let s:recordfile=[]
++  endif
++  call add(s:recordfile, $'call delete({string(a:file)})')
++endfun
++
++" s:RecordDirInVar: record a un-vimball dir deletion in the .VimballRecord file {{{2
++fun! s:RecordDirInVar(dir)
++  if !exists("s:recorddir")
++    let s:recorddir = []
+   endif
++  call add(s:recorddir, $'call delete({string(a:dir)},"d")')
+ endfun
+ 
+ " ---------------------------------------------------------------------
+@@ -566,11 +586,11 @@ fun! s:RecordInFile(home)
+    setlocal ma
+    $
+    if exists("s:recordfile") && exists("s:recorddir")
+-    let cmd= cmd.s:recordfile."|".s:recorddir
++    let cmd= cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
+    elseif exists("s:recorddir")
+-    let cmd= cmd.s:recorddir
++    let cmd= cmd.join(s:recorddir, '|')
+    elseif exists("s:recordfile")
+-    let cmd= cmd.s:recordfile
++    let cmd= cmd.join(s:recordfile, '|')
+    else
+     return
+    endif
+diff --git a/src/testdir/test_plugin_vimball.vim b/src/testdir/test_plugin_vimball.vim
+index 2d5b4ba768..8025846694 100644
+--- a/src/testdir/test_plugin_vimball.vim
++++ b/src/testdir/test_plugin_vimball.vim
+@@ -65,7 +65,7 @@ func Test_vimball_basic()
+   call assert_true(filereadable('.VimballRecord'))
+   let record = readfile('.VimballRecord')
+   call assert_equal(1, record->len())
+-  call assert_match('^Xtest.vmb: rmdir.*call delete(', record[0])
++  call assert_match('^Xtest.vmb: call delete(''.\{-}'')|call delete(''.\{-}'',"d")$', record[0])
+   call s:teardown()
+ endfunc
+ 
+@@ -83,3 +83,17 @@ func Test_vimball_path_traversal()
+   call assert_false(filereadable('../XVimball/Xtest.txt'))
+   call s:teardown()
+ endfunc
++
++func Test_vimball_VimballRecord_filenames()
++  call s:Mkvimball()
++  call delete('XVimball', 'rf')
++  sp Xtest.vmb
++  4s#.*\ze\t#.VimballRecord#
++  so %
++  call feedkeys("\<cr>", "it")
++
++  let mess = execute(':mess')->split('\n')[-1]
++  call assert_match('(Vimball) Forbidding .VimballRecord filename.* aborting\.\.\.', mess)
++  call assert_false(filereadable('.VimballRecord'))
++  call s:teardown()
++endfunc
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9dda2c0be55..f0524ba7300 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
+           file://CVE-2026-73076.patch \
            "
 
 PV .= ".0340"

