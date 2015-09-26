Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 212D376FF6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 16:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QGnalC031038 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:49:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pDeMmJFRRz5v
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:49:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QGnPTi031025
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:49:36 +0100
Message-ID: <1443286165.19044.220.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Sep 2015 17:49:25 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] qemurunner: Handle qemu start failure correctly
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
X-List-Received-Date: Sat, 26 Sep 2015 16:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If qemu didn't start correctly, we may not have registered the child
signal. This results in a nasty traceback which confuses the underlying
issue. Cleanup this code and make the handler cleanup conditional.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 41b4401..c2c1779 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -258,8 +258,9 @@ class QemuRunner:
 
     def stop(self):
         self.stop_thread()
-        if self.runqemu:
+        if self.origchldhandler:
             signal.signal(signal.SIGCHLD, self.origchldhandler)
+        if self.runqemu:
             os.kill(self.monitorpid, signal.SIGKILL)
             logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
             logger.info("Sending SIGTERM to runqemu")
@@ -280,7 +281,6 @@ class QemuRunner:
             self.server_socket = None
         self.qemupid = None
         self.ip = None
-        signal.signal(signal.SIGCHLD, self.origchldhandler)
 
     def stop_thread(self):
         if self.thread and self.thread.is_alive():



