Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADC0076327
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926383"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:01 +0100
Message-Id: <4b90362b05176503ca1479772d050e7ed95bf6c9.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/11] oeqa/targetcontrol: write QemuRunner log output to a file
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

If we use this outside of testimage we don't have a task log; so let's
just explicitly write the log output to a file all the time so it's
always there to look at (particularly useful when runqemu exits
immediately with an error.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index beacdaf..138e6178 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -10,6 +10,7 @@ import subprocess
 import bb
 import traceback
 import sys
+import logging
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.utils.qemutinyrunner import QemuTinyRunner
@@ -123,6 +124,16 @@ class QemuTarget(BaseTarget):
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
 
+        # Log QemuRunner log output to a file
+        import oe.path
+        bb.utils.mkdirhier(self.testdir)
+        self.qemurunnerlog = os.path.join(self.testdir, 'qemurunner_log.%s' % self.datetime)
+        logger = logging.getLogger('BitBake.QemuRunner')
+        loggerhandler = logging.FileHandler(self.qemurunnerlog)
+        loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+        logger.addHandler(loggerhandler)
+        oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
+
         if d.getVar("DISTRO", True) == "poky-tiny":
             self.runner = QemuTinyRunner(machine=d.getVar("MACHINE", True),
                             rootfs=self.rootfs,
-- 
2.1.0


