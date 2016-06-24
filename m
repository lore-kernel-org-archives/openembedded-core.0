Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD1573CF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410472"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:25 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:41 +0300
Message-Id: <1466764661-24544-29-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 28/28] scripts/contrib: introduce build-perf-test-wrapper.sh
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:27 -0000

A shell script wrapper around oe-build-perf-test script. The purpose of
this wrapper is to act as a executor script, making it possible to run
the tests with a single command. The wrapper script initializes the
build environment, runs oe-build-perf-test and archives the results.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 102 +++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100755 scripts/contrib/build-perf-test-wrapper.sh

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
new file mode 100755
index 0000000..e8e8021
--- /dev/null
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -0,0 +1,102 @@
+#!/bin/bash
+#
+# Build performance test script wrapper
+#
+# Copyright (c) 2016, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+#
+# This script is a simple wrapper around the actual build performance tester
+# script. This script initializes the build environment, runs
+# oe-build-perf-test and archives the results.
+
+script=`basename $0`
+usage () {
+    echo "Usage: $script [COMMITISH]"
+}
+
+if [ $# -gt 1 ]; then
+    usage
+    exit 1
+fi
+commitish=$1
+
+echo "Running on `uname -n`"
+
+if ! git_topdir=$(git rev-parse --show-toplevel); then
+        echo "The current working dir doesn't seem to be a git clone. Please cd there before running `basename $0`"
+        exit 1
+fi
+
+cd "$git_topdir"
+
+if [ -n "$commitish" ]; then
+    # Checkout correct revision
+    echo "Checking out $commitish"
+    git fetch &> /dev/null
+    git checkout HEAD^0 &> /dev/null
+    git branch -D $commitish &> /dev/null
+    if ! git checkout -f $commitish &> /dev/null; then
+        echo "Git checkout failed"
+        exit 1
+    fi
+fi
+
+# Setup build environment
+timestamp=`date "+%Y%m%d%H%M%S"`
+git_rev=$(git rev-parse --short HEAD)  || exit 1
+base_dir="$git_topdir/build-perf-test"
+build_dir="$base_dir/build-$git_rev-$timestamp"
+results_dir="$base_dir/results-$git_rev-$timestamp"
+globalres_log="$base_dir/globalres.log"
+
+mkdir -p "$base_dir"
+source ./oe-init-build-env $build_dir >/dev/null || exit 1
+
+# Additional config
+auto_conf="$build_dir/conf/auto.conf"
+echo 'MACHINE = "qemux86"' > "$auto_conf"
+echo 'BB_NUMBER_THREADS = "8"' >> "$auto_conf"
+echo 'PARALLEL_MAKE = "-j 8"' >> "$auto_conf"
+echo "DL_DIR = \"$base_dir/downloads\"" >> "$auto_conf"
+# Disabling network sanity check slightly reduces the variance of timing results
+echo 'CONNECTIVITY_CHECK_URIS = ""' >> "$auto_conf"
+# Possibility to define extra settings
+if [ -f "$base_dir/auto.conf.extra" ]; then
+    cat "$base_dir/auto.conf.extra" >> "$auto_conf"
+fi
+
+# Run actual test script
+if ! oe-build-perf-test --out-dir "$results_dir" \
+                        --globalres-file "$globalres_log" \
+                        --lock-file "$base_dir/oe-build-perf.lock"; then
+    echo "oe-build-perf-test script failed!"
+    exit 1
+fi
+
+echo -ne "\n\n-----------------\n"
+echo "Global results file:"
+echo -ne "\n"
+
+cat "$globalres_log"
+
+echo -ne "\n\n-----------------\n"
+echo "Archiving results dir..."
+archive_dir=~/perf-results/archives
+mkdir -p "$archive_dir"
+results_basename=`basename "$results_dir"`
+results_dirname=`dirname "$results_dir"`
+tar -czf "$archive_dir/`uname -n`-${results_basename}.tar.gz" -C "$results_dirname" "$results_basename"
+
+rm -rf "$build_dir"
+rm -rf "$results_dir"
+
+echo "DONE"
-- 
2.6.6


