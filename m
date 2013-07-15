Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 656DF6A463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:42:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2013 07:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="370460138"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 07:42:17 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 12BB26A4091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:42:15 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:42:28 +0300
Message-Id: <9bbd2e2fc9030416965dc7104c603ef78b9a5ecd.1373899189.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 7/9] classes/testimage.bbclass: use a copy of rootfs for tests
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
X-List-Received-Date: Mon, 15 Jul 2013 14:42:17 -0000

Make a copy of the rootfs and test that.
We can now drop the snapshot option.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass    | 9 ++++++++-
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 22f0a92..940520f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -22,6 +22,7 @@ def testimage_main(d):
     import os
     import oeqa.runtime
     import re
+    import shutil
     from oeqa.oetest import runTests
     from oeqa.utils.sshcontrol import SSHControl
     from oeqa.utils.qemurunner import QemuRunner
@@ -61,7 +62,13 @@ def testimage_main(d):
     # and boot each supported fs type
     machine=d.getVar("MACHINE", True)
     #will handle fs type eventually, stick with ext3 for now
-    rootfs=d.getVar("DEPLOY_DIR_IMAGE", True) + '/' + d.getVar("IMAGE_BASENAME",True) + '-' + machine + '.ext3'
+    #make a copy of the original rootfs and use that for tests
+    origrootfs=os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME",True) + '.ext3')
+    rootfs=os.path.join(testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
+    try:
+        shutil.copyfile(origrootfs, rootfs)
+    except Exception as e:
+        bb.fatal("Error copying rootfs: %s" % e)
 
     qemu = QemuRunner(machine, rootfs)
     qemu.tmpdir = d.getVar("TMPDIR", True)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ec92988..1051b2b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -18,7 +18,7 @@ class QemuRunner:
         self.rootfs = rootfs
 
         self.streampath = '/tmp/qemuconnection.%s' % os.getpid()
-        self.qemuparams = 'bootparams="console=ttyS0" qemuparams="-snapshot -serial unix:%s,server,nowait"' % self.streampath
+        self.qemuparams = 'bootparams="console=ttyS0" qemuparams="-serial unix:%s,server,nowait"' % self.streampath
         self.qemupid = None
         self.ip = None
 
-- 
1.8.3.1


