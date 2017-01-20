Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A99AE772C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2017 09:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567532"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:59 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:22 -0600
Message-Id: <3839eb25b0aff37ded0ff00258807e881c5c5a8d.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 51/55] testimage.bbclass: Add support for package extraction
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

testimage support the installation of packages without a package
manager in the target. This adds support for package extraction
required to support the installation feature.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass         |  12 +++
 meta/lib/oeqa/utils/package_manager.py | 161 +++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index abcecca..1dfbc49 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -243,6 +243,8 @@ def testimage_main(d):
     test_modules = d.getVar('TEST_SUITES')
     tc.loadTests(test_paths, modules=test_modules)
 
+    package_extraction(d, tc.suites)
+
     bootparams = None
     if d.getVar('VIRTUAL-RUNTIME_init_manager', '') == 'systemd':
         bootparams = 'systemd.log_level=debug systemd.log_target=console'
@@ -337,12 +339,22 @@ def create_rpm_index(d):
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
 
+def package_extraction(d, test_suites):
+    from oeqa.utils.package_manager import find_packages_to_extract
+    from oeqa.utils.package_manager import extract_packages
+
+    test_create_extract_dirs(d)
+    packages = find_packages_to_extract(test_suites)
+    extract_packages(d, packages)
+
 def test_create_extract_dirs(d):
     install_path = d.getVar("TEST_INSTALL_TMP_DIR")
     package_path = d.getVar("TEST_PACKAGED_DIR")
     extracted_path = d.getVar("TEST_EXTRACTED_DIR")
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
+    bb.utils.remove(install_path, recurse=True)
     bb.utils.remove(package_path, recurse=True)
+    bb.utils.remove(extracted_path, recurse=True)
     bb.utils.mkdirhier(install_path)
     bb.utils.mkdirhier(package_path)
     bb.utils.mkdirhier(extracted_path)
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 0f6bdbc..ab0d3e5 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -1,3 +1,8 @@
+import bb
+import json
+import shutil
+
+
 def get_package_manager(d, root_path):
     """
     Returns an OE package manager that can install packages in root_path.
@@ -27,3 +32,159 @@ def get_package_manager(d, root_path):
     pm.update()
 
     return pm
+
+def find_packages_to_extract(test_suite):
+    """
+    Returns packages to extract required by runtime tests.
+    """
+    from oeqa.core.utils.test import getSuiteCasesFiles
+
+    needed_packages = {}
+    files = getSuiteCasesFiles(test_suite)
+
+    for f in set(files):
+        json_file = _get_json_file(f)
+        if json_file:
+            needed_packages.update(_get_needed_packages(json_file))
+
+    return needed_packages
+
+def _get_json_file(module_path):
+    """
+    Returns the path of the JSON file for a module, empty if doesn't exitst.
+    """
+
+    json_file = '%s.json' % module_path.rsplit('.', 1)[0]
+    if os.path.isfile(module_path) and os.path.isfile(json_file):
+        return json_file
+    else:
+        return ''
+
+def _get_needed_packages(json_file, test=None):
+    """
+    Returns a dict with needed packages based on a JSON file.
+
+    If a test is specified it will return the dict just for that test.
+    """
+    needed_packages = {}
+
+    with open(json_file) as f:
+        test_packages = json.load(f)
+    for key,value in test_packages.items():
+        needed_packages[key] = value
+
+    if test:
+        if test in needed_packages:
+            needed_packages = needed_packages[test]
+        else:
+            needed_packages = {}
+
+    return needed_packages
+
+def extract_packages(d, needed_packages):
+    """
+    Extract packages that will be needed during runtime.
+    """
+
+    import oe.path
+
+    extracted_path = d.getVar('TEST_EXTRACTED_DIR')
+
+    for key,value in needed_packages.items():
+        packages = ()
+        if isinstance(value, dict):
+            packages = (value, )
+        elif isinstance(value, list):
+            packages = value
+        else:
+            bb.fatal('Failed to process needed packages for %s; '
+                     'Value must be a dict or list' % key)
+
+        for package in packages:
+            pkg = package['pkg']
+            rm = package.get('rm', False)
+            extract = package.get('extract', True)
+
+            if extract:
+                #logger.debug(1, 'Extracting %s' % pkg)
+                dst_dir = os.path.join(extracted_path, pkg)
+                # Same package used for more than one test,
+                # don't need to extract again.
+                if os.path.exists(dst_dir):
+                    continue
+
+                # Extract package and copy it to TEST_EXTRACTED_DIR
+                pkg_dir = _extract_in_tmpdir(d, pkg)
+                oe.path.copytree(pkg_dir, dst_dir)
+                shutil.rmtree(pkg_dir)
+
+            else:
+                #logger.debug(1, 'Copying %s' % pkg)
+                _copy_package(d, pkg)
+
+def _extract_in_tmpdir(d, pkg):
+    """"
+    Returns path to a temp directory where the package was
+    extracted without dependencies.
+    """
+
+    from oeqa.utils.package_manager import get_package_manager
+
+    pkg_path = os.path.join(d.getVar('TEST_INSTALL_TMP_DIR'), pkg)
+    pm = get_package_manager(d, pkg_path)
+    extract_dir = pm.extract(pkg)
+    shutil.rmtree(pkg_path)
+
+    return extract_dir
+
+def _copy_package(d, pkg):
+    """
+    Copy the RPM, DEB or IPK package to dst_dir
+    """
+
+    from oeqa.utils.package_manager import get_package_manager
+
+    pkg_path = os.path.join(d.getVar('TEST_INSTALL_TMP_DIR'), pkg)
+    dst_dir = d.getVar('TEST_PACKAGED_DIR')
+    pm = get_package_manager(d, pkg_path)
+    pkg_info = pm.package_info(pkg)
+    file_path = pkg_info[pkg]['filepath']
+    shutil.copy2(file_path, dst_dir)
+    shutil.rmtree(pkg_path)
+
+def install_uninstall_packages(self, test_id, pkg_dir, install):
+    """
+    Check if the test requires a package and Install/Unistall it in the DUT
+    """
+
+    test = test_id.split('.')[4]
+    module = self.getModulefromID(test_id)
+    json = self._getJsonFile(module)
+    if json:
+        needed_packages = self._getNeededPackages(json, test)
+        if needed_packages:
+            self._install_uninstall_packages(needed_packages, pkg_dir, install)
+
+def _install_uninstall_packages(self, needed_packages, pkg_dir, install=True):
+    """
+    Install/Unistall packages in the DUT without using a package manager
+    """
+
+    if isinstance(needed_packages, dict):
+        packages = [needed_packages]
+    elif isinstance(needed_packages, list):
+        packages = needed_packages
+
+    for package in packages:
+        pkg = package['pkg']
+        rm = package.get('rm', False)
+        extract = package.get('extract', True)
+        src_dir = os.path.join(pkg_dir, pkg)
+
+        # Install package
+        if install and extract:
+            self.target.connection.copy_dir_to(src_dir, '/')
+
+        # Unistall package
+        elif not install and rm:
+            self.target.connection.delete_dir_structure(src_dir, '/')
-- 
2.1.4


