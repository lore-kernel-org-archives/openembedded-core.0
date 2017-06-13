Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 317E178347
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 04:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="980201309"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 13 Jun 2017 04:24:27 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 722315800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:14 +0300
Message-Id: <506ce6f79238857c3f5f2ac9c00db05cc0501a0d.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 26/26] selftest: add test_wic_rm test case
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:26 -0000

Added test case for "wic rm" functionality.
    - remove file from vfat partition
    - remove directory from vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 5034587..ee9ff0f 100644
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
+        self.assertIn('\nBZIMAGE        ', result.output)
+        self.assertIn('\nEFI          <DIR>     ', result.output)
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
+        self.assertNotIn('\nBZIMAGE        ', result.output)
+        self.assertNotIn('\nEFI          <DIR>     ', result.output)
-- 
2.1.4


