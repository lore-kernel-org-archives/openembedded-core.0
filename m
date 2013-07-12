Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B15B26077F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:46:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2013 09:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="364366319"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2013 09:48:05 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 27A2A6A4092
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:46:57 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 19:46:55 +0300
Message-Id: <b5952ed01ccab3b8826f2c46d2ed7c7c3d9a1aa0.1373647359.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
Subject: [PATCH 7/8] classes/testimage.bbclass: use a copy of rootfs for tests
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
X-List-Received-Date: Fri, 12 Jul 2013 16:46:58 -0000

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
1.8.1.4


