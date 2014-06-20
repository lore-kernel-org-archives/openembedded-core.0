Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 125057026F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:38:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2014 08:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="447997198"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2014 08:38:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 18:42:20 +0300
Message-Id: <a524c1e84d3dc85bd3652abea7a923474de21d37.1403277454.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
Subject: [PATCH 5/5] meta-yocto-bsp: oeqa/controllers: add GrubTarget
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
X-List-Received-Date: Fri, 20 Jun 2014 15:38:58 -0000

add control for generic grub pc via serial line

Implementation [YOCTO #5615].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py | 71 +++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py

diff --git a/meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py b/meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py
new file mode 100644
index 0000000..02ada65
--- /dev/null
+++ b/meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py
@@ -0,0 +1,71 @@
+# Copyright (C) 2014 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# This module adds support to testimage.bbclass to deploy images and run
+# tests on a Generic PC that boots using grub bootloader. The device must
+# be set up as per README.hardware and the master image should be deployed
+# onto the harddisk so that it boots into it by default.For booting into the
+# image under test we interact with grub over serial, so for the
+# Generic PC you will need an additional serial cable and device under test
+# needs to have a serial interface. The separate ext3
+# partition that will contain the image to be tested must be labelled
+# "testrootfs" so that the deployment code below can find it.
+
+import os
+import bb
+import time
+import subprocess
+import sys
+import pexpect
+
+import oeqa.utils.sshcontrol as sshcontrol
+from oeqa.controllers.masterimage import MasterImageHardwareTarget
+
+class GrubTarget(MasterImageHardwareTarget):
+
+    def __init__(self, d):
+        super(GrubTarget, self).__init__(d)
+        self.deploy_cmds = [
+                'mount -L boot /boot',
+                'mkdir -p /mnt/testrootfs',
+                'mount -L testrootfs /mnt/testrootfs',
+                'cp ~/test-kernel /boot',
+                'rm -rf /mnt/testrootfs/*',
+                'tar xvf ~/test-rootfs.%s -C /mnt/testrootfs' % self.image_fstype,
+                ]
+
+        if not self.serialcontrol_cmd:
+            bb.fatal("This TEST_TARGET needs a TEST_SERIALCONTROL_CMD defined in local.conf.")
+
+
+    def _deploy(self):
+        # make sure these aren't mounted
+        self.master.run("umount /boot; umount /mnt/testrootfs;")
+        self.master.ignore_status = False
+        # Kernel files may not be in the image, so copy them just in case
+        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
+        self.master.copy_to(self.kernel, "~/test-kernel")
+        for cmd in self.deploy_cmds:
+            self.master.run(cmd)
+
+    def _start(self, params=None):
+        self.power_cycle(self.master)
+        try:
+            serialconn = pexpect.spawn(self.serialcontrol_cmd, env=self.origenv, logfile=sys.stdout)
+            serialconn.expect("GNU GRUB  version 2.00")
+            serialconn.expect("Linux")
+            serialconn.sendline("OB\r")
+            serialconn.expect("login:", timeout=120)
+            serialconn.close()
+        except pexpect.ExceptionPexpect as e:
+            bb.fatal('Serial interaction failed: %s' % str(e))
+
+    def _wait_until_booted(self):
+        try:
+            serialconn = pexpect.spawn(self.serialcontrol_cmd, env=self.origenv, logfile=sys.stdout)
+            serialconn.expect("login:", timeout=120)
+            serialconn.close()
+        except pexpect.ExceptionPexpect as e:
+            bb.fatal('Serial interaction failed: %s' % str(e))
+
-- 
1.9.1


