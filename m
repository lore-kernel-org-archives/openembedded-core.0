Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 71FDA77DCA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 15:24:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 07 Jul 2017 08:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,323,1496127600"; d="scan'208";a="1149254091"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2017 08:24:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 302665803BE;
	Fri,  7 Jul 2017 08:24:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jul 2017 18:12:23 +0300
Message-Id: <1499440343-8389-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] imagefutures: add test_image_fstypes test case
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
X-List-Received-Date: Fri, 07 Jul 2017 15:24:32 -0000

Tested if core-image-minimal can be built for existing fstypes by
building an image and checking if result file <image>.<fstype> exists
in the image deploy directory.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index e6652ec..91d8e9b 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -124,3 +124,31 @@ class ImageFeatures(OESelftestTestCase):
         # check if result image is sparse
         image_stat = os.stat(image_path)
         self.assertTrue(image_stat.st_size > image_stat.st_blocks * 512)
+
+    def test_image_fstypes(self):
+        """
+        Summary:     Check if image of supported image fstypes can be built
+        Expected:    core-image-minimal can be built for various image types
+        Product:     oe-core
+        Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
+        """
+        image_name = 'core-image-minimal'
+
+        img_types = [itype for itype in get_bb_var("IMAGE_TYPES", image_name).split() \
+                         if itype not in ('container', 'elf', 'multiubi')]
+
+        config = 'IMAGE_FSTYPES += "%s"\n'\
+                 'MKUBIFS_ARGS ?= "-m 2048 -e 129024 -c 2047"\n'\
+                 'UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512"' % ' '.join(img_types)
+
+        self.write_config(config)
+
+        bitbake(image_name)
+
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
+        for itype in img_types:
+            image_path = os.path.join(deploy_dir_image, "%s.%s" % (link_name, itype))
+            # check if result image is in deploy directory
+            self.assertTrue(os.path.exists(image_path),
+                            "%s image %s doesn't exist" % (itype, image_path))
-- 
2.1.4


