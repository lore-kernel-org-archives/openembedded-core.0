Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063ABC77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.88566.1682448497018271035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi3-0003kM-3z; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-00Dl5t-FN; Tue, 25 Apr 2023 20:48:14 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209n-DX; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 8/9] oeqa/selftest/cases: add barebox tests
Date: Tue, 25 Apr 2023 20:47:19 +0200
Message-Id: <20230425184720.456896-9-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425184720.456896-1-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180394

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/selftest/cases/barebox.py | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/barebox.py

diff --git a/meta/lib/oeqa/selftest/cases/barebox.py b/meta/lib/oeqa/selftest/cases/barebox.py
new file mode 100644
index 0000000000..497cd6e8dd
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/barebox.py
@@ -0,0 +1,72 @@
+# Qemu-based barebox bootloader integration testing
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runqemu
+from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.core.decorator import OETestTag
+
+barebox_boot_patterns = {
+        'search_reached_prompt': r"stop autoboot",
+        'search_login_succeeded': r"barebox@[^:]+:[^ ]+ ",
+        'search_cmd_finished': r"barebox@[a-zA-Z0-9\-\s]+:/"
+        }
+
+
+class BareboxTest(OESelftestTestCase):
+
+    @skipIfNotArch(['arm', 'aarch64'])
+    @OETestTag("runqemu")
+    def test_boot_barebox(self):
+        """
+        Tests building barebox and booting it with QEMU
+        """
+
+        self.write_config("""
+QB_DEFAULT_KERNEL = "barebox-dt-2nd.img"
+PREFERRED_PROVIDER_virtual/bootloader = "barebox"
+""")
+
+        bitbake("virtual/bootloader core-image-minimal")
+
+        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic',
+                     boot_patterns=barebox_boot_patterns) as qemu:
+
+            # test if barebox console works
+            cmd = "version"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(status, 1, msg=output)
+            self.assertTrue("barebox" in output, msg=output)
+
+    @skipIfNotArch(['x86_64'])
+    @OETestTag("runqemu")
+    def test_boot_barebox_efi(self):
+        """
+        Tests building barebox for UEFI and booting it as EFI payload
+        with QEMU + OVMF
+        """
+        image = "core-image-minimal"
+
+        self.write_config("""
+IMAGE_INSTALL:append = " barebox"
+MACHINE_FEATURES:append = " pcbios efi"
+EXTRA_IMAGEDEPENDS += "ovmf"
+EFI_PROVIDER = "barebox"
+IMAGE_FSTYPES += "wic"
+WKS_FILE = "efi-bootdisk.wks.in"
+""")
+
+        bitbake(image)
+
+        with runqemu(image, ssh=False, runqemuparams='nographic ovmf',
+                     boot_patterns=barebox_boot_patterns, image_fstype='wic') as qemu:
+
+            # test if barebox console works
+            cmd = "version"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(status, 1, msg=output)
+            self.assertTrue("barebox" in output, msg=output)
-- 
2.39.2


