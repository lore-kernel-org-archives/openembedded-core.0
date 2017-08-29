Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61A3C7827F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 16:05:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7TG5ZY1028731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 Aug 2017 17:05:36 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dmj1D-0002kf-9n; Tue, 29 Aug 2017 17:05:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 17:05:33 +0100
Message-Id: <1504022734-10538-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 29 Aug 2017 17:05:36 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] qemurunner: Tweak qemu pid starting timeout code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2017 16:05:37 -0000

We're seeing timeouts in the autobuilder testing code. Increase these
timeouts to 120, print the length of time we're having to wait, change
the error messages to really be errors and don't print empty logs, its
not helpful, print a message about the empty log instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cd60ba7..54312fb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -55,7 +55,7 @@ class QemuRunner:
         self.thread = None
         self.use_kvm = use_kvm
 
-        self.runqemutime = 60
+        self.runqemutime = 120
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
 
     def create_socket(self):
@@ -204,7 +204,7 @@ class QemuRunner:
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
         if self.is_alive():
-            logger.info("qemu started - qemu procces pid is %s" % self.qemupid)
+            logger.info("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
             if get_ip:
                 cmdline = ''
                 with open('/proc/%s/cmdline' % self.qemupid) as p:
@@ -317,10 +317,14 @@ class QemuRunner:
                 logger.info("Serial console failed while trying to login")
 
         else:
-            logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            logger.error("Qemu pid didn't appear in %s seconds" % self.runqemutime)
             self._dump_host()
             self.stop()
-            logger.info("Output from runqemu:\n%s" % self.getOutput(output))
+            op = self.getOutput(output)
+            if op:
+                logger.error("Output from runqemu:\n%s" % op)
+            else:
+                logger.error("No output from runqemu.\n")
             return False
 
         return self.is_alive()
-- 
2.7.4


