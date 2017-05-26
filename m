Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F2133782E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887917"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:05 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:56 -0500
Message-Id: <7644270ef2be8d8cb98eff463339bf7739a79390.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 30/36] oeqa/selftest/case: Migrate case class to the new OEQA framework
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
X-List-Received-Date: Fri, 26 May 2017 20:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Summary of the changes:

- Use OETestCase as base class instead of unittest.TestCase
- Remove LogResults decorator the new framework provides logging into
  the core functionality.
- Logger is now self.logger instead of self.log
- Move comments into docstrings in several help methods
- Use get_test_layer() method instead of access monkey patched variable
  in old oeSelfTest case class.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 111 +++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 60 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 43a1951..95a8769 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -1,31 +1,19 @@
-# Copyright (c) 2013 Intel Corporation
-#
+# Copyright (C) 2013-2017 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
-
-# DESCRIPTION
-# Base class inherited by test classes in meta/lib/oeqa/selftest
-
-import unittest
-import os
 import sys
+import os
 import shutil
-import logging
+import glob
 import errno
-
-import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
-from oeqa.utils.decorators import LogResults
 from random import choice
-import glob
 from unittest.util import safe_repr
 
-@LogResults
-class oeSelfTest(unittest.TestCase):
-
-    log = logging.getLogger("selftest.base")
-    longMessage = True
+import oeqa.utils.ftools as ftools
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.core.case import OETestCase
 
+class OESelftestTestCase(OETestCase):
     def __init__(self, methodName="runTest"):
         self.builddir = os.environ.get("BUILDDIR")
         self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
@@ -36,23 +24,26 @@ class oeSelfTest(unittest.TestCase):
                                                   "conf/bblayers.bk")
         self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
         self.machineinc_path = os.path.join(self.builddir, "conf/machine.inc")
-        self.testlayer_path = oeSelfTest.testlayer_path
+        self.testlayer_path = get_test_layer()
         self._extra_tear_down_commands = []
         self._track_for_cleanup = [
             self.testinc_path, self.testinc_bblayers_path,
             self.machineinc_path, self.localconf_backup,
             self.local_bblayers_backup]
-        super(oeSelfTest, self).__init__(methodName)
+
+        super(OESelftestTestCase, self).__init__(methodName)
 
     def setUp(self):
+        super(OESelftestTestCase, self).setUp()
         os.chdir(self.builddir)
         # Check if local.conf or bblayers.conf files backup exists
         # from a previous failed test and restore them
         if os.path.isfile(self.localconf_backup) or os.path.isfile(
                 self.local_bblayers_backup):
-            self.log.debug("Found a local.conf and/or bblayers.conf backup \
-from a previously aborted test. Restoring these files now, but tests should \
-be re-executed from a clean environment to ensure accurate results.")
+            self.logger.debug("\
+Found a local.conf and/or bblayers.conf backup from a previously aborted test.\
+Restoring these files now, but tests should be re-executed from a clean environment\
+to ensure accurate results.")
             try:
                 shutil.copyfile(self.localconf_backup, self.localconf_path)
             except OSError as e:
@@ -67,9 +58,8 @@ be re-executed from a clean environment to ensure accurate results.")
         else:
             # backup local.conf and bblayers.conf
             shutil.copyfile(self.localconf_path, self.localconf_backup)
-            shutil.copyfile(self.local_bblayers_path,
-                            self.local_bblayers_backup)
-            self.log.debug("Creating local.conf and bblayers.conf backups.")
+            shutil.copyfile(self.local_bblayers_path, self.local_bblayers_backup)
+            self.logger.debug("Creating local.conf and bblayers.conf backups.")
         # we don't know what the previous test left around in config or inc files
         # if it failed so we need a fresh start
         try:
@@ -116,8 +106,8 @@ be re-executed from a clean environment to ensure accurate results.")
                 if not result.status ==  0:
                     failed_extra_commands.append(command)
             if failed_extra_commands:
-                self.log.warning("tearDown commands have failed: %s" % ', '.join(map(str, failed_extra_commands)))
-                self.log.debug("Trying to move on.")
+                self.logger.warning("tearDown commands have failed: %s" % ', '.join(map(str, failed_extra_commands)))
+                self.logger.debug("Trying to move on.")
             self._extra_tear_down_commands = []
 
         if self._track_for_cleanup:
@@ -129,90 +119,92 @@ be re-executed from a clean environment to ensure accurate results.")
             self._track_for_cleanup = []
 
         self.tearDownLocal()
+        super(OESelftestTestCase, self).tearDown()
 
     def tearDownLocal(self):
         pass
 
-    # add test specific commands to the tearDown method.
     def add_command_to_tearDown(self, command):
-        self.log.debug("Adding command '%s' to tearDown for this test." % command)
+        """Add test specific commands to the tearDown method"""
+        self.logger.debug("Adding command '%s' to tearDown for this test." % command)
         self._extra_tear_down_commands.append(command)
-    # add test specific files or directories to be removed in the tearDown method
+
     def track_for_cleanup(self, path):
-        self.log.debug("Adding path '%s' to be cleaned up when test is over" % path)
+        """Add test specific files or directories to be removed in the tearDown method"""
+        self.logger.debug("Adding path '%s' to be cleaned up when test is over" % path)
         self._track_for_cleanup.append(path)
 
