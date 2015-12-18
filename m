Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 828FE731D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 04:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="874234821"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2015 04:28:52 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 868D06A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:52 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:41:03 +0200
Message-Id: <5429ba2e30b47f54a2cd042c37b45a6cc4bc5dc6.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 11/12] oeqa/runtime: Copy all __init__.py files from all layers.
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:50 -0000

From: Lucian Musat <george.l.musat@intel.com>

Copy all the __init__.py files from all the extra layers
also, specified in bblayers.conf, in accordance to
TEST_SUITES variable.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 67 +++++++++++++++++++++++-------------------
 meta/lib/oeqa/runexported.py   |  2 +-
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 88aa941..83a11ee 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -211,6 +211,7 @@ def exportTests(d,tc):
     import shutil
     import pkgutil
     import re
+    import oeqa.utils.testexport as te
 
     exportpath = d.getVar("TEST_EXPORT_DIR", True)
 
@@ -300,37 +301,37 @@ def exportTests(d,tc):
             if not os.path.exists(target_folder):
                 shutil.copytree(mod.filename, target_folder)
 
-         if not isfolder:
+        if not isfolder:
             shutil.copy2(mod.filename, os.path.join(layerpath, "oeqa/runtime"))
-    # copy __init__.py files
-    for _oeqadir in get_extra_layers(d):
-        oeqadir = os.path.join(_oeqadir,"lib","oeqa")
-        # copy oeqa/oetest.py and oeqa/runexported.py
-        if os.path.basename(_oeqadir) == "meta":
-            layerpath = exportpath
-            # Make sure we always copy the minimum required files from meta
-            shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(layerpath, "oeqa"))
-            shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(layerpath, "oeqa"))
-            shutil.copy2(os.path.join(oeqadir, "runtime", "__init__.py"), os.path.join(layerpath, "oeqa", "runtime"))
-            shutil.copy2(os.path.join(oeqadir, "runexported.py"), layerpath)
-            for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
-                for f in files:
-                    if f.endswith(".py"):
-                        shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "oeqa/utils"))
-        else:
-            if oeqadir in mod.filename:
-                layerpath = os.path.join(exportpath, "extralayers", get_layer(mod.filename))
-
-        try:
-            if oeqadir in mod.filename:
+        # copy __init__.py files
+        for _oeqadir in get_extra_layers(d):
+            oeqadir = os.path.join(_oeqadir,"lib","oeqa")
+            # copy oeqa/oetest.py and oeqa/runexported.py
+            if os.path.basename(_oeqadir) == "meta":
+                layerpath = exportpath
+                # Make sure we always copy the minimum required files from meta
+                shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(layerpath, "oeqa"))
                 shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(layerpath, "oeqa"))
-        except IOError:
-            pass
-        try:
-            if oeqadir in mod.filename:
-                shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(layerpath, "oeqa/runtime"))
-        except IOError:
-            pass
+                shutil.copy2(os.path.join(oeqadir, "runtime", "__init__.py"), os.path.join(layerpath, "oeqa", "runtime"))
+                shutil.copy2(os.path.join(oeqadir, "runexported.py"), layerpath)
+                for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
+                    for f in files:
+                        if f.endswith(".py"):
+                            shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "oeqa/utils"))
+            else:
+                if oeqadir in mod.filename:
+                    layerpath = os.path.join(exportpath, "extralayers", get_layer(mod.filename))
+
+            try:
+                if oeqadir in mod.filename:
+                    shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(layerpath, "oeqa"))
+            except IOError:
+                pass
+            try:
+                if oeqadir in mod.filename:
+                    shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(layerpath, "oeqa/runtime"))
+            except IOError:
+                pass
         # copy oeqa/utils/*.py
         for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
             for f in files:
@@ -347,13 +348,19 @@ def exportTests(d,tc):
                 bb.utils.mkdirhier(os.path.join(exportpath, "conf/test"))
             else:
                 bb.utils.mkdirhier(os.path.join(exportpath, "extralayers/%s/conf/test" % os.path.basename(os.path.normpath(layer))))
+                layerpath = os.path.join(exportpath, "extralayers", os.path.basename(os.path.normpath(layer)))
             for root, dirs, files in os.walk(os.path.join(_oeqadir, "conf", "test")):
                 for f in files:
                     shutil.copy2(os.path.join(root, f), os.path.join(layerpath, "conf/test"))
 
     #integrating binaries too
     # creting needed directory structure
-    arch = te.get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir(d.getVar("DEPLOY_DIR_RPM", True)))
+    try:
+        arch = te.get_dest_folder(d.getVar("TUNE_FEATURES", True), os.listdir(d.getVar("DEPLOY_DIR_RPM", True)))
+    except OSError:
+        # Make a default folder
+        bb.utils.mkdirhier(os.path.join(d.getVar("DEPLOY_DIR_RPM", True), "i586"))
+        arch = "i586"
     bb.utils.mkdirhier(os.path.join(exportpath,"tar_files"))
     bb.utils.mkdirhier(os.path.join(exportpath,"binaries", arch, "packaged_binaries"))
     bb.utils.mkdirhier(os.path.join(exportpath,"binaries", "native"))
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 3a6bad7..2ce4922 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -24,7 +24,7 @@ import time
 import argparse
 import re
 
-from oeqa.utils.testsexport import get_dest_folder
+from oeqa.utils.testexport import get_dest_folder
 
 try:
     import simplejson as json
-- 
2.5.0


