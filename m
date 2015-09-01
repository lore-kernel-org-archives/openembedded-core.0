Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 514D476B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 15:45:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 01 Sep 2015 08:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="780398434"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2015 08:45:27 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 07:36:29 +0000
Message-Id: <f8d10368076fea7defa8b575ec1002771326dba2.1441091863.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441091863.git.mariano.lopez@linux.intel.com>
References: <cover.1441091863.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1441091863.git.mariano.lopez@linux.intel.com>
References: <cover.1441091863.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2 v2] qemurunner: Added host dumps when there are errors
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
X-List-Received-Date: Tue, 01 Sep 2015 15:45:25 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds an instance of HostDumper to qemurunner,
with this instance now is possible to get dumps
from the host when there is an error.

This adds dump points in the next cases:
    - runqemu exits before seeing qemu pid
    - Fail to get qemu process arguments
    - Not reach login banner before timeout
    - qemu pid never appears

This also modifies the constructors of BaseDumper,
HostDumper and TargetDumper, they don't require
the datastore anymore, but the feature to replace
datastore variables has been lost (never used)

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py           | 10 +++++-----
 meta/lib/oeqa/targetcontrol.py    |  9 +++++++--
 meta/lib/oeqa/utils/dump.py       | 28 +++++++++-------------------
 meta/lib/oeqa/utils/qemurunner.py | 15 ++++++++++++++-
 4 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index f541136..4224206 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -123,14 +123,14 @@ class oeRuntimeTest(oeTest):
         # If a test fails or there is an exception
         if not exc_info() == (None, None, None):
             exc_clear()
-            self.tc.host_dumper.create_dir(self._testMethodName)
-            self.tc.host_dumper.dump_host()
-            #Only QemuTarget has a serial console
+            #Only dump for QemuTarget
             if (isinstance(self.target, QemuTarget)):
+                self.tc.host_dumper.create_dir(self._testMethodName)
+                self.tc.host_dumper.dump_host()
                 self.target.target_dumper.dump_target(
                         self.tc.host_dumper.dump_dir)
-            print ("%s dump data stored in %s" % (self._testMethodName,
-                     self.tc.host_dumper.dump_dir))
+                print ("%s dump data stored in %s" % (self._testMethodName,
+                         self.tc.host_dumper.dump_dir))
 
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 2d58f17..542e259 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -124,6 +124,9 @@ class QemuTarget(BaseTarget):
         self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        dump_target_cmds = d.getVar("testimage_dump_target", True)
+        dump_host_cmds = d.getVar("testimage_dump_host", True)
+        dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
 
         # Log QemuRunner log output to a file
         import oe.path
@@ -151,9 +154,11 @@ class QemuTarget(BaseTarget):
                             deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
                             display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
                             logfile = self.qemulog,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)),
+                            dump_dir = dump_dir,
+                            dump_host_cmds = d.getVar("testimage_dump_host", True))
 
-        self.target_dumper = TargetDumper(d, self.runner)
+        self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
 
     def deploy(self):
         try:
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index e71e1cd..6067438 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -6,30 +6,22 @@ import itertools
 from commands import runCmd
 
 def get_host_dumper(d):
-    return HostDumper(d)
+    cmds = d.getVar("testimage_dump_host", True)
+    parent_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
+    return HostDumper(cmds, parent_dir)
 
 
 class BaseDumper(object):
 
-    def __init__(self, d, cmds):
+    def __init__(self, cmds, parent_dir):
         self.cmds = []
-        self.parent_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
+        self.parent_dir = parent_dir
         if not cmds:
             return
         for cmd in cmds.split('\n'):
             cmd = cmd.lstrip()
             if not cmd or cmd[0] == '#':
                 continue
-            # Replae variables from the datastore
-            while True:
-                index_start = cmd.find("${")
-                if index_start == -1:
-                    break
-                index_start += 2
-                index_end = cmd.find("}", index_start)
-                var = cmd[index_start:index_end]
-                value = d.getVar(var, True)
-                cmd = cmd.replace("${%s}" % var, value)
             self.cmds.append(cmd)
 
     def create_dir(self, dir_suffix):
@@ -62,9 +54,8 @@ class BaseDumper(object):
 
 class HostDumper(BaseDumper):
 
-    def __init__(self, d):
-        host_cmds = d.getVar("testimage_dump_host", True)
-        super(HostDumper, self).__init__(d, host_cmds)
+    def __init__(self, cmds, parent_dir):
+        super(HostDumper, self).__init__(cmds, parent_dir)
 
     def dump_host(self, dump_dir=""):
         if dump_dir:
@@ -76,9 +67,8 @@ class HostDumper(BaseDumper):
 
 class TargetDumper(BaseDumper):
 
-    def __init__(self, d, qemurunner):
-        target_cmds = d.getVar("testimage_dump_target", True)
-        super(TargetDumper, self).__init__(d, target_cmds)
+    def __init__(self, cmds, parent_dir, qemurunner):
+        super(TargetDumper, self).__init__(cmds, parent_dir)
         self.runner = qemurunner
 
     def dump_target(self, dump_dir=""):
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index bcdb69b..4ce5d9c 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -14,13 +14,14 @@ import socket
 import select
 import errno
 import threading
+from oeqa.utils.dump import HostDumper
 
 import logging
 logger = logging.getLogger("BitBake.QemuRunner")
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -42,6 +43,7 @@ class QemuRunner:
         self.thread = None
 
         self.runqemutime = 60
+        self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
 
     def create_socket(self):
         try:
@@ -118,6 +120,7 @@ class QemuRunner:
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                    self._dump_host()
                     self.stop()
                     logger.info("Output from runqemu:\n%s" % getOutput(output))
                     return False
@@ -137,6 +140,7 @@ class QemuRunner:
                     self.server_ip = ips[1]
             except IndexError, ValueError:
                 logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, getOutput(output)))
+                self._dump_host()
                 self.stop()
                 return False
             logger.info("qemu cmdline used:\n{}".format(cmdline))
@@ -189,6 +193,7 @@ class QemuRunner:
                 lines = "\n".join(bootlog.splitlines()[-25:])
                 logger.info("Last 25 lines of text:\n%s" % lines)
                 logger.info("Check full boot log: %s" % self.logfile)
+                self._dump_host()
                 self.stop()
                 return False
 
@@ -202,6 +207,7 @@ class QemuRunner:
 
         else:
             logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
+            self._dump_host()
             self.stop()
             logger.info("Output from runqemu:\n%s" % getOutput(output))
             return False
@@ -334,6 +340,13 @@ class QemuRunner:
                     status = 1
         return (status, str(data))
 
+
+    def _dump_host(self):
+        self.host_dumper.create_dir("qemu")
+        logger.error("Qemu ended unexpectedly, dump data from host"
+                " is in %s" % self.host_dumper.dump_dir)
+        self.host_dumper.dump_host()
+
 # This class is for reading data from a socket and passing it to logfunc
 # to be processed. It's completely event driven and has a straightforward
 # event loop. The mechanism for stopping the thread is a simple pipe which
-- 
1.8.4.5


