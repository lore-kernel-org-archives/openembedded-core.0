Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B99C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:27:44 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6733.1788265661246942088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fqyEPRID;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso3590960a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788265660; x=1788870460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lF0xvKtKrsnIfLhxeiWheUkxE4IYkYsAIE5xuLs7gcM=;
        b=fqyEPRID8/GHBT1qmPGss3ti+pdXYaGmudi4EVlheb4qqpRvlTiO2p1NKFTIiFr8d2
         p8obQYEPvoySDARSfL15DZWJy9YsUO9YLp1sBsd9lya8/YWcXEc6goE7WTD1+lQuOhz2
         AGKgyGffyxKB+TN6nh5GJbf0FbKbRxwg+Qej8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265660; x=1788870460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lF0xvKtKrsnIfLhxeiWheUkxE4IYkYsAIE5xuLs7gcM=;
        b=saBb9VziUgLcwUDafhHRKViWtF13KqLrtQ05W2A9l1YLkUhbPZZFVX+Vj9+pWH8lrZ
         Mnwh6rYWpS8Z17MHIuazWv3PtI8HYaELOdhA7IIQAbsAJ8j3Qj749JLE+xlAc31phb61
         fC4WCBLodXyKG9zR3jDO2hzu6nLR63ixHOtQeZulob5R+P2cZbH6vssgS4wiRThVjL/y
         AvEzaXCvsKp+8ZHBWZ7aFi5QPiNFPKsNpJwxoLS1Yy8nZIh7WuB07eu7V9HhomuRN8xB
         ROoWDvzTzeYmEAeDV/oN6WrH5An4fIlKTXg8lfJgvTqjh+GhHTSQx/h2DOJURwGk4ZtR
         cTNA==
X-Gm-Message-State: AFuF++k2g41FuN7fsfkwGMVNE5g9jF5BhRC+PujE60cIWMJ7zDFh+3E+
	/gqrJx3Zekv5gMrWSaljDFp83nfzCdMuzIuXSHt+JC7l+GSrcOmDGgScGxLF+8A+h2bNtSIx6GX
	O+6amjVo=
X-Gm-Gg: AYBFou0d/hZW4iY9gugp6IxMDdqiwJ2uR1ju0dpM2iIomFvhsPkch9AsHIjBpaEJy0o
	UZ75wN2Mzv7qYZJdNhXZV0h6HyWJnDf5gMnEoLtgqT7ic+Ky1lIfSP3qD27krjbyaIm/FCwYJLA
	9lGyHyh9A+h18LUbiSaZdLFb+h2mbpQL3VuxapL1f0+W+5AHhu+kw1Gz4edRzdSN1BgE8zENn5q
	NP5K9RHSKZiDxrINzc6i61x323Z+flvzaM/2BFs9UbFHYieSZMw1+nufNL4rpQe6EontQ6l+mfz
	il+jIkVK/SwzuSoZISphqEUM/bc1hJEwBu+Jbzt/Pttlmt5Tbrp01lhq+WL8GF/68apkG0LbrPv
	N0DznsCgUSpVzxe4NO42VBg2IzWGe0GnKTFyUaKe7sjcIhF01wYVZLYvsHpQfDkKk5yiM9e0lPC
	i2RQMj0c17+G6zaQc5AApdyJueW0GK4iIQe8UHyDx78NfdteYPntO8AaZM1oImklzTE7nIYRuTA
	w==
X-Received: by 2002:a17:90b:1806:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39907e1214amr10767857a91.22.1788265660474;
        Tue, 01 Sep 2026 05:27:40 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm42722969eec.0.2026.09.01.05.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:27:40 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 1/3] vim: Fix for CVE-2026-73076
Date: Tue,  1 Sep 2026 17:57:23 +0530
Message-ID: <20260901122727.85327-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244821

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73076.patch            | 167 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
new file mode 100644
index 0000000000..5f5c92b168
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
index 9dda2c0be5..f0524ba730 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73072.patch \
            file://CVE-2026-73073.patch \
            file://CVE-2026-73074.patch \
+           file://CVE-2026-73076.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


