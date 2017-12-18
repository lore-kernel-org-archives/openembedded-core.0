Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C98D277BEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:43:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 09:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,422,1508828400"; 
   d="scan'208";a="3707872"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga007.jf.intel.com with ESMTP; 18 Dec 2017 09:43:50 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 09:43:46 -0800
Message-Id: <20171218174347.92919-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2 1/2] scripts/oe-selftest: isolate oe-selftest execution
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
X-List-Received-Date: Mon, 18 Dec 2017 17:43:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The main idea is to isolate the oe-selftest execution so neither the current
build directory, configuration nor environment is use when executing the
selftests.

The approach uses 'oe-selftest' as a wrapper scripts with once all isolation
setup is done, it calls 'scripts/lib/oe-selftest-internal',
the latter is exactly what it is used to be oe-selftest. By isolation in this
context, we mean the following: creation of a unique directory (base on PID),
re-initializes the environment (re-sources oe-init-build-env)
and finally launches the the internal oe-selftest script.

The new build directory (created by oe-init-build-env, on top of the isolated dir)
has the same configuration data (local.conf, auto.conf, site.conf) as the
current one. Also, the variables DL_DIR and SSTATE_DIR are passed to
the new environment, effectively reusing these two directories and not impacting
performance.

This new wrapper allows to launch multiple 'oe-selftest -r XXX' jobs, each
running a certain module/class/unittest, easily allowing tools like GNU parallel
to run jobs in parallel (see scripts/contrib/parallel-oe-selftest.sh)

[YOCTO #11429]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/oe-selftest-internal | 75 +++++++++++++++++++++++++++++++
 scripts/oe-selftest              | 97 ++++++++++++++++++++--------------------
 2 files changed, 124 insertions(+), 48 deletions(-)
 create mode 100755 scripts/lib/oe-selftest-internal

diff --git a/scripts/lib/oe-selftest-internal b/scripts/lib/oe-selftest-internal
new file mode 100755
index 0000000000..cff2906763
--- /dev/null
+++ b/scripts/lib/oe-selftest-internal
@@ -0,0 +1,75 @@
+#!/usr/bin/env python3
+
+# Copyright (c) 2013-2017 Intel Corporation
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
+# This script runs tests defined in meta/lib/oeqa/selftest/
+# It's purpose is to automate the testing of different bitbake tools.
+# To use it you just need to source your build environment setup script and
+# add the meta-selftest layer to your BBLAYERS.
+# Call the script as: "oe-selftest -a" to run all the tests in meta/lib/oeqa/selftest/
+# Call the script as: "oe-selftest -r <module>.<Class>.<method>" to run just a single test
+# E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
+
+
+
+import os
+import sys
+import argparse
+import logging
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import argparse_oe
+import scriptutils
+import scriptpath
+scriptpath.add_oe_lib_path()
+scriptpath.add_bitbake_lib_path()
+
+from oeqa.utils import load_test_components
+from oeqa.core.exception import OEQAPreRun
+
+logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout)
+
+def main():
+    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
+    parser = argparse_oe.ArgumentParser(prog='oe-selftest', description=description)
+
+    comp_name, comp = load_test_components(logger, 'oe-selftest').popitem()
+    comp.register_commands(logger, parser)
+
+    try:
+        args = parser.parse_args()
+        results = args.func(logger, args)
+        ret = 0 if results.wasSuccessful() else 1
+    except SystemExit as err:
+        if err.code != 0:
+            raise err
+        ret = err.code
+    except OEQAPreRun as pr:
+        ret = 1
+
+    return ret
+
+if __name__ == '__main__':
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 1bf860a415..30bc797605 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -1,5 +1,7 @@
-#!/usr/bin/env python3
+#!/bin/sh
 
+# scripts/oe-selftest: calls oe-selftest-internal in a isolated environment
+#
 # Copyright (c) 2013-2017 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
@@ -14,62 +16,61 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Description: this script can be seen as a simple wrapper for scripts/lib/oe-selftest-internal,
+# however before calling the latter, it prepares the environment so that it runs
+# in a separate and unique build directory. With this idea,  multiple oe-selftest can
+# be launched simultaneously, reducing significantly the execution times.
 
