Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA5DCFD35C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:01:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.9803.1728648097541139959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1szEKt-0002PG-LC; Fri, 11 Oct 2024 14:01:35 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1szEKt-0014uQ-2B; Fri, 11 Oct 2024 14:01:35 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1szEKt-003RQ9-01;
	Fri, 11 Oct 2024 14:01:35 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v9 7/7] oeqa/selftest/cases: add basic barebox tests
Date: Fri, 11 Oct 2024 14:01:17 +0200
Message-Id: <20241011120117.818804-8-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011120117.818804-1-ejo@pengutronix.de>
References: <20241011120117.818804-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205678

From: Enrico Jorns <ejo@pengutronix.de>

This adds basic tests for qemuarm and qemuarm64.

So far, barebox fails to run properly under KVM for the same reasons
u-boot fails to run.

A patch series to address the problem was submitted by Ahmad Fatoum
after debugging the oe-selftest failures for this series:

https://lore.kernel.org/barebox/20241009060511.4121157-1-a.fatoum@pengutronix.de/

For now, simply disable KVM for these tests.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/selftest/cases/barebox.py | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/barebox.py

diff --git a/meta/lib/oeqa/selftest/cases/barebox.py b/meta/lib/oeqa/selftest/cases/barebox.py
new file mode 100644
index 0000000000..3f8f232432
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/barebox.py
@@ -0,0 +1,44 @@
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
+QEMU_USE_KVM = "False"
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
-- 
2.39.5


