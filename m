Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB43C3ABD8
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6811.1746866651053816665
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8466E153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28ED63F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/23] oeqa/sdk: use ensure_*_package helpers
Date: Sat, 10 May 2025 09:43:42 +0100
Message-ID: <20250510084400.269726-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216257

Clean up lots of dependency checking code by using the new helpers.

This means that a lot of tests that were previously skipped inside the
eSDK testing on the autobuilder are now executed, and fail.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/cmake.py   |  4 +---
 meta/lib/oeqa/sdk/cases/gtk3.py    |  8 ++------
 meta/lib/oeqa/sdk/cases/kmod.py    | 10 ++--------
 meta/lib/oeqa/sdk/cases/maturin.py | 13 +++----------
 meta/lib/oeqa/sdk/cases/meson.py   |  4 +---
 meta/lib/oeqa/sdk/cases/perl.py    |  5 +----
 meta/lib/oeqa/sdk/cases/python.py  |  5 +----
 7 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/cmake.py b/meta/lib/oeqa/sdk/cases/c=
make.py
index cb0944ee995..070682ef084 100644
--- a/meta/lib/oeqa/sdk/cases/cmake.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -23,9 +23,7 @@ class CMakeTest(OESDKTestCase):
         if libc in [ 'newlib' ]:
             raise unittest.SkipTest("CMakeTest class: SDK doesn't contai=
n a supported C library")
=20
-        if not (self.tc.hasHostPackage("nativesdk-cmake") or
-                self.tc.hasHostPackage("cmake-native")):
-            raise unittest.SkipTest("CMakeTest: needs cmake")
+        self.ensure_host_package("cmake")
=20
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix=3D"assimp", dir=3Dself.t=
c.sdk_dir) as testdir:
diff --git a/meta/lib/oeqa/sdk/cases/gtk3.py b/meta/lib/oeqa/sdk/cases/gt=
k3.py
index 8f60d5e7da7..1d953eecf1d 100644
--- a/meta/lib/oeqa/sdk/cases/gtk3.py
+++ b/meta/lib/oeqa/sdk/cases/gtk3.py
@@ -22,12 +22,8 @@ class GTK3Test(OESDKTestCase):
         if libc in [ 'newlib' ]:
             raise unittest.SkipTest("GTK3Test class: SDK doesn't contain=
 a supported C library")
=20
-        if not (self.tc.hasTargetPackage("gtk+3", multilib=3DTrue) or \
-                self.tc.hasTargetPackage("libgtk-3.0", multilib=3DTrue))=
:
-            raise unittest.SkipTest("GalculatorTest class: SDK don't sup=
port gtk+3")
-        if not (self.tc.hasHostPackage("nativesdk-gettext-dev") or
-                self.tc.hasHostPackage("gettext-native")):
-            raise unittest.SkipTest("GalculatorTest class: SDK doesn't c=
ontain gettext")
+        self.ensure_host_package(recipe=3D"intltool")
+        self.ensure_target_package("gtk+3", "libgtk-3.0", recipe=3D"gtk+=
3")
=20
     def test_galculator(self):
         with tempfile.TemporaryDirectory(prefix=3D"galculator", dir=3Dse=
lf.tc.sdk_dir) as testdir:
diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/km=
od.py
index 9e8fdbcd403..af9fcf5150d 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -7,7 +7,6 @@
 import os
 import subprocess
 import tempfile
-import unittest
=20
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
@@ -17,16 +16,11 @@ class KernelModuleTest(OESDKTestCase):
     """
     Test that out-of-tree kernel modules build.
     """
-
-    def setUp(self):
-        if not self.tc.hasTargetPackage("kernel-devsrc"):
-            raise unittest.SkipTest("KernelModuleTest needs kernel-devsr=
c")
-
+    def test_cryptodev(self):
+        self.ensure_target_package("kernel-devsrc")
         # These targets need to be built before kernel modules can be bu=
ilt.
         self._run("make -j -C $OECORE_TARGET_SYSROOT/usr/src/kernel prep=
are scripts")
=20
-
-    def test_cryptodev(self):
         with tempfile.TemporaryDirectory(prefix=3D"cryptodev", dir=3Dsel=
f.tc.sdk_dir) as testdir:
             git_url =3D "https://github.com/cryptodev-linux/cryptodev-li=
nux"
             # This is a knnown-good commit post-1.13 that builds with ke=
rnel 6.7+
diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases=
/maturin.py
index 20f6b553d0b..42394c7a973 100644
--- a/meta/lib/oeqa/sdk/cases/maturin.py
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -16,11 +16,7 @@ errors_have_output()
=20
 class MaturinTest(OESDKTestCase):
     def setUp(self):
-        if not (
-            self.tc.hasHostPackage("nativesdk-python3-maturin")
-            or self.tc.hasHostPackage("python3-maturin-native")
-        ):
-            raise unittest.SkipTest("No python3-maturin package in the S=
DK")
+        self.ensure_host_package("python3-maturin")
=20
     def test_maturin_list_python(self):
         py_major =3D self._run("python3 -c 'import sys; print(sys.versio=
n_info.major)'")
@@ -49,11 +45,8 @@ class MaturinDevelopTest(OESDKTestCase):
=20
     def setUp(self):
         machine =3D self.td.get("MACHINE")
-        if not (
-            self.tc.hasHostPackage("nativesdk-python3-maturin")
-            or self.tc.hasHostPackage("python3-maturin-native")
-        ):
-            raise unittest.SkipTest("No python3-maturin package in the S=
DK")
+        self.ensure_host_package("python3-maturin")
+
         if not (
             self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s"=
 % machine)
         ):
diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
index 1edf78720ac..6f773544e3d 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -22,9 +22,7 @@ class MesonTest(OESDKTestCase):
         if libc in [ 'newlib' ]:
             raise unittest.SkipTest("MesonTest class: SDK doesn't contai=
n a supported C library")
=20
-        if not (self.tc.hasHostPackage("nativesdk-meson") or
-                self.tc.hasHostPackage("meson-native")):
-            raise unittest.SkipTest("MesonTest: needs meson")
+        self.ensure_host_package("meson")
=20
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix=3D"epoxy", dir=3Dself.tc=
.sdk_dir) as testdir:
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/pe=
rl.py
index 8eab4442e85..a72bd2461a6 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -4,7 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import unittest
 from oeqa.sdk.case import OESDKTestCase
=20
 from oeqa.utils.subprocesstweak import errors_have_output
@@ -12,9 +11,7 @@ errors_have_output()
=20
 class PerlTest(OESDKTestCase):
     def setUp(self):
-        if not (self.tc.hasHostPackage("nativesdk-perl") or
-                self.tc.hasHostPackage("perl-native")):
-            raise unittest.SkipTest("No perl package in the SDK")
+        self.ensure_host_package("perl")
=20
     def test_perl(self):
         cmd =3D "perl -e '$_=3D\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/=
;print'"
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/=
python.py
index 51284949f50..b990cd889ad 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -4,7 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import unittest
 from oeqa.sdk.case import OESDKTestCase
=20
 from oeqa.utils.subprocesstweak import errors_have_output
@@ -12,9 +11,7 @@ errors_have_output()
=20
 class Python3Test(OESDKTestCase):
     def setUp(self):
-        if not (self.tc.hasHostPackage("nativesdk-python3-core") or
-                self.tc.hasHostPackage("python3-core-native")):
-            raise unittest.SkipTest("No python3 package in the SDK")
+        self.ensure_host_package("python3-core", recipe=3D"python3")
=20
     def test_python3(self):
         cmd =3D "python3 -c \"import codecs; print(codecs.encode('Uryyb,=
 jbeyq', 'rot13'))\""
--=20
2.43.0


