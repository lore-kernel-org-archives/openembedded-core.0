Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E09D4770AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 15:21:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 08:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="714707590"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2016 08:21:07 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 07:15:40 +0000
Message-Id: <e0387eea47138385035f974163850cfda7e006ee.1465196934.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 2/7] lib/oeqa/otest.py: Fix import tests from other layers with python3
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
X-List-Received-Date: Mon, 06 Jun 2016 15:21:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

In python3 the functionality to import modules has been changed and
this broke the capability to add runtime tests from other layers.

This commit returns this capability to testimage and testexport.

[YOCTO #9705]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass   | 10 ++++++----
 meta/lib/oeqa/__init__.py         |  0
 meta/lib/oeqa/oetest.py           |  5 ++---
 meta/lib/oeqa/runtime/__init__.py |  3 ---
 4 files changed, 8 insertions(+), 10 deletions(-)
 delete mode 100644 meta/lib/oeqa/__init__.py
 delete mode 100644 meta/lib/oeqa/runtime/__init__.py

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 51b7d93..c86eaac 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -96,11 +96,13 @@ def exportTests(d,tc):
                         shutil.copytree(foldername, target_folder)
         if not isfolder:
             shutil.copy2(mod.path, os.path.join(exportpath, "oeqa/runtime"))
-    # copy __init__.py files
-    oeqadir = os.path.dirname(pkgutil.get_loader("oeqa").path)
-    shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(exportpath, "oeqa"))
-    shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(exportpath, "oeqa/runtime"))
+    # Get meta layer
+    for layer in d.getVar("BBLAYERS", True).split():
+        if os.path.basename(layer) == "meta":
+            meta_layer = layer
+            break
     # copy oeqa/oetest.py and oeqa/runexported.py
+    oeqadir = os.path.join(meta_layer, "lib/oeqa")
     shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(exportpath, "oeqa"))
     shutil.copy2(os.path.join(oeqadir, "runexported.py"), exportpath)
     # copy oeqa/utils/*.py
diff --git a/meta/lib/oeqa/__init__.py b/meta/lib/oeqa/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index b4cf34b..819f959 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -203,8 +203,7 @@ class TestContext(object):
         self.testslist = self._get_tests_list(path, extrapath)
         self.testsrequired = self._get_test_suites_required()
 
-        self.filesdir = os.path.join(os.path.dirname(os.path.abspath(
-            oeqa.runtime.__file__)), "files")
+        self.filesdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "runtime/files")
         self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
         self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
 
@@ -460,7 +459,7 @@ class RuntimeTestContext(TestContext):
         Returns the path of the JSON file for a module, empty if doesn't exitst.
         """
 
-        module_file = module.filename
+        module_file = module.path
         json_file = "%s.json" % module_file.rsplit(".", 1)[0]
         if os.path.isfile(module_file) and os.path.isfile(json_file):
             return json_file
diff --git a/meta/lib/oeqa/runtime/__init__.py b/meta/lib/oeqa/runtime/__init__.py
deleted file mode 100644
index 4cf3fa7..0000000
--- a/meta/lib/oeqa/runtime/__init__.py
+++ /dev/null
@@ -1,3 +0,0 @@
-# Enable other layers to have tests in the same named directory
-from pkgutil import extend_path
-__path__ = extend_path(__path__, __name__)
-- 
2.6.6


