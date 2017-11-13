Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 80C9078697
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 18:17:23 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 10:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,389,1505804400"; d="scan'208";a="175306641"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga005.fm.intel.com with ESMTP; 13 Nov 2017 10:17:24 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 10:17:21 -0800
Message-Id: <20171113181721.79781-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 2/2] parallel-oe-selftest.sh: runs oe-selftest in parallel
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

Parallelize oe-selftest execution using GNU/Parallel: for each test
defined, a job will be launched and at any time at maximun of jobs will
be executing (defaults to 4). Extra parameters can be given to
parallel cmd after double dashes ('--'). Some cmd line examples:

1. Run all modules

    parallel-oe-selftest.sh

2. Run certaing modules and print results in order (see parallel man page for
more info)

    echo wic bblayers | parallel-oe-selftest.sh -- --keep-order

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/contrib/parallel-oe-selftest.sh | 81 +++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100755 scripts/contrib/parallel-oe-selftest.sh

diff --git a/scripts/contrib/parallel-oe-selftest.sh b/scripts/contrib/parallel-oe-selftest.sh
new file mode 100755
index 0000000000..5fbdff9f95
--- /dev/null
+++ b/scripts/contrib/parallel-oe-selftest.sh
@@ -0,0 +1,81 @@
+#!/bin/sh
+
+# paralell-oe-selftest: executes oe-selftest in 'parallel'. The tests (modules, clases or test methods, same
+# as oe-selftest --run-tests) to be executed can be piped to this script; if this is not the case, all modules
+# are executed
+#
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
+#
+
+# Before anything else, check oe-core environment
+if [ -z "$BUILDDIR" ]; then
+    echo "Please initialize the OE-Core environment through oe-init-build-env script"
+    exit 1
+fi
+
+usage() {
+CMD=$(basename $0)
+cat <<EOM
+Usage: $CMD [-h] [-j jobs] [-- <parallel options>]
+  -j jobs             Number of jobs to be running concurrently
+  -h                  Display this help message
+
+ Examples:
+   # run all tests, output results in order and show progress
+   $CMD -j 4 -- --keep-order --progress
+
+   # run just wic and bblayers
+   echo wic bblayers | $CMD
+
+EOM
+}
+
+JOBS=4
+# Parse and validate arguments
+while getopts "hj:" OPT; do
+	case $OPT in
+	j)
+	        JOBS="$OPTARG"
+	        ;;
+	h)
+		usage
+		exit 0
+		;;
+	--)
+		shift
+		break
+		;;
+	esac
+done
+
+shift "$((OPTIND - 1))"
+extraopts="$@"
+echo $extraopts
+
+if [ -t 0 ]; then
+    # no stdin, run all modules
+    TESTCASES="$(oe-selftest -m | awk '{ print $NF } ' | grep -v ':')"
+else
+    TESTCASES="$(cat /dev/stdin)"
+fi
+
+# Parallelization is done through GNU/Paralell, so it must be present in host machine
+which parallel 2>&1 >/dev/null || { echo "Please install GNU/Parallel"; exit 1; }
+
+echo "The following tests will be run in parallel with a $JOBS jobs"
+echo ""; for t in $TESTCASES; do echo -e "\t$t"; done; echo ""
+
+echo "$TESTCASES" | parallel --jobs $JOBS $extraopts oe-selftest -r
-- 
2.12.3


