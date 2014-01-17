Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 257036C72D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:11:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2014 02:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,670,1384329600"; d="scan'208";a="440327650"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2014 02:11:25 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 41E2D6A4007;
	Fri, 17 Jan 2014 02:11:20 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 12:23:29 +0100
Message-Id: <1389957809-32261-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] oe-selftest: Patch sstate tests to work with new sstate-cache naming and content
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
X-List-Received-Date: Fri, 17 Jan 2014 10:11:24 -0000

Made modifications to account for:
- .siginfo files present in sstate-cache from non sstate-enabled tasks
- new naming format for sstate files

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py |   28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 4b2c26d..acc0c27 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -48,12 +48,15 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        file_tracker_1 = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
-        self.assertTrue(file_tracker_1, msg="Could not find sstate files for: %s" % ', '.join(map(str, targets)))
+        tgz_created = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
+        self.assertTrue(tgz_created, msg="Could not find sstate .tgz files for: %s" % ', '.join(map(str, targets)))
+
+        siginfo_created = self.search_sstate('|'.join(map(str, [s + '.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
+        self.assertTrue(siginfo_created, msg="Could not find sstate .siginfo files for: %s" % ', '.join(map(str, targets)))
 
         bitbake(['-ccleansstate'] + targets)
-        file_tracker_2 = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
-        self.assertTrue(not file_tracker_2)
+        tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
+        self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s" % ', '.join(map(str, targets)))
 
     def test_cleansstate_task_distro_specific_nonspecific(self):
         self.run_test_cleansstate_task(['binutils-cross', 'binutils-native', 'eglibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
@@ -72,9 +75,9 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        self.assertTrue(self.search_sstate('|'.join(map(str, targets)), distro_specific=False, distro_nonspecific=True) == [], msg="Found distro non-specific sstate for: %s" % ', '.join(map(str, targets)))
-        file_tracker_1 = self.search_sstate('|'.join(map(str, targets)), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_1) > len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True) == [], msg="Found distro non-specific sstate for: %s" % ', '.join(map(str, targets)))
+        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
+        self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
         self.track_for_cleanup(self.distro_specific_sstate + "_old")
         shutil.copytree(self.distro_specific_sstate, self.distro_specific_sstate + "_old")
@@ -82,8 +85,8 @@ class SStateTests(SStateBase):
 
         bitbake(['-cclean'] + targets)
         bitbake(targets)
-        file_tracker_2 = self.search_sstate('|'.join(map(str, targets)), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_2) > len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
+        self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
         not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
         self.assertTrue(not_recreated == [], msg="The following sstate files ware not recreated: %s" % ', '.join(map(str, not_recreated)))
@@ -121,18 +124,18 @@ class SStateTests(SStateBase):
             self.append_config(global_config[idx])
             self.append_recipeinc(target, target_config[idx])
             if target_config[idx] == target_config[-1]:
-                target_sstate_before_build = self.search_sstate(target)
+                target_sstate_before_build = self.search_sstate(target + '.*?\.tgz$')
             bitbake("-cclean %s" % target)
             result = bitbake(target, ignore_status=True)
             if target_config[idx] == target_config[-1]:
-                target_sstate_after_build = self.search_sstate(target)
+                target_sstate_after_build = self.search_sstate(target + '.*?\.tgz$')
                 expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build]
             self.remove_config(global_config[idx])
             self.remove_recipeinc(target, target_config[idx])
             self.assertEqual(result.status, 0)
 
         runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated" % self.sstate_path)
-        actual_remaining_sstate = self.search_sstate(target)
+        actual_remaining_sstate = self.search_sstate(target + '.*?\.tgz$')
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
         self.assertFalse(actual_not_expected, msg="Files should have been removed but ware not: %s" % ', '.join(map(str, actual_not_expected)))
@@ -183,4 +186,3 @@ class SStateTests(SStateBase):
 
 
 
-
-- 
1.7.9.5


