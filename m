Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6FC77C30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490393188; x=1521929188;
	h=from:to:cc:subject:date:message-id;
	bh=c51+NG4cm0pEd6QuR+AD2zDUVulkS6xs6aJgKaMBULw=;
	b=MW7JVTZuOPKop81Wgg5paSfIxm792qoX7kZQUsMyCFnRu9rp87NA3hTD
	Rkp8mES7E+DtH99P2oLAeRr1cRjWuA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 15:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,216,1486454400"; d="scan'208";a="1111907767"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2017 15:06:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	juro.bystricky@intel.com
Date: Fri, 24 Mar 2017 15:06:16 -0700
Message-Id: <eb0686edbca089a0ae7f16712a83514be8d2bef9.1490392540.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/3] oeqa/runtime/context.py: Add automatic target loading
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
X-List-Received-Date: Fri, 24 Mar 2017 22:06:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds automatic target loading for runtime testing. It will look for
targets in 'lib/oeqa/core/target' in every layer used in the build.

Introspection was used to achieve this functionality, the idea is to load all
target modules and they will be registered with registerTarget decorator, so
it is less error prone than previous implementation.

testimage and testexport bbclasses were modified to support this. testexport
required more work to find the targets and copy them into the exporting
directory. The executor also needed to remove current choices (simpleremote,
qemu) because now we can have custom targets.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass   |  19 ++++++-
 meta/classes/testimage.bbclass    |   4 +-
 meta/lib/oeqa/core/target/base.py |  26 +++++++++
 meta/lib/oeqa/runtime/context.py  | 109 ++++++++------------------------------
 4 files changed, 68 insertions(+), 90 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 56edda9..25d66ca 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -58,8 +58,8 @@ def testexport_main(d):
     logger = logging.getLogger("BitBake")
 
     target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
-        d.getVar("TEST_SERVER_IP"))
+        d.getVar("TEST_TARGET"), d.getVar('BBLAYERS').split(), None,
+        d.getVar("TEST_TARGET_IP"), d.getVar("TEST_SERVER_IP"))
 
     host_dumper = OERuntimeTestContextExecutor.getHostDumper(
         d.getVar("testimage_dump_host"), d.getVar("TESTIMAGE_DUMP_DIR"))
@@ -108,6 +108,21 @@ def copy_needed_files(d, tc):
         else:
             shutil.copy2(src, dst)
 
+    # Get all target files.
+    t_path = os.path.join('lib', 'oeqa', 'core', 'target')
+    targets_to_copy = [os.path.join(root, filename)
+                       for path in d.getVar('BBLAYERS').split()
+                       for root, _, files in os.walk(os.path.join(path, t_path))
+                       for filename in files
+                       if filename.endswith('.py') ]
+
+    # Copy all targets.
+    export_target_path = os.path.join(export_path, t_path)
+    oe.path.remove(export_target_path)
+    bb.utils.mkdirhier(export_target_path)
+    for f in targets_to_copy:
+        shutil.copy2(f, export_target_path)
+
     # Remove cases and just copy the ones specified
     cases_path = os.path.join(export_path, 'lib', 'oeqa', 'runtime', 'cases')
     oe.path.remove(cases_path)
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index bfe5714..3199ac4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -242,8 +242,8 @@ def testimage_main(d):
 
     # the robot dance
     target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
