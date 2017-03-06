Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 55C1777552
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:24:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 07:24:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="1105352462"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2017 07:24:28 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AB6D16A4082
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:24:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:10:10 +0200
Message-Id: <6d1e84322198a977fcc47f14daafd9a77417dd5c.1488812619.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488812619.git.ed.bartosh@linux.intel.com>
References: <cover.1488812619.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/5] targetcontrol: add image_fstype argument to commands.runqemu
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
X-List-Received-Date: Mon, 06 Mar 2017 15:24:28 -0000

qemu runner picks up first fsimage type from the hard-coded
list of supported types. This makes it impossible to test
particular image type unless it's not ext4(first type in
the hardcoded list of types).

Added image_fstypes argument to commands.runqemu and QemuTarget
__init__ to specify type of the image to run qemu with.

This will be used to pass wic image type to test efi wic images.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py  | 4 ++--
 meta/lib/oeqa/utils/commands.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index dbd2c7c..0ad3a6b 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -113,11 +113,11 @@ class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
-    def __init__(self, d):
+    def __init__(self, d, image_fstype=None):
 
         super(QemuTarget, self).__init__(d)
 
-        self.image_fstype = self.get_image_fstype(d)
+        self.image_fstype = image_fstype or self.get_image_fstype(d)
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
         self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 73ede23..82c5908 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams=''):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None):
 
     import bb.tinfoil
     import bb.build
@@ -240,7 +240,7 @@ def runqemu(pn, ssh=True, runqemuparams=''):
         logger.propagate = False
         logdir = recipedata.getVar("TEST_LOG_DIR")
 
-        qemu = oeqa.targetcontrol.QemuTarget(recipedata)
+        qemu = oeqa.targetcontrol.QemuTarget(recipedata, image_fstype)
     finally:
         # We need to shut down tinfoil early here in case we actually want
         # to run tinfoil-using utilities with the running QEMU instance.
-- 
2.1.4


