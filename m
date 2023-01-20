Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B9EC54737
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.75897.1674225904759126094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsda-006KWg-Sx; Fri, 20 Jan 2023 16:45:02 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsda-00CEhw-Ig; Fri, 20 Jan 2023 16:45:02 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 12/14] oeqa qemurunner.py: kill qemu if it hangs
Date: Fri, 20 Jan 2023 16:44:48 +0200
Message-Id: <20230120144450.2913935-13-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
References: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230120144450.2913935-13-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176203

qemu doesn't always behave well and can hang too.
Log calls to stop qemu and finally kill it with force
if was still alive.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7f5d87fe70..494b4e03da 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -590,12 +590,21 @@ class QemuRunner:
             self.monitorpipe.close()
 
     def stop_qemu_system(self):
+        self.logger.debug('stop_qemu_system: self.qemupid = %s' % (self.qemupid))
         if self.qemupid:
             try:
                 # qemu-system behaves well and a SIGTERM is enough
+                self.logger.debug('sending SIGTERM to %s' % (self.qemupid))
                 os.kill(self.qemupid, signal.SIGTERM)
             except ProcessLookupError as e:
                 self.logger.warning('qemu-system ended unexpectedly')
+            time.sleep(5)
+            try:
+                # qemu-system did not behave well
+                self.logger.debug('sending SIGKILL to %s' % (self.qemupid))
+                os.kill(self.qemupid, signal.SIGKILL)
+            except ProcessLookupError as e:
+                self.logger.debug('qemu-system already dead')
 
     def stop_thread(self):
         if self.thread and self.thread.is_alive():
-- 
2.34.1


