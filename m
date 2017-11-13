Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 50E3378684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 18:17:22 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 10:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,389,1505804400"; d="scan'208";a="175306638"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga005.fm.intel.com with ESMTP; 13 Nov 2017 10:17:24 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 10:17:20 -0800
Message-Id: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2 1/2] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Mon, 13 Nov 2017 18:17:23 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The main idea is to isolate the oe-selftest execution so neither the current
build dir nor the configuration data is touch/polluted. This approach uses
a wrapper script (which is the one presented on this commit) which creates
a unique directory and inside it copies all scripts and metadata, re-initializes
the enviroment (re-sources oe-init-build-env) and finally launches
the oe-selftest-internal (which used to be oe-selftest) command, passing command
arguments to the latter.

The new build directory created when re-initializing the enviroment has the
same configuration data (local.conf, auto.conf, site.conf) as the
main build directory. The latter means that one can set DL_DIR and SSTATE_DIR
into <main build dir>/conf/site.conf and the oe-selftest execution will use this.

[YOCTO #11429]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/oe-selftest          | 108 ++++++++++++++++++++++++-------------------
 scripts/oe-selftest-internal |  75 ++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+), 48 deletions(-)
 create mode 100755 scripts/oe-selftest-internal

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 1bf860a415..0505f943e4 100755
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
@@ -14,62 +16,72 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+
+# Before anything else, check oe-core environment
+if [ -z "$BUILDDIR" ]; then
+    echo "Please initialize the OE-Core environment through oe-init-build-env script"
+    exit 1
+fi
+
+# Variable definitions
+ORIGBUILDDIR="$BUILDDIR"
+OESELFTESTSCRIPTDIR="$(which oe-selftest)"
+SCRIPTSDIR="$(dirname $OESELFTESTSCRIPTDIR)"
+OECOREDIR="$(dirname $SCRIPTSDIR)"
 
-# DESCRIPTION
-# This script runs tests defined in meta/lib/oeqa/selftest/
-# It's purpose is to automate the testing of different bitbake tools.
-# To use it you just need to source your build environment setup script and
-# add the meta-selftest layer to your BBLAYERS.
-# Call the script as: "oe-selftest -a" to run all the tests in meta/lib/oeqa/selftest/
-# Call the script as: "oe-selftest -r <module>.<Class>.<method>" to run just a single test
-# E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
+# oe-selftest-$$ related
+OESELFTESTDIR="$ORIGBUILDDIR/oe-selftest-$$"
+OESELFTESTBUILDDIR="$OESELFTESTDIR/build"
 
+# Return immediately in case no test execution
+ADDTESTS="$(echo "$@" | grep -i '\-a')"
+SOMETESTS="$(echo "$@" | grep -i '\-r')"
+if [ -z "$ADDTESTS" -a -z "$SOMETESTS" ]; then
+    if [ -z "$@" ]; then
+	oe-selftest-internal -h
+    else
+	oe-selftest-internal "$@"
+    fi
+    exit 0
+fi
 
+# Create directories (build, build/conf and layers)
+mkdir -p $OESELFTESTDIR $OESELFTESTBUILDDIR/conf $OESELFTESTLAYERSDIR
 
-import os
-import sys
-import argparse
-import logging
+# Populate the new build/conf, bblayers.conf will be touch latter to reflect new layer structure
+cp $ORIGBUILDDIR/conf/* $OESELFTESTBUILDDIR/conf
 
-scripts_path = os.path.dirname(os.path.realpath(__file__))
-lib_path = scripts_path + '/lib'
-sys.path = sys.path + [lib_path]
-import argparse_oe
-import scriptutils
-import scriptpath
-scriptpath.add_oe_lib_path()
-scriptpath.add_bitbake_lib_path()
+# Copy OE-Core meta directories
+cp -a $OECOREDIR/meta-selftest  $OESELFTESTDIR
+cp -a $OECOREDIR/meta-skeleton  $OESELFTESTDIR
+cp -a $OECOREDIR/meta-yocto-bsp $OESELFTESTDIR
 
-from oeqa.utils import load_test_components
-from oeqa.core.exception import OEQAPreRun
+# Copy non-metadata files
+cp -a $OECOREDIR/bitbake        $OESELFTESTDIR
+cp -a $SCRIPTSDIR               $OESELFTESTDIR
+cp $OECOREDIR/oe-init-build-env $OESELFTESTDIR
+cp $OECOREDIR/.templateconf     $OESELFTESTDIR
 
-logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout)
+# Copy all layers define in BBLAYERS and construct the new bblayers.conf at the same time
+BBLAYERS="$(bitbake -e | grep ^BBLAYERS= | sed -e s/BBLAYERS=// -e s/\"//g)"
+for src in $BBLAYERS; do
+    cp -a $src $OESELFTESTDIR
+    # rename the new layer into the new bblayers.conf
+    tgt="$OESELFTESTDIR/$(basename $src)"
+    sed -e "s|$src|$tgt|" -i $OESELFTESTBUILDDIR/conf/bblayers.conf
+done
 
-def main():
-    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
-    parser = argparse_oe.ArgumentParser(description=description)
+# Reinitialized environment with new metadata and templateconf environement
+cd $OESELFTESTDIR
+source ./oe-init-build-env $OESELFTESTBUILDDIR
 
-    comp_name, comp = load_test_components(logger, 'oe-selftest').popitem()
-    comp.register_commands(logger, parser)
+# Execute the tests throught oe-selftest-internal
+oe-selftest-internal "$@"
 
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
diff --git a/scripts/oe-selftest-internal b/scripts/oe-selftest-internal
new file mode 100755
index 0000000000..cff2906763
--- /dev/null
+++ b/scripts/oe-selftest-internal
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
-- 
2.12.3


