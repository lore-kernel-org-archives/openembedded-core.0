Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 59200731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567430"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:44 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:51 -0600
Message-Id: <abc8e71fd0c90123162ddaea3f7380698e71579b.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 20/55] oeqa/sdk: Add case and context modules for the SDK component
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds case and context modules for SDK based on oetest.py old code.

Enables SDK Test component usage with oe-test, the SDK Test component
adds command line options for specify sdk installed dir, sdk environment
and target/hosts maniftest.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py       |  51 ----------------
 meta/lib/oeqa/sdk/__init__.py |   0
 meta/lib/oeqa/sdk/case.py     |  12 ++++
 meta/lib/oeqa/sdk/context.py  | 133 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+), 51 deletions(-)
 create mode 100644 meta/lib/oeqa/sdk/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/case.py
 create mode 100644 meta/lib/oeqa/sdk/context.py

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index d1aef96..d7c3588 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -145,20 +145,6 @@ class OETestCalledProcessError(subprocess.CalledProcessError):
 
 subprocess.CalledProcessError = OETestCalledProcessError
 
-class oeSDKTest(oeTest):
-    def __init__(self, methodName='runTest'):
-        self.sdktestdir = oeSDKTest.tc.sdktestdir
-        super(oeSDKTest, self).__init__(methodName)
-
-    @classmethod
-    def hasHostPackage(self, pkg):
-        if re.search(pkg, oeTest.tc.hostpkgmanifest):
-            return True
-        return False
-
-    def _run(self, cmd):
-        return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True, stderr=subprocess.STDOUT).decode("utf-8")
-
 class oeSDKExtTest(oeSDKTest):
     def _run(self, cmd):
         # extensible sdk shows a warning if found bitbake in the path
