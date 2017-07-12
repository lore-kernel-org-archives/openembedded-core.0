Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEBB71AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:36:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133704"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:36:53 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:48 -0500
Message-Id: <8b356c6d0531dd5ec0c6e15a4feeaecc23b450e9.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 02/29] oeqa/selftest/{context, case}: Handle KeyboardInterrupt/SIGINT and SIGTERM
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
X-List-Received-Date: Wed, 12 Jul 2017 19:36:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to avoid corrupt local.conf and bblayers.conf adds
signal handler for SIGTERM and use try/finally (KeyboardIntrrupt) block
to restore previously backuped configuration.

[YOCTO #11650]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py    |  36 +++++++------
 meta/lib/oeqa/selftest/context.py | 107 +++++++++++++++++++++++++++-----------
 2 files changed, 97 insertions(+), 46 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 31a11fddda9..871009c568b 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -13,28 +13,34 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.core.case import OETestCase
 
 class OESelftestTestCase(OETestCase):
-    builddir = os.environ.get("BUILDDIR") or ""
-    localconf_path = os.path.join(builddir, "conf/local.conf")
-    localconf_backup = os.path.join(builddir, "conf/local.bk")
-    testinc_path = os.path.join(builddir, "conf/selftest.inc")
-    local_bblayers_path = os.path.join(builddir, "conf/bblayers.conf")
-    local_bblayers_backup = os.path.join(builddir, "conf/bblayers.bk")
-    testinc_bblayers_path = os.path.join(builddir, "conf/bblayers.inc")
-    machineinc_path = os.path.join(builddir, "conf/machine.inc")
-
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
-        self._track_for_cleanup = [
-            self.testinc_path, self.testinc_bblayers_path,
-            self.machineinc_path, self.localconf_backup,
-            self.local_bblayers_backup]
-
         super(OESelftestTestCase, self).__init__(methodName)
 
     @classmethod
     def setUpClass(cls):
         super(OESelftestTestCase, cls).setUpClass()
-        cls.testlayer_path = cls.tc.testlayer_path
+
+        cls.testlayer_path = cls.tc.config_paths['testlayer_path']
+        cls.builddir = cls.tc.config_paths['builddir']
+
+        cls.localconf_path = cls.tc.config_paths['localconf']
+        cls.localconf_backup = cls.tc.config_paths['localconf_class_backup']
+        cls.local_bblayers_path = cls.tc.config_paths['bblayers']
+        cls.local_bblayers_backup = cls.tc.config_paths['bblayers_class_backup']
+
+        cls.testinc_path = os.path.join(cls.tc.config_paths['builddir'],
+                "conf/selftest.inc")
+        cls.testinc_bblayers_path = os.path.join(cls.tc.config_paths['builddir'],
+                "conf/bblayers.inc")
+        cls.machineinc_path = os.path.join(cls.tc.config_paths['builddir'],
+                "conf/machine.inc")
+
+        cls._track_for_cleanup = [
+            cls.testinc_path, cls.testinc_bblayers_path,
+            cls.machineinc_path, cls.localconf_backup,
+            cls.local_bblayers_backup]
+
         cls.add_include()
 
     @classmethod
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index ca87398224c..4575a0537fb 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -6,6 +6,8 @@ import time
 import glob
 import sys
 import imp
+import signal
+from shutil import copyfile
 from random import choice
 
 import oeqa
@@ -16,13 +18,12 @@ from oeqa.core.exception import OEQAPreRun
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
 class OESelftestTestContext(OETestContext):
-    def __init__(self, td=None, logger=None, machines=None, testlayer_path=None):
+    def __init__(self, td=None, logger=None, machines=None, config_paths=None):
         super(OESelftestTestContext, self).__init__(td, logger)
 
         self.machines = machines
         self.custommachine = None
-
-        self.testlayer_path = testlayer_path
+        self.config_paths = config_paths
 
     def runTests(self, machine=None):
         if machine:
@@ -108,7 +109,29 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         self.tc_kwargs['init']['td'] = get_bb_vars()
         self.tc_kwargs['init']['machines'] = self._get_available_machines()
-        self.tc_kwargs['init']['testlayer_path'] = get_test_layer()
+
+        builddir = os.environ.get("BUILDDIR")
+        self.tc_kwargs['init']['config_paths'] = {}
+        self.tc_kwargs['init']['config_paths']['testlayer_path'] = \
+                get_test_layer()
+        self.tc_kwargs['init']['config_paths']['builddir'] = builddir
+        self.tc_kwargs['init']['config_paths']['localconf'] = \
+                os.path.join(builddir, "conf/local.conf")
+        self.tc_kwargs['init']['config_paths']['localconf_backup'] = \
+                os.path.join(builddir, "conf/local.conf.orig")
+        self.tc_kwargs['init']['config_paths']['localconf_class_backup'] = \
+                os.path.join(builddir, "conf/local.conf.bk")
+        self.tc_kwargs['init']['config_paths']['bblayers'] = \
+                os.path.join(builddir, "conf/bblayers.conf")
+        self.tc_kwargs['init']['config_paths']['bblayers_backup'] = \
+                os.path.join(builddir, "conf/bblayers.conf.orig")
+        self.tc_kwargs['init']['config_paths']['bblayers_class_backup'] = \
+                os.path.join(builddir, "conf/bblayers.conf.bk")
+
+        copyfile(self.tc_kwargs['init']['config_paths']['localconf'],
+                self.tc_kwargs['init']['config_paths']['localconf_backup'])
+        copyfile(self.tc_kwargs['init']['config_paths']['bblayers'], 
+                self.tc_kwargs['init']['config_paths']['bblayers_backup'])
 
     def _pre_run(self):
         def _check_required_env_variables(vars):
@@ -131,7 +154,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                     runCmd("bitbake-layers add-layer %s" %meta_selftestdir)
                     # reload data is needed because a meta-selftest layer was add
                     self.tc.td = get_bb_vars()
-                    self.tc.testlayer_path = get_test_layer()
+                    self.tc.config_paths['testlayer_path'] = get_test_layer()
                 else:
                     self.tc.logger.error("could not locate meta-selftest in:\n%s" % meta_selftestdir)
                     raise OEQAPreRun
@@ -184,41 +207,63 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             rc.logSummary(self.name)
 
         return rc
+
+    def _signal_clean_handler(self, signum, frame):
+        sys.exit(1)
     
     def run(self, logger, args):
         self._process_args(logger, args)
-        rc = None
 
-        if args.machine:
-            logger.info('Custom machine mode enabled. MACHINE set to %s' %
-                    args.machine)
+        signal.signal(signal.SIGTERM, self._signal_clean_handler)
 
-            if args.machine == 'all':
-                results = []
-                for m in self.tc_kwargs['init']['machines']:
-                    self.tc_kwargs['run']['machine'] = m
-                    results.append(self._internal_run(logger, args))
+        rc = None
+        try:
+            if args.machine:
+                logger.info('Custom machine mode enabled. MACHINE set to %s' %
+                        args.machine)
+
+                if args.machine == 'all':
+                    results = []
+                    for m in self.tc_kwargs['init']['machines']:
+                        self.tc_kwargs['run']['machine'] = m
+                        results.append(self._internal_run(logger, args))
+
+                        # XXX: the oe-selftest script only needs to know if one
+                        # machine run fails
+                        for r in results:
+                            rc = r
+                            if not r.wasSuccessful():
+                                break
 
-                    # XXX: the oe-selftest script only needs to know if one
-                    # machine run fails
-                    for r in results:
-                        rc = r
-                        if not r.wasSuccessful():
-                            break
+                else:
+                    self.tc_kwargs['run']['machine'] = args.machine
+                    return self._internal_run(logger, args)
 
             else:
                 self.tc_kwargs['run']['machine'] = args.machine
-                return self._internal_run(logger, args)
-
-        else:
-            self.tc_kwargs['run']['machine'] = args.machine
-            rc = self._internal_run(logger, args)
-
-        output_link = os.path.join(os.path.dirname(args.output_log),
-                "%s-results.log" % self.name)
-        if os.path.exists(output_link):
-            os.remove(output_link)
-        os.symlink(args.output_log, output_link)
+                rc = self._internal_run(logger, args)
+        finally:
+            config_paths = self.tc_kwargs['init']['config_paths']
+            if os.path.exists(config_paths['localconf_backup']):
+                copyfile(config_paths['localconf_backup'],
+                        config_paths['localconf'])
+                os.remove(config_paths['localconf_backup'])
+
+            if os.path.exists(config_paths['bblayers_backup']):
+                copyfile(config_paths['bblayers_backup'], 
+                        config_paths['bblayers'])
+                os.remove(config_paths['bblayers_backup'])
+
+            if os.path.exists(config_paths['localconf_class_backup']):
+                os.remove(config_paths['localconf_class_backup'])
+            if os.path.exists(config_paths['bblayers_class_backup']):
+                os.remove(config_paths['bblayers_class_backup'])
+
+            output_link = os.path.join(os.path.dirname(args.output_log),
+                    "%s-results.log" % self.name)
+            if os.path.exists(output_link):
+                os.remove(output_link)
+            os.symlink(args.output_log, output_link)
 
         return rc
 
-- 
2.11.0


