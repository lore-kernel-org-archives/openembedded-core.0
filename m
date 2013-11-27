Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 54FCD6D87D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:08:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2013 09:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,783,1378882800"; d="scan'208";a="441131525"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2013 09:08:12 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 708366A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:08:10 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 19:08:50 +0200
Message-Id: <56375857353c273ddcfd8f6ae0fbf0df96d6f9e0.1385571298.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/4] scripts/oe-selftest: script to run builds as unittest against bitbake or various scripts
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
X-List-Received-Date: Wed, 27 Nov 2013 17:08:31 -0000

The purpose of oe-selftest is to run unittest modules added from meta/lib/oeqa/selftest,
which are tests against bitbake tools.

Right now the script it's useful for simple tests like:
  - "bitbake --someoption, change some metadata, bitbake X, check something" type scenarios (PR service, error output, etc)
  - or "bitbake-layers <...>" type scripts and yocto-bsp tools.

This commit also adds some helper modules that the tests will use and a base class.
Also, most of the tests will have a dependency on a meta-selftest layer
which contains specially modified recipes/bbappends/include files for the purpose of the tests.
The tests themselves will usually write to ".inc" files from the layer or in conf/selftest.inc
(which is added as an include in local.conf at the start and removed at the end)

It's a simple matter or sourcing the enviroment, adding the meta-selftest layer to bblayers.conf
and running: oe-selftest to get some results. It would finish faster if at least a core-image-minimal
was built before.

