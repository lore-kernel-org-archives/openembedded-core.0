Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A196C731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:23:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2016 05:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,520,1444719600"; d="scan'208";a="853150401"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2016 05:23:08 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 69B1A6A4006;
	Mon,  4 Jan 2016 06:11:06 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 15:26:08 +0200
Message-Id: <1451913968-8669-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] selftest: moved tc test_buildhistory_does_not_change_signatures
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
X-List-Received-Date: Mon, 04 Jan 2016 13:23:10 -0000

Moved test_buildhistory_does_not_change_signatures from
buildhistory/BuildhistoryBase to buildoptions/BuildhistoryTests.

The test being in the base class was causing it to run
multiple times.

Fix for [YOCTO #8867]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/buildhistory.py | 64 ++--------------------------------
 meta/lib/oeqa/selftest/buildoptions.py | 64 ++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 62 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/buildhistory.py
index e8aa05d..38bcd72 100644
--- a/meta/lib/oeqa/selftest/buildhistory.py
+++ b/meta/lib/oeqa/selftest/buildhistory.py
@@ -42,65 +42,5 @@ class BuildhistoryBase(oeSelfTest):
         else:
             self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.output))
 
-    @testcase(1386)
-    def test_buildhistory_does_not_change_signatures(self):
-        """
-        Summary:     Ensure that buildhistory does not change signatures
-        Expected:    Only 'do_rootfs' and 'do_build' tasks are rerun
-        Product:     oe-core
-        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        tmpdir1_name = 'tmpsig1'
-        tmpdir2_name = 'tmpsig2'
-        builddir = os.environ.get('BUILDDIR')
-        tmpdir1 = os.path.join(builddir, tmpdir1_name)
-        tmpdir2 = os.path.join(builddir, tmpdir2_name)
-
-        self.track_for_cleanup(tmpdir1)
-        self.track_for_cleanup(tmpdir2)
-
-        features = 'TMPDIR = "%s"\n' % tmpdir1
-        self.write_config(features)
-        bitbake('core-image-sato -S none')
-
-        features = 'TMPDIR = "%s"\n' % tmpdir2
-        features += 'INHERIT += "buildhistory"\n'
-        self.write_config(features)
-        bitbake('core-image-sato -S none')
-
-        def get_files(d):
-            f = []
-            for root, dirs, files in os.walk(d):
-                for name in files:
-                    f.append(os.path.join(root, name))
-            return f
-
-        files1 = get_files(tmpdir1 + '/stamps')
-        files2 = get_files(tmpdir2 + '/stamps')
-        files2 = [x.replace(tmpdir2_name, tmpdir1_name) for x in files2]
-
-        f1 = set(files1)
-        f2 = set(files2)
-        sigdiff = f1 - f2
-
-        self.assertEqual(len(sigdiff), 2, 'Expected 2 signature differences. Out: %s' % list(sigdiff))
-
-        unexpected_diff = []
-
-        # No new signatures should appear apart from do_rootfs and do_build
-        found_do_rootfs_flag = False
-        found_do_build_flag = False
-
-        for sig in sigdiff:
-            if 'do_rootfs' in sig:
-                found_do_rootfs_flag = True
-            elif 'do_build' in sig:
-                found_do_build_flag = True
-            else:
-                unexpected_diff.append(sig)
-
-        self.assertTrue(found_do_rootfs_flag, 'Task do_rootfs did not rerun.')
-        self.assertTrue(found_do_build_flag, 'Task do_build did not rerun')
-        self.assertFalse(unexpected_diff, 'Found unexpected signature differences. Out: %s' % unexpected_diff)
+    # No tests should be added to the base class.
+    # Please create a new class that inherit this one, or use one of those already available for adding tests.
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index acf481f..64ced15 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -118,6 +118,70 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
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
+
+
 class BuildImagesTest(oeSelfTest):
     @testcase(563)
     def test_directfb(self):
-- 
2.1.0


