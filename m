Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAF8770D8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:38:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 24 Jan 2016 11:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="35360019"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2016 11:38:07 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 5CE382C8001;
	Sun, 24 Jan 2016 12:26:00 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:48 +0200
Message-Id: <1453664991-31706-10-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Cc: Lucian Musat <george.l.musat@intel.com>
Subject: [PATCH 10/13] oeqa/testimage: Added export features.
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
X-List-Received-Date: Sun, 24 Jan 2016 19:38:05 -0000

From: Lucian Musat <george.l.musat@intel.com>

It is now possible to export tests from all the layers that are
added in bblayers even when grouped in folders. They are exported
in another folder called "extralayers" and nicely grouped per layer
so the test files won't mingle.
If a layer contains a conf/test folder then export that as well.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 113 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 96 insertions(+), 17 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 400d16d..e3793ab 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -164,6 +164,11 @@ def get_tests_list(d, type="runtime"):
                     testslist.append("oeqa." + type + "." + testname)
                     found = True
                     break
+                elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0]))\
+                    and os.path.isdir(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0])):
+                    testslist.append("oeqa." + type + "." + testname)
+                    found = True
+                    break
             if not found:
                 bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
 
@@ -184,6 +189,24 @@ def get_tests_list(d, type="runtime"):
                 add_auto_list(testpath)
     return testslist
 
+def get_extra_layers(d):
+    default_layers = ['meta-yocto','meta-yocto-bsp']
+    extra_layers = []
+
+    layer_list = [var for var in d.getVar("BBLAYERS", True).split(" ") if var]
+
+    for layer in layer_list:
+        if (os.path.basename(os.path.normpath(layer)) not in default_layers)\
+        and os.path.exists(os.path.join(layer,"lib","oeqa")):
+            extra_layers.append(layer)
+    return extra_layers
+
+def get_layer(fullpath):
+    try:
+        layer = os.path.basename(fullpath.split(os.path.join("lib","oeqa"))[0].rstrip(os.sep))
+    except IndexError:
+        layer = None
+    return layer
 
 def exportTests(d,tc):
     import json
@@ -239,6 +262,13 @@ def exportTests(d,tc):
     #   - __init__.py files
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
+    if len(get_extra_layers(d)) > 1:
+        bb.utils.mkdirhier(os.path.join(exportpath, "extralayers"))
+        for layer in get_extra_layers(d):
+            if os.path.basename(os.path.normpath(layer)) != "meta":
+                bb.utils.mkdirhier(os.path.join(exportpath, "extralayers/%s/oeqa/runtime/files" % os.path.basename(os.path.normpath(layer))))
+                bb.utils.mkdirhier(os.path.join(exportpath, "extralayers/%s/oeqa/utils" % os.path.basename(os.path.normpath(layer))))
+
     # copy test modules, this should cover tests in other layers too
     bbpath = d.getVar("BBPATH", True).split(':')
     for t in tc.testslist:
@@ -246,6 +276,18 @@ def exportTests(d,tc):
         if re.search("\w+\.\w+\.test_\S+", t):
             t = '.'.join(t.split('.')[:3])
         mod = pkgutil.get_loader(t)
+        if (str(os.path.join("meta","lib","oeqa")) not in mod.filename):
+            if get_layer(mod.filename):
+                layerpath = os.path.join(exportpath, "extralayers", get_layer(mod.filename))
+            else:
+                layerpath = exportpath
+        else:
+            layerpath = exportpath
+
+        if os.path.isdir(mod.filename):
+            isfolder = True
+        else:
+            shutil.copy2(mod.filename, os.path.join(layerpath, "oeqa/runtime"))
         # More depth than usual?
         if (t.count('.') > 2):
             for p in bbpath:
@@ -255,24 +297,61 @@ def exportTests(d,tc):
                     target_folder = os.path.join(exportpath, "oeqa", "runtime", os.path.basename(foldername))
                     if not os.path.exists(target_folder):
                         shutil.copytree(foldername, target_folder)
-        if not isfolder:
-            shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
+        if isfolder:
+            target_folder = os.path.join(layerpath, "oeqa", "runtime", os.path.basename(mod.filename))
+            if not os.path.exists(target_folder):
+                shutil.copytree(mod.filename, target_folder)
+
+         if not isfolder:
+            shutil.copy2(mod.filename, os.path.join(layerpath, "oeqa/runtime"))
     # copy __init__.py files
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
+    for _oeqadir in get_extra_layers(d):
+        oeqadir = os.path.join(_oeqadir,"lib","oeqa")
+        # copy oeqa/oetest.py and oeqa/runexported.py
+        if os.path.basename(_oeqadir) == "meta":
+            layerpath = exportpath
+            # Make sure we always copy the minimum required files from meta
+            shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(layerpath, "oeqa"))
+            shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(layerpath, "oeqa"))
+            shutil.copy2(os.path.join(oeqadir, "runtime", "__init__.py"), os.path.join(layerpath, "oeqa", "runtime"))
+            shutil.copy2(os.path.join(oeqadir, "runexported.py"), layerpath)
+            for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
+                for f in files:
+                    if f.endswith(".py"):
+                        shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "oeqa/utils"))
+        else:
+            if oeqadir in mod.filename:
+                layerpath = os.path.join(exportpath, "extralayers", get_layer(mod.filename))
+
+        try:
+            if oeqadir in mod.filename:
+                shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(layerpath, "oeqa"))
+        except IOError:
+            pass
+        try:
+            if oeqadir in mod.filename:
+                shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(layerpath, "oeqa/runtime"))
+        except IOError:
+            pass
+        # copy oeqa/utils/*.py
+        for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
+            for f in files:
+                if f.endswith(".py") and (oeqadir in mod.filename):
+                    shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "oeqa/utils"))
+        # copy oeqa/runtime/files/*
+        for root, dirs, files in os.walk(os.path.join(oeqadir, "runtime/files")):
+            for f in files:
+                if oeqadir in mod.filename:
+                    shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "oeqa/runtime/files"))
+        # copy conf/test folder
+        if os.path.isdir(os.path.join(_oeqadir, "conf", "test")):
+            if os.path.join("meta","lib","oeqa") in oeqadir:
+                bb.utils.mkdirhier(os.path.join(exportpath, "conf/test"))
+            else:
+                bb.utils.mkdirhier(os.path.join(exportpath, "extralayers/%s/conf/test" % os.path.basename(os.path.normpath(layer))))
+            for root, dirs, files in os.walk(os.path.join(_oeqadir, "conf", "test")):
+                for f in files:
+                    shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "conf/test"))
 
     #integrating binaries too
     # creting needed directory structure
-- 
2.5.0


