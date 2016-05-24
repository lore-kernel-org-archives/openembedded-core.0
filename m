Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3E34670179
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326953"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:06 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:14 +0000
Message-Id: <0f84ea6bf33a054cc23458fedb89eeac32722b68.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 05/10] oetest.py: Add extract_packages() to RuntimeTestContext class
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
X-List-Received-Date: Tue, 24 May 2016 20:49:05 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new method extracts the content of package (RPM, DEB, or IPK)
to a directory inside of WORKDIR. The extraction is needed for later
install in the DUTs without using a package manager.

[YOCTO #8694]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 70 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 7abd850..8dd494a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -12,6 +12,7 @@ import unittest
 import inspect
 import subprocess
 import signal
+import shutil
 try:
     import bb
 except ImportError:
@@ -264,6 +265,22 @@ class TestContext(object):
 
         return testslist
 
+    def getTestModules(self):
+        """
+        Returns all the test modules in the testlist.
+        """
+
+        import pkgutil
+
+        modules = []
+        for test in self.testslist:
+            if re.search("\w+\.\w+\.test_\S+", test):
+                test = '.'.join(t.split('.')[:3])
+            module = pkgutil.get_loader(test)
+            modules.append(module)
+
+        return modules
+
     def getTests(self, test):
         '''Return all individual tests executed when running the suite.'''
         # Unfortunately unittest does not have an API for this, so we have
@@ -385,6 +402,44 @@ class RuntimeTestContext(TestContext):
         if oeTest.hasPackage("procps"):
             oeRuntimeTest.pscmd = "ps -ef"
 
+    def extract_packages(self):
+        """
+        Find and extract packages that will be needed during runtime.
+        """
+
+        needed_packages = {}
+        extracted_path = self.d.getVar("TEST_EXTRACTED_DIR", True)
+        modules = self.getTestModules()
+        bbpaths = self.d.getVar("BBPATH", True).split(":")
+
+        for module in modules:
+            json_file = self._getJsonFile(module)
+            if json_file:
+                needed_packages = self._getNeededPackages(json_file)
+
+        for key,value in needed_packages.items():
+            packages = ()
+            if isinstance(value, dict):
+                packages = (value, )
+            elif isinstance(value, list):
+                packages = value
+            else:
+                bb.fatal("Failed to process needed packages for %s; "
+                         "Value must be a dict or list" % key)
+
+            for package in packages:
+                pkg = package["pkg"]
+                rm = package.get("rm", False)
+                extract = package.get("extract", True)
+                if extract:
+                    dst_dir = os.path.join(extracted_path, pkg)
+
+                # Extract package and copy it to TEST_EXTRACTED_DIR
+                if extract and not os.path.exists(dst_dir):
+                    pkg_dir = self._extract_in_tmpdir(pkg)
+                    shutil.copytree(pkg_dir, dst_dir)
+                    shutil.rmtree(pkg_dir)
+
     def _getJsonFile(self, module):
         """
         Returns the path of the JSON file for a module, empty if doesn't exitst.
@@ -422,6 +477,21 @@ class RuntimeTestContext(TestContext):
 
         return needed_packages
 
+    def _extract_in_tmpdir(self, pkg):
+        """"
+        Returns path to a temp directory where the package was
+        extracted without dependencies.
+        """
+
+        from oeqa.utils.package_manager import get_package_manager
+
+        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR", True), pkg)
+        pm = get_package_manager(self.d, pkg_path)
+        extract_dir = pm.extract(pkg)
+        shutil.rmtree(pkg_path)
+
+        return extract_dir
+
 class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
-- 
2.6.6


