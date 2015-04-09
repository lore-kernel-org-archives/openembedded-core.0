Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA31606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 08:10:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2015 01:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,548,1422950400"; d="scan'208";a="677572239"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2015 01:10:37 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 1CF8D6A408F;
	Thu,  9 Apr 2015 01:10:12 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:08:10 +0300
Message-Id: <1428566892-30526-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/3] oeqa/targetcontrol: Add support for poky-tiny in QemuTarget.
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
X-List-Received-Date: Thu, 09 Apr 2015 08:10:48 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1f4770f..9a681a3 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -12,6 +12,7 @@ import traceback
 import sys
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
+from oeqa.utils.qemutinyrunner import QemuTinyRunner
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
@@ -110,7 +111,7 @@ class BaseTarget(object):
 
 class QemuTarget(BaseTarget):
 
-    supported_image_fstypes = ['ext3', 'ext4']
+    supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz']
 
     def __init__(self, d):
 
@@ -120,14 +121,25 @@ class QemuTarget(BaseTarget):
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
         self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
-
-        self.runner = QemuRunner(machine=d.getVar("MACHINE", True),
-                        rootfs=self.rootfs,
-                        tmpdir = d.getVar("TMPDIR", True),
-                        deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
-                        display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
-                        logfile = self.qemulog,
-                        boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE") + '-' + d.getVar('MACHINE') + '.bin')
+
+        if d.getVar("DISTRO", True) == "poky-tiny":
+            self.runner = QemuTinyRunner(machine=d.getVar("MACHINE", True),
+                            rootfs=self.rootfs,
+                            tmpdir = d.getVar("TMPDIR", True),
+                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
+                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
+                            logfile = self.qemulog,
+                            kernel = self.kernel,
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
+        else:
+            self.runner = QemuRunner(machine=d.getVar("MACHINE", True),
+                            rootfs=self.rootfs,
+                            tmpdir = d.getVar("TMPDIR", True),
+                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
+                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
+                            logfile = self.qemulog,
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
 
     def deploy(self):
         try:
@@ -167,6 +179,9 @@ class QemuTarget(BaseTarget):
         else:
             raise bb.build.FuncFailed("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
+    def run_serial(self, command):
+        return self.runner.run_serial(command)
+
 
 class SimpleRemoteTarget(BaseTarget):
 
-- 
2.1.0


