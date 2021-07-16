Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494571"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075409"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/28] oeqa/selftest/archiver: Allow tests to ignore empty directories
Date: Fri, 16 Jul 2021 10:42:02 +0800
Message-Id: <373f7c92bab1c08fb895c55553f28539d0b45025.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If we tweak sstate to not remove empty directories under conditions
where a race could occur, we see failures from:

"oe-selftest -r archiver.Archiver.test_archiver_filters_by_type archiver.Archiver.test_archiver_filters_by_type_and_name"

since an empty directory is left behind. Update the tests to ignore
empty directories.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10cda713faea9a348fd278137ac75e4a6d76a71c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index ddd08ecf84..0194ae9f69 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -35,11 +35,11 @@ class Archiver(OESelftestTestCase):
         src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
 
         # Check that include_recipe was included
-        included_present = len(glob.glob(src_path + '/%s-*' % include_recipe))
+        included_present = len(glob.glob(src_path + '/%s-*/*' % include_recipe))
         self.assertTrue(included_present, 'Recipe %s was not included.' % include_recipe)
 
         # Check that exclude_recipe was excluded
-        excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
+        excluded_present = len(glob.glob(src_path + '/%s-*/*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
 
     def test_archiver_filters_by_type(self):
@@ -67,11 +67,11 @@ class Archiver(OESelftestTestCase):
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
         # Check that target_recipe was included
-        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipe))
+        included_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipe))
         self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipe)
 
         # Check that native_recipe was excluded
-        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipe))
+        excluded_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipe)
 
     def test_archiver_filters_by_type_and_name(self):
@@ -104,17 +104,17 @@ class Archiver(OESelftestTestCase):
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
         # Check that target_recipe[0] and native_recipes[1] were included
-        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[0]))
+        included_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[0]))
         self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipes[0])
 
-        included_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[1]))
+        included_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipes[1]))
         self.assertTrue(included_present, 'Recipe %s was not included.' % native_recipes[1])
 
         # Check that native_recipes[0] and target_recipes[1] were excluded
-        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[0]))
+        excluded_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipes[0]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipes[0])
 
-        excluded_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[1]))
+        excluded_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[1]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
 
 
-- 
2.31.1

