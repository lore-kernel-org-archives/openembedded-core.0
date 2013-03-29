Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1ULbEU-0002Zu-B2
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 16:28:46 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2013 08:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,373,1363158000"; d="scan'208";a="309162536"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2013 08:10:38 -0700
Received: from localhost.localdomain (unknown [10.237.112.141])
	by linux.intel.com (Postfix) with ESMTP id 39ECD2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 08:10:31 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 17:10:23 +0200
Message-Id: <f3a2209ab8f0af47a756970a17210a84f1b39b73.1364568244.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
Subject: [PATCH 4/4] scripts/contrib/build-perf-test.sh: add timings for bitbake -p
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
X-List-Received-Date: Fri, 29 Mar 2013 15:28:46 -0000

Add another test to time bitbake -p with and without cache/ or tmp/cache.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 62 ++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 103475d..44a902c 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -49,7 +49,7 @@ Options:
         -t <val>
                 Value for BB_NUMBER_THREADS. Default is 8.
         -i <image-name>
-                Instead of timing agains core-image-sato, use <image-name>
+                Instead of timing against core-image-sato, use <image-name>
         -d <path>
                 Use <path> as DL_DIR
         -p <githash>
@@ -173,7 +173,7 @@ declare -a TIMES
 time_count=0
 
 bbtime () {
-    log "Timing: bitbake $1"
+    log "   Timing: bitbake $1"
 
     if [ $verbose -eq 0 ]; then 
         /usr/bin/time -v -o $resultsfile bitbake "$1" >> $bboutput
@@ -183,11 +183,11 @@ bbtime () {
     ret=$?
     if [ $ret -eq 0 ]; then
         t=`grep wall $resultsfile | sed 's/.*m:ss): //'`
-        log "Time: $t"
+        log "   TIME: $t"
         TIMES[(( time_count++ ))]="$t"
     else
-        log "Exit status was non-zero. Exit..."
-        #exit $ret 
+        log "ERROR: exit status was non-zero, will report time as 0."
+        TIMES[(( time_count++ ))]="0"
     fi
     
     #time by default overwrites the output file and we  want to keep the results
@@ -199,7 +199,7 @@ bbtime () {
 
 #we don't time bitbake here
 bbnotime () {
-    log "Running: bitbake $1"
+    log "   Running: bitbake $1"
     if [ $verbose -eq 0 ]; then
         bitbake "$1" >> $bboutput
     else
@@ -207,24 +207,24 @@ bbnotime () {
     fi
     ret=$?
     if [ $ret -eq 0 ]; then
-        log "Finished bitbake $1"
+        log "   Finished bitbake $1"
     else
-        log "Exit status was non-zero. Exit.."
+        log "ERROR: exit status was non-zero. Exit.."
         exit $?
     fi
 
 }
 
 do_rmtmp() {
-    log "Removing tmp"
-    rm -rf bitbake.lock pseudodone tmp conf/sanity_info
+    log "   Removing tmp"
+    rm -rf bitbake.lock pseudodone conf/sanity_info cache tmp
 }
 do_rmsstate () {
-    log "Removing sstate-cache"
+    log "   Removing sstate-cache"
     rm -rf sstate-cache
 }
 do_sync () {
-    log "Syncing and dropping caches"
+    log "   Syncing and dropping caches"
     sync; sync
     if [ $reqpass -eq 0 ]; then
         sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
@@ -248,7 +248,7 @@ do_sync () {
 #        - time bitbake core-image-sato
 #        - collect data
 #     Part2:
-#        - bitbake virtual/kernel -c
+#        - bitbake virtual/kernel -c cleansstate
 #        - time bitbake virtual/kernel
 #     Part3:
 #        - add INHERIT to local.conf
@@ -263,15 +263,14 @@ do_rmtmp
 do_rmsstate
 do_sync
 bbtime "$IMAGE"
-log "Size of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
 log "Buildstats are saved in $OUTDIR/buildstats-test1"
 mv tmp/buildstats $OUTDIR/buildstats-test1
 }
 
 
 test1_p2 () {
-log "Running Test 1, part 2/3: bitbake virtual/kernel -c clean && cleansstate and time bitbake virtual/kernel"
-bbnotime "virtual/kernel -c clean"
+log "Running Test 1, part 2/3: bitbake virtual/kernel -c cleansstate and time bitbake virtual/kernel"
 bbnotime "virtual/kernel -c cleansstate"
 do_sync
 bbtime "virtual/kernel"
@@ -280,12 +279,12 @@ bbtime "virtual/kernel"
 test1_p3 () {
 log "Running Test 1, part 3/3: Build $IMAGE w/o sstate and report size of tmp/dir with rm_work enabled"
 echo "INHERIT += \"rm_work\"" >> conf/local.conf
-#do_rmtmp
-#do_rmsstate
+do_rmtmp
+do_rmsstate
 do_sync
 bbtime "$IMAGE"
 sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
-log "Size of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
 log "Buildstats are saved in $OUTDIR/buildstats-test13"
 mv tmp/buildstats $OUTDIR/buildstats-test13
 }
@@ -305,14 +304,37 @@ bbtime "$IMAGE -c rootfs"
 }
 
 
+# Test 3
+# parsing time metrics
+#
+#  Start with
+#   i) "rm -rf tmp/cache; time bitbake -p"
+#  ii) "rm -rf tmp/cache/default-eglibc/; time bitbake -p"
+# iii) "time bitbake -p"
+
+
+test3 () {
+log "Running Test 3: Parsing time metrics (bitbake -p)"
+log "   Removing tmp/cache && cache"
+rm -rf tmp/cache cache
+bbtime "-p"
+log "   Removing tmp/cache/default-eglibc/"
+rm -rf tmp/cache/default-eglibc/
+bbtime "-p"
+bbtime "-p"
+}
+
+
+
 # RUN!
 
 test1_p1
 test1_p2
 test1_p3
 test2
+test3
 
-log "All done"
+log "All done, cleaning up..."
 
 do_rmtmp
 do_rmsstate
-- 
1.8.1.4



