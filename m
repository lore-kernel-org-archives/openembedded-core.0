Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FCAC54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:11 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=LjeKKlLA;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=7643; q=dns/txt;
  s=NAESA-Selector1; t=1785575527; x=1817111527;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KF6ZJhdpRevOznbtXv+wKFzqgakku31vrbaB3YLerLo=;
  b=LjeKKlLAzh1pY9qi+RwECnebdEl5D/pl9J41io2W4+0q9J8fvDJ8BUSk
   QXamR6wI3GaSrpFjp/H0oCW1jw+qDb/SSRQD8gmRaRtzxD0TRCRwhqBNq
   Lg3By6e4lV8zDgN3+ObBU3iIN7ISpp1hM6dBW5wRr2U4TgMCx8Ec/dfxq
   aBR3jWo3mkMujZhkJshjAnUGLTTwtmWkpmu3ooZtVJwJacvqw0BuVBgNn
   BRNu3UzxUJHTrBpNiU30mZi+QRorvZNZgbXUlSpTKHHOPpNrvp18RtP1M
   kKuks4QZ81+cZRZTic/hU36Gpajeu/IJgyzaJz8ii/YsX66DEO29ehTmY
   Q==;
X-CSE-ConnectionGUID: JK7pg0+lTaCnRKBAwJR97w==
X-CSE-MsgGUID: 0E4JBQbPRpOqR8uDRCy84Q==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911526"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:12:06 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 07/10] vim: Fix for CVE-2026-57456
Date: Sat,  1 Aug 2026 14:40:24 +0530
Message-ID: <20260801091145.2788751-7-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242485

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/cce141c42740f122dd8486ae04e21c2a81016ba8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57456

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-57456.patch            | 164 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57456.patch b/meta/recipes-support/vim/files/CVE-2026-57456.patch
new file mode 100644
index 0000000000..253fff486d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57456.patch
@@ -0,0 +1,164 @@
+From 88a735ff4fa7ff269ba4ca94a44e8cdaefa5df28 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:50:56 +0000
+Subject: [PATCH] patch 9.2.0699: [security]: possible code execution with
+ python complete
+
+Problem:  [security]: possible code execution with python complete
+          (morningbread)
+Solution: Use repr() to quote the doc strings correctly
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-ppj8-wqjf-6fp3
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/cce141c42740f122dd8486ae04e21c2a81016ba8]
+CVE: CVE-2026-57456
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/python3complete.vim        |  9 +++++----
+ runtime/autoload/pythoncomplete.vim         |  9 +++++----
+ src/testdir/test_plugin_python3complete.vim | 15 +++++++++++++++
+ src/version.c                               |  2 ++
+ 4 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index c4ef19d82..f90cca74b 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -2,7 +2,7 @@
+ " Maintainer: <vacancy>
+ " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
+ " Version: 0.10
+-" Last Updated: 2026 Jun 04
++" Last Updated: 2026 Jun 21
+ "
+ " Roland Puntaier: this file contains adaptations for python3 and is parallel to pythoncomplete.vim
+ "
+@@ -22,6 +22,7 @@
+ "     previous code passed buffer-supplied expressions to exec() which
+ "     Python evaluates at definition time, allowing arbitrary code
+ "     execution via crafted def/class headers
++"   * use repr() on doc strings to prevent code execution
+ "
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+@@ -335,7 +336,7 @@ class Scope(object):
+ 
+     def get_code(self):
+         str = ""
+-        if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += repr(self.docstr)+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+@@ -378,7 +379,7 @@ class Class(Scope):
+                        if _DOTTED_NAME_RE.match(s.strip())]
+         if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         if len(self.subscopes) > 0:
+             for s in self.subscopes: str += s.get_code()
+         else:
+@@ -401,7 +402,7 @@ class Function(Scope):
+         safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+             (self.currentindent(),self.name,','.join(safe_params))
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         str += "%spass\n" % self.childindent()
+         return str
+ 
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 39b1efd29..d2f5d57b0 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -2,7 +2,7 @@
+ " Maintainer: <vacancy>
+ " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
+ " Version: 0.10
+-" Last Updated: 2026 Jun 04
++" Last Updated: 2026 Jun 21
+ "
+ " Changes
+ " TODO:
+@@ -20,6 +20,7 @@
+ "     previous code passed buffer-supplied expressions to exec() which
+ "     Python evaluates at definition time, allowing arbitrary code
+ "     execution via crafted def/class headers
++"   * use repr() on doc strings to prevent code execution
+ "
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+@@ -350,7 +351,7 @@ class Scope(object):
+ 
+     def get_code(self):
+         str = ""
+-        if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += repr(self.docstr)+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+@@ -393,7 +394,7 @@ class Class(Scope):
+                        if _DOTTED_NAME_RE.match(s.strip())]
+         if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         if len(self.subscopes) > 0:
+             for s in self.subscopes: str += s.get_code()
+         else:
+@@ -416,7 +417,7 @@ class Function(Scope):
+         safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+             (self.currentindent(),self.name,','.join(safe_params))
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         str += "%spass\n" % self.childindent()
+         return str
+ 
+diff --git a/src/testdir/test_plugin_python3complete.vim b/src/testdir/test_plugin_python3complete.vim
+index e2b0c6616..590348ee4 100644
+--- a/src/testdir/test_plugin_python3complete.vim
++++ b/src/testdir/test_plugin_python3complete.vim
+@@ -221,4 +221,19 @@ func Test_python3complete_allow_import_on_runs_imports()
+         \ 'g:pythoncomplete_allow_import=1 did not run the buffer import')
+ endfunc
+ 
++func Test_python3complete_no_exec_via_class_docstring()
++  " A class-body docstring is emitted verbatim between triple quotes by
++  " get_code() and runs at class-definition time during exec().  A single-
++  " quoted source docstring lets an embedded """ survive doc()'s leading/
++  " trailing quote strip and break out of the generated literal.
++  let marker = tempname()
++  call s:CompleteAndExpectNoMarker([
++        \ 'class Foo:',
++        \ '    ''x"""+open("' . marker . '", "w").close()+"""y''',
++        \ '    pass',
++        \ 'Foo.',
++        \ ], marker,
++        \ 'class docstring expression was evaluated during omni-completion')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index d3b72595f..bf680c656 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    699,
+ /**/
+     698,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8c5a5e88a9..0f1355f0fc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57453.patch \
            file://CVE-2026-57454.patch \
            file://CVE-2026-57455.patch \
+           file://CVE-2026-57456.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


