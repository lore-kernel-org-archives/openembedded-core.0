Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.46791.1629239878156061316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 15:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE654101E
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 15:37:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57AA43F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 15:37:57 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdk: add relocation test for buildtools
Date: Tue, 17 Aug 2021 23:37:55 +0100
Message-Id: <20210817223755.2172775-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The buildtools-extended tarball includes GCC, which relies on being
relocated correctly to work.  Add a test case that verifies that the
loader paths have all been relocated, as otherwise there are
hard-to-debug errors at build time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/gcc.py | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/buildtools-cases/gcc.py

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/gcc.py b/meta/lib/oeqa/sd=
k/buildtools-cases/gcc.py
new file mode 100644
index 00000000000..36ba15b1340
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-cases/gcc.py
@@ -0,0 +1,29 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os.path
+from oeqa.sdk.case import OESDKTestCase
+
+class GccTests(OESDKTestCase):
+    def test_verify_specs(self):
+        """
+        Verify that the compiler has been relocated successfully and isn=
't
+        looking in the hard-coded prefix.
+        """
+        # Canonicalise the SDK root
+        sdk_base =3D os.path.realpath(self.tc.sdk_dir)
+        # Canonicalise the location of GCC
+        gcc_path =3D os.path.realpath(self._run("command -v gcc").strip(=
))
+        # Skip the test if the GCC didn't come from the buildtools, as i=
t only
+        # comes with buildtools-extended-tarball.
+        if os.path.commonprefix((sdk_base, gcc_path)) !=3D sdk_base:
+            self.skipTest("Buildtools does not provide GCC")
+
+        # This is the prefix that GCC is build with, and should be repla=
ced at
+        # installation time.
+        sdkpath =3D self.td.get("SDKPATH")
+        self.assertTrue(sdkpath)
+
+        for line in self._run('gcc -dumpspecs').splitlines():
+            self.assertNotIn(sdkpath, line)
--=20
2.32.0

