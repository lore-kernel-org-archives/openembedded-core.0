Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AC8C678281
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 08 Jun 2017 09:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="1179989154"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2017 09:15:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 220F55806E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:13:07 +0300
Message-Id: <2d86b22613bab03c31bed13da243e06d4179d89a.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 25/25] selftest: add test_wic_rm test case
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:37 -0000

Added test case for "wic rm" functionality.
    - remove file from vfat partition
    - remove directory from vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 5034587..76cf8d0 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -855,3 +855,33 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertEqual(0, result.status)
             self.assertEqual(8, len(result.output.split('\n')))
             self.assertTrue(os.path.basename(testdir) in result.output)
+
+    def test_wic_rm(self):
+        """Test removing files and directories from the the wic image."""
+        self.assertEqual(0, runCmd("wic create mkefidisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D -o %s" % self.resultdir).status)
+        images = glob(self.resultdir + "mkefidisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # list directory content of the first partition
+        result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertTrue('\nbzimage        ' in result.output)
+        self.assertTrue('\nefi          <DIR>     ' in result.output)
+
+        # remove file
+        result = runCmd("wic rm %s:1/bzimage -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+
+        # remove directory
+        result = runCmd("wic rm %s:1/efi -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+
+        # check if they're removed
+        result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertFalse('\nbzimage        ' in result.output)
+        self.assertFalse('\nefi          <DIR>     ' in result.output)
-- 
2.1.4


