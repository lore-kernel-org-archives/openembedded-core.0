Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C519C54ED7
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:09 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.75895.1674225904346143894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsda-006KWS-Fd; Fri, 20 Jan 2023 16:45:02 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsda-00CEeA-5M; Fri, 20 Jan 2023 16:45:02 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 11/14] oeqa qemurunner.py: add timeout to QMP calls
Date: Fri, 20 Jan 2023 16:44:47 +0200
Message-Id: <20230120144450.2913935-12-mikko.rapeli@linaro.org>
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
 Message-ID: 20230120144450.2913935-12-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176202

When a qemu machine hangs, the QMP calls can hang for ever
too, and when this happens any failing test commands from ssh
runner may be followed by dump_monitor() calls which
then also hang. Hangs followed by hangs.

Use runqemutime at setup and run_monitor() specific timeout
for later calls.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ed44036758..7f5d87fe70 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -350,6 +350,9 @@ class QemuRunner:
                     return False
 
             try:
+                # set timeout value for all QMP calls
+                self.logger.info("QMP setting timeout to %d" % (self.runqemutime))
+                self.qmp.settimeout(self.runqemutime)
                 self.qmp.connect()
                 connect_time = time.time()
                 self.logger.info("QMP connected to QEMU at %s and took %s seconds" %
@@ -633,7 +636,9 @@ class QemuRunner:
         return False
 
     def run_monitor(self, command, args=None, timeout=60):
+        self.logger.debug("run_monitor() called: command = %s, args = %s, timeout = %d" % (command, args, timeout))
         if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.settimeout(timeout)
             if args is not None:
                 return self.qmp.cmd(command, args)
             else:
-- 
2.34.1


