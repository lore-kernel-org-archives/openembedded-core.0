Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 38023767BF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 07:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7977O1V010548 for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 08:07:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iQycoCXTWKpy
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 08:07:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79775Io010540
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 08:07:18 +0100
Message-ID: <1439104025.30467.96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Aug 2015 00:07:05 -0700
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/qemurunner: Improve runqemu log output debug
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
X-List-Received-Date: Sun, 09 Aug 2015 07:07:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If runqemu fails, ensure the log output is shown as its invaluable
to aid debugging. Its slightly convoluted since we need to ensure
we don't block on reading the pipe which may still be executing
hence the need for nonblocking IO.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1cf8f76..dbe73e0 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -94,12 +94,19 @@ class QemuRunner:
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
+        def getOutput(o):
+            import fcntl
+            fl = fcntl.fcntl(o, fcntl.F_GETFL)
+            fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
+            return os.read(o.fileno(), 1000000)
+
         launch_cmd = 'runqemu %s %s %s' % (self.machine, self.rootfs, self.qemuparams)
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
         # oe-selftest (this makes stty error out immediately). There ought
         # to be a proper fix but this will suffice for now.
         self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp)
+        output = self.runqemu.stdout
 
         logger.info("runqemu started, pid is %s" % self.runqemu.pid)
         logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
@@ -109,9 +116,8 @@ class QemuRunner:
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     logger.info('runqemu exited with code %d' % self.runqemu.returncode)
-                    output = self.runqemu.stdout
                     self.stop()
-                    logger.info("Output from runqemu:\n%s" % output.read())
+                    logger.info("Output from runqemu:\n%s" % getOutput(output))
                     return False
             time.sleep(1)
 
@@ -122,7 +128,7 @@ class QemuRunner:
                 cmdline = p.read()
             ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
             if not ips or len(ips) != 3:
-                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
+                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, getOutput(output)))
                 self.stop()
                 return False
             else:
@@ -167,9 +173,8 @@ class QemuRunner:
                 return False
         else:
             logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
-            output = self.runqemu.stdout
             self.stop()
-            logger.info("Output from runqemu:\n%s" % output.read())
+            logger.info("Output from runqemu:\n%s" % getOutput(output))
             return False
 
         return self.is_alive()




