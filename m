Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2BE76167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 14:26:43 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so156692342wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 07:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JGi+/pOM/8K7qu0+HcoIrf6KUvrMOl/gzwmtbmj96Lg=;
	b=iqPq1C+PFfYbJE7X7uv+GlEFwKrQjRxsaiZ0mfz9RvqZjkXs072EJOtVWWcCi67rCn
	LgjfvZQBhBrSAXuj1g+HFtG0k5hDFo1xQU1ey4+2pu6bgIqGCEHY5FYi5FrSFBk+ufVS
	VueQiauoEVn1OwcIKSFBoH+x1dgfE2UBfPP3mjKa04D2vcR38cZQkqf5STJCzduywv32
	Z+QDRTZkGPueXcDC+yazR/W8gGrqpmzUmp/pvCcNWpx2fyfsiPwGvDfVbH+hV+aGObNJ
	UlrWhhj+1eX+YsCmJbSPI4YZKlnCzJpAdF50YWZW34NDcpHX5hhTg9KC6VlTaBrKfn3s
	OQPQ==
X-Gm-Message-State: ALoCoQlchbFnI5orbHeHJ4X6Nk2kuYqV5zHgJXPo3HtFFwzSbcf2pP0KaJjEVyjXLb8kT6FzebRr
X-Received: by 10.194.77.70 with SMTP id q6mr5699208wjw.70.1437575203202;
	Wed, 22 Jul 2015 07:26:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	df1sm22330533wib.12.2015.07.22.07.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jul 2015 07:26:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 15:20:48 +0100
Message-Id: <1437574848-6695-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/QemuRunner: don't use bb for logging
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
X-List-Received-Date: Wed, 22 Jul 2015 14:26:46 -0000

Instead of using bb.note() etc for logging use logging.Logger directly, allowing
the use of QemuRunner outside of bitbake.

Also clean up the logging/errors by moving create_socket() out of
__init__()/restart() and into start().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 61 ++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f1a7e24..a15990e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -12,7 +12,10 @@ import signal
 import re
 import socket
 import select
-import bb
+
+import logging
+logger = logging.getLogger("QemuRunner")
+logger.setLevel(logging.DEBUG - 2)
 
 class QemuRunner:
 
@@ -37,9 +40,6 @@ class QemuRunner:
 
         self.runqemutime = 60
 
-        self.create_socket()
-
-
     def create_socket(self):
 
         self.bootlog = ''
@@ -51,10 +51,12 @@ class QemuRunner:
             self.server_socket.bind(("127.0.0.1",0))
             self.server_socket.listen(2)
             self.serverport = self.server_socket.getsockname()[1]
-            bb.note("Created listening socket for qemu serial console on: 127.0.0.1:%s" % self.serverport)
+            logging.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % self.serverport)
+            return True
         except socket.error, msg:
             self.server_socket.close()
-            bb.fatal("Failed to create listening socket: %s" %msg[1])
+            logging.error("Failed to create listening socket: %s" % msg[1])
+            return False
 
 
     def log(self, msg):
@@ -63,26 +65,28 @@ class QemuRunner:
                 f.write("%s" % msg)
 
     def start(self, qemuparams = None):
-
         if self.display:
             os.environ["DISPLAY"] = self.display
         else:
-            bb.error("To start qemu I need a X desktop, please set DISPLAY correctly (e.g. DISPLAY=:1)")
+            logging.error("To start qemu I need a X desktop, please set DISPLAY correctly (e.g. DISPLAY=:1)")
             return False
         if not os.path.exists(self.rootfs):
-            bb.error("Invalid rootfs %s" % self.rootfs)
+            logging.error("Invalid rootfs %s" % self.rootfs)
             return False
         if not os.path.exists(self.tmpdir):
-            bb.error("Invalid TMPDIR path %s" % self.tmpdir)
+            logging.error("Invalid TMPDIR path %s" % self.tmpdir)
             return False
         else:
             os.environ["OE_TMPDIR"] = self.tmpdir
         if not os.path.exists(self.deploy_dir_image):