[ YOCTO #4740 ]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/__init__.py |   2 +
 meta/lib/oeqa/selftest/base.py     |  98 ++++++++++++++++++++++++
 meta/lib/oeqa/utils/commands.py    | 137 ++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/ftools.py      |  27 +++++++
 scripts/oe-selftest                | 148 +++++++++++++++++++++++++++++++++++++
 5 files changed, 412 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/__init__.py
 create mode 100644 meta/lib/oeqa/selftest/base.py
 create mode 100644 meta/lib/oeqa/utils/commands.py
 create mode 100644 meta/lib/oeqa/utils/ftools.py
 create mode 100755 scripts/oe-selftest

diff --git a/meta/lib/oeqa/selftest/__init__.py b/meta/lib/oeqa/selftest/__init__.py
new file mode 100644
index 0000000..3ad9513
--- /dev/null
+++ b/meta/lib/oeqa/selftest/__init__.py
@@ -0,0 +1,2 @@
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
new file mode 100644
index 0000000..30a71e8
--- /dev/null
+++ b/meta/lib/oeqa/selftest/base.py
@@ -0,0 +1,98 @@
+# Copyright (c) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+
+# DESCRIPTION
+# Base class inherited by test classes in meta/lib/selftest
+
+import unittest
+import os
+import sys
+import logging
+import errno
+
+import oeqa.utils.ftools as ftools
+
+
+class oeSelfTest(unittest.TestCase):
+
+    log = logging.getLogger("selftest.base")
+    longMessage = True
+
+    def __init__(self, methodName="runTest"):
+        self.builddir = os.environ.get("BUILDDIR")
+        self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
+        self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
+        self.testlayer_path = oeSelfTest.testlayer_path
+        super(oeSelfTest, self).__init__(methodName)
+
+    def setUp(self):
+        os.chdir(self.builddir)
+        # we don't know what the previous test left around in config or inc files
+        # if it failed so we need a fresh start
+        try:
+            os.remove(self.testinc_path)
+        except OSError as e:
+            if e.errno != errno.ENOENT:
+                raise
+        for root, _, files in os.walk(self.testlayer_path):
+            for f in files:
+                if f == 'test_recipe.inc':
+                    os.remove(os.path.join(root, f))
+        # tests might need their own setup
+        # but if they overwrite this one they have to call
+        # super each time, so let's give them an alternative
+        self.setUpLocal()
+
+    def setUpLocal(self):
+        pass
+
+    def tearDown(self):
+        self.tearDownLocal()
+
+    def tearDownLocal(self):
+        pass
+
+    # write to <builddir>/conf/selftest.inc
+    def write_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
+        ftools.write_file(self.testinc_path, data)
+
+    # append to <builddir>/conf/selftest.inc
+    def append_config(self, data):
+        self.log.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
+        ftools.append_file(self.testinc_path, data)
+
+    # remove data from <builddir>/conf/selftest.inc
+    def remove_config(self, data):
+        self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_path, data))
+        ftools.remove_from_file(self.testinc_path, data)
+
+    # write to meta-sefltest/recipes-test/<recipe>/test_recipe.inc
+    def write_recipeinc(self, recipe, data):
+        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        self.log.debug("Writing to: %s\n%s\n" % (inc_file, data))
+        ftools.write_file(inc_file, data)
+
+    # append data to meta-sefltest/recipes-test/<recipe>/test_recipe.inc
+    def append_recipeinc(self, recipe, data):
+        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        self.log.debug("Appending to: %s\n%s\n" % (inc_file, data))
+        ftools.append_file(inc_file, data)
+
+    # remove data from meta-sefltest/recipes-test/<recipe>/test_recipe.inc
+    def remove_recipeinc(self, recipe, data):
+        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        self.log.debug("Removing from: %s\n%s\n" % (inc_file, data))
+        ftools.remove_from_file(inc_file, data)
+
+    # delete meta-sefltest/recipes-test/<recipe>/test_recipe.inc file
+    def delete_recipeinc(self, recipe):
+        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        self.log.debug("Deleting file: %s" % inc_file)
+        try:
+            os.remove(self.testinc_path)
+        except OSError as e:
+            if e.errno != errno.ENOENT:
+                raise
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
new file mode 100644
index 0000000..9b42620
--- /dev/null
+++ b/meta/lib/oeqa/utils/commands.py
@@ -0,0 +1,137 @@
+# Copyright (c) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# DESCRIPTION
+# This module is mainly used by scripts/oe-selftest and modules under meta/oeqa/selftest
+# It provides a class and methods for running commands on the host in a convienent way for tests.
+
+
+
+import os
+import sys
+import signal
+import subprocess
+import threading
+import logging
+
+class Command(object):
+    def __init__(self, command, bg=False, timeout=None, data=None, **options):
+
+        self.defaultopts = {
+            "stdout": subprocess.PIPE,
+            "stderr": subprocess.STDOUT,
+            "stdin": None,
+            "shell": False,
+            "bufsize": -1,
+        }
+
+        self.cmd = command
+        self.bg = bg
+        self.timeout = timeout
+        self.data = data
+
+        self.options = dict(self.defaultopts)
+        if isinstance(self.cmd, basestring):
+            self.options["shell"] = True
+        if self.data:
+            self.options['stdin'] = subprocess.PIPE
+        self.options.update(options)
+
+        self.status = None
+        self.output = None
+        self.error = None
+        self.thread = None
+
+        self.log = logging.getLogger("utils.commands")
+
+    def run(self):
+        self.process = subprocess.Popen(self.cmd, **self.options)
+
+        def commThread():
+            self.output, self.error = self.process.communicate(self.data)
+
+        self.thread = threading.Thread(target=commThread)
+        self.thread.start()
+
+        self.log.debug("Running command '%s'" % self.cmd)
+
+        if not self.bg:
+            self.thread.join(self.timeout)
+            self.stop()
+
+    def stop(self):
+        if self.thread.isAlive():
+            self.process.terminate()
+            # let's give it more time to terminate gracefully before killing it
+            self.thread.join(5)
+            if self.thread.isAlive():
+                self.process.kill()
+                self.thread.join()
+
+        self.output = self.output.rstrip()
+        self.status = self.process.poll()
+
+        self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
+        # logging the complete output is insane
+        # bitbake -e output is really big
+        # and makes the log file useless
+        if self.status:
+            lout = "\n".join(self.output.splitlines()[-20:])
+            self.log.debug("Last 20 lines:\n%s" % lout)
+
+
+class Result(object):
+    pass
+
+def runCmd(command, ignore_status=False, timeout=None, **options):
+
+    result = Result()
+
+    cmd = Command(command, timeout=timeout, **options)
+    cmd.run()
+
+    result.command = command
+    result.status = cmd.status
+    result.output = cmd.output
+    result.pid = cmd.process.pid
+
+    if result.status and not ignore_status:
+        raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, result.output))
+
+    return result
+
+
+def bitbake(command, ignore_status=False, timeout=None, **options):
+    if isinstance(command, basestring):
+        cmd = "bitbake " + command
+    else:
+        cmd = [ "bitbake" ] + command
+
+    return runCmd(cmd, ignore_status, timeout, **options)
+
+
+def get_bb_env(target=None):
+    if target:
+        return runCmd("bitbake -e %s" % target).output
+    else:
+        return runCmd("bitbake -e").output
+
+def get_bb_var(var, target=None):
+    val = None
+    bbenv = get_bb_env(target)
+    for line in bbenv.splitlines():
+        if line.startswith(var + "="):
+            val = line.split('=')[1]
+            val = val.replace('\"','')
+            break
+    return val
+
+def get_test_layer():
+    layers = get_bb_var("BBLAYERS").split()
+    testlayer = None
+    for l in layers:
+        if "/meta-selftest" in l and os.path.isdir(l):
+            testlayer = l
+            break
+    return testlayer
diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
new file mode 100644
index 0000000..64ebe3d
--- /dev/null
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -0,0 +1,27 @@
+import os
+import re
+
+def write_file(path, data):
+    wdata = data.rstrip() + "\n"
+    with open(path, "w") as f:
+        f.write(wdata)
+
+def append_file(path, data):
+    wdata = data.rstrip() + "\n"
+    with open(path, "a") as f:
+            f.write(wdata)
+
+def read_file(path):
+    data = None
+    with open(path) as f:
+        data = f.read()
+    return data
+
+def remove_from_file(path, data):
+    lines = read_file(path).splitlines()
+    rmdata = data.strip().splitlines()
+    for l in rmdata:
+        for c in range(0, lines.count(l)):
+            i = lines.index(l)
+            del(lines[i])
+    write_file(path, "\n".join(lines))
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
new file mode 100755
index 0000000..db42e73
--- /dev/null
+++ b/scripts/oe-selftest
@@ -0,0 +1,148 @@
+#!/usr/bin/env python
+
+# Copyright (c) 2013 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+# DESCRIPTION
+# This script runs tests defined in meta/lib/selftest/
+# It's purpose is to automate the testing of different bitbake tools.
+# To use it you just need to source your build environment setup script and
+# add the meta-selftest layer to your BBLAYERS.
+# Call the script as: "oe-selftest" to run all the tests in in meta/lib/selftest/
+# Call the script as: "oe-selftest <module>.<Class>.<method>" to run just a single test
+# E.g: "oe-selftest bboutput.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/selftest/bboutput.py
+
+
+import os
+import sys
+import unittest
+import logging
+
+sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'meta/lib')))
+
+import oeqa.selftest
+import oeqa.utils.ftools as ftools
+from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
+from oeqa.selftest.base import oeSelfTest
+
+def logger_create():
+    log = logging.getLogger("selftest")
+    log.setLevel(logging.DEBUG)
+
+    fh = logging.FileHandler(filename='oe-selftest.log', mode='w')
+    fh.setLevel(logging.DEBUG)
+
+    ch = logging.StreamHandler(sys.stdout)
+    ch.setLevel(logging.INFO)
+
+    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
+    fh.setFormatter(formatter)
+    ch.setFormatter(formatter)
+
+    log.addHandler(fh)
+    log.addHandler(ch)
+
+    return log
+
+log = logger_create()
+
+def preflight_check():
+
+    log.info("Checking that everything is in order before running the tests")
+
+    if not os.environ.get("BUILDDIR"):
+        log.error("BUILDDIR isn't set. Did you forget to source your build environment setup script?")
+        return False
+
+    builddir = os.environ.get("BUILDDIR")
+    if os.getcwd() != builddir:
+        log.info("Changing cwd to %s" % builddir)
+        os.chdir(builddir)
+
+    if not "meta-selftest" in get_bb_var("BBLAYERS"):
+        log.error("You don't seem to have the meta-selftest layer in BBLAYERS")
+        return False
+
+    log.info("Running bitbake -p")
+    runCmd("bitbake -p")
+
+    return True
+
+def add_include():
+    builddir = os.environ.get("BUILDDIR")
+    if "#include added by oe-selftest.py" \
+        not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
+            log.info("Adding: \"include selftest.inc\" in local.conf")
+            ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
+                    "\n#include added by oe-selftest.py\ninclude selftest.inc")
+
+
+def remove_include():
+    builddir = os.environ.get("BUILDDIR")
+    if "#include added by oe-selftest.py" \
+        in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
+            log.info("Removing the include from local.conf")
+            ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
+                    "#include added by oe-selftest.py\ninclude selftest.inc")
+
+def get_tests():
+    testslist = []
+    for x in sys.argv[1:]:
+        testslist.append('oeqa.selftest.' + x)
+    if not testslist:
+        testpath = os.path.abspath(os.path.dirname(oeqa.selftest.__file__))
+        files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not f.startswith('_') and f != 'base.py'])
+        for f in files:
+            module = 'oeqa.selftest.' + f[:-3]
+            testslist.append(module)
+
+    return testslist
+
+def main():
+    if not preflight_check():
+        return 1
+
+    testslist = get_tests()
+    suite = unittest.TestSuite()
+    loader = unittest.TestLoader()
+    loader.sortTestMethodsUsing = None
+    runner = unittest.TextTestRunner(verbosity=2)
+    # we need to do this here, otherwise just loading the tests
+    # will take 2 minutes (bitbake -e calls)
+    oeSelfTest.testlayer_path = get_test_layer()
+    for test in testslist:
+        log.info("Loading tests from: %s" % test)
+        try:
+            suite.addTests(loader.loadTestsFromName(test))
+        except AttributeError as e:
+            log.error("Failed to import %s" % test)
+            log.error(e)
+            return 1
+    add_include()
+    result = runner.run(suite)
+    log.info("Finished")
+
+    return 0
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    finally:
+        remove_include()
+    sys.exit(ret)
-- 
1.8.3.1


