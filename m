Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1A88678049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="897215385"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2017 04:55:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 125CB58039C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:40 +0300
Message-Id: <8be6eb27ca2950b7b64ecccafd8372887117dc6a.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/7] wic: selftest: add test_wic_ls_ext test case
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
X-List-Received-Date: Tue, 05 Sep 2017 11:55:38 -0000

Tested if 'wic ls' correctly lists directory contents
of the ext* partition.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index aa73ba4f7ea..95170b946c6 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -991,3 +991,19 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 os.unlink(new_image_path)
             if os.path.exists(image_path + '.bak'):
                 os.rename(image_path + '.bak', image_path)
+
+    def test_wic_ls_ext(self):
+        """Test listing content of the ext partition using 'wic ls'"""
+        self.assertEqual(0, runCmd("wic create wictestdisk "
+                                   "--image-name=core-image-minimal "
+                                   "-D -o %s" % self.resultdir).status)
+        images = glob(self.resultdir + "wictestdisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+        # list directory content of the second ext4 partition
+        result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+        self.assertEqual(0, result.status)
+        self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(
+                            set(line.split()[-1] for line in result.output.split('\n') if line)))
-- 
2.13.5


