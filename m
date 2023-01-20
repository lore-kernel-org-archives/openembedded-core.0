Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA7DC54E94
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.75998.1674225903886822165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsda-006KWC-1l; Fri, 20 Jan 2023 16:45:02 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdZ-00CEbC-MU; Fri, 20 Jan 2023 16:45:01 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 10/14] oeqa qemurunner.py: add debug prints to stop()
Date: Fri, 20 Jan 2023 16:44:46 +0200
Message-Id: <20230120144450.2913935-11-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
References: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: BAYES_HAM(-3.00)
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
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230120144450.2913935-11-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176201

These help to investigate if any of the functions hang
when test target hangs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index eb6d3e8c57..ed44036758 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -533,12 +533,16 @@ class QemuRunner:
         return True
 
     def stop(self):
+        self.logger.debug("Stopping QemuRunner")
         if hasattr(self, "origchldhandler"):
             signal.signal(signal.SIGCHLD, self.origchldhandler)
+        self.logger.debug("Stopping thread")
         self.stop_thread()
+        self.logger.debug("Stopping qemu system")
         self.stop_qemu_system()
         if self.runqemu:
             if hasattr(self, "monitorpid"):
+                self.logger.debug("Sending SIGKILL to monitorpid")
                 os.kill(self.monitorpid, signal.SIGKILL)
                 self.logger.debug("Sending SIGTERM to runqemu")
                 try:
@@ -559,12 +563,15 @@ class QemuRunner:
             self.runqemu_exited = True
 
         if hasattr(self, 'qmp') and self.qmp:
+            self.logger.debug("Closing QMP")
             self.qmp.close()
             self.qmp = None
         if hasattr(self, 'server_socket') and self.server_socket:
+            self.logger.debug("Closing server socket")
             self.server_socket.close()
             self.server_socket = None
         if hasattr(self, 'threadsock') and self.threadsock:
+            self.logger.debug("Closing threadsock")
             self.threadsock.close()
             self.threadsock = None
         self.qemupid = None
@@ -576,6 +583,7 @@ class QemuRunner:
                 # We raced, ignore
                 pass
         if self.monitorpipe:
+            self.logger.debug("Closing monitorpipe")
             self.monitorpipe.close()
 
     def stop_qemu_system(self):
-- 
2.34.1


