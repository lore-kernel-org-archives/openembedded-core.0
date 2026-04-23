Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1527BFDEE41
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 18:11:55 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4122.1776967908339566692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 11:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=FQiWV4Hw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1328017-20260423181144195e9198f70002077c-t2wx_z@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260423181144195e9198f70002077c
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Apr 2026 20:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q/GMcOPR5aZtaxrXhrePuyIEVJz+Q/jsPO4a/9bjqA8=;
 b=FQiWV4HwL8QKB5SAfgo+rypr50feqYhObwXuE9MC42P/2L5rJAQCDCODszcaVs7lYnYOdZ
 /m2z2YIF/FYu91kN4IaJX5RqVHKobtjf/VFA5etP58IP7P33Z1Mm8Mc4P5S9T8sO0sJpPh/1
 B8eISiTTYWRsk3TQl1tfIBw3x2XxbDSKHvM9flI0T96peoYOT4gfDQ1awxeUUhrv/khrII2z
 IfBYq3692H7GcDM5cBcvVQ4By4BuziFp5ezVfZz2kPMcLGIIxJvKVdxQ1LO6XsEcavFcSrrN
 3jwtDth+V80acA4V8kNjtJN5LLFSKIUVA9jA+PcecP4j85g4XIjtJOTg==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH] oeqa/sdk: build libhandy instead of galculator
Date: Thu, 23 Apr 2026 20:11:41 +0200
Message-Id: <20260423181141.452976-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 18:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235833

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

galculator is unmaintained (last commit ~2014), its download URL is
gone causing core-image-sato:do_testsdk to fail.

Switch to building libhandy-1.8.3, a GTK+3 library from the GNOME
stack, using Meson (same as the buildepoxy test). This still exercises
SDK's GTK+3 cross-compilation support while using a project that is
actively hosted and builds cleanly.

Meson options disable optional features that require host tools not
guaranteed to be present in the SDK (glade, gobject-introspection,
vapi).

The file is renamed from buildgalculator.py to gtk3.py to reflect
that the test verifies GTK+3 SDK support, not a specific application.

Backport of master commits:
- ccf7fdc0e5 ('oeqa/sdk: rename test cases')
- ff6fa71eb0 ('oeqa/sdk/gtk3: build libhandy instead of galculator')
adapted for the scarthgap branch which does not have MesonTestBase
infrastructure.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 50 ---------------------
 meta/lib/oeqa/sdk/cases/gtk3.py            | 51 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 50 deletions(-)
 delete mode 100644 meta/lib/oeqa/sdk/cases/buildgalculator.py
 create mode 100644 meta/lib/oeqa/sdk/cases/gtk3.py

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
deleted file mode 100644
index 28187434a1..0000000000
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ /dev/null
@@ -1,50 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-import os
-import subprocess
-import tempfile
-import unittest
-
-from oeqa.sdk.case import OESDKTestCase
-from oeqa.utils.subprocesstweak import errors_have_output
-errors_have_output()
-
-class GalculatorTest(OESDKTestCase):
-    """
-    Test that autotools and GTK+ 3 compiles correctly.
-    """
-    def setUp(self):
-        libc = self.td.get("TCLIBC")
-        if libc in [ 'newlib' ]:
-            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain a supported C library")
-
-        if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
-                self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
-            raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
-        if not (self.tc.hasHostPackage("nativesdk-gettext-dev") or
-                self.tc.hasHostPackage("gettext-native")):
-            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
-
-    def test_galculator(self):
-        with tempfile.TemporaryDirectory(prefix="galculator", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
-
-            dirs = {}
-            dirs["source"] = os.path.join(testdir, "galculator-2.1.4")
-            dirs["build"] = os.path.join(testdir, "build")
-            dirs["install"] = os.path.join(testdir, "install")
-
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
-            self.assertTrue(os.path.isdir(dirs["source"]))
-            os.makedirs(dirs["build"])
-
-            self._run("cd {source} && sed -i -e '/s_preferences.*prefs;/d' src/main.c && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/aclocal -I m4".format(**dirs))
-            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
-            self._run("cd {build} && make -j".format(**dirs))
-            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
-
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "galculator"))
diff --git a/meta/lib/oeqa/sdk/cases/gtk3.py b/meta/lib/oeqa/sdk/cases/gtk3.py
new file mode 100644
index 0000000000..e32c1035ee
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/gtk3.py
@@ -0,0 +1,51 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import subprocess
+import tempfile
+import unittest
+
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class GTK3Test(OESDKTestCase):
+    """
+    Test that GTK+ 3 compile correctly by building libhandy.
+    """
+    def setUp(self):
+        libc = self.td.get("TCLIBC")
+        if libc in ['newlib']:
+            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain a supported C library")
+
+        if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or
+                self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
+            raise unittest.SkipTest("GTK3Test class: SDK doesn't support gtk+3")
+
+        if not (self.tc.hasHostPackage("nativesdk-meson") or
+                self.tc.hasHostPackage("meson-native")):
+            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain Meson")
+
+    def test_libhandy(self):
+        with tempfile.TemporaryDirectory(prefix="libhandy", dir=self.tc.sdk_dir) as testdir:
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://download.gnome.org/sources/libhandy/1.8/libhandy-1.8.3.tar.xz")
+
+            dirs = {}
+            dirs["source"] = os.path.join(testdir, "libhandy-1.8.3")
+            dirs["build"] = os.path.join(testdir, "build")
+            dirs["install"] = os.path.join(testdir, "install")
+
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
+            self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
+
+            self._run("meson --warnlevel 1 -Dglade_catalog=disabled -Dintrospection=disabled -Dvapi=false {build} {source}".format(
+                **dirs))
+            self._run("ninja -C {build} -v".format(**dirs))
+            self._run("DESTDIR={install} ninja -C {build} -v install".format(**dirs))
+
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libhandy-1.so"))
-- 
2.39.5


