Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF9FC7EE24
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.88090.1682448497545702772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi3-0003kL-5z; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-00Dl5q-EI; Tue, 25 Apr 2023 20:48:14 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209r-Dr; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 9/9] oeqa/selftest/cases: add basic u-boot test
Date: Tue, 25 Apr 2023 20:47:20 +0200
Message-Id: <20230425184720.456896-10-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180398

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/uboot.py

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
new file mode 100644
index 0000000000..d3c60c3052
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -0,0 +1,40 @@
+# Qemu-based u-boot bootloader integration testing
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runqemu
+from oeqa.core.decorator import OETestTag
+
+uboot_boot_patterns = {
+        'search_reached_prompt': "stop autoboot",
+        'search_login_succeeded': "=>",
+        'search_cmd_finished': "=>"
+        }
+
+
+class UBootTest(OESelftestTestCase):
+
+    @OETestTag("runqemu")
+    def test_boot_uboot(self):
+        """
+        Tests building u-boot and booting it with QEMU
+        """
+
+        self.write_config("""
+QB_DEFAULT_BIOS = "u-boot.bin"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+""")
+        bitbake("virtual/bootloader core-image-minimal")
+
+        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic',
+                     boot_patterns=uboot_boot_patterns) as qemu:
+
+            # test if u-boot console works
+            cmd = "version"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(status, 1, msg=output)
+            self.assertTrue("U-Boot" in output, msg=output)
-- 
2.39.2


