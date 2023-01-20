Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15B4C54794
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.75994.1674225901931524682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdY-006KVC-2i; Fri, 20 Jan 2023 16:45:00 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdX-00CEVN-Q8; Fri, 20 Jan 2023 16:44:59 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 06/14] oeqa dump.py: add error counter and stop after 5 failures
Date: Fri, 20 Jan 2023 16:44:42 +0200
Message-Id: <20230120144450.2913935-7-mikko.rapeli@linaro.org>
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
 Message-ID: 20230120144450.2913935-7-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176197

If test target qemu machine hangs completely, dump_target() calls
over serial console are taking a long time to time out, possibly
for every failing ssh command execution and a lot of test cases,
and same with dump_monitor().

Instead of trying for ever, count errors and after 5 stop trying
to dump_target() and dump_monitor() completely.

These help to end testing earlier when a test target is completely
deadlocked and all ssh, serial and QMP communication with it are
failing.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/dump.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index bcee03b576..d420b497f9 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -93,37 +93,55 @@ class HostDumper(BaseDumper):
             self._write_dump(cmd.split()[0], result.output)
 
 class TargetDumper(BaseDumper):
-    """ Class to get dumps from target, it only works with QemuRunner """
+    """ Class to get dumps from target, it only works with QemuRunner.
+        Will give up permanently after 5 errors from running commands over
+        serial console. This helps to end testing when target is really dead, hanging
+        or unresponsive.
+    """
 
     def __init__(self, cmds, parent_dir, runner):
         super(TargetDumper, self).__init__(cmds, parent_dir)
         self.runner = runner
+        self.errors = 0
 
     def dump_target(self, dump_dir=""):
+        if self.errors >= 5:
+                print("Too many errors when dumping data from target, assuming it is dead! Will not dump data anymore!")
+                return
         if dump_dir:
             self.dump_dir = dump_dir
         for cmd in self.cmds:
             # We can continue with the testing if serial commands fail
             try:
                 (status, output) = self.runner.run_serial(cmd)
+                if status == 0:
+                    self.errors = self.errors + 1
                 self._write_dump(cmd.split()[0], output)
             except:
+                self.errors = self.errors + 1
                 print("Tried to dump info from target but "
                         "serial console failed")
                 print("Failed CMD: %s" % (cmd))
 
 class MonitorDumper(BaseDumper):
-    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
+    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner
+        Will stop completely if there are more than 5 errors when dumping monitor data.
+        This helps to end testing when target is really dead, hanging or unresponsive.
+    """
 
     def __init__(self, cmds, parent_dir, runner):
         super(MonitorDumper, self).__init__(cmds, parent_dir)
         self.runner = runner
+        self.errors = 0
 
     def dump_monitor(self, dump_dir=""):
         if self.runner is None:
             return
         if dump_dir:
             self.dump_dir = dump_dir
+        if self.errors >= 5:
+                print("Too many errors when dumping data from qemu monitor, assuming it is dead! Will not dump data anymore!")
+                return
         for cmd in self.cmds:
             cmd_name = cmd.split()[0]
             try:
@@ -137,4 +155,5 @@ class MonitorDumper(BaseDumper):
                     output = self.runner.run_monitor(cmd_name)
                 self._write_dump(cmd_name, output)
             except Exception as e:
+                self.errors = self.errors + 1
                 print("Failed to dump QMP CMD: %s with\nException: %s" % (cmd_name, e))
-- 
2.34.1


