Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2489B78049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="897215388"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2017 04:55:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 22AE258039C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:41 +0300
Message-Id: <f206d92ed29186ebe4414eb44890f3332aa6922c.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/7] wic: selftest: add test_wic_cp_ext test case
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
X-List-Received-Date: Tue, 05 Sep 2017 11:55:39 -0000

Tested if 'wic cp' correctly copies files to the ext4 partition
of the wic image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 95170b946c6..1f0383c091f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1007,3 +1007,33 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(0, result.status)
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(
                             set(line.split()[-1] for line in result.output.split('\n') if line)))
+
+    def test_wic_cp_ext(self):
+        """Test copy files and directories to the ext partition."""
+        self.assertEqual(0, runCmd("wic create wictestdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D -o %s" % self.resultdir).status)
+        images = glob(self.resultdir + "wictestdisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # list directory content of the ext4 partition
+        result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        dirs = set(line.split()[-1] for line in result.output.split('\n') if line)
+        self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs))
+
+        with NamedTemporaryFile("w", suffix=".wic-cp") as testfile:
+            testfile.write("test")
+
+            # copy file to the partition
+            result = runCmd("wic cp %s %s:2/ -n %s" % (testfile.name, images[0], sysroot))
+            self.assertEqual(0, result.status)
+
+            # check if file is there
+            result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+            self.assertEqual(0, result.status)
+            newdirs = set(line.split()[-1] for line in result.output.split('\n') if line)
+            self.assertEqual(newdirs.difference(dirs), set([os.path.basename(testfile.name)]))
+
-- 
2.13.5


