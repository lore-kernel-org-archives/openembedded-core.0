Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CAA49731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:08:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2017 09:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567551"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:08:01 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:25 -0600
Message-Id: <2612158e6630378dca651f49dae0c49d244cc7d5.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 54/55] testexport.bbclass: Migrate testexport to use new framework
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
X-List-Received-Date: Fri, 20 Jan 2017 17:08:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This migrates current testexport implmentation to use the
new OEQA framework.

[YOCTO #10686]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 215 +++++++++++++++++-----------------------
 scripts/oe-test                 |  10 +-
 2 files changed, 99 insertions(+), 126 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 5398b3c..56edda9 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -33,113 +33,111 @@ TEST_EXPORT_DEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-nativ
 TEST_EXPORT_DEPENDS += "${@bb.utils.contains('TEST_EXPORT_SDK_ENABLED', '1', 'testexport-tarball:do_populate_sdk', '', d)}"
 TEST_EXPORT_LOCK = "${TMPDIR}/testimage.lock"
 
-python do_testexport() {
-    testexport_main(d)
-}
-
 addtask testexport
 do_testexport[nostamp] = "1"
 do_testexport[depends] += "${TEST_EXPORT_DEPENDS} ${TESTIMAGEDEPENDS}"
 do_testexport[lockfiles] += "${TEST_EXPORT_LOCK}"
 
-def exportTests(d,tc):
+python do_testexport() {
+    testexport_main(d)
+}
+
+def testexport_main(d):
     import json
+    import logging
+
+    from oeqa.runtime.context import OERuntimeTestContext
+    from oeqa.runtime.context import OERuntimeTestContextExecutor
+
+    image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
+                             d.getVar('IMAGE_LINK_NAME')))
+
+    tdname = "%s.testdata.json" % image_name
+    td = json.load(open(tdname, "r"))
+
+    logger = logging.getLogger("BitBake")
+
+    target = OERuntimeTestContextExecutor.getTarget(
+        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
+        d.getVar("TEST_SERVER_IP"))
+
+    host_dumper = OERuntimeTestContextExecutor.getHostDumper(
+        d.getVar("testimage_dump_host"), d.getVar("TESTIMAGE_DUMP_DIR"))
+
+    image_manifest = "%s.manifest" % image_name
+    image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
+
+    extract_dir = d.getVar("TEST_EXTRACTED_DIR")
+
+    tc = OERuntimeTestContext(td, logger, target, host_dumper,
+                              image_packages, extract_dir)
+
+    copy_needed_files(d, tc)
+
+def copy_needed_files(d, tc):
     import shutil
-    import pkgutil
-    import re
     import oe.path
 
