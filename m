Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB275EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:10:44 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.5806.1692771040414768928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4g-004KYW-2e;
	Wed, 23 Aug 2023 09:10:38 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4g-00Gamy-It; Wed, 23 Aug 2023 09:10:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 9/9] oeqa selftest runtime_test.py: skip virgl_headless test if /dev/dri/renderD128 access fails
Date: Wed, 23 Aug 2023 09:10:25 +0300
Message-Id: <20230823061025.3952909-9-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230823061025.3952909-9-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186554

If access to /dev/dri/renderD128 fails, then qemu with 3d graphics will
fail to start and errors are rather cryptic like:

qemu-system-x86_64: egl: render node init failed

To fix this, users likely need to

 * modprobe vgem
 * add their user to "render" group to write to /dev/dri/renderD128

If access is not available due to missing HW, driver or failing access,
then skip the test:

2023-08-22 14:41:20,591 - oe-selftest - INFO - test_testimage_virgl_headless (runtime_test.TestImage)
2023-08-22 14:41:20,603 - oe-selftest - INFO -  ... skipped 'Can not open "/dev/dri/renderD128" device'
2023-08-22 14:41:20,603 - oe-selftest - INFO - Can not open "/dev/dri/renderD128" device

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 5f90bc658f..e72504773a 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -264,7 +264,8 @@ TEST_RUNQEMUPARAMS:append = " slirp"
     def test_testimage_virgl_headless(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with egl-headless frontend
-        Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
+        Expected: 1. Check that virgl kernel driver is loaded (modprobe vgem, user part of "render" group and
+                     can open /dev/dri/renderD* device) and 3d acceleration is enabled
                   2. Check that kmscube demo runs without crashing.
         Product: oe-core
         Author: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -276,6 +277,14 @@ TEST_RUNQEMUPARAMS:append = " slirp"
             distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
+        # test requires vgem driver and possibly "render" group rights to access device file
+        render_dev = "/dev/dri/renderD128"
+        try:
+            with open(render_dev, "w") as f:
+                f.close()
+        except IOError:
+            self.skipTest('Can not open "%s" device' % (render_dev))
+
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'IMAGE_CLASSES += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
-- 
2.34.1


