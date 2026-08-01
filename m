Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCADC54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:22 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=JKSC7UqN;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=6391; q=dns/txt;
  s=NAESA-Selector1; t=1785575532; x=1817111532;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=odcXevo3f6NzI6ESJFDj4CFfC+XGvXFBtMIn1RVWmKs=;
  b=JKSC7UqNya6YxeuaY+IwRx8hedHjBWakMte9yEw1k0h3g/iXYPnog5lU
   4CC7sBn+OLhgWbUbV2ZdnI7foAeBjIas/UxPW+F9/BH0LMdLTZqd1KcrX
   FFhNKayvRn+TG/rkYy8vXWeCKpw5fUhh9tPr9dXH/jiQZZX94xvB5Rx7U
   2V03pu4qS2qLXRq69M3TKC7al3h8RsXfLbAFtPSNYXZfFCXiKsdNPl/z2
   KwNz/IjbsOqkI/EmOBiCTbcO37Hpdvl1gorutMoPPIsYvjXNJImLDyTyt
   eYBz+9DNI1ghZGz0k6auGG0yHCtUKfF6SNEem7lUUVrGtKtpI6e8FEEas
   g==;
X-CSE-ConnectionGUID: cu/G8/PiSDGHBKsz1K06fg==
X-CSE-MsgGUID: lvBPr9xLRb694cLhS4v50g==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911530"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:12:11 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 10/10] vim: Fix for CVE-2026-59858
Date: Sat,  1 Aug 2026 14:40:27 +0530
Message-ID: <20260801091145.2788751-10-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242488

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59858

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-59858.patch            | 149 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch b/meta/recipes-support/vim/files/CVE-2026-59858.patch
new file mode 100644
index 0000000000..f18637bd93
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59858.patch
@@ -0,0 +1,149 @@
+From 09554668bd5ab31261a5c5585a0f58baa1080105 Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Fri, 26 Jun 2026 15:41:24 +0900
+Subject: [PATCH] patch 9.2.0735: [security]: arbitrary Ex command execution
+ during C omni-completion
+
+Problem:  [security]: With C omni-completion, a crafted tags file can execute
+          arbitrary Ex commands when completing a struct/union member
+          (cipher-creator)
+Solution: Escape the type field before inserting it into the :vimgrep
+          pattern so it cannot close the pattern and start a new command
+          (Hirohito Higashi).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-mf92-v4xw-j45x
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704e]
+CVE: CVE-2026-59858
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/ccomplete.vim        |  2 +-
+ src/testdir/Make_all.mak              |  2 +
+ src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
+ src/version.c                         |  2 +
+ 4 files changed, 67 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_ccomplete.vim
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index 51237be98..dc3388b52 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -600,7 +600,7 @@ def StructMembers( # {{{1
+         return []
+       endif
+       execute 'silent! keepjumps noautocmd '
+-        .. n .. 'vimgrep ' .. '/\t' .. typename .. '\(\t\|$\)/j '
++        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') .. '\(\t\|$\)/j '
+         .. fnames
+ 
+       qflist = getqflist()
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index b5735b6c3..0cf2c4110 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -243,6 +243,7 @@ NEW_TESTS = \
+ 	test_partial \
+ 	test_paste \
+ 	test_perl \
++	test_plugin_ccomplete \
+ 	test_plugin_comment \
+ 	test_plugin_glvs \
+ 	test_plugin_helpcurwin \
+@@ -523,6 +524,7 @@ NEW_TESTS_RES = \
+ 	test_partial.res \
+ 	test_paste.res \
+ 	test_perl.res \
++	test_plugin_ccomplete.res \
+ 	test_plugin_comment.res \
+ 	test_plugin_glvs.res \
+ 	test_plugin_helpcurwin.res \
+diff --git a/src/testdir/test_plugin_ccomplete.vim b/src/testdir/test_plugin_ccomplete.vim
+new file mode 100644
+index 000000000..a635bd50b
+--- /dev/null
++++ b/src/testdir/test_plugin_ccomplete.vim
+@@ -0,0 +1,62 @@
++" Tests for the C omni-completion plugin (runtime/autoload/ccomplete.vim).
++
++func s:WriteTags(lines)
++  " Mark unsorted so lookup is a linear scan regardless of entry order.
++  let tagsfile = tempname()
++  call writefile(["!_TAG_FILE_SORTED\t0\t/0/"] + a:lines, tagsfile)
++  return tagsfile
++endfunc
++
++" A crafted typeref field is interpolated into the :vimgrep pattern in
++" StructMembers().  Without escaping, "/" closes the pattern and "|" starts a
++" new Ex command, so the field runs as an Ex command during completion.
++func Test_ccomplete_no_exec_via_typeref()
++  unlet! g:ccomplete_injected
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:x/|let g:ccomplete_injected = 1|\"",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  call ccomplete#Complete(0, 'myvar.x')
++
++  call assert_false(exists('g:ccomplete_injected'),
++        \ 'typeref field was executed as an Ex command during omni-completion')
++
++  bwipe!
++  let &tags = save_tags
++  unlet! g:ccomplete_injected
++endfunc
++
++" A legitimate typeref must still drive struct-member completion: escaping the
++" field value must not break the normal path.
++func Test_ccomplete_typeref_completion_still_works()
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:struct:mystruct",
++        \ "alpha\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
++        \ "beta\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  let items = ccomplete#Complete(0, 'myvar.')
++
++  call assert_equal(type([]), type(items),
++        \ 'ccomplete#Complete did not return a list')
++  let names = map(copy(items), 'v:val.word')
++  call assert_true(index(names, 'alpha') >= 0,
++        \ 'struct member "alpha" missing from completion: ' . string(names))
++  call assert_true(index(names, 'beta') >= 0,
++        \ 'struct member "beta" missing from completion: ' . string(names))
++
++  bwipe!
++  let &tags = save_tags
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index ceea0d5e7..92cd53129 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     736,
++/**/
++    735,
+ /**/
+     725,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9e2338fcb0..1da47d9243 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57456.patch \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
+           file://CVE-2026-59858.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


