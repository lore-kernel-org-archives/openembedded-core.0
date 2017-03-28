Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 46F4E77B1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 28 Mar 2017 05:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="839278070"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2017 05:43:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 103F06A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:06 +0300
Message-Id: <5c9fbe5d5f1ba56ebe17fc419c9a02b8c5dae685.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 9/9] oe-selftest: add test_image_bootpart_globbed test for wic
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:24 -0000

Test image-bootpart wic plugin with globbed value of
IMAGE_BOOT_FILES variable to increase test coverage.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index f0d9dd9..2401aaa 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -748,3 +748,13 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
+
+    def test_image_bootpart_globbed(self):
+        """Test globbed sources with image-bootpart plugin"""
+        img = "core-image-minimal"
+        cmd = "wic create sdimage-bootpart -e %s -o %s" % (img, self.resultdir)
+        config = 'IMAGE_BOOT_FILES = "%s*"' % get_bb_var('KERNEL_IMAGETYPE', img)
+        self.append_config(config)
+        self.assertEqual(0, runCmd(cmd).status)
+        self.remove_config(config)
+        self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
-- 
2.1.4


