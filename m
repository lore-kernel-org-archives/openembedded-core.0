Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ADA9B76E5E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 17:47:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2015 10:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758366172"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 10:47:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 650246A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:46:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 20:46:59 +0300
Message-Id: <9dbc177e45548bba4ba8930167d54afb4628bf3b.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/12] oe-selftest: test generation of <image>.env
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
X-List-Received-Date: Sun, 30 Aug 2015 17:47:16 -0000

Added test case to check if <image>.env file is generated
and contains bitbake variables used in wic code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 117bd9d..fe8a2d0 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -23,6 +23,7 @@
 
 """Test cases for wic."""
 
+import os
 import sys
 
 from glob import glob
@@ -168,3 +169,22 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
+    def test19_image_env(self):
+        """Test generation of <image>.env files."""
+        image = 'core-image-minimal'
+        stdir = get_bb_var('STAGING_DIR_TARGET', image)
+        imgdatadir = os.path.join(stdir, 'imgdata')
+
+        basename = get_bb_var('IMAGE_BASENAME', image)
+        self.assertEqual(basename, image)
+        path = os.path.join(imgdatadir, basename) + '.env'
+        self.assertTrue(os.path.isfile(path))
+
+        wicvars = get_bb_var('WICVARS', image).split()
+        wicvars.remove('IMAGE_BOOT_FILES') # this variable is optional
+        with open(path) as envfile:
+            content = dict(line.split("=", 1) for line in envfile)
+            # test if variables used by wic present in the .env file
+            for var in wicvars:
+                self.assertTrue(var in content, "%s is not in .env file" % var)
+                self.assertTrue(content[var])
-- 
2.1.4


