Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA10E784B3
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 14:17:13 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.82958.1696256228240846060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 07:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qnJjM-004yCR-10;
	Mon, 02 Oct 2023 17:17:04 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qnJjL-006V2Z-7U; Mon, 02 Oct 2023 17:17:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa qemurunner.py: switch utf8 error handling from ignore to replace
Date: Mon,  2 Oct 2023 17:16:56 +0300
Message-Id: <20231002141656.1548714-1-mikko.rapeli@linaro.org>
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
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20231002141656.1548714-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 14:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188612

It seems like "ignore" is stopping decoding and failing to detect
login prompts. Maybe "replace" works more reliably when reads from
serial console are incomplete and we're trying to detect the login
prompt. See logs like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5833/steps/14/logs/stdio
https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/log.do_testimage.3051530
https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/qemu_boot_log.20231001114436

Python documentation is not clear on how "ignore" and "replace" differ
and both should continue processing if there are errors in the stream:

https://docs.python.org/3/library/codecs.html#error-handlers

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b24091e212..5c18ccbd3e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -109,7 +109,7 @@ class QemuRunner:
 
     def decode_qemulog(self, todecode):
         # Sanitize the data received from qemu as it may contain control characters
-        msg = todecode.decode("utf-8", errors='ignore')
+        msg = todecode.decode("utf-8", errors='replace')
         msg = re_control_char.sub('', msg)
         return msg
 
@@ -474,7 +474,7 @@ class QemuRunner:
                         self.logger.error('Invalid file type: %s\n%s' % (file))
                         read = b''
 
-                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='ignore')))
+                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='replace')))
                     data = data + read
                     if data:
                         bootlog += data
-- 
2.34.1


