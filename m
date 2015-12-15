Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 46D3065CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 14:30:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2015 06:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,432,1444719600"; d="scan'208";a="618355492"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2015 06:30:08 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id CAC216A4087;
	Tue, 15 Dec 2015 07:18:09 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Dec 2015 16:32:43 +0200
Message-Id: <1450189963-7141-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] selftest/buildhistory.py: Test buildhistory does not change sigs
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
X-List-Received-Date: Tue, 15 Dec 2015 14:30:27 -0000

[YOCTO #5953] Add a test to ensure buildhistory does not
change signatures.

Also removed unused imports.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/buildhistory.py | 69 ++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/buildhistory.py
index d8cae46..e8aa05d 100644
--- a/meta/lib/oeqa/selftest/buildhistory.py
+++ b/meta/lib/oeqa/selftest/buildhistory.py
@@ -1,12 +1,10 @@
-import unittest
 import os
 import re
-import shutil
 import datetime
 
-import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
 
 
 class BuildhistoryBase(oeSelfTest):
@@ -43,3 +41,66 @@ class BuildhistoryBase(oeSelfTest):
             self.assertTrue(search_for_error, msg="Could not find desired error in output: %s" % error_regex)
         else:
             self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.output))
+
+    @testcase(1386)
+    def test_buildhistory_does_not_change_signatures(self):
+        """
+        Summary:     Ensure that buildhistory does not change signatures
+        Expected:    Only 'do_rootfs' and 'do_build' tasks are rerun
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        tmpdir1_name = 'tmpsig1'
+        tmpdir2_name = 'tmpsig2'
+        builddir = os.environ.get('BUILDDIR')
+        tmpdir1 = os.path.join(builddir, tmpdir1_name)
+        tmpdir2 = os.path.join(builddir, tmpdir2_name)
+
+        self.track_for_cleanup(tmpdir1)
+        self.track_for_cleanup(tmpdir2)
+
+        features = 'TMPDIR = "%s"\n' % tmpdir1
+        self.write_config(features)
+        bitbake('core-image-sato -S none')
+
+        features = 'TMPDIR = "%s"\n' % tmpdir2
+        features += 'INHERIT += "buildhistory"\n'
+        self.write_config(features)
+        bitbake('core-image-sato -S none')
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    f.append(os.path.join(root, name))
+            return f
+
+        files1 = get_files(tmpdir1 + '/stamps')
+        files2 = get_files(tmpdir2 + '/stamps')
+        files2 = [x.replace(tmpdir2_name, tmpdir1_name) for x in files2]
+
+        f1 = set(files1)
+        f2 = set(files2)
+        sigdiff = f1 - f2
+
+        self.assertEqual(len(sigdiff), 2, 'Expected 2 signature differences. Out: %s' % list(sigdiff))
+
+        unexpected_diff = []
+
+        # No new signatures should appear apart from do_rootfs and do_build
+        found_do_rootfs_flag = False
+        found_do_build_flag = False
+
+        for sig in sigdiff:
+            if 'do_rootfs' in sig:
+                found_do_rootfs_flag = True
+            elif 'do_build' in sig:
+                found_do_build_flag = True
+            else:
+                unexpected_diff.append(sig)
+
+        self.assertTrue(found_do_rootfs_flag, 'Task do_rootfs did not rerun.')
+        self.assertTrue(found_do_build_flag, 'Task do_build did not rerun')
+        self.assertFalse(unexpected_diff, 'Found unexpected signature differences. Out: %s' % unexpected_diff)
-- 
2.1.0


