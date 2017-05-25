Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A98C078155
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:49 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 25 May 2017 07:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="106899763"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 25 May 2017 07:47:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C42F6580363
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:28 +0300
Message-Id: <8d40da418ce8a4417925264173da41eaee29965e.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495722660.git.ed.bartosh@linux.intel.com>
References: <cover.1495722660.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/11] selftest: add test_wic_cp test case
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
X-List-Received-Date: Thu, 25 May 2017 14:47:50 -0000

Added test case for "wic cp" functionality.
     - copy file to vfat partition
     - copy directory to vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 46 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e908c07..3a611c1 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -28,7 +28,7 @@ import sys
 import unittest
 
 from glob import glob
-from shutil import rmtree
+from shutil import rmtree, copy
 from functools import wraps, lru_cache
 from tempfile import NamedTemporaryFile
 
@@ -845,3 +845,47 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
         self.assertEqual(0, result.status)
         self.assertEqual(6, len(result.output.split('\n')))
+
+    def test_wic_cp(self):
+        """Test copy files and directories to the the wic image."""
+        self.assertEqual(0, runCmd("wic create wictestdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D -o %s" % self.resultdir).status)
+        images = glob(self.resultdir + "wictestdisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # list directory content of the first partition
+        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertEqual(6, len(result.output.split('\n')))
+
+        with NamedTemporaryFile("w", suffix=".wic-cp") as testfile:
+            testfile.write("test")
+
+            # copy file to the partition
+            result = runCmd("wic cp %s %s:1/ -n %s" % (testfile.name, images[0], sysroot))
+            self.assertEqual(0, result.status)
+
+            # check if file is there
+            result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+            self.assertEqual(0, result.status)
+            self.assertEqual(7, len(result.output.split('\n')))
+            self.assertTrue(os.path.basename(testfile.name) in result.output)
+
+            # prepare directory
+            testdir = os.path.join(self.resultdir, 'wic-test-cp-dir')
+            testsubdir = os.path.join(testdir, 'subdir')
+            os.makedirs(os.path.join(testsubdir))
+            copy(testfile.name, testdir)
+
+            # copy directory to the partition
+            result = runCmd("wic cp %s %s:1/ -n %s" % (testdir, images[0], sysroot))
+            self.assertEqual(0, result.status)
+
+            # check if directory is there
+            result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+            self.assertEqual(0, result.status)
+            self.assertEqual(8, len(result.output.split('\n')))
+            self.assertTrue(os.path.basename(testdir) in result.output)
-- 
2.1.4


