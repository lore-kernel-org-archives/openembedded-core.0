Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1ULbES-0002Zu-Nj
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 16:28:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2013 08:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,373,1363158000"; d="scan'208";a="309162518"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2013 08:10:35 -0700
Received: from localhost.localdomain (unknown [10.237.112.141])
	by linux.intel.com (Postfix) with ESMTP id E55B02C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 08:10:28 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 17:10:21 +0200
Message-Id: <6bf8faf38f9a5eb70ff2986fc324804ddfa1d4e8.1364568244.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/4] scripts/contrib/build-perf-test.sh: add a global results file
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

Append results from each run to a single file in order to keep a history.
Also do some cosmetic changes and fix some whitespace.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 43 ++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 2d70cfa..0f7a3a9 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -108,8 +108,9 @@ fi
 
 if [ -n "$commit" ]; then
             echo "git checkout $commit"
+            git pull > /dev/null 2>&1
             git checkout $commit || exit 1
-            git pull || exit 1
+            git pull > /dev/null 2>&1
 fi
 
 rev=$(git rev-parse --short HEAD)  || exit 1
@@ -118,6 +119,7 @@ BUILDDIR="$OUTDIR/build"
 resultsfile="$OUTDIR/results.log"
 bboutput="$OUTDIR/bitbake.log"
 myoutput="$OUTDIR/output.log"
+globalres="$clonedir/build-perf-test/globalres.log"
 
 mkdir -p $OUTDIR || exit 1
                                 
@@ -131,9 +133,10 @@ log () {
 # Config stuff
 #
 
+rev=$(git rev-parse HEAD) || exit 1
 log "Git revision is $rev"
 
-source ./oe-init-build-env $OUTDIR/build >/dev/null
+source ./oe-init-build-env $OUTDIR/build >/dev/null || exit 1
 cd $OUTDIR/build
 
 [ -n "$MACHINE" ] || export MACHINE="qemux86"
@@ -155,8 +158,12 @@ fi
 # Functions
 #
 
+declare -a TIMES
+time_count=0
+
 bbtime () {
-    log "Running and timing bitbake $1"
+    log "Timing: bitbake $1"
+
     if [ $verbose -eq 0 ]; then 
         /usr/bin/time -v -o $resultsfile bitbake "$1" >> $bboutput
     else
@@ -164,13 +171,14 @@ bbtime () {
     fi
     ret=$?
     if [ $ret -eq 0 ]; then
-        log "Finished bitbake $1"
+        t=`grep wall $resultsfile | sed 's/.*m:ss): //'`
+        log "Time: $t"
+        TIMES[(( time_count++ ))]="$t"
     else
         log "Exit status was non-zero. Exit..."
         exit $ret 
     fi
     
-    log "Time: `grep wall $resultsfile`"
     #time by default overwrites the output file and we  want to keep the results
     #it has an append option but I don't want to clobber the results in the same file
     i=`ls $OUTDIR/results.log* |wc -l`
@@ -180,7 +188,7 @@ bbtime () {
 
 #we don't time bitbake here
 bbnotime () {
-    log "Running bitbake $1"
+    log "Running: bitbake $1"
     if [ $verbose -eq 0 ]; then
         bitbake "$1" >> $bboutput
     else
@@ -198,7 +206,7 @@ bbnotime () {
 
 do_rmtmp() {
     log "Removing tmp"
-    rm -rf bitbake.lock pseudone tmp conf/sanity_info
+    rm -rf bitbake.lock pseudodone tmp conf/sanity_info
 }
 do_rmsstate () {
     log "Removing sstate-cache"
@@ -244,7 +252,7 @@ do_rmtmp
 do_rmsstate
 do_sync
 bbtime "$IMAGE"
-log "Size of tmp dir is: `du -hc tmp | grep total`"
+log "Size of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
 log "Buildstats are saved in $OUTDIR/buildstats-test1"
 mv tmp/buildstats $OUTDIR/buildstats-test1
 }
@@ -265,8 +273,10 @@ do_rmtmp
 do_rmsstate
 do_sync
 bbtime "$IMAGE"
-log "Size of tmp dir is: `du -hc tmp | grep total`"
 sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
+log "Size of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+log "Buildstats are saved in $OUTDIR/buildstats-test13"
+mv tmp/buildstats $OUTDIR/buildstats-test13
 }
 
 
@@ -291,11 +301,12 @@ test1_p2
 test1_p3
 test2
 
-log "All done."
-
-
-
-
-
-
+log "All done"
 
+# if we got til here write to global results
+echo "$rev" >> $globalres
+for i in "${TIMES[@]}"; do
+    echo -n "$i," >> $globalres
+done
+echo >> $globalres
+sed -i '$ s/,$//' $globalres
-- 
1.8.1.4



