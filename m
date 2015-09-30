Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 16C127706A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:46:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 06:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="655095422"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 05:38:36 +0000
Message-Id: <bb518e291c6a6466beb83603f7bf806091cb1a72.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 5/5] lib/oeqa/selftest/yoctobsp: Basic tests for yocto-bsp script
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
X-List-Received-Date: Wed, 30 Sep 2015 13:46:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Unit tests include listing properties and creating BSP using the default kernel,
both tests done for supported architectures. Test can be manually executed with:

    $ oe-selftest --run-tests yoctobsp.YoctoBSP

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/yoctobsp.py | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/yoctobsp.py

diff --git a/meta/lib/oeqa/selftest/yoctobsp.py b/meta/lib/oeqa/selftest/yoctobsp.py
new file mode 100644
index 0000000..4c539a1
--- /dev/null
+++ b/meta/lib/oeqa/selftest/yoctobsp.py
@@ -0,0 +1,39 @@
+import unittest
+import os
+import logging
+import tempfile
+import shutil
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd
+from oeqa.utils.decorators import skipUnlessPassed
+
+class YoctoBSP(oeSelfTest):
+
+    @classmethod
+    def setUpClass(self):
+        result = runCmd("yocto-bsp list karch")
+        self.karchs = [karch.lstrip() for karch in result.output.splitlines()][1:]
+
+    def test_yoctobsp_listproperties(self):
+        for karch in self.karchs:
+            result = runCmd("yocto-bsp list %s properties" % karch)
+            self.assertEqual(0, result.status, msg="Properties from %s architecture could not be listed" % karch)
+
+    def test_yoctobsp_create(self):
+        # Generate a temporal file and folders for each karch
+        json = "{\"use_default_kernel\":\"yes\"}\n"
+        fd = tempfile.NamedTemporaryFile(delete=False)
+        fd.write(json)
+        fd.close()
+        tmpfolders = dict([(karch, tempfile.mkdtemp()) for karch in self.karchs])
+        # Create BSP
+        for karch in self.karchs:
+            result = runCmd("yocto-bsp create test %s -o %s -i %s" % (karch, "%s/unitest" % tmpfolders[karch], fd.name))
+            self.assertEqual(0, result.status, msg="Could not create a BSP with architecture %s using %s " % (karch, fd.name))
+        # Remove tmp file/folders
+        os.unlink(fd.name)
+        self.assertFalse(os.path.exists(fd.name), msg = "Temporal file %s could not be removed" % fd.name)
+        for tree in tmpfolders.values():
+            shutil.rmtree(tree)
+            self.assertFalse(os.path.exists(tree), msg = "Temporal folder %s could not be removed" % tree)
-- 
1.8.4.5


