Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71752C3ABCF
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6813.1746866652255095509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0A60153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 754C13F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/23] oeqa/sdk/meson: generalise test case
Date: Sat, 10 May 2025 09:43:44 +0100
Message-ID: <20250510084400.269726-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216259

Refactor this test case so the generic "build a meson project" code is
separated out and can be reused.

Also currently meson inside eSDKs only works with fully populated eSDKs,
but our testing uses minimal eSDKS, so skip the test if the eSDK is a
minimal build.  A bug has been filed to resolve this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 51 +++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
index 6f773544e3d..4fb101f9f73 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -10,37 +10,54 @@ import tempfile
 import unittest
=20
 from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdkext.context import OESDKExtTestContext
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class MesonTest(OESDKTestCase):
-    """
-    Test that Meson builds correctly.
-    """
+class MesonTestBase(OESDKTestCase):
     def setUp(self):
         libc =3D self.td.get("TCLIBC")
         if libc in [ 'newlib' ]:
             raise unittest.SkipTest("MesonTest class: SDK doesn't contai=
n a supported C library")
=20
+        if isinstance(self.tc, OESDKExtTestContext):
+            self.skipTest(f"{self.id()} does not support eSDK (https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D15854)")
+
         self.ensure_host_package("meson")
+        self.ensure_host_package("pkgconfig")
+
+    def build_meson(self, sourcedir, builddir, installdir=3DNone, option=
s=3D""):
+        """
+        Given a source tree in sourcedir, configure it to build in build=
dir with
+        the specified options, and if installdir is set also install.
+        """
+        log =3D self._run(f"meson setup --warnlevel 1 {builddir} {source=
dir} {options}")
+
+        # Check that Meson thinks we're doing a cross build and not a na=
tive
+        self.assertIn("Build type: cross build", log)
+
+        self._run(f"meson compile -C {builddir} -v")
+
+        if installdir:
+            self._run(f"meson install -C {builddir} --destdir {installdi=
r}")
+
+class MesonTest(MesonTestBase):
+    """
+    Test that Meson builds correctly.
+    """
=20
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix=3D"epoxy", dir=3Dself.tc=
.sdk_dir) as testdir:
             tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://=
github.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz"=
)
=20
-            dirs =3D {}
-            dirs["source"] =3D os.path.join(testdir, "libepoxy-1.5.3")
-            dirs["build"] =3D os.path.join(testdir, "build")
-            dirs["install"] =3D os.path.join(testdir, "install")
+            sourcedir =3D os.path.join(testdir, "libepoxy-1.5.3")
+            builddir =3D os.path.join(testdir, "build")
+            installdir =3D os.path.join(testdir, "install")
=20
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir=
], stderr=3Dsubprocess.STDOUT)
-            self.assertTrue(os.path.isdir(dirs["source"]))
-            os.makedirs(dirs["build"])
+            self.assertTrue(os.path.isdir(sourcedir))
=20
-            log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno=
 -Dx11=3Dfalse {build} {source}".format(**dirs))
-            # Check that Meson thinks we're doing a cross build and not =
a native
-            self.assertIn("Build type: cross build", log)
-            self._run("ninja -C {build} -v".format(**dirs))
-            self._run("DESTDIR=3D{install} ninja -C {build} -v install".=
format(**dirs))
-
-            self.check_elf(os.path.join(dirs["install"], "usr", "local",=
 "lib", "libepoxy.so"))
+            os.makedirs(builddir)
+            self.build_meson(sourcedir, builddir, installdir, "-Degl=3Dn=
o -Dglx=3Dno -Dx11=3Dfalse")
+            self.assertTrue(os.path.isdir(installdir))
+            self.check_elf(os.path.join(installdir, "usr", "local", "lib=
", "libepoxy.so"))
--=20
2.43.0


