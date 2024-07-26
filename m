Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44841C52CDC
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.65425.1722010961262244021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46QGMcnp026618
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:22:40 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 6/8] oeqa sdk cases: Skip SDK test cases when TCLIBC is newlib
Date: Fri, 26 Jul 2024 11:22:36 -0500
Message-Id: <1722010958-23635-6-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202555

From: Mark Hatle <mark.hatle@amd.com>

Newlib generally requires additional components to function.  Skip the
cases where newlib is known to not work.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9934755554e40d9980b90c3d541f4c702203561)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oeqa/sdk/cases/assimp.py          | 4 ++++
 meta/lib/oeqa/sdk/cases/buildcpio.py       | 5 +++++
 meta/lib/oeqa/sdk/cases/buildepoxy.py      | 4 ++++
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 4 ++++
 meta/lib/oeqa/sdk/cases/buildlzip.py       | 5 +++++
 meta/lib/oeqa/sdk/cases/gcc.py             | 4 ++++
 6 files changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index d990b1e..4cc30f2 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -19,6 +19,10 @@ class BuildAssimp(OESDKTestCase):
     """
 
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("CMakeTest class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 51003b1..ab8fc41 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -17,6 +17,11 @@ class BuildCpioTest(OESDKTestCase):
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
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 147ee3e..5b9c36f 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -18,6 +18,10 @@ class EpoxyTest(OESDKTestCase):
     Test that Meson builds correctly.
     """
     def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in [ 'newlib' ]:
+            raise unittest.SkipTest("MesonTest class: SDK doesn't contain a supported C library")
+
         if not (self.tc.hasHostPackage("nativesdk-meson") or
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 178f074..2818743 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -18,6 +18,10 @@ class GalculatorTest(OESDKTestCase):
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
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index b4b7d85..afedc25 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -13,6 +13,11 @@ class BuildLzipTest(OESDKTestCase):
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
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index fc28b9c..e810d2c 100644
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
-- 
1.8.3.1


