Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0261BC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:03 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=DyKl9bLB;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=13140;
  q=dns/txt; s=NAESA-Selector1; t=1785575521;
  x=1817111521;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ViEl7lxyzXwYo8MXX8OkEKfyDErZ6BxGcMAVLayEOqY=;
  b=DyKl9bLBB2+hicruNAIkV5ErYsPFh3ZMcRfMRuegsRrnRy0Lw3XJ+cTp
   H1xiJI7HRx9QWeSVyB4V9aPHimIObj3C5LxZXBip/kHnlulbmnncEKVrV
   0+zNNFE6r+yV90w3w+r4brxZAItyTbz7PYstLaJUIpfu+kW9QvQ39zHVb
   rP4BjvZ4FXAIhCabeOpjrIm5LRE68/0U4y+h58MSTp/nPBqsaDeuCCOJI
   rGow35AJ9fUfaIcsaJQucNrf9dIjRwoyOaJP+gwEH3haSKgKkUoTXFCd1
   qYpwL7rcEQjdHPoN/rEwFhJa8xZLbCRKLyEn0lpkS4OlvUO6uIDNc8GJH
   g==;
X-CSE-ConnectionGUID: vTZKoA4YTvm7ZVFPwOEfww==
X-CSE-MsgGUID: ToVcHSTvTVG7rVCcmu8xew==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911521"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:12:00 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 04/10] vim: Fix for CVE-2026-57453
Date: Sat,  1 Aug 2026 14:40:21 +0530
Message-ID: <20260801091145.2788751-4-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242482

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/b2cc9be119d51212bf0d3f2a99
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57453

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-57453.patch            | 269 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57453.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57453.patch b/meta/recipes-support/vim/files/CVE-2026-57453.patch
new file mode 100644
index 0000000000..46959d715a
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57453.patch
@@ -0,0 +1,269 @@
+From e1e4a712cb53b6f674ade81ba1384a37a31f3061 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/vim/vim/commit/b2cc9be119d51212bf0d3f2a99]
+CVE: CVE-2026-57453
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/zip.vim | 78 +++++++++++++++++++---------------------
+ runtime/doc/pi_zip.txt   | 12 +------
+ src/version.c            |  2 ++
+ 3 files changed, 39 insertions(+), 53 deletions(-)
+
+diff --git a/runtime/autoload/zip.vim b/runtime/autoload/zip.vim
+index f4482fd7f..8738a7f68 100644
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
++  let ps_cmd = 'call system(' . string(s:ZipReadPS(zipfile, fname, temp)) . ')'
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
+index e9294b405..67c37721f 100644
+--- a/runtime/doc/pi_zip.txt
++++ b/runtime/doc/pi_zip.txt
+@@ -1,4 +1,4 @@
+-*pi_zip.txt*	For Vim version 9.2.  Last change: 2026 Apr 05
++*pi_zip.txt*	For Vim version 9.2.  Last change: 2026 Jun 20
+ 
+ 				+====================+
+ 				| Zip File Interface |
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
+diff --git a/src/version.c b/src/version.c
+index a216b9b01..4d6908426 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    678,
+ /**/
+     671,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0fc3ae5df0..56a2004899 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-55693.patch \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57451.patch \
+           file://CVE-2026-57453.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


