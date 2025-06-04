Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27606C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:03:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17365.1749045813297261155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 07:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D61E61758
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 07:03:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D4BE3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 07:03:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oeqa/selftest: add test case for oeqa.utils.subprocesstweak
Date: Wed,  4 Jun 2025 15:03:25 +0100
Message-ID: <20250604140326.2214919-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604140326.2214919-1-ross.burton@arm.com>
References: <20250604140326.2214919-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 14:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217950

This class has a monkey-patched CalledProcessError instance that extends
the __str__ method. Add a test case to ensure that it behaves as
expected.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/liboe.py | 35 ++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selfte=
st/cases/liboe.py
index d5ffffdcb41..4eab9441435 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -9,7 +9,7 @@ from oeqa.utils.commands import get_bb_var, get_bb_vars, =
bitbake, runCmd
 import oe.path
 import os
=20
-class LibOE(OESelftestTestCase):
+class CopyTreeTests(OESelftestTestCase):
=20
     @classmethod
     def setUpClass(cls):
@@ -102,3 +102,36 @@ class LibOE(OESelftestTestCase):
         self.assertEqual(dstcnt, len(testfiles), "Number of files in dst=
 (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
=20
         oe.path.remove(testloc)
+
+class SubprocessTests(OESelftestTestCase):
+
+    def test_subprocess_tweak(self):
+        """
+        Test that the string representation of
+        oeqa.utils.subprocesstweak.OETestCalledProcessError includes std=
out and
+        stderr, as expected.
+        """
+        script =3D """
+#! /bin/sh
+echo Ivn fgqbhg | tr '[a-zA-Z]' '[n-za-mN-ZA-M]'
+echo Ivn fgqree | tr '[a-zA-Z]' '[n-za-mN-ZA-M]' >&2
+exit 42
+        """
+
+        import subprocess
+        import unittest.mock
+        from oeqa.utils.subprocesstweak import OETestCalledProcessError
+
+        with self.assertRaises(OETestCalledProcessError) as cm:
+            with unittest.mock.patch("subprocess.CalledProcessError", OE=
TestCalledProcessError):
+                subprocess.run(["bash", "-"], input=3Dscript, text=3DTru=
e, capture_output=3DTrue, check=3DTrue)
+
+        e =3D cm.exception
+        self.assertEqual(e.returncode, 42)
+        self.assertEqual("Via stdout\n", e.stdout)
+        self.assertEqual("Via stderr\n", e.stderr)
+
+        string =3D str(e)
+        self.assertIn("exit status 42", string)
+        self.assertIn("Standard Output: Via stdout", string)
+        self.assertIn("Standard Error: Via stderr", string)
--=20
2.43.0


