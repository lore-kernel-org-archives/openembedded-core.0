Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B72DF77FF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:21:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 10:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="1137380649"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2017 10:21:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 456FD58061A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 10:21:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 20:20:05 +0300
Message-Id: <e81f02aa1df5ad3f815e912df898814f4835ff1c.1496423753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496423753.git.ed.bartosh@linux.intel.com>
References: <cover.1496423753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/6] selftest: add test_wic_rm test case
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
X-List-Received-Date: Fri, 02 Jun 2017 17:21:53 -0000

Added test case for "wic rm" functionality.
    - remove file from vfat partition
    - remove directory from vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3a611c1..b137fd1 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -889,3 +889,31 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
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
+        self.assertEqual(8, len(result.output.split('\n')))
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
+        self.assertEqual(6, len(result.output.split('\n')))
-- 
2.1.4


