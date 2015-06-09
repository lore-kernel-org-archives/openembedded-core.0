Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6080C6AC43
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 11:05:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2015 04:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="505419477"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2015 04:02:23 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id CD7EB2E055B;
	Tue,  9 Jun 2015 04:01:47 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 14:12:15 +0300
Message-Id: <1433848335-21365-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest/buildoptions.py: added auto test for directfb image generation
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
X-List-Received-Date: Tue, 09 Jun 2015 11:05:19 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 926ffe9..c69da68 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -120,7 +120,16 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
 
-
-
-
-
+class BuildImagesTest(oeSelfTest):
+    @testcase(563)
+    def test_directfb(self):
+        """
+        This method is used to test the build of directfb image for arm arch.
+        In essence we build a core-image-directfb and test the exitcode of bitbake that in case of success is 0.
+        """
+        self.add_command_to_tearDown('cleanup-workdir')
+        self.write_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
+        self.res = bitbake("core-image-directfb").status
+        self.remove_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
+        self.assertEqual(self.res, 0, "\ndirectfb image couldn't be built\n")
+        self.assertEqual(self.res, 0, "\ncore-image-directfb failed to build. Please check logs for further details.\n")
\ No newline at end of file
-- 
2.1.4


