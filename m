Return-Path: <costin.c.constantin@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A46E76AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 06:44:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2015 23:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,521,1432623600"; d="scan'208";a="733227403"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2015 23:44:24 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 4B9BD2E055B;
	Tue, 21 Jul 2015 23:43:39 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 09:54:56 +0300
Message-Id: <1437548096-22741-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] oeqa/buildoptions.py: automate test case 563; build directfb image
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
X-List-Received-Date: Wed, 22 Jul 2015 06:44:26 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 13ec276..10e4fc5 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -2,7 +2,8 @@ import unittest
 import os
 import logging
 import re
-
+import glob as g
+import pexpect as p
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -119,8 +120,14 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
-
-
-
-
-
+class BuildImagesTest(oeSelfTest):
+    @testcase(563)
+    def test_directfb(self):
+        """
+        This method is used to test the build of directfb image for arm arch.
+        In essence we build a coreimagedirectfb and test the exitcode of bitbake that in case of success is 0.
+        """
+        self.add_command_to_tearDown('cleanupworkdir')
+        self.write_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
+        res = bitbake("core-image-directfb", ignore_status=True)
+        self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed to build. Please check logs for further details.\nbitbake output %s" % res.output)
-- 
2.1.4


