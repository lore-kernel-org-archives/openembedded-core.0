Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9F56ED65
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 14:56:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2014 06:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="344531841"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Feb 2014 06:56:18 -0800
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 598D56A4007;
	Fri, 28 Feb 2014 06:56:07 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 18:59:28 +0200
Message-Id: <1393606768-3317-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] oe-selftest: Fix test_sstate_cache_management_script*
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
X-List-Received-Date: Fri, 28 Feb 2014 14:56:20 -0000

Fixed tests for sstate-cache-management.sh that ware failing due to:
 - recent changes to sstate-cache structure
 - recent changes to the script itself

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index acc0c27..27561ca 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -105,7 +105,8 @@ class SStateTests(SStateBase):
 
 
     # Test the sstate-cache-management script. Each element in the global_config list is used with the corresponding element in the target_config list
-    def run_test_sstate_cache_management_script(self, target, global_config=[''], target_config=['']):
+    # global_config elements are expected to not generate any sstate files that would be removed by sstate-cache-management.sh (such as changing the value of MACHINE)
+    def run_test_sstate_cache_management_script(self, target, global_config=[''], target_config=[''], ignore_patterns=[]):
         self.assertTrue(global_config)
         self.assertTrue(target_config)
         self.assertTrue(len(global_config) == len(target_config), msg='Lists global_config and target_config should have the same number of elements')
@@ -119,23 +120,27 @@ class SStateTests(SStateBase):
         # For not this only checks if random sstate tasks are handled correctly as a group.
         # In the future we should add control over what tasks we check for.
 
+        sstate_archs_list = []
         expected_remaining_sstate = []
         for idx in range(len(target_config)):
             self.append_config(global_config[idx])
             self.append_recipeinc(target, target_config[idx])
+            sstate_arch = get_bb_var('SSTATE_PKGARCH', target)
+            if not sstate_arch in sstate_archs_list:
+                sstate_archs_list.append(sstate_arch)
             if target_config[idx] == target_config[-1]:
                 target_sstate_before_build = self.search_sstate(target + '.*?\.tgz$')
             bitbake("-cclean %s" % target)
             result = bitbake(target, ignore_status=True)
             if target_config[idx] == target_config[-1]:
                 target_sstate_after_build = self.search_sstate(target + '.*?\.tgz$')
-                expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build]
+                expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build if not any(pattern in x for pattern in ignore_patterns)]
             self.remove_config(global_config[idx])
             self.remove_recipeinc(target, target_config[idx])
             self.assertEqual(result.status, 0)
 
-        runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated" % self.sstate_path)
-        actual_remaining_sstate = self.search_sstate(target + '.*?\.tgz$')
+        runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
+        actual_remaining_sstate = [x for x in self.search_sstate(target + '.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
         self.assertFalse(actual_not_expected, msg="Files should have been removed but ware not: %s" % ', '.join(map(str, actual_not_expected)))
@@ -168,7 +173,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         global_config.append('MACHINE = "qemux86"')
         target_config.append('PR = "1"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config)
+        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
@@ -177,7 +182,7 @@ class SStateTests(SStateBase):
         target_config.append('')
         global_config.append('MACHINE = "qemux86"')
         target_config.append('')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config)
+        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
 
 
-- 
1.8.3.2


