Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DBB4B772CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567510"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:57 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:18 -0600
Message-Id: <e14b256864777b549dc14a1d195a1906c00fac46.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 47/55] testimage.bbclass: Migrate class to use new runtime framework
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:57 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This migrates testimage class to use the new framework. Most of
the code added here is to get rid off the data store dependency.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 186 +++++++++++++++++++++++++++++++----------
 1 file changed, 144 insertions(+), 42 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 62ecaef..016c1c1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -77,6 +77,7 @@ TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'creat
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
 
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
@@ -112,6 +113,9 @@ testimage_dump_host () {
 }
 
 python do_testimage() {
+
+    testimage_sanity(d)
+
     testimage_main(d)
 }
 
@@ -120,67 +124,165 @@ do_testimage[nostamp] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
+def testimage_sanity(d):
+    if (d.getVar('TEST_TARGET') == 'simpleremote'
+        and (not d.getVar('TEST_TARGET_IP')
+             or not d.getVar('TEST_SERVER_IP'))):
+        bb.fatal('When TEST_TARGET is set to "simpleremote" '
+                 'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
+
 def testimage_main(d):
-    import unittest
     import os
-    import oeqa.runtime
-    import time
     import signal
-    from oeqa.oetest import ImageTestContext
-    from oeqa.targetcontrol import get_target_controller
-    from bb.utils import export_proxies
-    from oeqa.utils.dump import HostDumper
+    import json
+    import sys
+    import logging
+    import time
 
+    from bb.utils import export_proxies
+    from oeqa.runtime.context import OERuntimeTestContext
+    from oeqa.runtime.context import OERuntimeTestContextExecutor
+    from oeqa.core.target.qemu import supported_fstypes
+    from oeqa.utils import make_logger_bitbake_compatible
+
+    def sigterm_exception(signum, stackframe):
+        """
+        Catch SIGTERM from worker in order to stop qemu.
+        """
+        raise RuntimeError
+
+    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
     pn = d.getVar("PN")
+
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
-    test_create_extract_dirs(d)
+    #test_create_extract_dirs(d)
+
+    image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
+                             d.getVar('IMAGE_LINK_NAME')))
+
+    tdname = "%s.testdata.json" % image_name
+    td = json.load(open(tdname, "r"))
+
+    image_manifest = "%s.manifest" % image_name
+    image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
+
+    # Get machine
+    machine = d.getVar("MACHINE")
+
+    # Get rootfs
+    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
+                  if fs in supported_fstypes]
+    if not fstypes:
+        bb.fatal('Unsupported image type built. Add a comptible image to '
+                 'IMAGE_FSTYPES. Supported types: %s' %
+                 ', '.join(supported_fstypes))
+    rootfs = '%s.%s' % (image_name, fstypes[0])
+
+    # Get tmpdir (not really used, just for compatibility)
+    tmpdir = d.getVar("TMPDIR")
+
+    # Get deploy_dir_image (not really used, just for compatibility)
+    dir_image = d.getVar("DEPLOY_DIR_IMAGE")
+
+    # Get bootlog
+    bootlog = os.path.join(d.getVar("TEST_LOG_DIR"),
+                           'qemu_boot_log.%s' % d.getVar('DATETIME'))
+
+    # Get display
+    display = d.getVar("BB_ORIGENV").getVar("DISPLAY")
+
+    # Get kernel
+    kernel_name = ('%s-%s.bin' % (d.getVar("KERNEL_IMAGETYPE"), machine))
+    kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), kernel_name)
+
+    # Get boottime
+    boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
+
+    # Get use_kvm
+    qemu_use_kvm = d.getVar("QEMU_USE_KVM")
+    if qemu_use_kvm and qemu_use_kvm == 'True' and 'x86' in machine:
+        kvm = True
+    else:
+        kvm = False
+
+    # TODO: We use the current implementatin of qemu runner because of
+    # time constrains, qemu runner really needs a refactor too.
+    target_kwargs = { 'machine'     : machine,
+                      'rootfs'      : rootfs,
+                      'tmpdir'      : tmpdir,
+                      'dir_image'   : dir_image,
+                      'display'     : display,
+                      'kernel'      : kernel,
+                      'boottime'    : boottime,
+                      'bootlog'     : bootlog,
+                      'kvm'         : kvm,
+                    }
 
     # runtime use network for download projects for build
     export_proxies(d)
 
     # we need the host dumper in test context
