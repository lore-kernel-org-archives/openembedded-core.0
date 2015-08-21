Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85953759C7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 01:05:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 21 Aug 2015 18:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,723,1432623600"; d="scan'208";a="788755848"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2015 18:05:28 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2015 16:56:15 +0000
Message-Id: <1440176176-35232-3-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1440176176-35232-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1440176176-35232-1-git-send-email-mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] qemurunner: Added host dumps when there are errors
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
X-List-Received-Date: Sat, 22 Aug 2015 01:05:29 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds an instance of HostDumper to qemurunner,
with this instance now is possible to get dumps
from the host when there is an error.

This also adds dump points in the next cases:
    - runqemu exits before seeing qemu pid
    - Fail to get qemu process arguments
    - Not reach login banner before timeout
    - qemu pid never appears

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass    |  2 +-
 meta/lib/oeqa/targetcontrol.py    | 10 ++++++----
 meta/lib/oeqa/utils/qemurunner.py | 15 +++++++++++++--
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 824b47f..2131869 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -250,7 +250,7 @@ def testimage_main(d):
     host_dumper = get_host_dumper(d)
 
     # the robot dance
-    target = get_target_controller(d)
+    target = get_target_controller(d, host_dumper)
 
     class TestContext(object):
         def __init__(self):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 2d58f17..14ba1d9 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -18,11 +18,11 @@ from oeqa.utils.dump import TargetDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
-def get_target_controller(d):
+def get_target_controller(d, host_dumper):
     testtarget = d.getVar("TEST_TARGET", True)
     # old, simple names
     if testtarget == "qemu":
-        return QemuTarget(d)
+        return QemuTarget(d, host_dumper)
     elif testtarget == "simpleremote":
         return SimpleRemoteTarget(d)
     else:
@@ -115,7 +115,7 @@ class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz']
 
-    def __init__(self, d):
+    def __init__(self, d, host_dumper):
 
         super(QemuTarget, self).__init__(d)
 
@@ -124,6 +124,7 @@ class QemuTarget(BaseTarget):
         self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        self.host_dumper = host_dumper
 
         # Log QemuRunner log output to a file
         import oe.path
@@ -151,7 +152,8 @@ class QemuTarget(BaseTarget):
                             deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
                             display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
                             logfile = self.qemulog,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)),
+                            host_dumper = self.host_dumper)
 
         self.target_dumper = TargetDumper(d, self.runner)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0458447..6c17f11 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -19,7 +19,7 @@ logger = logging.getLogger("BitBake.QemuRunner")
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, host_dumper):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -37,8 +37,9 @@ class QemuRunner:
         self.deploy_dir_image = deploy_dir_image
         self.logfile = logfile
         self.boottime = boottime
-        self.logged = False
+        self.host_dumper = host_dumper
 
+        self.logged = False
         self.runqemutime = 60
 
     def create_socket(self):
@@ -117,6 +118,7 @@ class QemuRunner:
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                    self._dump_host()
                     self.stop()
                     logger.info("Output from runqemu:\n%s" % getOutput(output))
                     return False
@@ -136,6 +138,7 @@ class QemuRunner:
                     self.server_ip = ips[1]
             except IndexError, ValueError:
                 logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, getOutput(output)))
+                self._dump_host()
                 self.stop()
                 return False
             logger.info("Target IP: %s" % self.ip)
@@ -174,6 +177,7 @@ class QemuRunner:
                 lines = "\n".join(self.bootlog.splitlines()[-25:])
                 logger.info("Last 25 lines of text:\n%s" % lines)
                 logger.info("Check full boot log: %s" % self.logfile)
+                self._dump_host()
                 self.stop()
                 return False
 
@@ -187,6 +191,7 @@ class QemuRunner:
 
         else:
             logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            self._dump_host()
             self.stop()
             logger.info("Output from runqemu:\n%s" % getOutput(output))
             return False
@@ -312,3 +317,9 @@ class QemuRunner:
                 if (status_cmd == "0"):
                     status = 1
         return (status, str(data))
+
+    def _dump_host(self):
+        self.host_dumper.create_dir("qemu")
+        logger.error("Qemu ended unexpectedly, dump data from host"
+                " is in %s" % self.host_dumper.dump_dir)
+        self.host_dumper.dump_host()
-- 
1.8.4.5


