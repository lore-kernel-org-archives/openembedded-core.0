Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D5EC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:05 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.14398.1635263943689041253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783260"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783260"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:00 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786309"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:58:59 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/37] oeqa/selftest/sstatetests: fix typo ware ->
 were
Date: Tue, 26 Oct 2021 23:57:33 +0800
Message-Id: 
 <0c8d02830ebac3c8ba563a46d304b1ef2a282b9f.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157405

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c94a9ece226b1d2012f5ee966b81bf607d954937)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 17a1545506..874f439282 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -137,7 +137,7 @@ class SStateTests(SStateBase):
             filtered_results.append(r)
         self.assertTrue(filtered_results == [], msg="Found distro non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)), str(filtered_results)))
         file_tracker_1 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
 
         self.track_for_cleanup(self.distro_specific_sstate + "_old")
         shutil.copytree(self.distro_specific_sstate, self.distro_specific_sstate + "_old")
@@ -146,13 +146,13 @@ class SStateTests(SStateBase):
         bitbake(['-cclean'] + targets)
         bitbake(targets)
         file_tracker_2 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
 
         not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
-        self.assertTrue(not_recreated == [], msg="The following sstate files ware not recreated: %s" % ', '.join(map(str, not_recreated)))
+        self.assertTrue(not_recreated == [], msg="The following sstate files were not recreated: %s" % ', '.join(map(str, not_recreated)))
 
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
-        self.assertTrue(created_once == [], msg="The following sstate files ware created only in the second run: %s" % ', '.join(map(str, created_once)))
+        self.assertTrue(created_once == [], msg="The following sstate files were created only in the second run: %s" % ', '.join(map(str, created_once)))
 
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
@@ -202,9 +202,9 @@ class SStateTests(SStateBase):
         actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
-        self.assertFalse(actual_not_expected, msg="Files should have been removed but ware not: %s" % ', '.join(map(str, actual_not_expected)))
+        self.assertFalse(actual_not_expected, msg="Files should have been removed but were not: %s" % ', '.join(map(str, actual_not_expected)))
         expected_not_actual = [x for x in expected_remaining_sstate if x not in actual_remaining_sstate]
-        self.assertFalse(expected_not_actual, msg="Extra files ware removed: %s" ', '.join(map(str, expected_not_actual)))
+        self.assertFalse(expected_not_actual, msg="Extra files were removed: %s" ', '.join(map(str, expected_not_actual)))
 
     def test_sstate_cache_management_script_using_pr_1(self):
         global_config = []
-- 
2.31.1


