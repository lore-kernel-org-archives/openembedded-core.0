Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D249C3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 18:44:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3487.1720809844347279403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 11:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29EF61007
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:44:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86F943F766
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:44:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdk: add out-of-tree kernel module building test
Date: Fri, 12 Jul 2024 19:43:58 +0100
Message-Id: <20240712184358.3103083-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 18:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201848

Validate that out-of-tree kernel module building using kernel-devsrc
works as expected.

This test uses cryptodev-linux as a idiomatic out of tree module. As the
latest release doesn't actually build with kernel 6.7+, use the same
commit that our recipe uses.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/kmod.py | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/kmod.py

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/km=
od.py
new file mode 100644
index 00000000000..9e8fdbcd403
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -0,0 +1,41 @@
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
+class KernelModuleTest(OESDKTestCase):
+    """
+    Test that out-of-tree kernel modules build.
+    """
+
+    def setUp(self):
+        if not self.tc.hasTargetPackage("kernel-devsrc"):
+            raise unittest.SkipTest("KernelModuleTest needs kernel-devsr=
c")
+
+        # These targets need to be built before kernel modules can be bu=
ilt.
+        self._run("make -j -C $OECORE_TARGET_SYSROOT/usr/src/kernel prep=
are scripts")
+
+
+    def test_cryptodev(self):
+        with tempfile.TemporaryDirectory(prefix=3D"cryptodev", dir=3Dsel=
f.tc.sdk_dir) as testdir:
+            git_url =3D "https://github.com/cryptodev-linux/cryptodev-li=
nux"
+            # This is a knnown-good commit post-1.13 that builds with ke=
rnel 6.7+
+            git_sha =3D "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
+
+            sourcedir =3D os.path.join(testdir, "cryptodev-linux")
+            subprocess.check_output(["git", "clone", git_url, sourcedir]=
, stderr=3Dsubprocess.STDOUT)
+            self.assertTrue(os.path.isdir(sourcedir))
+            subprocess.check_output(["git", "-C", sourcedir, "checkout",=
 git_sha], stderr=3Dsubprocess.STDOUT)
+
+            self._run("make -C %s V=3D1 KERNEL_DIR=3D$OECORE_TARGET_SYSR=
OOT/usr/src/kernel" % sourcedir)
+            self.check_elf(os.path.join(sourcedir, "cryptodev.ko"))
--=20
2.34.1


