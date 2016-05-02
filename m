Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE7357016E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 21:23:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2016 14:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,569,1455004800"; d="scan'208";a="944713033"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2016 14:23:17 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:19:17 +0000
Message-Id: <f8a39f8f546987b1af99de31893854e33958ea6b.1462194553.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 4/6] testimage.bbclass: Remove exported test
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
X-List-Received-Date: Mon, 02 May 2016 21:23:17 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Exported tests now have their own class, so
the code in testimage is not needed anymore.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 137 +++++------------------------------------
 1 file changed, 17 insertions(+), 120 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e77bb11..a2e13df 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -30,7 +30,6 @@
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 TEST_EXPORT_DIR ?= "${TMPDIR}/testimage/${PN}"
-TEST_EXPORT_ONLY ?= "0"
 
 RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
 MINTESTSUITE = "ping"
@@ -62,8 +61,6 @@ TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_TARGET ?= "qemu"
-TEST_TARGET_IP ?= ""
-TEST_SERVER_IP ?= ""
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
@@ -108,97 +105,6 @@ do_testimage[nostamp] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
-def exportTests(d,tc):
-    import json
-    import shutil
-    import pkgutil
-    import re
-
-    exportpath = d.getVar("TEST_EXPORT_DIR", True)
-
-    savedata = {}
-    savedata["d"] = {}
-    savedata["target"] = {}
-    savedata["host_dumper"] = {}
-    for key in tc.__dict__:
-        # special cases
-        if key not in ['d', 'target', 'host_dumper', 'suite']:
-            savedata[key] = getattr(tc, key)
-    savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP", True)
-    savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP", True)
-
-    keys = [ key for key in d.keys() if not key.startswith("_") and not key.startswith("BB") \
-            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func", True)]
-    for key in keys:
-        try:
-            savedata["d"][key] = d.getVar(key, True)
-        except bb.data_smart.ExpansionError:
-            # we don't care about those anyway
-            pass
-
-    savedata["host_dumper"]["parent_dir"] = tc.host_dumper.parent_dir
-    savedata["host_dumper"]["cmds"] = tc.host_dumper.cmds
-
-    json_file = os.path.join(exportpath, "testdata.json")
-    with open(json_file, "w") as f:
-            json.dump(savedata, f, skipkeys=True, indent=4, sort_keys=True)
-
-    # Replace absolute path with relative in the file
-    exclude_path = os.path.join(d.getVar("COREBASE", True),'meta','lib','oeqa')
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
-    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
-    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
-    # copy test modules, this should cover tests in other layers too
-    bbpath = d.getVar("BBPATH", True).split(':')
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
-                        shutil.copytree(foldername, target_folder)
-        if not isfolder:
-            shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
-    # copy __init__.py files
-    oeqadir = pkgutil.get_loader("oeqa").filename
-    shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(exportpath, "oeqa"))
-    shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(exportpath, "oeqa/runtime"))
-    # copy oeqa/oetest.py and oeqa/runexported.py
-    shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(exportpath, "oeqa"))
-    shutil.copy2(os.path.join(oeqadir, "runexported.py"), exportpath)
-    # copy oeqa/utils/*.py
-    for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
-        for f in files:
-            if f.endswith(".py"):
-                shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/utils"))
-    # copy oeqa/runtime/files/*
-    for root, dirs, files in os.walk(os.path.join(oeqadir, "runtime/files")):
-        for f in files:
-            shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
-
-    bb.plain("Exported tests to: %s" % exportpath)
-
 def testimage_main(d):
     import unittest
     import os
@@ -210,11 +116,7 @@ def testimage_main(d):
     from oeqa.utils.dump import get_host_dumper
 
     pn = d.getVar("PN", True)
-    export = oe.utils.conditional("TEST_EXPORT_ONLY", "1", True, False, d)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
-    if export:
-        bb.utils.remove(d.getVar("TEST_EXPORT_DIR", True), recurse=True)
-        bb.utils.mkdirhier(d.getVar("TEST_EXPORT_DIR", True))
 
     # we need the host dumper in test context
     host_dumper = get_host_dumper(d)
@@ -234,29 +136,24 @@ def testimage_main(d):
         import traceback
         bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
 
-    if export:
+    target.deploy()
+    try:
+        target.start()
+        starttime = time.time()
+        result = tc.runTests()
+        stoptime = time.time()
+        if result.wasSuccessful():
+            bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+            msg = "%s - OK - All required tests passed" % pn
+            skipped = len(result.skipped)
+            if skipped:
+                msg += " (skipped=%d)" % skipped
+            bb.plain(msg)
+        else:
+            raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
+    finally:
         signal.signal(signal.SIGTERM, tc.origsigtermhandler)
-        tc.origsigtermhandler = None
-        exportTests(d,tc)
-    else:
-        target.deploy()
-        try:
-            target.start()
-            starttime = time.time()
-            result = tc.runTests()
-            stoptime = time.time()
-            if result.wasSuccessful():
-                bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-                msg = "%s - OK - All required tests passed" % pn
-                skipped = len(result.skipped)
-                if skipped:
-                    msg += " (skipped=%d)" % skipped
-                bb.plain(msg)
-            else:
-                raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
-        finally:
-            signal.signal(signal.SIGTERM, tc.origsigtermhandler)
-            target.stop()
+        target.stop()
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
 
-- 
2.6.6


