Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA7375E2D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Feb 2016 03:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="902097469"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2016 03:12:34 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 754386A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:12 +0200
Message-Id: <c0fc0492e28bb4290b16943607005140d5ac79aa.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 05/14] qemurunner: add parameter to method 'start'
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:34 -0000

QemuRunner requires pair of ip addresses provided through kernel
commandline for method 'start' to work. These ip addresses are
used to connect to the image using ssh and run tests there.
However, this functionality should not be mandatory as testing
doesn't always require ssh connection. Some tests can be run using
serial console.

Added new parameter 'get_ip' to QemuRunner.start to make it possible
to skip getting pair of ip addresses from kernel command line. This
should allow oe-selftest to test images without modifying kernel
command line.

[YOCTO #8498]

(From OE-Core rev: 3f8b734ebb81d035849288091bb0b97b9c4fba34)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 45 ++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index def8ace..784cf96 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -91,7 +91,7 @@ class QemuRunner:
                 self._dump_host()
                 raise SystemExit
 
-    def start(self, qemuparams = None):
+    def start(self, qemuparams = None, get_ip = True):
         if self.display:
             os.environ["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
@@ -178,27 +178,28 @@ class QemuRunner:
 
         if self.is_alive():
             logger.info("qemu started - qemu procces pid is %s" % self.qemupid)
-            cmdline = ''
-            with open('/proc/%s/cmdline' % self.qemupid) as p:
-                cmdline = p.read()
-                # It is needed to sanitize the data received
-                # because is possible to have control characters
-                cmdline = re_control_char.sub('', cmdline)
-            try:
-                ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
-                if not ips or len(ips) != 3:
-                    raise ValueError
-                else:
-                    self.ip = ips[0]
-                    self.server_ip = ips[1]
-            except IndexError, ValueError:
-                logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, self.getOutput(output)))
-                self._dump_host()
-                self.stop()
-                return False
-            logger.info("qemu cmdline used:\n{}".format(cmdline))
-            logger.info("Target IP: %s" % self.ip)
-            logger.info("Server IP: %s" % self.server_ip)
+            if get_ip:
+                cmdline = ''
+                with open('/proc/%s/cmdline' % self.qemupid) as p:
+                    cmdline = p.read()
+                    # It is needed to sanitize the data received
+                    # because is possible to have control characters
+                    cmdline = re_control_char.sub('', cmdline)
+                try:
+                    ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
+                    if not ips or len(ips) != 3:
+                        raise ValueError
+                    else:
+                        self.ip = ips[0]
+                        self.server_ip = ips[1]
+                except IndexError, ValueError:
+                    logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, self.getOutput(output)))
+                    self._dump_host()
+                    self.stop()
+                    return False
+                logger.info("qemu cmdline used:\n{}".format(cmdline))
+                logger.info("Target IP: %s" % self.ip)
+                logger.info("Server IP: %s" % self.server_ip)
 
             self.thread = LoggingThread(self.log, threadsock, logger)
             self.thread.start()
-- 
2.1.4


