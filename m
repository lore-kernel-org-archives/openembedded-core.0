Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F165C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 13:51:32 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.54079.1704376281644766968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 05:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rLO7y-00A9Xv-2J;
	Thu, 04 Jan 2024 15:51:19 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rLO7y-0023bW-FA; Thu, 04 Jan 2024 15:51:18 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa systemd.py: settle() using "running" or "degraded" state
Date: Thu,  4 Jan 2024 15:51:12 +0200
Message-Id: <20240104135112.490141-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20240104135112.490141-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 13:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193323

systemd boot has completed when system is in "running" or "degraded"
(some services failed) state. Check for that in the systemd settle()
function instead of listing all services and checking their activation
state since some services are in activation state even when whole
system is already in "running" state. Examples of services which can be
in activation state are rootfs auto mounting related generated services.

Without this patch systemd test_systemd_list (systemd.SystemdBasicTests) times
out on an image with dm-verity /usr partition and systemd generated
rootfs:

NOTE:  ... FAIL
Traceback (most recent call last):
  File "/home/builder/src/base/build/../poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/builder/src/base/poky/meta/lib/oeqa/runtime/cases/systemd.py", line 97, in test_systemd_failed
    self.assertTrue(settled, msg=msg)
AssertionError: False is not true : Timed out waiting for systemd to settle:
  UNIT                                                                                              LOAD   ACTIVE     SUB
     DESCRIPTION
  dev-disk-by\x2did-dm\x2dname\x2droot.device                                                       loaded activating tentativ
e    /dev/disk/by-id/dm-name-root
  dev-disk-by\x2did-dm\x2dname\x2dusr.device                                                        loaded activating tentativ
e    /dev/disk/by-id/dm-name-usr
  dev-disk-by\x2did-dm\x2duuid\x2dCRYPT\x2dLUKS2\x2df2b944f394174eb5918cb6af2c6b4cb2\x2droot.device loaded activating tentativ
e    /dev/disk/by-id/dm-uuid-CRYPT-LUKS2-f2b944f394174eb5918cb6af2c6b4cb2-root
  dev-disk-by\x2did-dm\x2duuid\x2dCRYPT\x2dVERITY\x2d3dd703c88f1946658697a6d57617473b\x2dusr.device loaded activating tentativ
e    /dev/disk/by-id/dm-uuid-CRYPT-VERITY-3dd703c88f1946658697a6d57617473b-usr
  dev-disk-by\x2duuid-bfbf856e\x2d3c65\x2d4eb2\x2d9ffb\x2d8e0b11641d85.device                       loaded activating tentativ
e    /dev/disk/by-uuid/bfbf856e-3c65-4eb2-9ffb-8e0b11641d85
  dev-dm\x2d0.device                                                                                loaded activating tentativ
e    /dev/dm-0
  dev-dm\x2d1.device                                                                                loaded activating tentativ
e    /dev/dm-1
...

Fix is to check for the systemd global "running" or "degraded" state.
Note that it would be possible to use a blocking call
"systemctl is-system-running --wait" to exit after system enters "running"
or "degraded" state but using the existing loop for a 2 minute timeout.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 37f295492d..58e94b62ff 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -68,8 +68,8 @@ class SystemdBasicTests(SystemdTest):
         """
         endtime = time.time() + (60 * 2)
         while True:
-            status, output = self.target.run('SYSTEMD_BUS_TIMEOUT=240s systemctl --state=activating')
-            if "0 loaded units listed" in output:
+            status, output = self.target.run('SYSTEMD_BUS_TIMEOUT=240s systemctl is-system-running')
+            if "running" in output or "degraded" in output:
                 return (True, '')
             if time.time() >= endtime:
                 return (False, output)
-- 
2.34.1


