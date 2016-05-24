Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 33EAB60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326971"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:09 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:17 +0000
Message-Id: <12fd3b74af160880520cb43cd72c2f133fdcfecf.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 08/10] oetest.py: Add install/uninstall functionality for DUTs
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
X-List-Received-Date: Tue, 24 May 2016 20:49:08 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Add the functionality to install/unistall packages in the
DUTs without the use of the package manager. This is possible
with the extraction introduced in the previous commits.

testimage and testexport bbclasses has been modified in order
to support this new feature.

[YOCTO #8694]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 29 +++++++++++++---
 meta/classes/testimage.bbclass  | 45 ++++++++++++++++++++++++-
 meta/lib/oeqa/oetest.py         | 74 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index e06c668..21a2bf7 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -16,6 +16,9 @@
 
 TEST_LOG_DIR ?= "${WORKDIR}/testexport"
 TEST_EXPORT_DIR ?= "${TMPDIR}/testexport/${PN}"
+TEST_EXPORT_PACKAGED_DIR ?= "packages/packaged"
+TEST_EXPORT_EXTRACTED_DIR ?= "packages/extracted"
+
 TEST_TARGET ?= "simpleremote"
 TEST_TARGET_IP ?= ""
 TEST_SERVER_IP ?= ""
@@ -27,9 +30,9 @@ python do_testexport() {
     testexport_main(d)
 }
 
-addtask testexport
+addtask testexport after do_test_extract_packages
 do_testimage[nostamp] = "1"
-do_testimage[depends] += "${TEST_EXPORT_DEPENDS}"
+do_testimage[depends] += "${TEST_EXPORT_DEPENDS} ${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TEST_EXPORT_LOCK}"
 
 def exportTests(d,tc):
@@ -96,6 +99,10 @@ def exportTests(d,tc):
                         shutil.copytree(foldername, target_folder)
         if not isfolder:
             shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
+            json_file = "%s.json" % mod.filename.rsplit(".", 1)[0]
+            if os.path.isfile(json_file):
+                shutil.copy2(json_file, os.path.join(exportpath, "oeqa/runtime"))
+
     # copy __init__.py files
     oeqadir = pkgutil.get_loader("oeqa").filename
     shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(exportpath, "oeqa"))
@@ -113,6 +120,19 @@ def exportTests(d,tc):
         for f in files:
             shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
 
+    # Copy packages needed for runtime testing
+    export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR", True), "packages")
+    test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR", True)
+    for root, subdirs, files in os.walk(test_pkg_dir):
+        for subdir in subdirs:
+            tmp_dir = os.path.join(root.replace(test_pkg_dir, "").lstrip("/"), subdir)
+            new_dir = os.path.join(export_pkg_dir, tmp_dir)
+            bb.utils.mkdirhier(new_dir)
+
+        for f in files:
+            src_f = os.path.join(root, f)
+            dst_f = os.path.join(export_pkg_dir, root.replace(test_pkg_dir, "").lstrip("/"), f)
+            shutil.copy2(src_f, dst_f)
     bb.plain("Exported tests to: %s" % exportpath)
 
 def testexport_main(d):
@@ -120,9 +140,10 @@ def testexport_main(d):
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
 
