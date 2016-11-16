Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3892D6014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 23:00:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 16 Nov 2016 15:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="902265477"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2016 15:00:35 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 17:05:36 -0600
Message-Id: <474e7788d55d9a557edd26e79d64508684f06be8.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/3] scripts: Specify the stats to take into account
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
X-List-Received-Date: Wed, 16 Nov 2016 23:00:34 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are many more stats on buildstats that 'Elapsed time', so make the script
more flexible to support all stats. Some cmd line examples:

$ buildstats.sh -s 'utime'

Buildstats' data covers proc's stats in different areas, including CPU times,
IO, program system resources and child program system resources. In order
to print values on each of these sets from command line, one can use the
following:

$ buildstats.sh -H -s 'TIME' | less

$ buildstats.sh -H -s 'IO' | less

and 'RUSAGE' and 'CHILD_RUSAGE' for program and program's child system
resources.

One more thing: The new version gives the same output as the old one,
just specifying the 'Elapsed time' as stat param:

$ buildstats.sh -s 'Elapsed time'

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/contrib/bb-perf/buildstats.sh | 99 +++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 17 deletions(-)

diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-perf/buildstats.sh
index 96158a9..8d7e248 100755
--- a/scripts/contrib/bb-perf/buildstats.sh
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -18,24 +18,40 @@
 # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 #
 # DESCRIPTION
-# Given a 'buildstats' path (created by bitbake when setting
-# USER_CLASSES ?= "buildstats" on local.conf) and task names, outputs
-# '<task> <recipe> <elapsed time>' for all recipes. Elapsed times are in
-# seconds, and task should be given without the 'do_' prefix.
+# Given 'buildstats' data (generate by bitbake when setting
+# USER_CLASSES ?= "buildstats" on local.conf), task names and a stats values
+# (these are the ones preset on the buildstats files), outputs
+# '<task> <recipe> <value_1> <value_2> ... <value_n>'. The units are the ones
+# defined at buildstats, which in turn takes data from /proc/[pid] files
 #
 # Some useful pipelines
 #
-# 1. Tasks with largest elapsed times
-# $ buildstats.sh -b <buildstats> | sort -k3 -n -r | head
+# 1. Tasks with largest stime (Amount of time that this process has been scheduled
+#    in kernel mode) values
+# $ buildstats.sh -b <buildstats> -s stime | sort -k3 -n -r | head
 #
-# 2. Min, max, sum per task (in needs GNU datamash)
-# $ buildstats.sh -b <buildstats> | datamash -t' ' -g1 min 3 max 3 sum 3 | sort -k4 -n -r
+# 2. Min, max, sum utime (Amount  of  time  that  this process has been scheduled
+#    in user mode) per task (in needs GNU datamash)
+# $ buildstats.sh -b <buildstats> -s utime | datamash -t' ' -g1 min 3 max 3 sum 3 | sort -k4 -n -r
 #
 # AUTHORS
 # Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
 #
+
+# Stats, by type
+TIME="utime:stime:cutime:cstime"
+IO="IO wchar:IO write_bytes:IO syscr:IO read_bytes:IO rchar:IO syscw:IO cancelled_write_bytes"
+RUSAGE="rusage ru_utime:rusage ru_stime:rusage ru_maxrss:rusage ru_minflt:rusage ru_majflt:\
+rusage ru_inblock:rusage ru_oublock:rusage ru_nvcsw:rusage ru_nivcsw"
+
+CHILD_RUSAGE="Child rusage ru_utime:Child rusage ru_stime:Child rusage ru_maxrss:Child rusage ru_minflt:\
+Child rusage ru_majflt:Child rusage ru_inblock:Child rusage ru_oublock:Child rusage ru_nvcsw:\
+Child rusage ru_nivcsw"
+
 BS_DIR="tmp/buildstats"
 TASKS="compile:configure:fetch:install:patch:populate_lic:populate_sysroot:unpack"
+STATS="$TIME"
+HEADER="" # No header by default
 
 function usage {
 CMD=$(basename $0)
@@ -45,12 +61,20 @@ Usage: $CMD [-b buildstats_dir] [-t do_task]
                 (default: "$BS_DIR")
   -t tasks      The tasks to be computed
                 (default: "$TASKS")
+  -s stats      The stats to be matched. Options: TIME, IO, RUSAGE, CHILD_RUSAGE
+                or any other defined buildstat separated by colons, i.e. stime:utime
+                (default: "$STATS")
+                Default stat sets:
+                    TIME=$TIME
+                    IO=$IO
+                    RUSAGE=$RUSAGE
+                    CHILD_RUSAGE=$CHILD_RUSAGE
   -h            Display this help message
 EOM
 }
 
 # Parse and validate arguments
-while getopts "b:t:h" OPT; do
+while getopts "b:t:s:Hh" OPT; do
 	case $OPT in
 	b)
 		BS_DIR="$OPTARG"
@@ -58,6 +82,12 @@ while getopts "b:t:h" OPT; do
 	t)
 		TASKS="$OPTARG"
 		;;
+	s)
+		STATS="$OPTARG"
+		;;
+	H)
+	        HEADER="y"
+	        ;;
 	h)
 		usage
 		exit 0
@@ -76,15 +106,50 @@ if [ ! -d "$BS_DIR" ]; then
 	exit 1
 fi
 
-RECIPE_FIELD=1
-TIME_FIELD=4
+stats=""
+IFS=":"
+for stat in ${STATS}; do
+	case $stat in
+	    TIME)
+		stats="${stats}:${TIME}"
+		;;
+	    IO)
+		stats="${stats}:${IO}"
+		;;
+	    RUSAGE)
+		stats="${stats}:${RUSAGE}"
+		;;
+	    CHILD_RUSAGE)
+		stats="${stats}:${CHILD_RUSAGE}"
+		;;
+	    *)
+		stats="${STATS}"
+	esac
+done
+
+# remove possible colon at the beginning
+stats="$(echo "$stats" | sed -e 's/^://1')"
+
+# Provide a header if required by the user
+[ -n "$HEADER" ] && { echo "task:recipe:$stats"; }
 
-tasks=(${TASKS//:/ })
-for task in "${tasks[@]}"; do
+for task in ${TASKS}; do
     task="do_${task}"
-    for file in $(find ${BS_DIR} -type f -name ${task}); do
-        recipe=$(sed -n -e "/$task/p" ${file} | cut -d ':' -f${RECIPE_FIELD})
-        time=$(sed -n -e "/$task/p" ${file} | cut -d ':' -f${TIME_FIELD} | cut -d ' ' -f2)
-        echo "${task} ${recipe} ${time}"
+    for file in $(find ${BS_DIR} -type f -name ${task} | awk 'BEGIN{ ORS=""; OFS=":" } { print $0,"" }'); do
+        recipe="$(basename $(dirname $file))"
+	times=""
+	for stat in ${stats}; do
+	    [ -z "$stat" ] && { echo "empty stats"; }
+	    time=$(sed -n -e "s/^\($stat\): \\(.*\\)/\\2/p" $file)
+	    # in case the stat is not present, set the value as NA
+	    [ -z "$time" ] && { time="NA"; }
+	    # Append it to times
+	    if [ -z "$times" ]; then
+		times="${time}"
+	    else
+		times="${times} ${time}"
+	    fi
+	done
+        echo "${task} ${recipe} ${times}"
     done
 done
-- 
2.1.4


