Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E3BC55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:11 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=BwfsGP94;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=5875; q=dns/txt;
  s=NAESA-Selector1; t=1785575529; x=1817111529;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZDf+nBW5H8iafKoE02iD2AyPCMhevJVzRvIKWSFaMVs=;
  b=BwfsGP94KNx1F+TH7MFxKv9ZREx7SOJZZiik4+bYBJPhqLHLbC6la5d2
   hWyALbe3TqiiDnk4iucIrA9ts0IMO616Asb5bbF11GozexLwHHyKw/9Ai
   O3v/5sUWkTyDni0E5Nym9dltddB3OKdGp3N2eCQ6CvXNi91xQymTuJp/S
   HfozxjnZTwvCYcLivCyVPS7dR+7NwdM+K2tNFjWZ/aFtJ6k4qviPoZf4J
   +40zPBhxiAAp/+oVRS38MLvfwRoftEIoe7atfkJHhgN7+WhrSi8Zg3Qtd
   U4Twvn1MLyyRFqytU9h57yVnoaY9awJ9/KTkoHBOzxtWi0a17zWU3zUX2
   g==;
X-CSE-ConnectionGUID: LGGZGycRQ+G6pq6z3PCq0g==
X-CSE-MsgGUID: Q2jtvQH0QiekmjGAfUXg6Q==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911527"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:12:07 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 08/10] vim: Fix for CVE-2026-59856
Date: Sat,  1 Aug 2026 14:40:25 +0530
Message-ID: <20260801091145.2788751-8-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242486

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/43afc581a37a35762dd0ef292f038b9dc5680a24
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59856

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-59856.patch            | 118 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59856.patch b/meta/recipes-support/vim/files/CVE-2026-59856.patch
new file mode 100644
index 0000000000..9e9bdf03c5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59856.patch
@@ -0,0 +1,118 @@
+From c532c40015db331fbcfdf4ef9dd717b13fc54d2e Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Fri, 26 Jun 2026 20:07:01 +0900
+Subject: [PATCH] patch 9.2.0736: potential command execution in PHP
+ omni-completion
+
+Problem:  With PHP omni-completion, a crafted file can potentially
+          execute arbitrary commands when completing a class member.
+Solution: Quote the class name before inserting it into the search()
+          pattern run via win_execute().
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/43afc581a37a35762dd0ef292f038b9dc5680a24]
+CVE: CVE-2026-59856
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/phpcomplete.vim        |  3 ++-
+ src/testdir/Make_all.mak                |  2 ++
+ src/testdir/test_plugin_phpcomplete.vim | 35 +++++++++++++++++++++++++
+ src/version.c                           |  2 ++
+ 4 files changed, 41 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_phpcomplete.vim
+
+diff --git a/runtime/autoload/phpcomplete.vim b/runtime/autoload/phpcomplete.vim
+index 5b4263ae4..93f7d8b45 100644
+--- a/runtime/autoload/phpcomplete.vim
++++ b/runtime/autoload/phpcomplete.vim
+@@ -2082,7 +2082,8 @@ function! phpcomplete#GetClassContentsStructure(file_path, file_lines, class_nam
+ 	let result = []
+ 	let popup_id = popup_create(a:file_lines, {'hidden': v:true})
+ 
+-	call win_execute(popup_id, 'call search(''\c\(class\|interface\|trait\)\_s\+'.a:class_name.'\(\>\|$\)'')')
++	call win_execute(popup_id, 'call search('
++		\ . string('\c\(class\|interface\|trait\)\_s\+' . a:class_name . '\(\>\|$\)') . ')')
+ 	call win_execute(popup_id, "let cfline = line('.')")
+ 	call win_execute(popup_id, "call search('{')")
+ 	call win_execute(popup_id, "let endline = line('.')")
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index b06d1af43..b5735b6c3 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -250,6 +250,7 @@ NEW_TESTS = \
+ 	test_plugin_man \
+ 	test_plugin_matchparen \
+ 	test_plugin_netrw \
++	test_plugin_phpcomplete \
+ 	test_plugin_python3complete \
+ 	test_plugin_osc52 \
+ 	test_plugin_tar \
+@@ -529,6 +530,7 @@ NEW_TESTS_RES = \
+ 	test_plugin_man.res \
+ 	test_plugin_matchparen.res \
+ 	test_plugin_netrw.res \
++	test_plugin_phpcomplete.res \
+ 	test_plugin_python3complete.res \
+ 	test_plugin_osc52.res \
+ 	test_plugin_tar.res \
+diff --git a/src/testdir/test_plugin_phpcomplete.vim b/src/testdir/test_plugin_phpcomplete.vim
+new file mode 100644
+index 000000000..7f66be47b
+--- /dev/null
++++ b/src/testdir/test_plugin_phpcomplete.vim
+@@ -0,0 +1,35 @@
++" Tests for the PHP omni-completion plugin (runtime/autoload/phpcomplete.vim).
++
++" A buffer class name is interpolated into a search() pattern run via
++" win_execute().  Without escaping, "'" closes the string and "|" starts a new
++" Ex command, so the name runs as an Ex command during completion.
++func Test_phpcomplete_no_exec_via_class_name()
++  unlet! g:phpcomplete_injected
++  let lines = ['<?php', 'class x {}', '']
++  let payload = "x')|let g:phpcomplete_injected = 1|call search('"
++
++  try
++    call phpcomplete#GetClassContentsStructure('x.php', lines, payload)
++  catch
++  endtry
++
++  call assert_false(exists('g:phpcomplete_injected'),
++        \ 'class name was executed as an Ex command during completion')
++
++  unlet! g:phpcomplete_injected
++endfunc
++
++func Test_phpcomplete_class_lookup_still_works()
++  let lines = ['<?php', 'class Foo {', '    public $bar;', '}', '']
++  let result = phpcomplete#GetClassContentsStructure('Foo.php', lines, 'Foo')
++
++  call assert_equal(type([]), type(result),
++        \ 'GetClassContentsStructure did not return a list')
++  call assert_true(len(result) > 0, 'no class structure returned')
++  call assert_match('class Foo', result[0].content,
++        \ 'class body missing from returned content')
++  call assert_match('bar', result[0].content,
++        \ 'class member missing from returned content')
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index bf680c656..fbc2c8b15 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    736,
+ /**/
+     699,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0f1355f0fc..f0e54d71e0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57454.patch \
            file://CVE-2026-57455.patch \
            file://CVE-2026-57456.patch \
+           file://CVE-2026-59856.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


