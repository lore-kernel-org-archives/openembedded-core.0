Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CDCC55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:01 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=aHcCmAfQ;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=5441; q=dns/txt;
  s=NAESA-Selector1; t=1785575517; x=1817111517;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QDwSefYuciwX8ZuIft4k1HP53JZTi8uqkLABVIi0zeg=;
  b=aHcCmAfQLUPMFRJ1xDlAOAMT6R1wF44qe0/ARLPf3pBjfnqtC6GPsBbu
   oFJCZSgPKxyMJjiKRzYsB7dPRaJQoEjHWnEtNmlaJfKFG8BI7lntL5GI9
   6naLlS5vtnlOKBDbKOR1b/5zB5v3mh3sNsazrIR1yvYo4BrJMB4JwNvp2
   AOOAeVGHyrfqt0OdqXe5zAv1NmiHHqQ4jK1CvrtRtiuBtuMLK9CV6uGAR
   fwyFWBbF1LV2xF5zw0q4Z6vbvhgZKpjpImY8Uf3xBVSUXH6fPAQy2sUYJ
   CxnDBRBdR5lFUlLj6BSa6Lz0qYvHItzufAde60cpx3bxWLCs5cIPbLBVw
   A==;
X-CSE-ConnectionGUID: f0DvwIV+RnSSxyycrYctgA==
X-CSE-MsgGUID: sCOO62TtTe228B/wkTqljg==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911516"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:11:56 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 02/10] vim: Fix for CVE-2026-55895
Date: Sat,  1 Aug 2026 14:40:19 +0530
Message-ID: <20260801091145.2788751-2-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242480

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/55bc757a5d436e59d50fe43f7cda94b118f86cb2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-55895

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-55895.patch            | 106 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55895.patch b/meta/recipes-support/vim/files/CVE-2026-55895.patch
new file mode 100644
index 0000000000..6bfb8ee124
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55895.patch
@@ -0,0 +1,106 @@
+From 7c320315fab914a26bccfbbe6caf1a721897aa9c Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Tue, 16 Jun 2026 21:00:28 +0000
+Subject: [PATCH] patch 9.2.0663: [security]: runtime(netrw): code injection in
+ local file deletion
+
+Problem:  [security]: s:NetrwLocalRmFile() escapes only the backslash in
+          the file name before passing it to :execute, so a name
+          containing "|" injects arbitrary Ex commands when the file is
+          deleted (cipher-creator)
+Solution: Use fnameescape() to correctly escape the file name
+          (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-vhh8-v6wx-hjjh
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/55bc757a5d436e59d50fe43f7cda94b118f86cb2]
+CVE: CVE-2026-55895
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ .../pack/dist/opt/netrw/autoload/netrw.vim    |  5 +++--
+ src/testdir/test_plugin_netrw.vim             | 20 +++++++++++++++++++
+ src/version.c                                 |  2 ++
+ 3 files changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index a04120d5f..d7eca30e4 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -24,6 +24,7 @@
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " 2026 Apr 01 by Vim Project use fnameescape() with netrw#FileUrlEdit()
+ " 2026 Apr 05 by Vim Project Fix netrw#RFC2396() #19913
++" 2026 Jun 16 by Vim Project Fix filename escaping in local file deletion
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -3061,7 +3062,7 @@ function s:NetrwBrowse(islocal,dirname)
+     elseif !a:islocal && dirname !~ '[\/]$' && dirname !~ '^"'
+         " s:NetrwBrowse :  remote regular file handler {{{3
+         if bufname(dirname) != ""
+-            exe "NetrwKeepj b ".bufname(dirname)
++            exe "NetrwKeepj b ".fnameescape(bufname(dirname))
+         else
+             " attempt transfer of remote regular file
+ 
+@@ -8770,7 +8771,7 @@ function s:NetrwLocalRmFile(path, fname, all)
+             call netrw#msg#Notify('ERROR', printf("unable to delete <%s>!", rmfile))
+         else
+             " Remove file only if there are no pending changes
+-            execute printf('silent! bwipeout %s', rmfile)
++            execute printf('silent! bwipeout %s', fnameescape(rmfile))
+         endif
+ 
+     elseif dir && (all || empty(ok))
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index cfce82f68..a0a3915f5 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -674,4 +674,24 @@ func Test_netrw_injection()
+   endtry
+ endfunc
+ 
++" Deleting a file whose name contains an Ex command separator must not let the
++" name inject commands into the :execute in s:NetrwLocalRmFile().
++func Test_netrw_local_rm_injection()
++  CheckUnix
++  let dir   = getcwd() . '/Xnetrwrm'
++  let fname = "x|let g:injected = 1"
++  call mkdir(dir, 'pR')
++  call writefile([], dir . '/' . fname)
++  try
++    call netrw#Call('NetrwLocalRmFile', dir, fname, 1)
++    call assert_false(exists('g:injected'), 'filename must not inject Ex commands')
++    " The file is removed before the sink, so its absence also confirms the
++    " vulnerable code path was actually exercised (not skipped on an error).
++    call assert_false(filereadable(dir . '/' . fname), 'crafted file must be deleted')
++  finally
++    call delete(dir . '/' . fname)
++    unlet! g:injected
++  endtry
++endfunc
++
+ " vim:ts=8 sts=2 sw=2 et
+diff --git a/src/version.c b/src/version.c
+index e7f323854..16a8b140d 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     671,
++/**/
++    663,
+ /**/
+     653,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4189817a8d..48edfc694f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-55892.patch \
            file://CVE-2026-57452.patch \
            file://CVE-2026-55693.patch \
+           file://CVE-2026-55895.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


