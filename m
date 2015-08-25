Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BDA1176C4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:04:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2015 02:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="631743553"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 25 Aug 2015 02:04:53 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B2C266A4083;
	Tue, 25 Aug 2015 02:04:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:25 +0300
Message-Id: <f6eb87e2b7d3a5450a3d0ebd94b23708b3d6f5fd.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 14/17] oe-selftest: test building wic image by bitbake
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
X-List-Received-Date: Tue, 25 Aug 2015 09:04:53 -0000

Added test case to verify building of wic-image-minimal recipe
and produced artifacts: manifest and bzipped partitioned image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 639234b..b7bbc7b 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -187,3 +187,17 @@ class Wic(oeSelfTest):
                         'IMAGE_LINK_NAME', 'STAGING_LIBDIR', 'ROOTFS_SIZE'):
                 self.assertTrue(var in content)
                 self.assertTrue(content[var])
+
+    def test20_wic_image_type(self):
+        """Test building wic images by bitbake"""
+        self.assertEqual(0, bitbake('wic-image-minimal').status)
+
+        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        prefix = os.path.join(deploy_dir, 'wic-image-minimal-%s.' % machine)
+        # check if we have result image and manifests symlinks
+        # pointing to existing files
+        for suffix in ('wic.bz2', 'manifest'):
+            path = prefix + suffix
+            self.assertTrue(os.path.islink(path))
+            self.assertTrue(os.path.isfile(os.path.realpath(path)))
-- 
2.1.4