-    # write to <builddir>/conf/selftest.inc
     def write_config(self, data):
-        self.log.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
+        """Write to <builddir>/conf/selftest.inc"""
+
+        self.logger.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
         ftools.write_file(self.testinc_path, data)
 
         custommachine = os.getenv('CUSTOMMACHINE')
         if custommachine and 'MACHINE' in data:
             machine = get_bb_var('MACHINE')
-            self.log.warning('MACHINE overridden: %s' % machine)
+            self.logger.warning('MACHINE overridden: %s' % machine)
 
-    # append to <builddir>/conf/selftest.inc
     def append_config(self, data):
-        self.log.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
+        """Append to <builddir>/conf/selftest.inc"""
+        self.logger.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
         ftools.append_file(self.testinc_path, data)
 
         custommachine = os.getenv('CUSTOMMACHINE')
         if custommachine and 'MACHINE' in data:
             machine = get_bb_var('MACHINE')
-            self.log.warning('MACHINE overridden: %s' % machine)
+            self.logger.warning('MACHINE overridden: %s' % machine)
 
-    # remove data from <builddir>/conf/selftest.inc
     def remove_config(self, data):
-        self.log.debug("Removing from: %s\n%s\n" % (self.testinc_path, data))
+        """Remove data from <builddir>/conf/selftest.inc"""
+        self.logger.debug("Removing from: %s\n%s\n" % (self.testinc_path, data))
         ftools.remove_from_file(self.testinc_path, data)
 
-    # write to meta-sefltest/recipes-test/<recipe>/test_recipe.inc
     def write_recipeinc(self, recipe, data):
+        """Write to meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
         inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
-        self.log.debug("Writing to: %s\n%s\n" % (inc_file, data))
+        self.logger.debug("Writing to: %s\n%s\n" % (inc_file, data))
         ftools.write_file(inc_file, data)
 
-    # append data to meta-sefltest/recipes-test/<recipe>/test_recipe.inc
     def append_recipeinc(self, recipe, data):
+        """Append data to meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
         inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
-        self.log.debug("Appending to: %s\n%s\n" % (inc_file, data))
+        self.logger.debug("Appending to: %s\n%s\n" % (inc_file, data))
         ftools.append_file(inc_file, data)
 
-    # remove data from meta-sefltest/recipes-test/<recipe>/test_recipe.inc
     def remove_recipeinc(self, recipe, data):
+        """Remove data from meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
         inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
-        self.log.debug("Removing from: %s\n%s\n" % (inc_file, data))
+        self.logger.debug("Removing from: %s\n%s\n" % (inc_file, data))
         ftools.remove_from_file(inc_file, data)
 
-    # delete meta-sefltest/recipes-test/<recipe>/test_recipe.inc file
     def delete_recipeinc(self, recipe):
+        """Delete meta-sefltest/recipes-test/<recipe>/test_recipe.inc file"""
         inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
-        self.log.debug("Deleting file: %s" % inc_file)
+        self.logger.debug("Deleting file: %s" % inc_file)
         try:
             os.remove(inc_file)
         except OSError as e:
             if e.errno != errno.ENOENT:
                 raise
-
-    # write to <builddir>/conf/bblayers.inc
     def write_bblayers_config(self, data):
-        self.log.debug("Writing to: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        """Write to <builddir>/conf/bblayers.inc"""
+        self.logger.debug("Writing to: %s\n%s\n" % (self.testinc_bblayers_path, data))
         ftools.write_file(self.testinc_bblayers_path, data)
 
-    # append to <builddir>/conf/bblayers.inc
     def append_bblayers_config(self, data):
-        self.log.debug("Appending to: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        """Append to <builddir>/conf/bblayers.inc"""
+        self.logger.debug("Appending to: %s\n%s\n" % (self.testinc_bblayers_path, data))
         ftools.append_file(self.testinc_bblayers_path, data)
 
-    # remove data from <builddir>/conf/bblayers.inc
     def remove_bblayers_config(self, data):
-        self.log.debug("Removing from: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        """Remove data from <builddir>/conf/bblayers.inc"""
+        self.logger.debug("Removing from: %s\n%s\n" % (self.testinc_bblayers_path, data))
         ftools.remove_from_file(self.testinc_bblayers_path, data)
 
-    # write to <builddir>/conf/machine.inc
     def set_machine_config(self, data):
-        self.log.debug("Writing to: %s\n%s\n" % (self.machineinc_path, data))
+        """Write to <builddir>/conf/machine.inc"""
+        self.logger.debug("Writing to: %s\n%s\n" % (self.machineinc_path, data))
         ftools.write_file(self.machineinc_path, data)
 
     # check does path exist    
@@ -227,7 +219,6 @@ be re-executed from a clean environment to ensure accurate results.")
             msg = self._formatMessage(msg, "%s exists when it should not" % safe_repr(expr))
             raise self.failureException(msg)
 
-
 def get_available_machines():
     # Get a list of all available machines
     bbpath = get_bb_var('BBPATH').split(':')
@@ -237,7 +228,7 @@ def get_available_machines():
         found_machines = glob.glob(os.path.join(path, 'conf', 'machine', '*.conf'))
         if found_machines:
             for i in found_machines:
-                # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
+            # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
                 machines.append(os.path.splitext(os.path.basename(i))[0])
 
     return machines
-- 
2.1.4