-            bb.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
+            logging.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
             return False
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
+        if not self.create_socket():
+            return False
+
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
         # badly with screensavers.
         os.environ["QEMU_DONT_GRAB"] = "1"
@@ -93,28 +97,28 @@ class QemuRunner:
         launch_cmd = 'runqemu %s %s %s' % (self.machine, self.rootfs, self.qemuparams)
         self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
 
-        bb.note("runqemu started, pid is %s" % self.runqemu.pid)
-        bb.note("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        logging.info("runqemu started, pid is %s" % self.runqemu.pid)
+        logging.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             time.sleep(1)
 
         if self.is_alive():
-            bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
+            logging.info("qemu started - qemu procces pid is %s" % self.qemupid)
             cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
                 cmdline = p.read()
             ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
             if not ips or len(ips) != 3:
-                bb.note("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
+                logging.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
                 self.stop()
                 return False
             else:
                 self.ip = ips[0]
                 self.server_ip = ips[1]
-            bb.note("Target IP: %s" % self.ip)
-            bb.note("Server IP: %s" % self.server_ip)
-            bb.note("Waiting at most %d seconds for login banner" % self.boottime )
+            logging.info("Target IP: %s" % self.ip)
+            logging.info("Server IP: %s" % self.server_ip)
+            logging.info("Waiting at most %d seconds for login banner" % self.boottime)
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
             reachedlogin = False
@@ -127,7 +131,7 @@ class QemuRunner:
                         self.qemusock.setblocking(0)
                         socklist.append(self.qemusock)
                         socklist.remove(self.server_socket)
-                        bb.note("Connection from %s:%s" % addr)
+                        logging.info("Connection from %s:%s" % addr)
                     else:
                         data = sock.recv(1024)
                         if data:
@@ -136,24 +140,24 @@ class QemuRunner:
                             if re.search("qemu.* login:", self.bootlog):
                                 stopread = True
                                 reachedlogin = True
-                                bb.note("Reached login banner")
+                                logging.info("Reached login banner")
                         else:
                             socklist.remove(sock)
                             sock.close()
                             stopread = True
 
             if not reachedlogin:
-                bb.note("Target didn't reached login boot in %d seconds" % self.boottime)
+                logging.info("Target didn't reached login boot in %d seconds" % self.boottime)
                 lines = "\n".join(self.bootlog.splitlines()[-5:])
-                bb.note("Last 5 lines of text:\n%s" % lines)
-                bb.note("Check full boot log: %s" % self.logfile)
+                logging.info("Last 5 lines of text:\n%s" % lines)
+                logging.info("Check full boot log: %s" % self.logfile)
                 self.stop()
                 return False
         else:
-            bb.note("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            logging.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
             output = self.runqemu.stdout
             self.stop()
-            bb.note("Output from runqemu:\n%s" % output.read())
+            logging.info("Output from runqemu:\n%s" % output.read())
             return False
 
         return self.is_alive()
@@ -161,13 +165,13 @@ class QemuRunner:
     def stop(self):
 
         if self.runqemu:
-            bb.note("Sending SIGTERM to runqemu")
+            logging.info("Sending SIGTERM to runqemu")
             os.killpg(self.runqemu.pid, signal.SIGTERM)
             endtime = time.time() + self.runqemutime
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
             if self.runqemu.poll() is None:
-                bb.note("Sending SIGKILL to runqemu")
+                logging.info("Sending SIGKILL to runqemu")
                 os.killpg(self.runqemu.pid, signal.SIGKILL)
             self.runqemu = None
         if self.server_socket:
@@ -177,10 +181,9 @@ class QemuRunner:
         self.ip = None
 
     def restart(self, qemuparams = None):
-        bb.note("Restarting qemu process")
+        logging.info("Restarting qemu process")
         if self.runqemu.poll() is None:
             self.stop()
-        self.create_socket()
         if self.start(qemuparams):
             return True
         return False
-- 
2.1.4