-    exportpath = d.getVar("TEST_EXPORT_DIR")
-
-    savedata = {}
-    savedata["d"] = {}
-    savedata["target"] = {}
-    savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP")
-    savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP")
-
-    keys = [ key for key in d.keys() if not key.startswith("_") and not key.startswith("BB") \
-            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func")]
-    for key in keys:
-        try:
-            savedata["d"][key] = d.getVar(key)
-        except bb.data_smart.ExpansionError:
-            # we don't care about those anyway
-            pass
-
-    json_file = os.path.join(exportpath, "testdata.json")
-    with open(json_file, "w") as f:
-            json.dump(savedata, f, skipkeys=True, indent=4, sort_keys=True)
-
-    # Replace absolute path with relative in the file
-    exclude_path = os.path.join(d.getVar("COREBASE"),'meta','lib','oeqa')
-    f1 = open(json_file,'r').read()
-    f2 = open(json_file,'w')
-    m = f1.replace(exclude_path,'oeqa')
-    f2.write(m)
-    f2.close()
-
-    # now start copying files
-    # we'll basically copy everything under meta/lib/oeqa, with these exceptions
-    #  - oeqa/targetcontrol.py - not needed
-    #  - oeqa/selftest - something else
-    # That means:
-    #   - all tests from oeqa/runtime defined in TEST_SUITES (including from other layers)
-    #   - the contents of oeqa/utils and oeqa/runtime/files
-    #   - oeqa/oetest.py and oeqa/runexport.py (this will get copied to exportpath not exportpath/oeqa)
-    #   - __init__.py files
-    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/files"))
-    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
-    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
-    # copy test modules, this should cover tests in other layers too
-    bbpath = d.getVar("BBPATH").split(':')
-    for t in tc.testslist:
-        isfolder = False
-        if re.search("\w+\.\w+\.test_\S+", t):
-            t = '.'.join(t.split('.')[:3])
-        mod = pkgutil.get_loader(t)
-        # More depth than usual?
-        if (t.count('.') > 2):
-            for p in bbpath:
-                foldername = os.path.join(p, 'lib',  os.sep.join(t.split('.')).rsplit(os.sep, 1)[0])
-                if os.path.isdir(foldername):
-                    isfolder = True
-                    target_folder = os.path.join(exportpath, "oeqa", "runtime", os.path.basename(foldername))
-                    if not os.path.exists(target_folder):
-                        oe.path.copytree(foldername, target_folder)
-        if not isfolder:
-            shutil.copy2(mod.path, os.path.join(exportpath, "oeqa/runtime"))
-            json_file = "%s.json" % mod.path.rsplit(".", 1)[0]
-            if os.path.isfile(json_file):
-                shutil.copy2(json_file, os.path.join(exportpath, "oeqa/runtime"))
-    # Get meta layer
-    for layer in d.getVar("BBLAYERS").split():
-        if os.path.basename(layer) == "meta":
-            meta_layer = layer
-            break
-    # copy oeqa/oetest.py and oeqa/runexported.py
-    oeqadir = os.path.join(meta_layer, "lib/oeqa")
-    shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(exportpath, "oeqa"))
-    shutil.copy2(os.path.join(oeqadir, "runexported.py"), exportpath)
-    # copy oeqa/utils/*.py
-    for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
-        for f in files:
-            if f.endswith(".py"):
-                shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/utils"))
-    # copy oeqa/files/*
-    for root, dirs, files in os.walk(os.path.join(oeqadir, "files")):
-        for f in files:
-            shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/files"))
-    # copy oeqa/runtime/files/*
-    for root, dirs, files in os.walk(os.path.join(oeqadir, "runtime/files")):
-        for f in files:
-            shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
+    from oeqa.utils.package_manager import _get_json_file
+    from oeqa.core.utils.test import getSuiteCasesFiles
+
+    export_path = d.getVar('TEST_EXPORT_DIR')
+    corebase_path = d.getVar('COREBASE')
+
+    # Clean everything before starting
+    oe.path.remove(export_path)
+    bb.utils.mkdirhier(os.path.join(export_path, 'lib', 'oeqa'))
+
+    # The source of files to copy are relative to 'COREBASE' directory
+    # The destination is relative to 'TEST_EXPORT_DIR'
+    # Because we are squashing the libraries, we need to remove
+    # the layer/script directory
+    files_to_copy = [ os.path.join('meta', 'lib', 'oeqa', 'core'),
+                      os.path.join('meta', 'lib', 'oeqa', 'runtime'),
+                      os.path.join('meta', 'lib', 'oeqa', 'files'),
+                      os.path.join('meta', 'lib', 'oeqa', 'utils'),
+                      os.path.join('scripts', 'oe-test'),
+                      os.path.join('scripts', 'lib', 'argparse_oe.py'),
+                      os.path.join('scripts', 'lib', 'scriptutils.py'), ]
+
+    for f in files_to_copy:
+        src = os.path.join(corebase_path, f)
+        dst = os.path.join(export_path, f.split('/', 1)[-1])
+        if os.path.isdir(src):
+            oe.path.copytree(src, dst)
+        else:
+            shutil.copy2(src, dst)
+
+    # Remove cases and just copy the ones specified
+    cases_path = os.path.join(export_path, 'lib', 'oeqa', 'runtime', 'cases')
+    oe.path.remove(cases_path)
+    bb.utils.mkdirhier(cases_path)
+    test_paths = get_runtime_paths(d)
+    test_modules = d.getVar('TEST_SUITES')
+    tc.loadTests(test_paths, modules=test_modules)
+    for f in getSuiteCasesFiles(tc.suites):
+        shutil.copy2(f, cases_path)
+        json_file = _get_json_file(f)
+        if json_file:
+            shutil.copy2(json_file, cases_path)
+
+    # Copy test data
+    image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
+                            d.getVar('IMAGE_LINK_NAME')))
+    image_manifest = "%s.manifest" % image_name
+    tdname = "%s.testdata.json" % image_name
+    test_data_path = os.path.join(export_path, 'data')
+    bb.utils.mkdirhier(test_data_path)
+    shutil.copy2(image_manifest, os.path.join(test_data_path, 'manifest'))
+    shutil.copy2(tdname, os.path.join(test_data_path, 'testdata.json'))
 
     # Create tar file for common parts of testexport
     create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
 
     # Copy packages needed for runtime testing
+    package_extraction(d, tc.suites)
     test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR")
-    if os.listdir(test_pkg_dir):
+    if os.path.isdir(test_pkg_dir) and os.listdir(test_pkg_dir):
         export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "packages")
         oe.path.copytree(test_pkg_dir, export_pkg_dir)
         # Create tar file for packages needed by the DUT
@@ -158,35 +156,7 @@ def exportTests(d,tc):
         # Create tar file for the sdk
         create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH"), export_sdk_dir)
 
-    bb.plain("Exported tests to: %s" % exportpath)
-
-def testexport_main(d):
-    from oeqa.oetest import ExportTestContext
-    from oeqa.targetcontrol import get_target_controller
-
-    test_create_extract_dirs(d)
-    export_dir = d.getVar("TEST_EXPORT_DIR")
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
-    bb.utils.remove(export_dir, recurse=True)
-    bb.utils.mkdirhier(export_dir)
-
-    # the robot dance
-    target = get_target_controller(d)
-
-    # test context
-    tc = ExportTestContext(d, target)
-
-    # this is a dummy load of tests
-    # we are doing that to find compile errors in the tests themselves
-    # before booting the image
-    try:
-        tc.loadTests()
-    except Exception as e:
-        import traceback
-        bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-
-    tc.extract_packages()
-    exportTests(d,tc)
+    bb.plain("Exported tests to: %s" % export_path)
 
 def create_tarball(d, tar_name, src_dir):
 
@@ -204,7 +174,4 @@ def create_tarball(d, tar_name, src_dir):
     tar.close()
     os.chdir(current_dir)
 
-
-testexport_main[vardepsexclude] =+ "BB_ORIGENV"
-
 inherit testimage
diff --git a/scripts/oe-test b/scripts/oe-test
index 5731dff..a1d282d 100755
--- a/scripts/oe-test
+++ b/scripts/oe-test
@@ -16,8 +16,14 @@ lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 import argparse_oe
 import scriptutils
-import scriptpath
-scriptpath.add_oe_lib_path()
+
+# oe-test is used for testexport and it doesn't have oe lib
+# so we just skip adding these libraries (not used in testexport)
+try:
+    import scriptpath
+    scriptpath.add_oe_lib_path()
+except ImportError:
+    pass
 
 from oeqa.core.context import OETestContextExecutor
 
-- 
2.1.4


