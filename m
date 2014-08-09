Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 452C870A51
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:54:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2014 01:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,831,1400050800"; d="scan'208";a="574133171"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2014 01:53:55 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 29C416A4007;
	Sat,  9 Aug 2014 01:53:16 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 13:59:06 +0300
Message-Id: <1407581949-12085-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 1/4] meta/classes/testimage.bbclass: add testsdk task and enable functionality for it.
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
X-List-Received-Date: Sat, 09 Aug 2014 08:54:00 -0000

- add new testsdk task for meta-toolchain testing.
- enable the get_tests_list method to work with sdk tests.
- add default TEST_SUITES value for meta-toolchain package

NOTE: Original patch made by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/classes/testimage.bbclass | 97 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 285c6a9..97d0380 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -19,7 +19,7 @@
 # Note that order in TEST_SUITES is important (it's the order tests run) and it influences tests dependencies.
 # A layer can add its own tests in lib/oeqa/runtime, provided it extends BBPATH as normal in its layer.conf.
 
-# TEST_LOG_DIR contains a ssh log (what command is running, output and return codes) and a qemu boot log till login
+# TEST_LOG_DIR contains a command ssh log and may contain infromation about what command is running, output and return codes and for qemu a boot log till login.
 # Booting is handled by this class, and it's not a test in itself.
 # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
 
@@ -32,6 +32,7 @@ DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python"
 DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python"
+DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
@@ -53,8 +54,15 @@ do_testimage[nostamp] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
+python do_testsdk() {
+    testsdk_main(d)
+}
+addtask testsdk
+do_testsdk[nostamp] = "1"
+do_testsdk[depends] += "${TESTIMAGEDEPENDS}"
+do_testsdk[lockfiles] += "${TESTIMAGELOCK}"
 
-def get_tests_list(d):
+def get_tests_list(d, type="runtime"):
     testsuites = d.getVar("TEST_SUITES", True).split()
     bbpath = d.getVar("BBPATH", True).split(':')
 
@@ -65,12 +73,12 @@ def get_tests_list(d):
         if testname != "auto":
             found = False
             for p in bbpath:
-                if os.path.exists(os.path.join(p, 'lib', 'oeqa', 'runtime', testname + '.py')):
-                    testslist.append("oeqa.runtime." + testname)
+                if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
+                    testslist.append("oeqa." + type + "." + testname)
                     found = True
                     break
             if not found:
-                bb.error('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
+                bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
 
     if "auto" in testsuites:
         def add_auto_list(path):
@@ -78,12 +86,12 @@ def get_tests_list(d):
                 bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
             files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
             for f in files:
-                module = 'oeqa.runtime.' + f[:-3]
+                module = 'oeqa.' + type + '.' + f[:-3]
                 if module not in testslist:
                     testslist.append(module)
 
         for p in bbpath:
-            testpath = os.path.join(p, 'lib', 'oeqa', 'runtime')
+            testpath = os.path.join(p, 'lib', 'oeqa', type)
             bb.debug(2, 'Searching for tests in %s' % testpath)
             if os.path.exists(testpath):
                 add_auto_list(testpath)
@@ -230,3 +238,78 @@ def testimage_main(d):
         target.stop()
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
+
+
+def testsdk_main(d):
+    import unittest
+    import os
+    import glob
+    import oeqa.runtime
+    import oeqa.sdk
+    import time
+    import subprocess
+    from oeqa.oetest import loadTests, runTests
+
+    pn = d.getVar("PN", True)
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+
+    # tests in TEST_SUITES become required tests
+    # they won't be skipped even if they aren't suitable.
+    # testslist is what we'll actually pass to the unittest loader
+    testslist = get_tests_list(d, "sdk")
+    testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
+
+    sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
+    bb.utils.remove(sdktestdir, True)
+    bb.utils.mkdirhier(sdktestdir)
+
+    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
+    if not os.path.exists(tcname):
+        bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake meta-toolchain' .")
+    subprocess.call("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
+
+    targets = glob.glob(d.expand(sdktestdir + "/tc/sysroots/*${TARGET_VENDOR}-linux*"))
+    if len(targets) > 1:
+        bb.fatal("Error, multiple targets within the SDK found and we don't know which to test? %s" % str(targets))
+    sdkenv = sdktestdir + "/tc/environment-setup-" + os.path.basename(targets[0])
+
+    class TestContext(object):
+        def __init__(self):
+            self.d = d
+            self.testslist = testslist
+            self.testsrequired = testsrequired
+            self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
+            self.sdktestdir = sdktestdir
+            self.sdkenv = sdkenv
+
+    # test context
+    tc = TestContext()
+
+    # this is a dummy load of tests
+    # we are doing that to find compile errors in the tests themselves
+    # before booting the image
+    try:
+        loadTests(tc, "sdk")
+    except Exception as e:
+        import traceback
+        bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+    try:
+        starttime = time.time()
+        result = runTests(tc, "sdk")
+        stoptime = time.time()
+        if result.wasSuccessful():
+            bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+            msg = "%s - OK - All required tests passed" % pn
+            skipped = len(result.skipped)
+            if skipped:
+                msg += " (skipped=%d)" % skipped
+            bb.plain(msg)
+        else:
+            raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
+    finally:
+        pass
+        bb.utils.remove(sdktestdir, True)
+
+testsdk_main[vardepsexclude] =+ "BB_ORIGENV"
+
-- 
1.8.3.2


