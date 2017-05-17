Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8849377E36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:40:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="969437543"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 17 May 2017 06:40:26 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 0CA766A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:40:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:39:53 +0000
Message-Id: <0d62506f311d9fa37394f103a0075a13885d1fd8.1495028274.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028274.git.ed.bartosh@linux.intel.com>
References: <cover.1495028274.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 8/8] selftest: add new test case test_wic_ls
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
X-List-Received-Date: Wed, 17 May 2017 13:40:25 -0000

Tested 'wic ls' functionality:
 - list of image partitions
 - list of directory content of vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 9cb9507830..e908c076ad 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -825,3 +825,23 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
+
+    def test_wic_ls(self):
+        """Test listing image content using 'wic ls'"""
+        self.assertEqual(0, runCmd("wic create wictestdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D -o %s" % self.resultdir).status)
+        images = glob(self.resultdir + "wictestdisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # list partitions
+        result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertEqual(3, len(result.output.split('\n')))
+
+        # list directory content of the first partition
+        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertEqual(6, len(result.output.split('\n')))
-- 
2.12.0


