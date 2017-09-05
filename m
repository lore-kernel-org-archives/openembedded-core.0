Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B7CD2780AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 05 Sep 2017 04:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="131851868"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2017 04:55:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3429C58039C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:42 +0300
Message-Id: <7a5d997dc264ca8913c5ea57a2c5120a2dc41528.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/7] wic: selftest: add test_wic_rm_ext test case
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
X-List-Received-Date: Tue, 05 Sep 2017 11:55:41 -0000

Tested if 'wic rm' correctly removes files from the ext4 partition
of the wic image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 1f0383c091f..e416a3724ab 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1037,3 +1037,26 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             newdirs = set(line.split()[-1] for line in result.output.split('\n') if line)
             self.assertEqual(newdirs.difference(dirs), set([os.path.basename(testfile.name)]))
 
+    def test_wic_rm_ext(self):
+        """Test removing files from the ext partition."""
+        self.assertEqual(0, runCmd("wic create mkefidisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D -o %s" % self.resultdir).status)
+        images = glob(self.resultdir + "mkefidisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # list directory content of the /etc directory on ext4 partition
+        result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertTrue('fstab' in [line.split()[-1] for line in result.output.split('\n') if line])
+
+        # remove file
+        result = runCmd("wic rm %s:2/etc/fstab -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+
+        # check if it's removed
+        result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertTrue('fstab' not in [line.split()[-1] for line in result.output.split('\n') if line])
-- 
2.13.5