-# DESCRIPTION
-# This script runs tests defined in meta/lib/oeqa/selftest/
-# It's purpose is to automate the testing of different bitbake tools.
-# To use it you just need to source your build environment setup script and
-# add the meta-selftest layer to your BBLAYERS.
-# Call the script as: "oe-selftest -a" to run all the tests in meta/lib/oeqa/selftest/
-# Call the script as: "oe-selftest -r <module>.<Class>.<method>" to run just a single test
-# E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
+# Before anything else, check oe-core environment and quit if this has not been set
+if [ -z "$BUILDDIR" ]; then
+    echo "Please initialize the OE-Core environment through oe-init-build-env script"
+    exit 1
+fi
 
+# Variable definitions
+ORIGBUILDDIR="$BUILDDIR"
+OESELFTESTSCRIPTDIR="$(which oe-selftest)"
+SCRIPTSDIR="$(dirname $OESELFTESTSCRIPTDIR)"
+OECOREDIR="$(dirname $SCRIPTSDIR)"
 
+# oe-selftest-$$ related
+OESELFTESTDIR="$ORIGBUILDDIR/oe-selftest-$$"
+OESELFTESTBUILDDIR="$OESELFTESTDIR/build"
 
-import os
-import sys
-import argparse
-import logging
+ADDTESTS="$(echo "$@"  | egrep '\-\-run\-all\-tests|\-a')"
+SOMETESTS="$(echo "$@" | egrep '\-\-run\-tests|\-r')"
+SKIPTESTS="$(echo "$@" | egrep '\-\-skip\-test|\-R')"
+# Run the desired non-execution command, no need to isolate the environment
+if [ -z "${ADDTESTS}${SOMETESTS}${SKIPTESTS}" ]; then
+    if [ -z "$@" ]; then
+	$SCRIPTSDIR/lib/oe-selftest-internal -h
+    else
+	$SCRIPTSDIR/lib/oe-selftest-internal "$@"
+    fi
+    exit 0
+fi
 
-scripts_path = os.path.dirname(os.path.realpath(__file__))
-lib_path = scripts_path + '/lib'
-sys.path = sys.path + [lib_path]
-import argparse_oe
-import scriptutils
-import scriptpath
-scriptpath.add_oe_lib_path()
-scriptpath.add_bitbake_lib_path()
+# Create isolated directories (build, build/conf and layers)
+mkdir -p $OESELFTESTDIR $OESELFTESTBUILDDIR/conf $OESELFTESTLAYERSDIR
 
-from oeqa.utils import load_test_components
-from oeqa.core.exception import OEQAPreRun
+# Populate the new build/conf, bblayers.conf will be touch latter to reflect new layer structure
+cp $ORIGBUILDDIR/conf/*.conf $OESELFTESTBUILDDIR/conf
 
-logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout)
+# respect current DL_DIR and SSTATE_DIR
+for var in DL_DIR SSTATE_DIR; do
+    echo  "$(bitbake -e | grep ^$var)" >> $OESELFTESTDIR/site.conf
+done
 
-def main():
-    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
-    parser = argparse_oe.ArgumentParser(description=description)
+# Reinitialized environment with new metadata and templateconf environement
+. $OECOREDIR/oe-init-build-env $OESELFTESTBUILDDIR
 
-    comp_name, comp = load_test_components(logger, 'oe-selftest').popitem()
-    comp.register_commands(logger, parser)
+# Execute the tests throught oe-selftest-internal
+$OECOREDIR/scripts/lib/oe-selftest-internal "$@"
 
-    try:
-        args = parser.parse_args()
-        results = args.func(logger, args)
-        ret = 0 if results.wasSuccessful() else 1
-    except SystemExit as err:
-        if err.code != 0:
-            raise err
-        ret = err.code
-    except OEQAPreRun as pr:
-        ret = 1
+OESELFTESTRC="$?"
 
-    return ret
+# Echo working folder
+echo -e "\nAll work done under $OESELFTESTDIR\n"
 
-if __name__ == '__main__':
-    try:
-        ret = main()
-    except Exception:
-        ret = 1
-        import traceback
-        traceback.print_exc()
-    sys.exit(ret)
+exit $OESELFTESTRC
-- 
2.12.3


