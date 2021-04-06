Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11927.1617716064006752164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 06:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79AA61FB
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Apr 2021 06:34:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234653F73D
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Apr 2021 06:34:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: add test case for SRC_URI dependency sniffing
Date: Tue,  6 Apr 2021 14:34:20 +0100
Message-Id: <20210406133420.2675977-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add tests to verify that SRC_URI dependency sniffing works correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/fetch.py | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selfte=
st/cases/fetch.py
index 76cbadf2ff..67e85d3e4c 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import tempfile
+import textwrap
+import bb.tinfoil
 import oe.path
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
@@ -49,3 +52,54 @@ MIRRORS_forcevariable =3D "git://.*/.* http://download=
s.yoctoproject.org/mirror/so
         self.write_config(features)
         oe.path.remove(dldir, recurse=3DTrue)
         bitbake("dbus-wait -c fetch -f")
+
+
+class Dependencies(OESelftestTestCase):
+    def write_recipe(self, content):
+        f =3D tempfile.NamedTemporaryFile(mode=3D"wt", suffix=3D".bb")
+        f.write(content)
+        f.flush()
+        return f
+
+    def test_dependencies(self):
+        """
+        Verify that the correct dependencies are generated for specific =
SRC_URI entries.
+        """
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=3DFalse, quiet=3D2)
+
+            r =3D """
+            LICENSE=3D"CLOSED"
+            SRC_URI=3D"http://example.com/tarball.zip"
+            """
+            f =3D self.write_recipe(textwrap.dedent(r))
+            d =3D tinfoil.parse_recipe_file(f.name)
+            self.assertIn("wget-native", d.getVarFlag("do_fetch", "depen=
ds"))
+            self.assertIn("unzip-native", d.getVarFlag("do_unpack", "dep=
ends"))
+
+            # Verify that the downloadfilename overrides the URI
+            r =3D """
+            LICENSE=3D"CLOSED"
+            SRC_URI=3D"https://example.com/tarball;downloadfilename=3Dso=
mething.zip"
+            """
+            f =3D self.write_recipe(textwrap.dedent(r))
+            d =3D tinfoil.parse_recipe_file(f.name)
+            self.assertIn("wget-native", d.getVarFlag("do_fetch", "depen=
ds"))
+            self.assertIn("unzip-native", d.getVarFlag("do_unpack", "dep=
ends") or "")
+
+            r =3D """
+            LICENSE=3D"CLOSED"
+            SRC_URI=3D"ftp://example.com/tarball.lz"
+            """
+            f =3D self.write_recipe(textwrap.dedent(r))
+            d =3D tinfoil.parse_recipe_file(f.name)
+            self.assertIn("wget-native", d.getVarFlag("do_fetch", "depen=
ds"))
+            self.assertIn("lzip-native", d.getVarFlag("do_unpack", "depe=
nds"))
+
+            r =3D """
+            LICENSE=3D"CLOSED"
+            SRC_URI=3D"git://example.com/repo"
+            """
+            f =3D self.write_recipe(textwrap.dedent(r))
+            d =3D tinfoil.parse_recipe_file(f.name)
+            self.assertIn("git-native", d.getVarFlag("do_fetch", "depend=
s"))
--=20
2.25.1

