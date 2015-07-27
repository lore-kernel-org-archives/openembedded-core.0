Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF5E762FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926346"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:03:58 +0100
Message-Id: <c338a1bd14f8fc0cbc961cea6e07dd5a767d1af4.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/11] oeqa/utils/qemurunner: fix logging
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:13 -0000

OE-Core commit 519e381278d40bdac79add340e4c0460a9f97e17 unfortunately
broke logging in two different ways:

1) it prevented logging to the task log from working within bitbake
   -c testimage. This is due to the logger object being set up too early
   which interferes with BitBake's own logging. If we prefix the name
   with "BitBake." everything works (and we don't need to set the
   logging level).

2) Additionally because it called the log functions on the logging
   module and not the logger object it set up, this caused the
   oe-selftest logging to start printing everything from that point
   forward.

Fix these two issues and return us to the desired behaviour for
do_testimage.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 49 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 59c9934..4de3c64 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -14,8 +14,7 @@ import socket
 import select
 
 import logging
-logger = logging.getLogger("QemuRunner")
-logger.setLevel(logging.DEBUG - 2)
+logger = logging.getLogger("BitBake.QemuRunner")
 
 class QemuRunner:
 
@@ -51,11 +50,11 @@ class QemuRunner:
             self.server_socket.bind(("127.0.0.1",0))
             self.server_socket.listen(2)
             self.serverport = self.server_socket.getsockname()[1]
-            logging.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % self.serverport)
+            logger.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % self.serverport)
             return True
         except socket.error, msg:
             self.server_socket.close()
-            logging.error("Failed to create listening socket: %s" % msg[1])
+            logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
 
@@ -68,18 +67,18 @@ class QemuRunner:
         if self.display:
             os.environ["DISPLAY"] = self.display
         else:
-            logging.error("To start qemu I need a X desktop, please set DISPLAY correctly (e.g. DISPLAY=:1)")
+            logger.error("To start qemu I need a X desktop, please set DISPLAY correctly (e.g. DISPLAY=:1)")
             return False
         if not os.path.exists(self.rootfs):
-            logging.error("Invalid rootfs %s" % self.rootfs)
+            logger.error("Invalid rootfs %s" % self.rootfs)
             return False
         if not os.path.exists(self.tmpdir):
-            logging.error("Invalid TMPDIR path %s" % self.tmpdir)
+            logger.error("Invalid TMPDIR path %s" % self.tmpdir)
             return False
         else:
             os.environ["OE_TMPDIR"] = self.tmpdir
         if not os.path.exists(self.deploy_dir_image):
-            logging.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
+            logger.error("Invalid DEPLOY_DIR_IMAGE path %s" % self.deploy_dir_image)
             return False
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
@@ -97,28 +96,28 @@ class QemuRunner:
         launch_cmd = 'runqemu %s %s %s' % (self.machine, self.rootfs, self.qemuparams)
         self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
 
-        logging.info("runqemu started, pid is %s" % self.runqemu.pid)
-        logging.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        logger.info("runqemu started, pid is %s" % self.runqemu.pid)
+        logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             time.sleep(1)
 
         if self.is_alive():
-            logging.info("qemu started - qemu procces pid is %s" % self.qemupid)
+            logger.info("qemu started - qemu procces pid is %s" % self.qemupid)
             cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
                 cmdline = p.read()
             ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
             if not ips or len(ips) != 3:
-                logging.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
+                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
                 self.stop()
                 return False
             else:
                 self.ip = ips[0]
                 self.server_ip = ips[1]
-            logging.info("Target IP: %s" % self.ip)
-            logging.info("Server IP: %s" % self.server_ip)
-            logging.info("Waiting at most %d seconds for login banner" % self.boottime)
+            logger.info("Target IP: %s" % self.ip)
+            logger.info("Server IP: %s" % self.server_ip)
+            logger.info("Waiting at most %d seconds for login banner" % self.boottime)
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
             reachedlogin = False
@@ -131,7 +130,7 @@ class QemuRunner:
                         self.qemusock.setblocking(0)
                         socklist.append(self.qemusock)
                         socklist.remove(self.server_socket)
-                        logging.info("Connection from %s:%s" % addr)
+                        logger.info("Connection from %s:%s" % addr)
                     else:
                         data = sock.recv(1024)
                         if data:
@@ -140,24 +139,24 @@ class QemuRunner:
                             if re.search(".* login:", self.bootlog):
                                 stopread = True
                                 reachedlogin = True
-                                logging.info("Reached login banner")
+                                logger.info("Reached login banner")
                         else:
                             socklist.remove(sock)
                             sock.close()
                             stopread = True
 
             if not reachedlogin:
-                logging.info("Target didn't reached login boot in %d seconds" % self.boottime)
+                logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
                 lines = "\n".join(self.bootlog.splitlines()[-5:])
-                logging.info("Last 5 lines of text:\n%s" % lines)
-                logging.info("Check full boot log: %s" % self.logfile)
+                logger.info("Last 5 lines of text:\n%s" % lines)
+                logger.info("Check full boot log: %s" % self.logfile)
                 self.stop()
                 return False
         else:
-            logging.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
             output = self.runqemu.stdout
             self.stop()
-            logging.info("Output from runqemu:\n%s" % output.read())
+            logger.info("Output from runqemu:\n%s" % output.read())
             return False
 
         return self.is_alive()
@@ -165,13 +164,13 @@ class QemuRunner:
     def stop(self):
 
         if self.runqemu:
-            logging.info("Sending SIGTERM to runqemu")
+            logger.info("Sending SIGTERM to runqemu")
             os.killpg(self.runqemu.pid, signal.SIGTERM)
             endtime = time.time() + self.runqemutime
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
             if self.runqemu.poll() is None:
-                logging.info("Sending SIGKILL to runqemu")
+                logger.info("Sending SIGKILL to runqemu")
                 os.killpg(self.runqemu.pid, signal.SIGKILL)
             self.runqemu = None
         if self.server_socket:
@@ -181,7 +180,7 @@ class QemuRunner:
         self.ip = None
 
     def restart(self, qemuparams = None):
-        logging.info("Restarting qemu process")
+        logger.info("Restarting qemu process")
         if self.runqemu.poll() is None:
             self.stop()
         if self.start(qemuparams):
-- 
2.1.0


