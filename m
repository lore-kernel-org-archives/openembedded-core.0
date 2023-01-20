Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14ABC52D11
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.75891.1674225900330537079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdW-006KUp-HP; Fri, 20 Jan 2023 16:44:58 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdW-00CEQz-7t; Fri, 20 Jan 2023 16:44:58 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 03/14] oeqa ssh.py: clarify timeout API and add more debug prints to run()
Date: Fri, 20 Jan 2023 16:44:39 +0200
Message-Id: <20230120144450.2913935-4-mikko.rapeli@linaro.org>
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
 Message-ID: 20230120144450.2913935-4-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176194

Clarify timeout handling. Timeout calculation is from start of command
OR last output from ssh command. When the ssh command output is
captured, that resets the timeout timer. Timeout is effetively
an "inactive timeout".

Print process output to a new line to keep the output more
readable.

Then log the calls to dumper functions which also seem to be deadlocking
for ever when a qemu machine hangs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/target/ssh.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 11f4ec6de0..2aaa15ec0e 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -65,7 +65,7 @@ class OESSHTarget(OETarget):
         """
             Runs command in target using SSHProcess.
         """
-        self.logger.debug("[Running]$ %s" % " ".join(command))
+        self.logger.debug("[Running]$ '%s', timeout=%s, ignore_status=%s" % (" ".join(command), timeout, ignore_status))
 
         starttime = time.time()
         status, output = SSHCall(command, self.logger, timeout)
@@ -83,9 +83,10 @@ class OESSHTarget(OETarget):
             Runs command in target.
 
             command:    Command to run on target.
-            timeout:    <value>:    Kill command after <val> seconds.
-                        None:       Kill command default value seconds.
-                        0:          No timeout, runs until return.
+            timeout:    <value>:    Kill command after <val> seconds when there is no output.
+                        None:       Kill command with default value seconds when there is no output.
+                        0:          No activity timeout, runs until return. Can still fail with timeout
+                                    if ssh client returns failures or TCP socket times out.
         """
         targetCmd = 'export PATH=/usr/sbin:/sbin:/usr/bin:/bin; %s' % command
         sshCmd = self.ssh + [self.ip, targetCmd]
@@ -98,15 +99,19 @@ class OESSHTarget(OETarget):
             processTimeout = self.timeout
 
         status, output = self._run(sshCmd, processTimeout, ignore_status)
-        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
+        # ssh reports errors with return value 255 but also commands can return that value
         if (status == 255) and (('No route to host') in output):
             if self.monitor_dumper:
+                self.logger.debug('Command failed, capturing QMP data: dump_monitor()')
                 self.monitor_dumper.dump_monitor()
         if status == 255:
             if self.target_dumper:
+                self.logger.debug('Command failed, capturing data from serial console: dump_target()')
                 self.target_dumper.dump_target()
             if self.monitor_dumper:
+                self.logger.debug('Command failed, capturing QMP data: dump_monitor()')
                 self.monitor_dumper.dump_monitor()
+        self.logger.debug('returning from run()')
         return (status, output)
 
     def copyTo(self, localSrc, remoteDst):
-- 
2.34.1


