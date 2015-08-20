Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A244F65CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 04:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772375902"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 04:56:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id CE8E36A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:55:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:15 +0300
Message-Id: <e3247f924309bc63f349eb4be707860b59edb56b.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/17] oe-selftest: test generation of <image>.env
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:45 -0000

Added test case to check if <image>.env file is generated
and contains bitbake variables used in wic code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 0c503ef..15de621 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -23,6 +23,7 @@
 
 """Test cases for wic."""
 
+import os
 import sys
 
 from glob import glob
@@ -160,3 +161,22 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                      "%(wks)s-*.direct" % vars)))
+
+    def test18_image_env(self):
+        """Test generation of <image>.env files."""
+        image = 'core-image-minimal'
+        stdir = get_bb_var('STAGING_DIR_TARGET', image)
+        imgdatadir = os.path.join(stdir, 'imgdata')
+        basename = get_bb_var('IMAGE_BASENAME', image)
+        self.assertEqual(basename, image)
+        path = os.path.join(imgdatadir, basename) + '.env'
+        self.assertTrue(os.path.isfile(path))
+        with open(path) as envfile:
+            content = dict(line.split("=", 1) for line in envfile)
+            # test if variables used by wic present in the .env file
+            for var in ('IMAGE_ROOTFS', 'DEPLOY_DIR_IMAGE', 'BBLAYERS',
+                        'STAGING_DIR_NATIVE', 'STAGING_DATADIR', 'TARGET_SYS',
+                        'IMAGE_BASENAME', 'INITRAMFS_FSTYPES', 'MACHINE_ARCH',
+                        'IMAGE_LINK_NAME', 'STAGING_LIBDIR', 'ROOTFS_SIZE'):
+                self.assertTrue(var in content)
+                self.assertTrue(content[var])
-- 
2.1.4