-        d.getVar("TEST_SERVER_IP"), **target_kwargs)
+        d.getVar("TEST_TARGET"), d.getVar('BBLAYERS').split(), None,
+        d.getVar("TEST_TARGET_IP"), d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
     tc = OERuntimeTestContext(td, logger, target, host_dumper,
diff --git a/meta/lib/oeqa/core/target/base.py b/meta/lib/oeqa/core/target/base.py
index c886491..426a577 100644
--- a/meta/lib/oeqa/core/target/base.py
+++ b/meta/lib/oeqa/core/target/base.py
@@ -54,3 +54,29 @@ class OETarget(object):
     @abstractmethod
     def copyDirTo(self, localSrc, remoteDst):
         pass
+
+def discover_targets(layer_paths):
+    """
+    Imports modules found in 'lib/oeqa/core/target'.
+
+    This is used to register targets using registerTarget decorator.
+    """
+
+    target_path = 'lib/oeqa/core/target'
+    paths = [os.path.join(p, target_path) for p in layer_paths]
+    for path in paths:
+        files_python = [os.path.join(root, filename)
+                        for root, _, filenames in os.walk(path)
+                        for filename in filenames
+                        if filename.endswith('.py')]
+        for f in files_python:
+            if '__init__.py' in f:
+                continue
+            abs_path = os.path.abspath(f)
+            for sys_path in sys.path:
+                if sys_path in abs_path:
+                    rel_path = os.path.relpath(abs_path, sys_path)
+                    break
+
+            name = rel_path.replace('.py', '').replace(os.path.sep, '.')
+            importlib.import_module(name)
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index c4cd76c..5482a39 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -51,6 +51,10 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_target_ip = '192.168.7.2'
     default_host_dumper_dir = '/tmp/oe-saved-tests'
     default_extract_dir = 'packages/extracted'
+    default_root = os.path.join(
+                        os.path.dirname(
+                        os.path.dirname(
+                        os.path.dirname(os.path.dirname(__file__)))))
 
     def register_commands(self, logger, subparsers):
         super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
@@ -58,7 +62,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         runtime_group = self.parser.add_argument_group('runtime options')
 
         runtime_group.add_argument('--target-type', action='store',
-                default=self.default_target_type, choices=['simpleremote', 'qemu'],
+                default=self.default_target_type,
                 help="Target type of device under test, default: %s" \
                 % self.default_target_type)
         runtime_group.add_argument('--target-ip', action='store',
@@ -89,96 +93,28 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
 
     @staticmethod
-    def getTarget(target_type, logger, target_ip, server_ip, **kwargs):
+    def getTarget(target_type, target_paths, logger, target_ip, server_ip, **kwargs):
+        """
+        Gets target to be used with runtime testing.
+
+        It is possible to add targes using registerTarget decorator and putting
+        the module in 'lib/oeqa/core/target' directory of your layer.
+        """
+
+        from oeqa.core.target.base import discover_targets, targetClasses
+
         target = None
+        discover_targets(target_paths)
 
-        if target_type == 'simpleremote':
-            target = OESSHTarget(logger, target_ip, server_ip, **kwargs)
-        elif target_type == 'qemu':
-            target = OEQemuTarget(logger, target_ip, server_ip, **kwargs)
+        target_class = targetClasses.get(target_type, None)
+        if target_class:
+            target = target_class(logger, target_ip, server_ip, **kwargs)
         else:
-            # XXX: This code uses the old naming convention for controllers and
-            # targets, the idea it is to leave just targets as the controller
-            # most of the time was just a wrapper.
-            # XXX: This code tries to import modules from lib/oeqa/controllers
-            # directory and treat them as controllers, it will less error prone
-            # to use introspection to load such modules.
-            # XXX: Don't base your targets on this code it will be refactored
-            # in the near future.
-            # Custom target module loading
-            try:
-                target_modules_path = kwargs.get('target_modules_path', '')
-                controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
-                target = controller(logger, target_ip, server_ip, **kwargs)
-            except ImportError as e:
-                raise TypeError("Failed to import %s from available controller modules" % target_type)
+            msg = 'Can\'t find "%s" in available targets' % target_type
+            raise TypeError(msg)
 
         return target
 
-    # Search oeqa.controllers module directory for and return a controller
-    # corresponding to the given target name.
-    # AttributeError raised if not found.
-    # ImportError raised if a provided module can not be imported.
-    @staticmethod
-    def getControllerModule(target, target_modules_path):
-        controllerslist = OERuntimeTestContextExecutor._getControllerModulenames(target_modules_path)
-        controller = OERuntimeTestContextExecutor._loadControllerFromName(target, controllerslist)
-        return controller
-
-    # Return a list of all python modules in lib/oeqa/controllers for each
-    # layer in bbpath
-    @staticmethod
-    def _getControllerModulenames(target_modules_path):
-
-        controllerslist = []
-
-        def add_controller_list(path):
-            if not os.path.exists(os.path.join(path, '__init__.py')):
-                raise OSError('Controllers directory %s exists but is missing __init__.py' % path)
-            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
-            for f in files:
-                module = 'oeqa.controllers.' + f[:-3]
-                if module not in controllerslist:
-                    controllerslist.append(module)
-                else:
-                    raise RuntimeError("Duplicate controller module found for %s. Layers should create unique controller module names" % module)
-
-        extpath = target_modules_path.split(':')
-        for p in extpath:
-            controllerpath = os.path.join(p, 'lib', 'oeqa', 'controllers')
-            if os.path.exists(controllerpath):
-                add_controller_list(controllerpath)
-        return controllerslist
-
-    # Search for and return a controller from given target name and
-    # set of module names.
-    # Raise AttributeError if not found.
-    # Raise ImportError if a provided module can not be imported
-    @staticmethod
-    def _loadControllerFromName(target, modulenames):
-        for name in modulenames:
-            obj = OERuntimeTestContextExecutor._loadControllerFromModule(target, name)
-            if obj:
-                return obj
-        raise AttributeError("Unable to load {0} from available modules: {1}".format(target, str(modulenames)))
-
-    # Search for and return a controller or None from given module name
-    @staticmethod
-    def _loadControllerFromModule(target, modulename):
-        obj = None
-        # import module, allowing it to raise import exception
-        try:
-            module = __import__(modulename, globals(), locals(), [target])
-        except Exception as e:
-            return obj
-        # look for target class in the module, catching any exceptions as it
-        # is valid that a module may not have the target class.
-        try:
-            obj = getattr(module, target)
-        except:
-            obj = None
-        return obj
-        
     @staticmethod
     def readPackagesManifest(manifest):
         if not manifest or not os.path.exists(manifest):
@@ -208,7 +144,8 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         self.tc_kwargs['init']['target'] = \
                 OERuntimeTestContextExecutor.getTarget(args.target_type,
-                        None, args.target_ip, args.server_ip, **target_kwargs)
+                        [self.default_root], None, args.target_ip, args.server_ip,
+                        **target_kwargs)
         self.tc_kwargs['init']['host_dumper'] = \
                 OERuntimeTestContextExecutor.getHostDumper(None,
                         args.host_dumper_dir)
-- 
2.10.2


