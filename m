Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E4EC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 17:51:41 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.824.1678729899870465409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 10:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pbmKd-00F9Qi-UQ; Mon, 13 Mar 2023 19:51:36 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pbmKd-00Aty1-1J; Mon, 13 Mar 2023 19:51:35 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa rtc.py: skip if read-only-rootfs
Date: Mon, 13 Mar 2023 19:51:28 +0200
Message-Id: <20230313175128.2598077-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
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
 Symbol: NEURAL_HAM(-0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230313175128.2598077-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 17:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178462

hwclock command fails on read-only-rootfs:

AssertionError: 1 != 0 : Failed to reset RTC time, output: hwclock: cannot open /etc/adjtime: Read-only file system

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/rtc.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index b2159b1134..6e45c5db4f 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -5,6 +5,7 @@
 #
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
 import re
@@ -21,12 +22,14 @@ class RTCTest(OERuntimeTestCase):
             self.logger.debug('Starting systemd-timesyncd daemon')
             self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
+    @skipIfFeature('read-only-rootfs',
+                   'Test does not work with read-only-rootfs in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
     def test_rtc(self):
         (status, output) = self.target.run('hwclock -r')
         self.assertEqual(status, 0, msg='Failed to get RTC time, output: %s' % output)
-        
+
         (status, current_datetime) = self.target.run('date +"%m%d%H%M%Y"')
         self.assertEqual(status, 0, msg='Failed to get system current date & time, output: %s' % current_datetime)
 
@@ -37,7 +40,6 @@ class RTCTest(OERuntimeTestCase):
 
         (status, output) = self.target.run('date %s' % current_datetime)
         self.assertEqual(status, 0, msg='Failed to reset system date & time, output: %s' % output)
-        
+
         (status, output) = self.target.run('hwclock -w')
         self.assertEqual(status, 0, msg='Failed to reset RTC time, output: %s' % output)
-        
-- 
2.34.1


