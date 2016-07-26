Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1925E607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:46:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jul 2016 08:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="740010954"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 08:46:00 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 07:39:07 +0000
Message-Id: <0aed60265c2c6929b7f55c9d28cb29c1162bc2d5.1469518569.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] oeqa/oetest.py: Allow to export packages using symlinks
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
X-List-Received-Date: Tue, 26 Jul 2016 15:46:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently packages that contains symlinks can't be extracted
and exported. This allows to export extracted such packages.

A nice side effect is improved readability.

[YOCTO #9932]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 22 ++++------------------
 meta/lib/oeqa/oetest.py         | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 15fa470..4d2641b 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -47,6 +47,7 @@ def exportTests(d,tc):
     import shutil
     import pkgutil
     import re
+    from oeqa.utils.commands import oeqa_copy
 
     exportpath = d.getVar("TEST_EXPORT_DIR", True)
 
@@ -132,27 +133,12 @@ def exportTests(d,tc):
     create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR", True))
 
     # Copy packages needed for runtime testing
-    export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "packages")
     test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR", True)
-    need_pkg_dir = False
-    for root, subdirs, files in os.walk(test_pkg_dir):
-        for subdir in subdirs:
-            tmp_dir = os.path.join(root.replace(test_pkg_dir, "").lstrip("/"), subdir)
-            new_dir = os.path.join(export_pkg_dir, tmp_dir)
-            bb.utils.mkdirhier(new_dir)
-
-        for f in files:
-            need_pkg_dir = True
-            src_f = os.path.join(root, f)
-            dst_f = os.path.join(export_pkg_dir, root.replace(test_pkg_dir, "").lstrip("/"), f)
-            shutil.copy2(src_f, dst_f)
-
-    if need_pkg_dir:
+    if os.listdir(test_pkg_dir):
+        export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "packages")
+        shutil.copytree(test_pkg_dir, export_pkg_dir, copy_function=oeqa_copy)
         # Create tar file for packages needed by the DUT
         create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE", True), export_pkg_dir)
-    else:
-        # Remov packages dir from exported test
-        bb.utils.remove(export_pkg_dir, True)
 
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED", True) == "1":
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index e63ca56..bb6b908 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -26,6 +26,7 @@ try:
     import oeqa.sdkext
 except ImportError:
     pass
+from oeqa.utils.commands import oeqa_copy
 from oeqa.utils.decorators import LogResults, gettag, getResults
 from oeqa.utils import avoid_paths_in_environ
 
@@ -447,6 +448,8 @@ class RuntimeTestContext(TestContext):
         modules = self.getTestModules()
         bbpaths = self.d.getVar("BBPATH", True).split(":")
 
+        shutil.rmtree(self.d.getVar("TEST_EXTRACTED_DIR", True))
+        shutil.rmtree(self.d.getVar("TEST_PACKAGED_DIR", True))
         for module in modules:
             json_file = self._getJsonFile(module)
             if json_file:
@@ -481,13 +484,18 @@ class RuntimeTestContext(TestContext):
                     dst_dir = os.path.join(packaged_path)
 
                 # Extract package and copy it to TEST_EXTRACTED_DIR
-                if extract and not os.path.exists(dst_dir):
-                    pkg_dir = self._extract_in_tmpdir(pkg)
-                    shutil.copytree(pkg_dir, dst_dir)
+                pkg_dir = self._extract_in_tmpdir(pkg)
+                if extract:
+
+                    # Same package used for more than one test,
+                    # don't need to extract again.
+                    if os.path.exists(dst_dir):
+                        continue
+                    shutil.copytree(pkg_dir, dst_dir, copy_function=oeqa_copy)
                     shutil.rmtree(pkg_dir)
 
                 # Copy package to TEST_PACKAGED_DIR
-                elif not extract:
+                else:
                     self._copy_package(pkg)
 
     def _getJsonFile(self, module):
-- 
2.6.6


