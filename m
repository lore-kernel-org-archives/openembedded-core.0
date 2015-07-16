Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 568786013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:12:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2015 06:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,488,1432623600"; d="scan'208";a="525346134"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2015 06:12:05 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id D3AE26A4005;
	Thu, 16 Jul 2015 06:11:22 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 16:22:28 +0300
Message-Id: <1437052948-5162-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/prservice: add useful failure messages to test cases
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
X-List-Received-Date: Thu, 16 Jul 2015 13:12:05 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/prservice.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index fb6d68d..4187fbf 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -17,7 +17,7 @@ class BitbakePrTests(oeSelfTest):
         package_data_file = os.path.join(pkgdata_dir, 'runtime', package_name)
         package_data = ftools.read_file(package_data_file)
         find_pr = re.search("PKGR: r[0-9]+\.([0-9]+)", package_data)
-        self.assertTrue(find_pr)
+        self.assertTrue(find_pr, "No PKG revision found in %s" % package_data_file)
         return int(find_pr.group(1))
 
     def get_task_stamp(self, package_name, recipe_task):
@@ -60,8 +60,8 @@ class BitbakePrTests(oeSelfTest):
         stamp_2 = self.get_task_stamp(package_name, track_task)
 
         bitbake("-ccleansstate %s" % package_name)
-        self.assertTrue(pr_2 - pr_1 == 1)
-        self.assertTrue(stamp_1 != stamp_2)
+        self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
+        self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
     def run_test_pr_export_import(self, package_name, replace_current_db=True):
         self.config_pr_tests(package_name)
@@ -86,7 +86,7 @@ class BitbakePrTests(oeSelfTest):
         pr_2 = self.get_pr_version(package_name)
 
         bitbake("-ccleansstate %s" % package_name)
-        self.assertTrue(pr_2 - pr_1 == 1)
+        self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
 
     @testcase(930)
     def test_import_export_replace_db(self):
-- 
2.1.4


