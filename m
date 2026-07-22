Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BE7C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:04 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47120.1784723641731865481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SmwM6fM3;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so10106296a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723641; x=1785328441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLAWZbvY1mC4aUxorPU1xb3l4fr2TOUdreuh7/KUsUc=;
        b=SmwM6fM3ZolVvsippcVyudPzqqDM1qLXEoOjfsQDdLtnEx+6K4avgJFTS8EeL3COhF
         3FW5avMowReePT2pk+pgNUiEmLFlvOfTIIdJklOnjCZrUKx/bQ+D0jnTgyOl1QpRAAin
         sLXApzz539OOROKrIihsLMqeWE1m0uiPrQBf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723641; x=1785328441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLAWZbvY1mC4aUxorPU1xb3l4fr2TOUdreuh7/KUsUc=;
        b=KRqJ7ioK2rbuttJ6VV2rM+MX0I6VxKOSM2slbQUf/JmmHOZ5ZVgRUZYUfPZGALKuwg
         nol5gjWoMA9X3evlqM65OSQ9hxslTphBd1cgNy31KqY4q36B78c7iz80jQinZlgO4cOk
         x5nMo2oxRW6L07APHLkKs+JYnmuFc4z7x8XiFktmusxPsGQBrmPtn0dOkqaHP8TvALJJ
         PA2w5t4wN8TbBKjvwZudGq6N3S+MTyGUcV41d0sLlnb3C+YGTgJ/MOO7+o8EcKwecyde
         8P74JDzeoUYr013FOrnz7oWuF0sh+quk4bHuJ/8AlpO4x0KlF+KcQaeJTunnyuLEK6UZ
         d44g==
X-Gm-Message-State: AOJu0YyU+ccDf7Xf43MrDXP9ZDmXzjHVyCbGD5yk6QuRKQq03Mcz30TU
	KUhnlmZ2HKctoAtmoVWAC3N60c4WNBoiPrnrf8ilEuCh0vm877TAbkJqcxt6tWRkapNTmBi0dRu
	GBHH2
X-Gm-Gg: AR+sD11YUvS1wJQpQs6SZDrsvkKSkBYxu5LuVs5r26W7dOOzbi7/p2BJDls+8bIBAms
	o7yD7bBPT7auuk4RRDBvNfvOEJnrm6x54e3TWCz3LVWpMG3aSCfLsw5entK0SdwuH83AZzWdqAY
	wR9CdgmppnpWTN/PF2Qt6UzNGKLhOcOVZ2LdI/6daBDUxBqRQH7vCLJoNjcvrWTgd7qBgphWFio
	Q+hsKPH2C8Fay6mcRqT4rkMvSIMWQBwSiXalHM9ZhRtOZNpk63dlmySZvs34+v8R3WV95y5PfLo
	R91H5bWMMIHutkQn5iZJFZKHubpy9gD2dUugM/vPSKP5eZ9es8kA7q7UPlX2nd7WPTUR4WM4C6g
	RG0opX3h2tY7h9faSNrtNyu7VXNYlz+yKR5xFtkto5GfwRHTm55B/8832/9Y9/KhYnVHV7wJB1V
	VR6SxsQTKfUUIBNVYy
X-Received: by 2002:a17:90b:4ac8:b0:38e:447c:9a15 with SMTP id 98e67ed59e1d1-38e4b57ddc0mr21912229a91.36.1784723640806;
        Wed, 22 Jul 2026 05:34:00 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:33:59 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 03/10] vim: Fix CVE-2026-57453