-    host_dumper = HostDumper(d.getVar("testimage_dump_host", True),
-        d.getVar("TESTIMAGE_DUMP_DIR", True))
+    host_dumper = OERuntimeTestContextExecutor.getHostDumper(
+        d.getVar("testimage_dump_host"),
+        d.getVar("TESTIMAGE_DUMP_DIR"))
 
     # the robot dance
-    target = get_target_controller(d)
+    target = OERuntimeTestContextExecutor.getTarget(
+        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
+        d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
-    tc = ImageTestContext(d, target, host_dumper)
+    tc = OERuntimeTestContext(td, logger, target, host_dumper, image_packages)
 
-    # this is a dummy load of tests
-    # we are doing that to find compile errors in the tests themselves
-    # before booting the image
-    try:
-        tc.loadTests()
-    except Exception as e:
-        import traceback
-        bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+    # Load tests before starting the target
+    test_paths = get_runtime_paths(d)
+    test_modules = d.getVar('TEST_SUITES')
+    tc.loadTests(test_paths, modules=test_modules)
+
+    bootparams = None
+    if d.getVar('VIRTUAL-RUNTIME_init_manager', '') == 'systemd':
+        bootparams = 'systemd.log_level=debug systemd.log_target=console'
 
-    tc.extract_packages()
-    target.deploy()
+    results = None
+    orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     try:
-        bootparams = None
-        if d.getVar('VIRTUAL-RUNTIME_init_manager', '') == 'systemd':
-            bootparams = 'systemd.log_level=debug systemd.log_target=console'
-        target.start(extra_bootparams=bootparams)
-        starttime = time.time()
-        result = tc.runTests()
-        stoptime = time.time()
-        if result.wasSuccessful():
-            bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-            msg = "%s - OK - All required tests passed" % pn
-            skipped = len(result.skipped)
-            if skipped:
-                msg += " (skipped=%d)" % skipped
-            bb.plain(msg)
+        # We need to check if runqemu ends unexpectedly
+        # or if the worker send us a SIGTERM
+        tc.target.start(extra_bootparams=bootparams)
+        results = tc.runTests()
+    except (RuntimeError, BlockingIOError) as err:
+        if isinstance(err, RuntimeError):
+            bb.error('testimage received SIGTERM, shutting down...')
         else:
-            bb.fatal("%s - FAILED - check the task log and the ssh log" % pn)
-    except BlockingIOError as err:
-        bb.error('runqemu failed, shutting down...')
+            bb.error('runqemu failed, shutting down...')
+        if results:
+            results.stop()
+            results = None
     finally:
-        signal.signal(signal.SIGTERM, tc.origsigtermhandler)
-        target.stop()
+        signal.signal(signal.SIGTERM, orig_sigterm_handler)
+        tc.target.stop()
+
+    # Show results (if we have them)
+    if not results:
+        bb.fatal('%s - FAILED - tests were interrupted during execution' % pn)
+    tc.logSummary(results, pn)
+    tc.logDetails()
+    if not results.wasSuccessful():
+        bb.fatal('%s - FAILED - check the task log and the ssh log' % pn)
+
+def get_runtime_paths(d):
+    """
+    Returns a list of paths where runtime test must reside.
+
+    Runtime tests are expected in <LAYER_DIR>/lib/oeqa/runtime/cases/
+    """
+    paths = []
+
+    for layer in d.getVar('BBLAYERS').split():
+        path = os.path.join(layer, 'lib/oeqa/runtime/cases')
+        if os.path.isdir(path):
+            paths.append(path)
+    return paths
 
 def test_create_extract_dirs(d):
     install_path = d.getVar("TEST_INSTALL_TMP_DIR")
@@ -193,6 +295,6 @@ def test_create_extract_dirs(d):
     bb.utils.mkdirhier(extracted_path)
 
 
-testimage_main[vardepsexclude] =+ "BB_ORIGENV"
+testimage_main[vardepsexclude] += "BB_ORIGENV DATETIME"
 
 inherit testsdk
-- 
2.1.4


