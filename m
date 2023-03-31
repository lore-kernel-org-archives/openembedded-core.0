Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B46DC77B62
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.51305.1680258405725441781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086W-8S; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxy-007yPP-Ij; Fri, 31 Mar 2023 12:26:42 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxx-006Ahq-4y; Fri, 31 Mar 2023 12:26:41 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 08/10] oeqa/utils/qemurunner: limit precision of timing debugging output
Date: Fri, 31 Mar 2023 12:26:20 +0200
Message-Id: <20230331102622.1468385-9-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331102622.1468385-1-ejo@pengutronix.de>
References: <20230331102622.1468385-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 10:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179414

* There is no need to be that precise. It just irritates in the logs.
* There is also no point in printing plain time.time() value a single
  time while only using formatted printout everywhere else, thus remove
  it.
* Use %d for printing integer times

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/qemurunner.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9d6fe4fe59..623d45010a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -275,7 +275,7 @@ class QemuRunner:
             os._exit(0)
 
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
-        self.logger.debug("waiting at most %s seconds for qemu pid (%s)" %
+        self.logger.debug("waiting at most %d seconds for qemu pid (%s)" %
                           (self.runqemutime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
@@ -299,7 +299,7 @@ class QemuRunner:
             self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
 
         if not self.is_alive():
-            self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
+            self.logger.error("Qemu pid didn't appear in %d seconds (%s)" %
                               (self.runqemutime, time.strftime("%D %H:%M:%S")))
 
             qemu_pid = None
@@ -354,7 +354,7 @@ class QemuRunner:
                 self.qmp.settimeout(self.runqemutime)
                 self.qmp.connect()
                 connect_time = time.time()
-                self.logger.info("QMP connected to QEMU at %s and took %s seconds" %
+                self.logger.info("QMP connected to QEMU at %s and took %.2f seconds" %
                                   (time.strftime("%D %H:%M:%S"),
                                    time.time() - launch_time))
             except OSError as msg:
@@ -388,14 +388,14 @@ class QemuRunner:
 
         # Release the qemu process to continue running
         self.run_monitor('cont')
-        self.logger.info("QMP released QEMU at %s and took %s seconds from connect" %
+        self.logger.info("QMP released QEMU at %s and took %.2f seconds from connect" %
                           (time.strftime("%D %H:%M:%S"),
                            time.time() - connect_time))
 
         # We are alive: qemu is running
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
-        self.logger.debug("qemu started in %s seconds - qemu procces pid is %s (%s)" %
+        self.logger.debug("qemu started in %.2f seconds - qemu procces pid is %s (%s)" %
                           (time.time() - (endtime - self.runqemutime),
                            self.qemupid, time.strftime("%D %H:%M:%S")))
         cmdline = ''
@@ -486,9 +486,9 @@ class QemuRunner:
                             self.server_socket = qemusock
                             stopread = True
                             reachedlogin = True
-                            self.logger.debug("Reached login banner in %s seconds (%s, %s)" %
+                            self.logger.debug("Reached login banner in %.2f seconds (%s)" %
                                               (time.time() - (endtime - self.boottime),
-                                              time.strftime("%D %H:%M:%S"), time.time()))
+                                              time.strftime("%D %H:%M:%S")))
                     else:
                         # no need to check if reachedlogin unless we support multiple connections
                         self.logger.debug("QEMU socket disconnected before login banner reached. (%s)" %
-- 
2.39.2