Date: Wed, 22 Jul 2026 18:03:29 +0530
Message-ID: <20260722123336.587556-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241671

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57453
[2] https://github.com/vim/vim/security/advisories/GHSA-x5fg-h5w9-9frf

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-57453.patch            | 248 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57453.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57453.patch b/meta/recipes-support/vim/files/CVE-2026-57453.patch
new file mode 100644
index 0000000000..d1ad6d6f54
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57453.patch
@@ -0,0 +1,248 @@
+From b2cc9be119d51212bf0d3f2a994c7e517c73f4a9 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sat, 20 Jun 2026 15:35:58 +0000
+Subject: [PATCH] patch 9.2.0678: [security]: potential powershell code
+ execution in zip.vim
+
+Problem:  [security]: potential powershell code execution in zip.vim
+          (DDugs)
+Solution: Cleanup zip.vim, introduce PSEscape() to escape() potential powershell code,
+          use consistent s:Escape() in the various PowerShell functions
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-x5fg-h5w9-9frf
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/b2cc9be119d51212bf0d3f2a994c7e517c73f4a9]
+CVE: CVE-2026-57453
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ runtime/autoload/zip.vim | 78 +++++++++++++++++++---------------------
+ runtime/doc/pi_zip.txt   | 10 ------
+ 2 files changed, 36 insertions(+), 52 deletions(-)
+
+diff --git a/runtime/autoload/zip.vim b/runtime/autoload/zip.vim
+index f4482fd7fc..752503a626 100644
+--- a/runtime/autoload/zip.vim
++++ b/runtime/autoload/zip.vim
+@@ -22,6 +22,7 @@
+ " 2026 Mar 08 by Vim Project: Make ZipUpdatePS() check for powershell
+ " 2026 Apr 01 by Vim Project: Detect more path traversal attacks
+ " 2026 Apr 05 by Vim Project: Detect more path traversal attacks
++" 2026 Jun 20 by Vim Project: Fix wrong escaping for the powershell calls
+ " License:	Vim License  (see vim's :help license)
+ " Copyright:	Copyright (C) 2005-2019 Charles E. Campbell {{{1
+ "		Permission is hereby granted to use and distribute this code,
+@@ -49,15 +50,6 @@ let s:NOTE           = 0
+ 
+ " ---------------------------------------------------------------------
+ "  Global Values: {{{1
+-if !exists("g:zip_shq")
+- if &shq != ""
+-  let g:zip_shq= &shq
+- elseif has("unix")
+-  let g:zip_shq= "'"
+- else
+-  let g:zip_shq= '"'
+- endif
+-endif
+ if !exists("g:zip_zipcmd")
+  let g:zip_zipcmd= "zip"
+ endif
+@@ -133,7 +125,7 @@ function! s:ZipBrowsePS(zipfile)
+   " Browse the contents of a zip file using PowerShell's
+   " Equivalent `unzip -Z1 -- zipfile`
+   let cmds = [
+-        \ '$zip = [System.IO.Compression.ZipFile]::OpenRead(' . s:Escape(a:zipfile, 1) . ');',
++        \ '$zip = [System.IO.Compression.ZipFile]::OpenRead(' . s:PSEscape(a:zipfile) . ');',
+         \ '$zip.Entries | ForEach-Object { $_.FullName };',
+         \ '$zip.Dispose()'
+         \ ]
+@@ -147,16 +139,16 @@ function! s:ZipReadPS(zipfile, fname, tempfile)
+     call s:Mess('WarningMsg', "***warning*** PowerShell can display, but cannot update, files in archive subfolders")
+   endif
+   let cmds = [
+-        \ '$zip = [System.IO.Compression.ZipFile]::OpenRead(' . s:Escape(a:zipfile, 1) . ');',
+-        \ '$fileEntry = $zip.Entries | Where-Object { $_.FullName -eq ' . s:Escape(a:fname, 1) . ' };',
++        \ '$zip = [System.IO.Compression.ZipFile]::OpenRead(' . s:PSEscape(a:zipfile) . ');',
++        \ '$fileEntry = $zip.Entries | Where-Object { $_.FullName -eq ' . s:PSEscape(a:fname) . ' };',
+         \ '$stream = $fileEntry.Open();',
+-        \ '$fileStream = [System.IO.File]::Create(' . s:Escape(a:tempfile, 1) . ');',
++        \ '$fileStream = [System.IO.File]::Create(' . s:PSEscape(a:tempfile) . ');',
+         \ '$stream.CopyTo($fileStream);',
+         \ '$fileStream.Close();',
+         \ '$stream.Close();',
+         \ '$zip.Dispose()'
+         \ ]
+-  return 'pwsh -NoProfile -Command ' . s:Escape(join(cmds, ' '), 1)
++  return 'pwsh -NoProfile -Command ' . s:Escape(join(cmds, ' '))
+ endfunction
+ 
+ function! s:ZipUpdatePS(zipfile, fname)
+@@ -166,7 +158,7 @@ function! s:ZipUpdatePS(zipfile, fname)
+     call s:Mess('Error', "***error*** PowerShell cannot update files in archive subfolders")
+     return ':'
+   endif
+-  return 'Compress-Archive -Path ' . a:fname . ' -Update -DestinationPath ' . a:zipfile
++  return 'Compress-Archive -Path ' . s:PSEscape(a:fname) . ' -Update -DestinationPath ' . s:PSEscape(a:zipfile)
+ endfunction
+ 
+ function! s:ZipExtractFilePS(zipfile, fname)
+@@ -177,16 +169,16 @@ function! s:ZipExtractFilePS(zipfile, fname)
+     return ':'
+   endif
+   let cmds = [
+-        \ '$zip = [System.IO.Compression.ZipFile]::OpenRead(' . s:Escape(a:zipfile, 1) . ');',
+-        \ '$fileEntry = $zip.Entries | Where-Object { $_.FullName -eq ' . a:fname . ' };',
++        \ '$zip = [System.IO.Compression.ZipFile]::OpenRead(' . s:PSEscape(a:zipfile) . ');',
++        \ '$fileEntry = $zip.Entries | Where-Object { $_.FullName -eq ' . s:PSEscape(a:fname) . ' };',
+         \ '$stream = $fileEntry.Open();',
+-        \ '$fileStream = [System.IO.File]::Create(' . a:fname . ');',
++        \ '$fileStream = [System.IO.File]::Create(' . s:PSEscape(a:fname) . ');',
+         \ '$stream.CopyTo($fileStream);',
+         \ '$fileStream.Close();',
+         \ '$stream.Close();',
+         \ '$zip.Dispose()'
+         \ ]
+-  return 'pwsh -NoProfile -Command ' . s:Escape(join(cmds, ' '), 1)
++  return 'pwsh -NoProfile -Command ' . s:Escape(join(cmds, ' '))
+ endfunction
+ 
+ function! s:ZipDeleteFilePS(zipfile, fname)
+@@ -194,12 +186,12 @@ function! s:ZipDeleteFilePS(zipfile, fname)
+   " Equivalent to `zip -d zipfile fname`
+   let cmds = [
+         \ 'Add-Type -AssemblyName System.IO.Compression.FileSystem;',
+-        \ '$zip = [System.IO.Compression.ZipFile]::Open(' . s:Escape(a:zipfile, 1) . ', ''Update'');',
+-        \ '$entry = $zip.Entries | Where-Object { $_.Name -eq ' . s:Escape(a:fname, 1) . ' };',
++        \ '$zip = [System.IO.Compression.ZipFile]::Open(' . s:PSEscape(a:zipfile) . ', ''Update'');',
++        \ '$entry = $zip.Entries | Where-Object { $_.Name -eq ' . s:PSEscape(a:fname) . ' };',
+         \ 'if ($entry) { $entry.Delete(); $zip.Dispose() }',
+         \ 'else { $zip.Dispose() }'
+         \ ]
+-  return 'pwsh -NoProfile -Command ' . s:Escape(join(cmds, ' '), 1)
++  return 'pwsh -NoProfile -Command ' . s:Escape(join(cmds, ' '))
+ endfunction
+ 
+ " ----------------
+@@ -339,9 +331,9 @@ fun! zip#Read(fname,mode)
+   let temp = tempname()
+   let fn   = expand('%:p')
+ 
+-  let gnu_cmd = g:zip_unzipcmd . ' -p -- ' . s:Escape(zipfile, 0) . ' ' . s:Escape(fname, 0) . ' > ' . s:Escape(temp, 0)
+-  let gnu_cmd = 'call system(''' . substitute(gnu_cmd, "'", "''", 'g') . ''')'
+-  let ps_cmd = 'sil !' . s:ZipReadPS(zipfile, fname, temp)
++  let gnu_cmd = g:zip_unzipcmd . ' -p -- ' . s:Escape(zipfile) . ' ' . s:Escape(fname) . ' > ' . s:Escape(temp)
++  let gnu_cmd = 'call system(' . string(gnu_cmd) . ')'
++  let ps_cmd = $"call system({string(s:ZipDeleteFilePS(zipfile, fname))})"
+   call s:TryExecGnuFallBackToPs(g:zip_unzipcmd, gnu_cmd, ps_cmd)
+ 
+   sil exe 'keepalt file '.temp
+@@ -408,9 +400,9 @@ fun! zip#Write(fname)
+     " TODO: what to check on MS-Windows to avoid writing absolute paths?
+   endif
+   if fname =~ '^[.]\{1,2}/'
+-    let gnu_cmd = g:zip_zipcmd . ' -d ' . s:Escape(fnamemodify(zipfile,":p"),0) . ' ' . s:Escape(fname,0)
+-    let gnu_cmd = 'call system(''' . substitute(gnu_cmd, "'", "''", 'g') . ''')'
+-    let ps_cmd = $"call system({s:Escape(s:ZipDeleteFilePS(zipfile, fname), 1)})"
++    let gnu_cmd = g:zip_zipcmd . ' -d ' . s:Escape(fnamemodify(zipfile,":p")) . ' ' . s:Escape(fname)
++    let gnu_cmd = 'call system(' . string(gnu_cmd) . ')'
++    let ps_cmd = $"call system({string(s:ZipDeleteFilePS(zipfile, fname))})"
+     call s:TryExecGnuFallBackToPs(g:zip_zipcmd, gnu_cmd, ps_cmd)
+     let fname = fname->substitute('^\([.]\{1,2}/\)\+', '', 'g')
+     let need_rename = 1
+@@ -419,7 +411,7 @@ fun! zip#Write(fname)
+   if fname =~ '/'
+     let dirpath = substitute(fname,'/[^/]\+$','','e')
+     if has("win32unix") && executable("cygpath")
+-    let dirpath = substitute(system("cygpath ".s:Escape(dirpath,0)),'\n','','e')
++    let dirpath = substitute(system("cygpath ".s:Escape(dirpath)),'\n','','e')
+     endif
+     call mkdir(dirpath,"p")
+   endif
+@@ -430,16 +422,17 @@ fun! zip#Write(fname)
+   " don't overwrite files forcefully
+   exe "w ".fnameescape(fname)
+   if has("win32unix") && executable("cygpath")
+-    let zipfile = substitute(system("cygpath ".s:Escape(zipfile,0)),'\n','','e')
++    let zipfile = substitute(system("cygpath ".s:Escape(zipfile)),'\n','','e')
+   endif
+ 
+   if (has("win32") || has("win95") || has("win64") || has("win16")) && &shell !~? 'sh$'
+     let fname = substitute(fname, '[', '[[]', 'g')
+   endif
+ 
+-  let gnu_cmd = g:zip_zipcmd . ' -u '. s:Escape(fnamemodify(zipfile,":p"),0) . ' ' . s:Escape(fname,0)
++  let gnu_cmd = g:zip_zipcmd . ' -u '. s:Escape(fnamemodify(zipfile,":p")) . ' ' . s:Escape(fname)
+   let gnu_cmd = 'call system(''' . substitute(gnu_cmd, "'", "''", 'g') . ''')'
+-  let ps_cmd = s:ZipUpdatePS(s:Escape(fnamemodify(zipfile, ':p'), 0), s:Escape(fname, 0))
++  let zip = fnamemodify(zipfile, ':p')
++  let ps_cmd = s:ZipUpdatePS(zip, fname)
+   let ps_cmd = 'call system(''' . substitute(ps_cmd, "'", "''", 'g') . ''')'
+   call s:TryExecGnuFallBackToPs(g:zip_zipcmd, gnu_cmd, ps_cmd)
+   if &shell =~ 'pwsh'
+@@ -522,8 +515,8 @@ fun! zip#Extract()
+ 
+   " extract the file mentioned under the cursor
+   let gnu_cmd = g:zip_extractcmd . ' -o '. shellescape(b:zipfile) . ' ' . target
+-  let gnu_cmd = 'call system(''' . substitute(gnu_cmd, "'", "''", 'g') . ''')'
+-  let ps_cmd = $"call system({s:Escape(s:ZipExtractFilePS(b:zipfile, target), 1)})"
++  let gnu_cmd = 'call system(' . string(gnu_cmd) . ')'
++  let ps_cmd = 'call system(' . string(s:ZipExtractFilePS(b:zipfile, fname)) . ')'
+   call s:TryExecGnuFallBackToPs(g:zip_extractcmd, gnu_cmd, ps_cmd)
+ 
+   if v:shell_error != 0
+@@ -537,19 +530,20 @@ endfun
+ 
+ " ---------------------------------------------------------------------
+ " s:Escape: {{{2
+-fun! s:Escape(fname,isfilt)
+-  if exists("*shellescape")
+-   if a:isfilt
+-    let qnameq= shellescape(a:fname,1)
+-   else
+-    let qnameq= shellescape(a:fname)
+-   endif
++fun! s:Escape(fname, isfilt = 0)
++  if a:isfilt
++   let qnameq = shellescape(a:fname, 1)
+   else
+-   let qnameq= g:zip_shq.escape(a:fname,g:zip_shq).g:zip_shq
++   let qnameq = shellescape(a:fname)
+   endif
+   return qnameq
+ endfun
+ 
++" s:PSEscape: Escape a string for Powershell, shellescape() does not work here {{{2
++fun! s:PSEscape(str)
++  return "'" .. substitute(a:str, "'", "''", 'g') .. "'"
++endfun
++
+ " ---------------------------------------------------------------------
+ " s:ChgDir: {{{2
+ fun! s:ChgDir(newdir,errlvl,errmsg)
+diff --git a/runtime/doc/pi_zip.txt b/runtime/doc/pi_zip.txt
+index e9294b4059..b1800dfcc5 100644
+--- a/runtime/doc/pi_zip.txt
++++ b/runtime/doc/pi_zip.txt
+@@ -48,16 +48,6 @@ Copyright: Copyright (C) 2005-2015 Charles E Campbell	 *zip-copyright*
+    If this variable exists and is true, the file window will not be
+    automatically maximized when opened.
+ 
+-							*g:zip_shq*
+-   Different operating systems may use one or more shells to execute
+-   commands.  Zip will try to guess the correct quoting mechanism to
+-   allow spaces and whatnot in filenames; however, if it is incorrectly
+-   guessing the quote to use for your setup, you may use >
+-	g:zip_shq
+-<   which by default is a single quote under Unix (') and a double quote
+-   under Windows (").  If you'd rather have no quotes, simply set
+-   g:zip_shq to the empty string (let g:zip_shq= "") in your <.vimrc>.
+-
+ 							*g:zip_unzipcmd*
+    Use this option to specify the program which does the duty of "unzip".
+    It's used during browsing. By default: >
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b9f6ef987c..ecdf7cb5b9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52860.patch \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55895.patch \
+           file://CVE-2026-57453.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


