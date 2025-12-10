Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E492D3E775
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:33:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3209.1765391598441972931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5291153B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:10 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A0883F762
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] oeqa/selftest/meson: use iputils instead of libepoxy
Date: Wed, 10 Dec 2025 18:33:06 +0000
Message-ID: <20251210183308.4022909-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183308.4022909-1-ross.burton@arm.com>
References: <20251210183308.4022909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227503

libepoxy is suboptimal for the SDK testing purposes, mainly because it
is a GL-based library so we have to disable all of the functionality.
While this hasn't been a problem, meson 1.9.2 introduces a change of
behaviour which breaks the build.

Take this opportunity to switch to iputils, which is actively maintained,
has minimal dependencies, and builds faster.

Also move some asserts into build_meson() to avoid duplication in the
test case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/m=
eson.py
index 74199889223..a066bc134b6 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -34,6 +34,9 @@ class MesonTestBase(OESDKTestCase):
         """
         log =3D self._run(f"meson setup --warnlevel 1 {builddir} {source=
dir} {options}")
=20
+        # Check that the build directory now exists
+        self.assertTrue(os.path.isdir(builddir))
+
         # Check that Meson thinks we're doing a cross build and not a na=
tive
         self.assertIn("Build type: cross build", log)
=20
@@ -49,24 +52,24 @@ class MesonTestBase(OESDKTestCase):
=20
         if installdir:
             self._run(f"meson install -C {builddir} --destdir {installdi=
r}")
+            # Check that the install directory now exists
+            self.assertTrue(os.path.isdir(installdir))
=20
 class MesonTest(MesonTestBase):
     """
     Test that Meson builds correctly.
     """
=20
-    def test_epoxy(self):
-        with tempfile.TemporaryDirectory(prefix=3D"epoxy", dir=3Dself.tc=
.sdk_dir) as testdir:
-            tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://=
github.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz"=
)
+    def test_iputils(self):
+        with tempfile.TemporaryDirectory(prefix=3D"iputils", dir=3Dself.=
tc.sdk_dir) as testdir:
+            tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://=
github.com/iputils/iputils/releases/download/20250605/iputils-20250605.ta=
r.gz")
=20
-            sourcedir =3D os.path.join(testdir, "libepoxy-1.5.3")
+            sourcedir =3D os.path.join(testdir, "iputils-20250605")
             builddir =3D os.path.join(testdir, "build")
             installdir =3D os.path.join(testdir, "install")
=20
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir=
], stderr=3Dsubprocess.STDOUT)
             self.assertTrue(os.path.isdir(sourcedir))
=20
-            os.makedirs(builddir)
-            self.build_meson(sourcedir, builddir, installdir, "-Degl=3Dn=
o -Dglx=3Dno -Dx11=3Dfalse")
-            self.assertTrue(os.path.isdir(installdir))
-            self.check_elf(os.path.join(installdir, "usr", "local", "lib=
", "libepoxy.so"))
+            self.build_meson(sourcedir, builddir, installdir)
+            self.check_elf(os.path.join(installdir, "usr", "local", "bin=
", "ping"))
--=20
2.43.0


