Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF3E6771A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316011"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:49 -0700
Message-Id: <741912e1d53f4a9dc0011e4731ca5b67e2f86c89.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 01/20] oeqa.selftest.archiver: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:20 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/archiver.py        | 24 +++++++++++++++---------
 meta/lib/oeqa/selftest/conf/archiver.conf |  8 ++++++++
 2 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/archiver.conf

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index f2030c4..a2e2de9 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -4,10 +4,16 @@ from oeqa.utils.decorators import testcase
 import glob
 import os
 import shutil
+from oeqa.utils.readconfig import conffile
 
 
 class Archiver(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     @testcase(1345)
     def test_archiver_allows_to_filter_on_recipe_name(self):
         """
@@ -19,13 +25,11 @@ class Archiver(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        include_recipe = 'busybox'
-        exclude_recipe = 'zlib'
-
-        features = 'INHERIT += "archiver"\n'
-        features += 'ARCHIVER_MODE[src] = "original"\n'
-        features += 'COPYLEFT_PN_INCLUDE = "%s"\n' % include_recipe
-        features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % exclude_recipe
+        # Test configuration is taken from conf file
+        include_recipe = self.config.get('archiver', 'include_recipe')
+        exclude_recipe = self.config.get('archiver', 'exclude_recipe')
+        image = self.config.get('archiver', 'image')
+        features = self.config.get('archiver', 'archiver_features')
 
         # Update local.conf
         self.write_config(features)
@@ -43,8 +47,10 @@ class Archiver(oeSelfTest):
 
         # Check that include_recipe was included
         is_included = len(glob.glob(src_path + '/%s*' % include_recipe))
-        self.assertEqual(1, is_included, 'Recipe %s was not included.' % include_recipe)
+        self.assertEqual(1, is_included, 'Recipe %s was not included.'
+                         % include_recipe)
 
         # Check that exclude_recipe was excluded
         is_excluded = len(glob.glob(src_path + '/%s*' % exclude_recipe))
-        self.assertEqual(0, is_excluded, 'Recipe %s was not excluded.' % exclude_recipe)
+        self.assertEqual(0, is_excluded, 'Recipe %s was not excluded.'
+                         % exclude_recipe)
diff --git a/meta/lib/oeqa/selftest/conf/archiver.conf b/meta/lib/oeqa/selftest/conf/archiver.conf
new file mode 100644
index 0000000..2d56056
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/archiver.conf
@@ -0,0 +1,8 @@
+[archiver]
+include_recipe = busybox
+exclude_recipe = zlib
+archiver_features = INHERIT += "archiver"
+           ARCHIVER_MODE[src] = "original"
+           COPYLEFT_PN_INCLUDE = "busybox"
+           COPYLEFT_PN_EXCLUDE = "zlib"
+image = core-image-minimal
-- 
1.8.3.1


