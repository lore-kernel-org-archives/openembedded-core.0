Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 21EB376BC5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 21:14:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2015 14:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758485151"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 14:14:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E25056A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 14:13:45 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 00:14:26 +0300
Message-Id: <697d9e85a031e765a4e4297ebd06d970eaefa02b.1440969020.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440969020.git.ed.bartosh@linux.intel.com>
References: <cover.1440969020.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440969020.git.ed.bartosh@linux.intel.com>
References: <cover.1440969020.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/5] oe-selftest: test building wic image by bitbake
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
X-List-Received-Date: Sun, 30 Aug 2015 21:14:36 -0000

Added test case to verify building of wic-image-minimal recipe
and produced artifacts: manifest and bzipped partitioned image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index fe8a2d0..deb2333 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -188,3 +188,17 @@ class Wic(oeSelfTest):
             for var in wicvars:
                 self.assertTrue(var in content, "%s is not in .env file" % var)
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


