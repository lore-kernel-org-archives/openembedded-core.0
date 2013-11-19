Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E02D61957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 15:43:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2013 07:43:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="411206154"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 19 Nov 2013 07:43:01 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id A238E6A400F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 07:42:59 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:43:34 +0200
Message-Id: <37ad9a7558870b29c88bd64190de629ab81ab319.1384874570.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 1/4] scripts/oe-selftest: script to run builds as unitests against bitbake or various scripts
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
X-List-Received-Date: Tue, 19 Nov 2013 15:43:26 -0000

The purpose of oe-selftest is to run unittest modules added in scripts/lib/selftest/tests,
which are tests against bitbake tools.
The scripts/lib/selftest/tests path for tests is only temporary.
Tests probably will be moved to meta/lib/oeqa/<something> once we've worked out how that can work.
(the reason to have them there is to allow layers to add their own tests).

Right now the script it's useful for simple tests like:
  - "bitbake --someoption, change some metadata, bitbake X, check something" type scenarios (PR service, error output, etc)
  - or "bitbake-layers <...>" type scripts and yocto-bsp tools.
This commit also adds some helper methods that the tests will use (which are currently used by the script itself,
and those also need to move if the tests move).

Also, most of the tests will have a dependency on a meta-selftest layer
which contains specially modified recipes/bbappends/include files for the purpose of the tests.

It's a simple matter or sourcing the enviroment, adding the meta-selftest layer
and running: oe-selftest to get some results.

[ YOCTO #4740 ]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/lib/selftest/__init__.py       |   0
 scripts/lib/selftest/base.py           |  54 ++++++++++++
 scripts/lib/selftest/tests/__init__.py |   0
 scripts/lib/selftest/utils/__init__.py |   0
 scripts/lib/selftest/utils/commands.py | 146 +++++++++++++++++++++++++++++++++
 scripts/lib/selftest/utils/ftools.py   |  27 ++++++
 scripts/oe-selftest                    | 130 +++++++++++++++++++++++++++++
 7 files changed, 357 insertions(+)
 create mode 100644 scripts/lib/selftest/__init__.py
 create mode 100644 scripts/lib/selftest/base.py
 create mode 100644 scripts/lib/selftest/tests/__init__.py
 create mode 100644 scripts/lib/selftest/utils/__init__.py
 create mode 100644 scripts/lib/selftest/utils/commands.py
 create mode 100644 scripts/lib/selftest/utils/ftools.py
 create mode 100755 scripts/oe-selftest

diff --git a/scripts/lib/selftest/__init__.py b/scripts/lib/selftest/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/selftest/base.py b/scripts/lib/selftest/base.py
new file mode 100644
index 0000000..4d90828
--- /dev/null
+++ b/scripts/lib/selftest/base.py
@@ -0,0 +1,54 @@
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
+# Base class inherited by test classes in scripts/lib/selftest/tests
+
+import unittest
+import os
+import sys
+import logging
+
+import selftest.utils.ftools as ftools
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
+        super(oeSelfTest, self).__init__(methodName)
+
+    def setUp(self):
+        os.chdir(self.builddir)
+        # we don't know what the previous test set in here, we need a fresh start
+        if os.path.isfile(self.testinc_path):
+            os.remove(self.testinc_path)
+
+    def write_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.testinc_path, data))
+        ftools.write_file(self.testinc_path, data)
+
+    def append_config(self, data):
+        self.log.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
+        ftools.append_file(self.testinc_path, data)
+
+    def remove_config(self, data):
+        self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_path, data))
+        ftools.remove_from_file(self.testinc_path, data)
diff --git a/scripts/lib/selftest/tests/__init__.py b/scripts/lib/selftest/tests/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/selftest/utils/__init__.py b/scripts/lib/selftest/utils/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/selftest/utils/commands.py b/scripts/lib/selftest/utils/commands.py
new file mode 100644
index 0000000..c808927
--- /dev/null
+++ b/scripts/lib/selftest/utils/commands.py
@@ -0,0 +1,146 @@
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
+# This module is mainly used by scripts/oe-selftest and modules under scripts/lib/selftest
+# It provides a class and methods for running commands on the host in a convienent way for tests.
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
+        self.log = logging.getLogger("selftest.commands")
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
+        raise Exception("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, result.output))
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
diff --git a/scripts/lib/selftest/utils/ftools.py b/scripts/lib/selftest/utils/ftools.py
new file mode 100644
index 0000000..64ebe3d
--- /dev/null
+++ b/scripts/lib/selftest/utils/ftools.py
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
index 0000000..2d4d4aa
--- /dev/null
+++ b/scripts/oe-selftest
@@ -0,0 +1,130 @@
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
+# This script runs tests defined in scripts/lib/selftest/tests
+# It's purpose is to automate the testing of different bitbake tools.
+# To use it you just need to source your build environment setup script and
+# add the meta-selftest layer to your BBLAYERS.
+# Call the script as: "oe-selftest" to run all the tests in in scripts/lib/selftest/tests.
+# Call the script as: "oe-selftest <module>.<Class>.<method>" to run just a single test
+# E.g: "oe-selftest bboutput.BitbakeLayers" will run just the BitbakeLayers class in scripts/lib/selftest/tests/bboutput.py
+
+
+import os
+import sys
+import unittest
+import logging
+
+sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'lib'))
+
+from selftest.utils.commands import runCmd, get_bb_var
+import selftest.utils.ftools as ftools
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
+def main():
+
+    if not preflight_check():
+        return 1
+
+    tests_list = []
+    for x in sys.argv[1:]:
+        tests_list.append("selftest.tests." + x)
+    if not tests_list:
+        tests_list.append("selftest.tests")
+
+    suite = unittest.TestSuite()
+    loader = unittest.TestLoader()
+    loader.sortTestMethodsUsing = None
+    runner = unittest.TextTestRunner(verbosity=2)
+    log.info("Running tests from: %s" % " ".join(tests_list))
+    suite = loader.loadTestsFromNames(tests_list)
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


