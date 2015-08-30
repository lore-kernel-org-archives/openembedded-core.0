Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB9973CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 03:22:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2015 20:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,437,1437462000"; d="scan'208";a="778953254"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2015 20:22:53 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:16:07 +0000
Message-Id: <1440962167-23420-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] buildstats: Outputs 'task recipe elapsed-time' from each buildstats' recipe
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
X-List-Received-Date: Mon, 31 Aug 2015 03:22:54 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Given a 'buildstats' path (created by bitbake when setting
USER_CLASSES ?= "buildstats" on local.conf) and task names, outputs
'<task> <recipe> <elapsed time>' for all recipes. Elapsed times are in
seconds, and task should be given without the 'do_' prefix.

Some useful pipelines

1. Tasks with largest elapsed times

    $ buildstats.sh -b <buildstats> | sort -k3 -n -r | head
    do_compile perl-5.20.0-r1 221.82
    do_configure gettext-native-0.19.4-r0 140.34
    do_compile openssl-native-1.0.2a-r0 107.48
    do_compile openssl-1.0.2a-r0 102.10
    do_configure perl-native-5.20.0-r0 90.70
    do_configure gettext-0.19.4-r0 88.17
    do_compile gcc-cross-i586-4.9.2-r0 83.98
    do_configure m4-native-1.4.17-r0 83.44
    do_compile qemu-native-2.2.0-r1 71.69
    do_compile glibc-2.21-r0 60.88

2. Min, max, sum per task

    $ buildstats.sh | datamash -t' ' -g1 min 3 max 3 sum 3 | sort -k4 -n -r
    do_configure 0.03 140.34 1968.66
    do_compile 0.01 221.82 1664.44
    do_install 0.03 40.31 330.45
    do_populate_sysroot 0.11 34.45 229.23
    do_unpack 0.01 36.1 193.54
    do_patch 0.01 9.2 62.07
    do_fetch 0.01 6.66 32.13
    do_populate_lic 0.09 1.65 30.7

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/contrib/bb-perf/buildstats.sh | 90 +++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100755 scripts/contrib/bb-perf/buildstats.sh

diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-perf/buildstats.sh
new file mode 100755
index 0000000..96158a9
--- /dev/null
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -0,0 +1,90 @@
+#!/bin/bash
+#
+# Copyright (c) 2011, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# DESCRIPTION
+# Given a 'buildstats' path (created by bitbake when setting
+# USER_CLASSES ?= "buildstats" on local.conf) and task names, outputs
+# '<task> <recipe> <elapsed time>' for all recipes. Elapsed times are in
+# seconds, and task should be given without the 'do_' prefix.
+#
+# Some useful pipelines
+#
+# 1. Tasks with largest elapsed times
+# $ buildstats.sh -b <buildstats> | sort -k3 -n -r | head
+#
+# 2. Min, max, sum per task (in needs GNU datamash)
+# $ buildstats.sh -b <buildstats> | datamash -t' ' -g1 min 3 max 3 sum 3 | sort -k4 -n -r
+#
+# AUTHORS
+# Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+#
+BS_DIR="tmp/buildstats"
+TASKS="compile:configure:fetch:install:patch:populate_lic:populate_sysroot:unpack"
+
+function usage {
+CMD=$(basename $0)
+cat <<EOM
+Usage: $CMD [-b buildstats_dir] [-t do_task]
+  -b buildstats The path where the folder resides
+                (default: "$BS_DIR")
+  -t tasks      The tasks to be computed
+                (default: "$TASKS")
+  -h            Display this help message
+EOM
+}
+
+# Parse and validate arguments
+while getopts "b:t:h" OPT; do
+	case $OPT in
+	b)
+		BS_DIR="$OPTARG"
+		;;
+	t)
+		TASKS="$OPTARG"
+		;;
+	h)
+		usage
+		exit 0
+		;;
+	*)
+		usage
+		exit 1
+		;;
+	esac
+done
+
+# Ensure the buildstats folder exists
+if [ ! -d "$BS_DIR" ]; then
+	echo "ERROR: $BS_DIR does not exist"
+	usage
+	exit 1
+fi
+
+RECIPE_FIELD=1
+TIME_FIELD=4
+
+tasks=(${TASKS//:/ })
+for task in "${tasks[@]}"; do
+    task="do_${task}"
+    for file in $(find ${BS_DIR} -type f -name ${task}); do
+        recipe=$(sed -n -e "/$task/p" ${file} | cut -d ':' -f${RECIPE_FIELD})
+        time=$(sed -n -e "/$task/p" ${file} | cut -d ':' -f${TIME_FIELD} | cut -d ' ' -f2)
+        echo "${task} ${recipe} ${time}"
+    done
+done
-- 
1.8.4.5


