Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A67A78429
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:10:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 07:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,427,1508828400"; d="scan'208";a="14883260"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2017 07:10:37 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 07:10:33 -0800
Message-Id: <20171219151033.86763-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v3] parallel-oe-selftest.sh: runs oe-selftest in parallel
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
X-List-Received-Date: Tue, 19 Dec 2017 15:10:37 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Run in parallel the (oe)selftests using GNU/Parallel: for each test
defined, a job will be launched and at any time at maximum of jobs
will be executing (defaults to 4).

1. Run all modules

    parallel-oe-selftest.sh

2. Run certain modules and print results in order (see parallel man
page for more info)

    parallel-oe-selftest.sh wic bblayers

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---

Changes from v3 (both suggested by Andre McCurdy):
* fix typos in commit message and comments on code
* fix if condition on all-tests execution

 scripts/contrib/parallel-oe-selftest.sh | 72 +++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100755 scripts/contrib/parallel-oe-selftest.sh

diff --git a/scripts/contrib/parallel-oe-selftest.sh b/scripts/contrib/parallel-oe-selftest.sh
new file mode 100755
index 0000000000..4dfda02454
--- /dev/null
+++ b/scripts/contrib/parallel-oe-selftest.sh
@@ -0,0 +1,72 @@
+#!/bin/sh
+
+# paralell-oe-selftest: executes oe-selftest in 'parallel'.
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
+Usage: $CMD [-h] [-j jobs] [test1 test2 ..]
+  -j jobs             Number of jobs to be running concurrently
+  -h                  Display this help message
+
+ Examples:
+   # run all found testcases
+   $CMD
+
+   # just run wic and bblayers
+   $CMD wic bblayers
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
+
+shift "$((OPTIND - 1))"
+TESTCASES="$@"
+
+which parallel 2>&1 >/dev/null || { echo "Please install GNU/Parallel"; exit 1; }
+
+if [ -z "$TESTCASES" ]; then
+    TESTCASES="$(oe-selftest -m | awk '{ print $NF } ' | grep -v ':')"
+    echo $TESTCASES | time parallel --keep-order --progress --jobs $JOBS oe-selftest -r
+else
+    time parallel -d ' ' --keep-order --progress --jobs $JOBS oe-selftest -r ::: $TESTCASES
+fi
-- 
2.12.3


