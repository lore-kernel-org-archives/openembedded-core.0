Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EB6C3ABD3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6814.1746866653505545286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2978A153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C18703F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/23] oeqa/sdk/gtk3: build libhandy instead of galculator
Date: Sat, 10 May 2025 09:43:46 +0100
Message-ID: <20250510084400.269726-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216261

galculator hasn't been touched for a decade now[1] and fails to compile
under GCC 15.

Switch to building libhandy, which is the GTK+3 precursor to libadwaita
in the Gnome stack. Whilst this is in low-maintainence mode, will be
updated if it breaks.

[1] https://github.com/galculator/galculator/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/gtk3.py | 46 ++++++++++++++-------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/gtk3.py b/meta/lib/oeqa/sdk/cases/gt=
k3.py
index 1d953eecf1d..cdaf50ed384 100644
--- a/meta/lib/oeqa/sdk/cases/gtk3.py
+++ b/meta/lib/oeqa/sdk/cases/gtk3.py
@@ -7,40 +7,34 @@
 import os
 import subprocess
 import tempfile
-import unittest
=20
-from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdk.cases.meson import MesonTestBase
+
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class GTK3Test(OESDKTestCase):
+class GTK3Test(MesonTestBase):
+
+    def setUp(self):
+        super().setUp()
+        self.ensure_target_package("gtk+3", "libgtk-3.0", recipe=3D"gtk+=
3")
+        self.ensure_host_package("glib-2.0-utils", "libglib-2.0-utils", =
recipe=3D"glib-2.0")
+
     """
     Test that autotools and GTK+ 3 compiles correctly.
     """
-    def setUp(self):
-        libc =3D self.td.get("TCLIBC")
-        if libc in [ 'newlib' ]:
-            raise unittest.SkipTest("GTK3Test class: SDK doesn't contain=
 a supported C library")
+    def test_libhandy(self):
+        with tempfile.TemporaryDirectory(prefix=3D"libhandy", dir=3Dself=
.tc.sdk_dir) as testdir:
+            tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://=
download.gnome.org/sources/libhandy/1.8/libhandy-1.8.3.tar.xz")
=20
-        self.ensure_host_package(recipe=3D"intltool")
-        self.ensure_target_package("gtk+3", "libgtk-3.0", recipe=3D"gtk+=
3")
-
-    def test_galculator(self):
-        with tempfile.TemporaryDirectory(prefix=3D"galculator", dir=3Dse=
lf.tc.sdk_dir) as testdir:
-            tarball =3D self.fetch(testdir, self.td["DL_DIR"], "http://g=
alculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
-
-            dirs =3D {}
-            dirs["source"] =3D os.path.join(testdir, "galculator-2.1.4")
-            dirs["build"] =3D os.path.join(testdir, "build")
-            dirs["install"] =3D os.path.join(testdir, "install")
+            sourcedir =3D os.path.join(testdir, "libhandy-1.8.3")
+            builddir =3D os.path.join(testdir, "build")
+            installdir =3D os.path.join(testdir, "install")
=20
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir=
], stderr=3Dsubprocess.STDOUT)
-            self.assertTrue(os.path.isdir(dirs["source"]))
-            os.makedirs(dirs["build"])
+            self.assertTrue(os.path.isdir(sourcedir))
+            os.makedirs(builddir)
=20
-            self._run("cd {source} && sed -i -e '/s_preferences.*prefs;/=
d' src/main.c && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/acl=
ocal -I m4".format(**dirs))
-            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS=
".format(**dirs))
-            self._run("cd {build} && make -j".format(**dirs))
-            self._run("cd {build} && make install DESTDIR=3D{install}".f=
ormat(**dirs))
-
-            self.check_elf(os.path.join(dirs["install"], "usr", "local",=
 "bin", "galculator"))
+            self.build_meson(sourcedir, builddir, installdir, "-Dglade_c=
atalog=3Ddisabled -Dintrospection=3Ddisabled -Dvapi=3Dfalse")
+            self.assertTrue(os.path.isdir(installdir))
+            self.check_elf(os.path.join(installdir, "usr", "local", "lib=
", "libhandy-1.so"))
--=20
2.43.0