@@ -657,43 +643,6 @@ class ExportTestContext(RuntimeTestContext):
         pkg_dir = os.path.join(export_dir, extracted_dir)
         super(ExportTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
 
-class SDKTestContext(TestContext):
-    def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
-        super(SDKTestContext, self).__init__(d)
-
-        self.sdktestdir = sdktestdir
-        self.sdkenv = sdkenv
-        self.tcname = tcname
-
-        if not hasattr(self, 'target_manifest'):
-            self.target_manifest = d.getVar("SDK_TARGET_MANIFEST")
-        try:
-            self.pkgmanifest = {}
-            with open(self.target_manifest) as f:
-                for line in f:
-                    (pkg, arch, version) = line.strip().split()
-                    self.pkgmanifest[pkg] = (version, arch)
-        except IOError as e:
-            bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
-
-        if not hasattr(self, 'host_manifest'):
-            self.host_manifest = d.getVar("SDK_HOST_MANIFEST")
-        try:
-            with open(self.host_manifest) as f:
-                self.hostpkgmanifest = f.read()
-        except IOError as e:
-            bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
-
-    def _get_test_namespace(self):
-        return "sdk"
-
-    def _get_test_suites(self):
-        return (self.d.getVar("TEST_SUITES_SDK") or "auto").split()
-
-    def _get_test_suites_required(self):
-        return [t for t in (self.d.getVar("TEST_SUITES_SDK") or \
-                "auto").split() if t != "auto"]
-
 class SDKExtTestContext(SDKTestContext):
     def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
         self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST")
diff --git a/meta/lib/oeqa/sdk/__init__.py b/meta/lib/oeqa/sdk/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
new file mode 100644
index 0000000..782db8b
--- /dev/null
+++ b/meta/lib/oeqa/sdk/case.py
@@ -0,0 +1,12 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import subprocess
+
+from oeqa.core.case import OETestCase
+
+class OESDKTestCase(OETestCase):
+    def _run(self, cmd):
+        return subprocess.check_output(". %s > /dev/null; %s;" % \
+                (self.tc.sdk_env, cmd), shell=True,
+                stderr=subprocess.STDOUT).decode("utf-8")
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
new file mode 100644
index 0000000..0189ed8
--- /dev/null
+++ b/meta/lib/oeqa/sdk/context.py
@@ -0,0 +1,133 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import glob
+import re
+
+from oeqa.core.context import OETestContext, OETestContextExecutor
+
+class OESDKTestContext(OETestContext):
+    sdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
+
+    def __init__(self, td=None, logger=None, sdk_dir=None, sdk_env=None,
+            target_pkg_manifest=None, host_pkg_manifest=None):
+        super(OESDKTestContext, self).__init__(td, logger)
+
+        self.sdk_dir = sdk_dir
+        self.sdk_env = sdk_env
+        self.target_pkg_manifest = target_pkg_manifest
+        self.host_pkg_manifest = host_pkg_manifest
+
+    def _hasPackage(self, manifest, pkg):
+        for host_pkg in manifest.keys():
+            if re.search(pkg, host_pkg):
+                return True
+        return False
+
+    def hasHostPackage(self, pkg):
+        return self._hasPackage(self.host_pkg_manifest, pkg)
+
+    def hasTargetPackage(self, pkg):
+        return self._hasPackage(self.target_pkg_manifest, pkg)
+
+class OESDKTestContextExecutor(OETestContextExecutor):
+    _context_class = OESDKTestContext
+
+    name = 'sdk'
+    help = 'sdk test component'
+    description = 'executes sdk tests'
+
+    default_cases = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
+            'cases')]
+    default_test_data = None
+
+    def register_commands(self, logger, subparsers):
+        import argparse_oe
+
+        super(OESDKTestContextExecutor, self).register_commands(logger, subparsers)
+
+        sdk_group = self.parser.add_argument_group('sdk options')
+        sdk_group.add_argument('--sdk-env', action='store',
+            help='sdk environment')
+        sdk_group.add_argument('--target-manifest', action='store',
+            help='sdk target manifest')
+        sdk_group.add_argument('--host-manifest', action='store',
+            help='sdk host manifest')
+
+        sdk_dgroup = self.parser.add_argument_group('sdk display options')
+        sdk_dgroup.add_argument('--list-sdk-env', action='store_true',
+            default=False, help='sdk list available environment')
+
+        # XXX this option is required but argparse_oe has a bug handling
+        # required options, seems that don't keep track of already parsed
+        # options
+        sdk_rgroup = self.parser.add_argument_group('sdk required options')
+        sdk_rgroup.add_argument('--sdk-dir', required=False, action='store', 
+            help='sdk installed directory')
+
+    @staticmethod
+    def _load_manifest(manifest):
+        pkg_manifest = {}
+        if manifest:
+            with open(manifest) as f:
+                for line in f:
+                    (pkg, arch, version) = line.strip().split()
+                    pkg_manifest[pkg] = (version, arch)
+
+        return pkg_manifest
+
+    def _process_args(self, logger, args):
+        super(OESDKTestContextExecutor, self)._process_args(logger, args)
+
+        self.tc_kwargs['init']['sdk_dir'] = args.sdk_dir
+        self.tc_kwargs['init']['sdk_env'] = self.sdk_env
+        self.tc_kwargs['init']['target_pkg_manifest'] = \
+                OESDKTestContextExecutor._load_manifest(args.target_manifest)
+        self.tc_kwargs['init']['host_pkg_manifest'] = \
+                OESDKTestContextExecutor._load_manifest(args.host_manifest)
+
+    @staticmethod
+    def _get_sdk_environs(sdk_dir):
+        sdk_env = {}
+
+        environ_pattern = sdk_dir + '/environment-setup-*'
+        full_sdk_env = glob.glob(sdk_dir + '/environment-setup-*')
+        for env in full_sdk_env:
+            m = re.search('environment-setup-(.*)', env)
+            if m:
+                sdk_env[m.group(1)] = env
+
+        return sdk_env
+
+    def _display_sdk_envs(self, log, args, sdk_envs):
+        log("Available SDK environments at directory %s:" \
+                % args.sdk_dir)
+        log("")
+        for env in sdk_envs:
+            log(env)
+
+    def run(self, logger, args):
+        if not args.sdk_dir:
+            raise argparse_oe.ArgumentUsageError("No SDK directory "\
+                   "specified please do, --sdk-dir SDK_DIR", self.name)
+
+        sdk_envs = OESDKTestContextExecutor._get_sdk_environs(args.sdk_dir)
+        if not sdk_envs:
+            raise argparse_oe.ArgumentUsageError("No available SDK "\
+                   "enviroments found at %s" % args.sdk_dir, self.name)
+
+        if args.list_sdk_env:
+            self._display_sdk_envs(logger.info, args, sdk_envs)
+            sys.exit(0)
+
+        if not args.sdk_env in sdk_envs:
+            self._display_sdk_envs(logger.error, args, sdk_envs)
+            raise argparse_oe.ArgumentUsageError("No valid SDK "\
+                   "environment (%s) specified" % args.sdk_env, self.name)
+
+        self.sdk_env = sdk_envs[args.sdk_env]
+        super(OESDKTestContextExecutor, self).run(logger, args)
+
+_executor_class = OESDKTestContextExecutor
-- 
2.1.4


