Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77859C3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 16:30:58 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.40632.1721925051665046890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 09:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46PGUlU2003737;
	Thu, 25 Jul 2024 11:30:48 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH] oeqa sdk cases: Skip SDK test cases when TCLIBC is newlib
Date: Thu, 25 Jul 2024 11:30:46 -0500
Message-Id: <1721925046-9392-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 16:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202511

From: Mark Hatle <mark.hatle@amd.com>

Newlib generally requires additional components to function.  Skip the
cases where newlib is known to not work.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---

I'm not entirely sure the patch is right, but it provides a mechanism to
exclude specific TCLIBCs from certain sdktests.  I only added newlib,
since that is all I'm using.

 meta/lib/oeqa/sdk/cases/autotools.py | 6 ++++++
 meta/lib/oeqa/sdk/cases/cmake.py     | 4 ++++
 meta/lib/oeqa/sdk/cases/gcc.py       | 4 ++++
 meta/lib/oeqa/sdk/cases/gtk3.py      | 4 ++++
 meta/lib/oeqa/sdk/cases/makefile.py  | 6 ++++++
 meta/lib/oeqa/sdk/cases/meson.py     | 4 ++++
 6 files changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index 848e9392ec..4bac28f04d 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -7,6 +7,7 @@
 import os
 import tempfile
 import subprocess
+import unittest
 
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
@@ -16,6 +17,11 @@ class AutotoolsTest(OESDKTestCase):
     """
     Check that autotools will cross-compile correctly.
     """
+    def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("AutotoolsTest class: SDK doesn't contain a supported C library")
+
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
diff --git a/meta/lib/oeqa/sdk/cases/cmake.py b/meta/lib/oeqa/sdk/cases/cmake.py
index db7d826a38..cb0944ee99 100644
--- a/meta/lib/oeqa/sdk/cases/cmake.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -19,6 +19,10 @@ class CMakeTest(OESDKTestCase):
     """
 
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("CMakeTest class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("CMakeTest: needs cmake")
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index fc28b9c3d4..e810d2c42b 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -26,6 +26,10 @@ class GccCompileTest(OESDKTestCase):
                     os.path.join(self.tc.sdk_dir, f))
 
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a supported C library")
+
         machine = self.td.get("MACHINE")
         if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
                 self.tc.hasHostPackage("^gcc-", regex=True)):
diff --git a/meta/lib/oeqa/sdk/cases/gtk3.py b/meta/lib/oeqa/sdk/cases/gtk3.py
index c329c4bb86..8f60d5e7da 100644
--- a/meta/lib/oeqa/sdk/cases/gtk3.py
+++ b/meta/lib/oeqa/sdk/cases/gtk3.py
@@ -18,6 +18,10 @@ class GTK3Test(OESDKTestCase):
     Test that autotools and GTK+ 3 compiles correctly.
     """
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
diff --git a/meta/lib/oeqa/sdk/cases/makefile.py b/meta/lib/oeqa/sdk/cases/makefile.py
index 2ff54ce25f..e1e2484820 100644
--- a/meta/lib/oeqa/sdk/cases/makefile.py
+++ b/meta/lib/oeqa/sdk/cases/makefile.py
@@ -5,6 +5,7 @@
 #
 
 import os, tempfile, subprocess
+import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
@@ -13,6 +14,11 @@ class MakefileTest(OESDKTestCase):
     """
     Test that "plain" compilation works, using just $CC $CFLAGS etc.
     """
+    def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("MakefileTest class: SDK doesn't contain a supported C library")
+
     def test_lzip(self):
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/meson.py
index be53df204a..1edf78720a 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -18,6 +18,10 @@ class MesonTest(OESDKTestCase):
     Test that Meson builds correctly.
     """
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("MesonTest class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasHostPackage("nativesdk-meson") or
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("MesonTest: needs meson")
-- 
2.34.1


