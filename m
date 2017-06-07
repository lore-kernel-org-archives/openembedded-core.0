Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 447AF780F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 10:26:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 03:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,310,1493708400"; d="scan'208";a="110199206"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 07 Jun 2017 03:26:21 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id 3AFE45802EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 03:26:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 13:25:30 +0300
Message-Id: <e4d6b5417020f4f3ec656b7fc49f65e4cba7c455.1496830884.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1496830884.git.ed.bartosh@linux.intel.com>
References: <cover.1496830884.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 6/6] selftest: add test_wic_rm test case
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
X-List-Received-Date: Wed, 07 Jun 2017 10:26:21 -0000

Added test case for "wic rm" functionality.
    - remove file from vfat partition
    - remove directory from vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index fa1a71c957..0e58a40ffc 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -891,3 +891,33 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
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
2.12.0


