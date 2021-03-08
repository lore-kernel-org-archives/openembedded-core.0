Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.258.1615226522894022255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2955106F
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D7F63F71B
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:57 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oeqa/selftest: add test to verify that poisoned sysroots are detected
Date: Mon,  8 Mar 2021 18:01:52 +0000
Message-Id: <20210308180152.3515502-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308180152.3515502-1-ross.burton@arm.com>
References: <20210308180152.3515502-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a recipe that explicitly searches /usr/include, and use that in
oe-selftest to verify that host include paths are correctly causing
build failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/recipes-test/poison/poison.bb  | 16 ++++++++++++++++
 meta/lib/oeqa/selftest/cases/buildoptions.py |  6 ++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-selftest/recipes-test/poison/poison.bb

diff --git a/meta-selftest/recipes-test/poison/poison.bb b/meta-selftest/=
recipes-test/poison/poison.bb
new file mode 100644
index 0000000000..7ace901cc3
--- /dev/null
+++ b/meta-selftest/recipes-test/poison/poison.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Sysroot poisoning test"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+LICENSE =3D "MIT"
+
+inherit nopackages
+
+# This test confirms that compiling code that searches /usr/include for =
headers
+# will result in compiler errors.  This recipe should will fail to build=
 and
+# oe-selftest has a test that verifies that.
+do_compile() {
+    touch empty.c
+    ${CPP} ${CFLAGS} -I/usr/include empty.c
+}
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
index 3495bee986..20fe8ed8f6 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -197,3 +197,9 @@ PREMIRRORS =3D "\\
=20
         bitbake("world --runall fetch")
=20
+
+class Poisoning(OESelftestTestCase):
+    def test_poisoning(self):
+        res =3D bitbake("poison", ignore_status=3DTrue)
+        self.assertNotEqual(res.status, 0)
+        self.assertTrue("is unsafe for cross-compilation" in res.output)
--=20
2.25.1