+    export_dir = d.getVar("TEST_EXPORT_DIR", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
-    bb.utils.remove(d.getVar("TEST_EXPORT_DIR", True), recurse=True)
-    bb.utils.mkdirhier(d.getVar("TEST_EXPORT_DIR", True))
+    bb.utils.remove(export_dir, recurse=True)
+    bb.utils.mkdirhier(export_dir)
 
     # the robot dance
     target = get_target_controller(d)
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a2e13df..436dec4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -30,6 +30,10 @@
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 TEST_EXPORT_DIR ?= "${TMPDIR}/testimage/${PN}"
+TEST_INSTALL_TMP_DIR ?= "${WORKDIR}/testimage/install_tmp"
+TEST_NEEDED_PACKAGES_DIR ?= "${WORKDIR}/testimage/packages"
+TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
+TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 
 RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
 MINTESTSUITE = "ping"
@@ -100,7 +104,16 @@ testimage_dump_host () {
 python do_testimage() {
     testimage_main(d)
 }
-addtask testimage
+
+python do_test_extract_packages() {
+    test_extract_packages(d)
+}
+
+addtask test_extract_packages
+do_test_extract_packages[nostamp] = "1"
+do_test_extract_packages[depends] += "${TESTIMAGEDEPENDS}"
+
+addtask testimage after do_test_extract_packages
 do_testimage[nostamp] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
@@ -155,6 +168,36 @@ def testimage_main(d):
         signal.signal(signal.SIGTERM, tc.origsigtermhandler)
         target.stop()
 
+def test_extract_packages(d):
+    from oeqa.oetest import ExportTestContext
+    from oeqa.targetcontrol import get_target_controller
+
+    install_path = d.getVar("TEST_INSTALL_TMP_DIR", True)
+    package_path = d.getVar("TEST_PACKAGED_DIR", True)
+    extracted_path = d.getVar("TEST_EXTRACTED_DIR", True)
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    bb.utils.remove(package_path, recurse=True)
+    bb.utils.mkdirhier(install_path)
+    bb.utils.mkdirhier(package_path)
+    bb.utils.mkdirhier(extracted_path)
+
+    # the robot dance
+    target = get_target_controller(d)
+
+    # test context
+    tc = ExportTestContext(d, target)
+
+    # this is a dummy load of tests we are doing this for later
+    # extraction of packages, before booting/exporting the tests
+    try:
+        tc.loadTests()
+    except Exception as e:
+        import traceback
+        bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+    tc.extract_packages()
+
+
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
 
 inherit testsdk
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a50f9d8..dfac09b 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -80,6 +80,9 @@ class oeRuntimeTest(oeTest):
         super(oeRuntimeTest, self).__init__(methodName)
 
     def setUp(self):
+        # Install packages in the DUT
+        self.tc.install_uninstall_packages(self.id())
+
         # Check if test needs to run
         if self.tc.sigterm:
             self.fail("Got SIGTERM")
@@ -93,6 +96,9 @@ class oeRuntimeTest(oeTest):
         pass
 
     def tearDown(self):
+        # Unistall packages in the DUT
+        self.tc.install_uninstall_packages(self.id(), False)
+
         res = getResults()
         # If a test fails or there is an exception dump
         # for QemuTarget only
@@ -281,6 +287,19 @@ class TestContext(object):
 
         return modules
 
+    def getModulefromID(self, test_id):
+        """
+        Returns the test module based on a test id.
+        """
+
+        module_name = ".".join(test_id.split(".")[:3])
+        modules = self.getTestModules()
+        for module in modules:
+            if module.fullname == module_name:
+                return module
+
+        return None
+
     def getTests(self, test):
         '''Return all individual tests executed when running the suite.'''
         # Unfortunately unittest does not have an API for this, so we have
@@ -514,6 +533,43 @@ class RuntimeTestContext(TestContext):
         shutil.copy2(file_path, dst_dir)
         shutil.rmtree(pkg_path)
 
+    def install_uninstall_packages(self, test_id, pkg_dir, install):
+        """
+        Check if the test requires a package and Install/Unistall it in the DUT
+        """
+
+        test = test_id.split(".")[4]
+        module = self.getModulefromID(test_id)
+        json = self._getJsonFile(module)
+        if json:
+            needed_packages = self._getNeededPackages(json, test)
+            if needed_packages:
+                self._install_uninstall_packages(needed_packages, pkg_dir, install)
+
+    def _install_uninstall_packages(self, needed_packages, pkg_dir, install=True):
+        """
+        Install/Unistall packages in the DUT without using a package manager
+        """
+
+        if isinstance(needed_packages, dict):
+            packages = [needed_packages]
+        elif isinstance(needed_packages, list):
+            packages = needed_packages
+
+        for package in packages:
+            pkg = package["pkg"]
+            rm = package.get("rm", False)
+            extract = package.get("extract", True)
+            src_dir = os.path.join(pkg_dir, pkg)
+
+            # Install package
+            if install and extract:
+                self.target.connection.copy_dir_to(src_dir, "/")
+
+            # Unistall package
+            elif not install and rm:
+                self.target.connection.delete_dir_structure(src_dir, "/")
+
 class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
@@ -529,11 +585,29 @@ class ImageTestContext(RuntimeTestContext):
         self.sigterm = True
         self.target.stop()
 
+    def install_uninstall_packages(self, test_id, install=True):
+        """
+        Check if the test requires a package and Install/Unistall it in the DUT
+        """
+
+        pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR", True)
+        super(ImageTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
+
 class ExportTestContext(RuntimeTestContext):
     def __init__(self, d, target, exported=False):
         super(ExportTestContext, self).__init__(d, target, exported)
         self.sigterm = None
 
+    def install_uninstall_packages(self, test_id, install=True):
+        """
+        Check if the test requires a package and Install/Unistall it in the DUT
+        """
+
+        export_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
+        extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR", True)
+        pkg_dir = os.path.join(export_dir, extracted_dir)
+        super(ExportTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
+
 class SDKTestContext(TestContext):
     def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
         super(SDKTestContext, self).__init__(d)
-- 
2.6.6


