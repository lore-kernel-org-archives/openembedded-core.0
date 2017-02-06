Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 22B4860766
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:53:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2017 09:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="40507543"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2017 09:53:30 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 09:49:37 -0800
Message-Id: <1486403377-10405-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] testimage: Implement custom target loading
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
X-List-Received-Date: Mon, 06 Feb 2017 17:53:31 -0000

This patch implements custom target loading for testimage, currently
missing due to major changes to the test framework.
Custom targets can be defined in various meta-layers, so we
need an extra path information in order to find them.
Any other additional info is retrieved as usual via the variables
TEST_TARGET and TEST_SUITES

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/testimage.bbclass   |  2 +-
 meta/lib/oeqa/runtime/context.py | 74 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c6e4cec..366c6f5 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -238,7 +238,7 @@ def testimage_main(d):
 
     # the robot dance
     target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
+        d.getVar("TEST_TARGET"), d.getVar("BBPATH"), None, d.getVar("TEST_TARGET_IP"),
         d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index e5e0141..ea1b4a6 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -89,7 +89,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
 
     @staticmethod
-    def getTarget(target_type, logger, target_ip, server_ip, **kwargs):
+    def getTarget(target_type, target_modules_path, logger, target_ip, server_ip, **kwargs):
         target = None
 
         if target_type == 'simpleremote':
@@ -97,11 +97,79 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         elif target_type == 'qemu':
             target = OEQemuTarget(logger, target_ip, server_ip, **kwargs)
         else:
-            # TODO: Implement custom target module loading
-            raise TypeError("target_type %s isn't supported" % target_type)
+            # Custom target module loading
+            try:
+                controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
+                target = controller(logger, target_ip, server_ip, **kwargs)
+            except ImportError as e:
+                raise TypeError("Failed to import %s from available controller modules" % target_type)
 
         return target
 
+    # Search oeqa.controllers module directory for and return a controller
+    # corresponding to the given target name.
+    # AttributeError raised if not found.
+    # ImportError raised if a provided module can not be imported.
+    @staticmethod
+    def getControllerModule(target, target_modules_path):
+        controllerslist = OERuntimeTestContextExecutor._getControllerModulenames(target_modules_path)
+        controller = OERuntimeTestContextExecutor._loadControllerFromName(target, controllerslist)
+        return controller
+
+    # Return a list of all python modules in lib/oeqa/controllers for each
+    # layer in bbpath
+    @staticmethod
+    def _getControllerModulenames(target_modules_path):
+
+        controllerslist = []
+
+        def add_controller_list(path):
+            if not os.path.exists(os.path.join(path, '__init__.py')):
+                raise OSError('Controllers directory %s exists but is missing __init__.py' % path)
+            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
+            for f in files:
+                module = 'oeqa.controllers.' + f[:-3]
+                if module not in controllerslist:
+                    controllerslist.append(module)
+                else:
+                    raise RuntimeError("Duplicate controller module found for %s. Layers should create unique controller module names" % module)
+
+        extpath = target_modules_path.split(':')
+        for p in extpath:
+            controllerpath = os.path.join(p, 'lib', 'oeqa', 'controllers')
+            if os.path.exists(controllerpath):
+                add_controller_list(controllerpath)
+        return controllerslist
+
+    # Search for and return a controller from given target name and
+    # set of module names.
+    # Raise AttributeError if not found.
+    # Raise ImportError if a provided module can not be imported
+    @staticmethod
+    def _loadControllerFromName(target, modulenames):
+        for name in modulenames:
+            obj = OERuntimeTestContextExecutor._loadControllerFromModule(target, name)
+            if obj:
+                return obj
+        raise AttributeError("Unable to load {0} from available modules: {1}".format(target, str(modulenames)))
+
+    # Search for and return a controller or None from given module name
+    @staticmethod
+    def _loadControllerFromModule(target, modulename):
+        obj = None
+        # import module, allowing it to raise import exception
+        try:
+            module = __import__(modulename, globals(), locals(), [target])
+        except Exception as e:
+            return obj
+        # look for target class in the module, catching any exceptions as it
+        # is valid that a module may not have the target class.
+        try:
+            obj = getattr(module, target)
+        except:
+            obj = None
+        return obj
+        
     @staticmethod
     def readPackagesManifest(manifest):
         if not manifest or not os.path.exists(manifest):
-- 
2.7.4


