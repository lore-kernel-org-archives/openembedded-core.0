Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E044B731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2017 09:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567538"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:08:00 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:23 -0600
Message-Id: <1f44b8b24ac89b87ca9a080536807dd7df0fae15.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 52/55] testimage.bbclass: Add package install feature
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
X-List-Received-Date: Fri, 20 Jan 2017 17:08:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allows to use the package install feature with
the new OEQA framework.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass         | 27 ++++++++------------
 meta/lib/oeqa/core/utils/test.py       | 10 +++++---
 meta/lib/oeqa/runtime/case.py          |  9 +++++++
 meta/lib/oeqa/runtime/context.py       | 12 ++++++++-
 meta/lib/oeqa/utils/package_manager.py | 46 ++++++++++++++++++++++++----------
 5 files changed, 69 insertions(+), 35 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1dfbc49..96e41c6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -159,7 +159,6 @@ def testimage_main(d):
     pn = d.getVar("PN")
 
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
-    #test_create_extract_dirs(d)
 
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
                              d.getVar('IMAGE_LINK_NAME')))
@@ -170,6 +169,8 @@ def testimage_main(d):
     image_manifest = "%s.manifest" % image_name
     image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
 
+    extract_dir = d.getVar("TEST_EXTRACTED_DIR")
+
     # Get machine
     machine = d.getVar("MACHINE")
 
@@ -236,7 +237,8 @@ def testimage_main(d):
         d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
-    tc = OERuntimeTestContext(td, logger, target, host_dumper, image_packages)
+    tc = OERuntimeTestContext(td, logger, target, host_dumper,
+                              image_packages, extract_dir)
 
     # Load tests before starting the target
     test_paths = get_runtime_paths(d)
@@ -343,22 +345,13 @@ def package_extraction(d, test_suites):
     from oeqa.utils.package_manager import find_packages_to_extract
     from oeqa.utils.package_manager import extract_packages
 
-    test_create_extract_dirs(d)
+    bb.utils.remove(d.getVar("TEST_NEEDED_PACKAGES_DIR"), recurse=True)
     packages = find_packages_to_extract(test_suites)
-    extract_packages(d, packages)
-
-def test_create_extract_dirs(d):
-    install_path = d.getVar("TEST_INSTALL_TMP_DIR")
-    package_path = d.getVar("TEST_PACKAGED_DIR")
-    extracted_path = d.getVar("TEST_EXTRACTED_DIR")
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
-    bb.utils.remove(install_path, recurse=True)
-    bb.utils.remove(package_path, recurse=True)
-    bb.utils.remove(extracted_path, recurse=True)
-    bb.utils.mkdirhier(install_path)
-    bb.utils.mkdirhier(package_path)
-    bb.utils.mkdirhier(extracted_path)
-
+    if packages:
+        bb.utils.mkdirhier(d.getVar("TEST_INSTALL_TMP_DIR"))
+        bb.utils.mkdirhier(d.getVar("TEST_PACKAGED_DIR"))
+        bb.utils.mkdirhier(d.getVar("TEST_EXTRACTED_DIR"))
+        extract_packages(d, packages)
 
 testimage_main[vardepsexclude] += "BB_ORIGENV DATETIME"
 
diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
index 88d1765..88d5d13 100644
--- a/meta/lib/oeqa/core/utils/test.py
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -10,11 +10,13 @@ def getSuiteCases(suite):
         Returns individual test from a test suite.
     """
     tests = []
-    for item in suite:
-        if isinstance(item, unittest.suite.TestSuite):
+
+    if isinstance(suite, unittest.TestCase):
+        tests.append(suite)
+    elif isinstance(suite, unittest.suite.TestSuite):
+        for item in suite:
             tests.extend(getSuiteCases(item))
-        elif isinstance(item, unittest.TestCase):
-            tests.append(item)
+
     return tests
 
 def getSuiteModules(suite):
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 43f1b2f..c1485c9 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -2,7 +2,16 @@
 # Released under the MIT license (see COPYING.MIT)
 
 from oeqa.core.case import OETestCase
+from oeqa.utils.package_manager import install_package, uninstall_package
 
 class OERuntimeTestCase(OETestCase):
     # target instance set by OERuntimeTestLoader.
     target = None
+
+    def _oeSetUp(self):
+        super(OERuntimeTestCase, self)._oeSetUp()
+        install_package(self)
+
+    def _oeTearDown(self):
+        super(OERuntimeTestCase, self)._oeTearDown()
+        uninstall_package(self)
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index bc8abd0..10b8b54 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -15,12 +15,14 @@ class OERuntimeTestContext(OETestContext):
     runtime_files_dir = os.path.join(
                         os.path.dirname(os.path.abspath(__file__)), "files")
 
-    def __init__(self, td, logger, target, host_dumper, image_packages):
+    def __init__(self, td, logger, target,
+                 host_dumper, image_packages, extract_dir):
         super(OERuntimeTestContext, self).__init__(td, logger)
 
         self.target = target
         self.image_packages = image_packages
         self.host_dumper = host_dumper
+        self.extract_dir = extract_dir
         self._set_target_cmds()
 
     def _set_target_cmds(self):
@@ -45,6 +47,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
     default_host_dumper_dir = '/tmp/oe-saved-tests'
+    default_extract_dir = 'extract_dir'
 
     def register_commands(self, logger, subparsers):
         super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
@@ -72,6 +75,9 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         runtime_group.add_argument('--packages-manifest', action='store',
                 help="Package manifest of the image under test")
 
+        runtime_group.add_argument('--extract-dir', action='store',
+                help='Directory where extracted packages reside')
+
         runtime_group.add_argument('--qemu-boot', action='store',
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
 
@@ -126,4 +132,8 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 OERuntimeTestContextExecutor.readPackagesManifest(
                         args.packages_manifest)
 
+        self.tc_kwargs['init']['extract_dir'] = \
+                OERuntimeTestContextExecutor.readPackagesManifest(
+                        args.extract_dir)
+
 _executor_class = OERuntimeTestContextExecutor
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index ab0d3e5..9264648 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -1,7 +1,8 @@
-import bb
+import os
 import json
 import shutil
 
+from oeqa.core.utils.test import getCaseFile, getCaseMethod
 
 def get_package_manager(d, root_path):
     """
@@ -86,6 +87,7 @@ def extract_packages(d, needed_packages):
     Extract packages that will be needed during runtime.
     """
 
+    import bb
     import oe.path
 
     extracted_path = d.getVar('TEST_EXTRACTED_DIR')
@@ -152,20 +154,38 @@ def _copy_package(d, pkg):
     shutil.copy2(file_path, dst_dir)
     shutil.rmtree(pkg_path)
 
-def install_uninstall_packages(self, test_id, pkg_dir, install):
+def install_package(test_case):
     """
-    Check if the test requires a package and Install/Unistall it in the DUT
+    Installs package in DUT if required.
     """
+    needed_packages = test_needs_package(test_case)
+    if needed_packages:
+        _install_uninstall_packages(needed_packages, test_case, True)
 
-    test = test_id.split('.')[4]
-    module = self.getModulefromID(test_id)
-    json = self._getJsonFile(module)
-    if json:
-        needed_packages = self._getNeededPackages(json, test)
+def uninstall_package(test_case):
+    """
+    Uninstalls package in DUT if required.
+    """
+    needed_packages = test_needs_package(test_case)
+    if needed_packages:
+        _install_uninstall_packages(needed_packages, test_case, False)
+
+def test_needs_package(test_case):
+    """
+    Checks if a test case requires to install/uninstall packages.
+    """
+    test_file = getCaseFile(test_case)
+    json_file = _get_json_file(test_file)
+
+    if json_file:
+        test_method = getCaseMethod(test_case)
+        needed_packages = _get_needed_packages(json_file, test_method)
         if needed_packages:
-            self._install_uninstall_packages(needed_packages, pkg_dir, install)
+            return needed_packages
+
+    return None
 
-def _install_uninstall_packages(self, needed_packages, pkg_dir, install=True):
+def _install_uninstall_packages(needed_packages, test_case, install=True):
     """
     Install/Unistall packages in the DUT without using a package manager
     """
@@ -179,12 +199,12 @@ def _install_uninstall_packages(self, needed_packages, pkg_dir, install=True):
         pkg = package['pkg']
         rm = package.get('rm', False)
         extract = package.get('extract', True)
-        src_dir = os.path.join(pkg_dir, pkg)
+        src_dir = os.path.join(test_case.tc.extract_dir, pkg)
 
         # Install package
         if install and extract:
-            self.target.connection.copy_dir_to(src_dir, '/')
+            test_case.tc.target.copyDirTo(src_dir, '/')
 
         # Unistall package
         elif not install and rm:
-            self.target.connection.delete_dir_structure(src_dir, '/')
+            test_case.tc.target.deleteDirStructure(src_dir, '/')
-- 
2.1.4


