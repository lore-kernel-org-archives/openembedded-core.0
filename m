Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE417826F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:19 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 08 Jun 2017 09:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="112031781"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2017 09:15:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 14E2858029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:50 +0300
Message-Id: <eb808965578c803154f616682e1accbacb288058.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/25] selftest: add new test case test_wic_ls
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:19 -0000

Tested 'wic ls' functionality:
 - list of image partitions
 - list of directory content of vfat partition

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 4040cf7..5d67395 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -791,3 +791,23 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 # 8 blocks is 4K (physical sector size)
                 self.assertEqual(dest_stat.st_blocks, 8)
             os.unlink(dest)
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
2.1.4


