Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1ULbES-0002Zv-Jp
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 16:28:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Mar 2013 08:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,373,1363158000"; d="scan'208";a="286271021"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2013 08:10:34 -0700
Received: from localhost.localdomain (unknown [10.237.112.141])
	by linux.intel.com (Postfix) with ESMTP id BD8682C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 08:10:27 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 17:10:20 +0200
Message-Id: <be3729b91e68fdf49cb10d2517203875218f1a69.1364568244.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/4] scripts/contrib/build-perf-test.sh: add a script for build performance tracking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 15:28:45 -0000

This script runs a series of builds (core-image-sato by default) with
and without sstate cache and collects some metrics (time and size currently).
It takes a commit as argument  (-c <rev>) and measures wall clock for
bitbake core-image-sato and virtual/kernel.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 301 +++++++++++++++++++++++++++++++++++++
 1 file changed, 301 insertions(+)
 create mode 100755 scripts/contrib/build-perf-test.sh

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
new file mode 100755
index 0000000..2d70cfa
--- /dev/null
+++ b/scripts/contrib/build-perf-test.sh
@@ -0,0 +1,301 @@
+#!/bin/bash
+#
+# This script runs a series of tests  (with and without sstate) and reports build time (and tmp/ size)
+# 
+# Build performance test script
+#
+# Copyright 2013 Intel Corporation
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
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+#
+#
+# AUTHORS:
+# Stefan Stanacar <stefanx.stanacar@intel.com>
+
+
+ME=$(basename $0)
+
+#
+# usage and setup
+#
+
+usage () {
+cat << EOT
+Usage: $ME [-h]
+       $ME [-c <commit>] [-v] [-m <val>] [-j <val>] [-t <val>] [-i <image-name>] [-d <path>]
+Options:
+	-h
+		Display this help and exit.
+	-c <commit>
+		git checkout <commit> before anything else
+	-v
+		Show bitbake output, don't redirect it to a log.
+	-m <machine>
+		Value for MACHINE. Default is qemux86.
+	-j <val>
+		Value for PARALLEL_MAKE. Default is 8. 
+	-t <val>
+		Value for BB_NUMBER_THREADS. Default is 8.
+        -i <image-name>
+                Instead of timing agains core-image-sato, use <image-name>
+        -d <path>
+                Use <path> as DL_DIR
+		
+Note: current working directory must be inside a poky git clone.
+ 
+EOT
+}
+
+
+if clonedir=$(git rev-parse --show-toplevel); then
+        cd $clonedir
+else
+        echo "The current working dir doesn't seem to be a poky git clone. Please cd there before running $ME"
+        exit 1
+fi
+
+IMAGE="core-image-sato"
+verbose=0
+dldir=
+commit=
+pmake=
+while getopts "hvc:m:j:t:i:d:" opt; do
+	case $opt in
+		h)	usage
+			exit 0
+			;;
+		v)	verbose=1
+			;;
+		c)	commit=$OPTARG
+			;;
+		m)      export MACHINE=$OPTARG
+			;;
+		j)	pmake=$OPTARG
+			;;
+		t)	export BB_NUMBER_THREADS=$OPTARG
+			;;
+                i)      IMAGE=$OPTARG
+                        ;;
+                d)      dldir=$OPTARG
+                        ;;
+		*)	usage
+			exit 1
+			;;			
+	esac
+done
+
+
+#drop cached credentials and test for sudo access without a password
+sudo -k -n ls > /dev/null 2>&1
+reqpass=$?
+if [ $reqpass -ne 0 ]; then
+    echo "The script requires sudo access to drop caches between builds (echo 3 > /proc/sys/vm/drop_caches)"
+    read -s -p "Please enter your sudo password: " pass
+    echo
+fi
+
+if [ -n "$commit" ]; then
+            echo "git checkout $commit"
+            git checkout $commit || exit 1
+            git pull || exit 1
+fi
+
+rev=$(git rev-parse --short HEAD)  || exit 1
+OUTDIR="$clonedir/build-perf-test/results-$rev-`date "+%Y%m%d%H%M%S"`"
+BUILDDIR="$OUTDIR/build"
+resultsfile="$OUTDIR/results.log"
+bboutput="$OUTDIR/bitbake.log"
+myoutput="$OUTDIR/output.log"
+
+mkdir -p $OUTDIR || exit 1
+                                
+log () {
+    local msg="$1"
+    echo "`date`: $msg" | tee -a $myoutput
+}
+
+
+#
+# Config stuff
+#
+
+log "Git revision is $rev"
+
+source ./oe-init-build-env $OUTDIR/build >/dev/null
+cd $OUTDIR/build
+
+[ -n "$MACHINE" ] || export MACHINE="qemux86"
+[ -n "$BB_NUMBER_THREADS" ] || export BB_NUMBER_THREADS="8"
+
+if [ -n "$pmake" ]; then
+        export PARALLEL_MAKE="-j $pmake"
+else
+        export PARALLEL_MAKE="-j 8"
+fi
+
+if [ -n "$dldir" ]; then
+    echo "DL_DIR = \"$dldir\"" >> conf/local.conf
+else
+    echo "DL_DIR = \"$clonedir/build-perf-test/downloads\"" >> conf/local.conf
+fi
+
+#
+# Functions
+#
+
+bbtime () {
+    log "Running and timing bitbake $1"
+    if [ $verbose -eq 0 ]; then 
+        /usr/bin/time -v -o $resultsfile bitbake "$1" >> $bboutput
+    else
+        /usr/bin/time -v -o $resultsfile bitbake "$1" 
+    fi
+    ret=$?
+    if [ $ret -eq 0 ]; then
+        log "Finished bitbake $1"
+    else
+        log "Exit status was non-zero. Exit..."
+        exit $ret 
+    fi
+    
+    log "Time: `grep wall $resultsfile`"
+    #time by default overwrites the output file and we  want to keep the results
+    #it has an append option but I don't want to clobber the results in the same file
+    i=`ls $OUTDIR/results.log* |wc -l`
+    mv $resultsfile "${resultsfile}.${i}"
+    log "More stats can be found in ${resultsfile}.${i}"    
+}
+
+#we don't time bitbake here
+bbnotime () {
+    log "Running bitbake $1"
+    if [ $verbose -eq 0 ]; then
+        bitbake "$1" >> $bboutput
+    else
+        bitbake "$1" 
+    fi
+    ret=$?
+    if [ $ret -eq 0 ]; then
+        log "Finished bitbake $1"
+    else
+        log "Exit status was non-zero. Exit.."
+        exit $?
+    fi
+
+}
+
+do_rmtmp() {
+    log "Removing tmp"
+    rm -rf bitbake.lock pseudone tmp conf/sanity_info
+}
+do_rmsstate () {
+    log "Removing sstate-cache"
+    rm -rf sstate-cache
+}
+do_sync () {
+    log "Syncing and dropping caches"
+    sync; sync
+    if [ $reqpass -eq 0 ]; then
+        sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
+    else
+        echo "$pass" | sudo -S sh -c "echo 3 > /proc/sys/vm/drop_caches"
+        echo
+    fi
+    sleep 3
+}
+
+####
+
+#
+# Test 1
+# Measure: Wall clock of "bitbake core-image-sato" and size of tmp/dir (w/o rm_work and w/ rm_work)
+# Pre: Downloaded sources, no sstate
+# Steps:
+#     Part1:
+#        - fetchall 
+#        - clean build dir
+#        - time bitbake core-image-sato
+#        - collect data
+#     Part2:
+#        - bitbake virtual/kernel -c
+#        - time bitbake virtual/kernel
+#     Part3:
+#        - add INHERIT to local.conf
+#        - clean build dir
+#        - build
+#        - report size, remove INHERIT
+
+test1_p1 () {
+log "Running Test 1, part 1/3: Measure wall clock of bitbake $IMAGE and size of tmp/ dir"
+bbnotime "$IMAGE -c fetchall"
+do_rmtmp
+do_rmsstate
+do_sync
+bbtime "$IMAGE"
+log "Size of tmp dir is: `du -hc tmp | grep total`"
+log "Buildstats are saved in $OUTDIR/buildstats-test1"
+mv tmp/buildstats $OUTDIR/buildstats-test1
+}
+
+
+test1_p2 () {
+log "Running Test 1, part 2/3: bitbake virtual/kernel -c clean && cleansstate and time bitbake virtual/kernel"
+bbnotime "virtual/kernel -c clean"
+bbnotime "virtual/kernel -c cleansstate"
+do_sync
+bbtime "virtual/kernel"
+}
+
+test1_p3 () {
+log "Running Test 1, part 3/3: Build $IMAGE w/o sstate and report size of tmp/dir with rm_work enabled"
+echo "INHERIT += \"rm_work\"" >> conf/local.conf
+do_rmtmp
+do_rmsstate
+do_sync
+bbtime "$IMAGE"
+log "Size of tmp dir is: `du -hc tmp | grep total`"
+sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
+}
+
+
+#
+# Test 2
+# Measure: Wall clock of "bitbake core-image-sato" and size of tmp/dir
+# Pre: populated sstate cache
+
+test2 () {
+#assuming test 1 has run
+log "Running Test 2: Measure wall clock of bitbake $IMAGE -c rootfs with sstate"
+do_rmtmp
+do_sync
+bbtime "$IMAGE -c rootfs"
+}
+
+
+# RUN!
+
+test1_p1
+test1_p2
+test1_p3
+test2
+
+log "All done."
+
+
+
+
+
+
+
-- 
1.8.1.4



