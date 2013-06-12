Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7446AA99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 15:06:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jun 2013 08:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="348753157"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2013 08:07:26 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 920276A4091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 08:06:45 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 18:07:19 +0300
Message-Id: <f5a38e996e6c2a8992e27aff588edbe821557fe1.1371049273.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1371049273.git.stefanx.stanacar@intel.com>
References: <cover.1371049273.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1371049273.git.stefanx.stanacar@intel.com>
References: <cover.1371049273.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/2] scripts/contrib/build-perf-test.sh: add branch name and sizes to results
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
X-List-Received-Date: Wed, 12 Jun 2013 15:06:57 -0000

Be more descriptive about the revision we are running on
in the global results file: add branch:commit and git describe fields.
Also add the sizes for tmp dir not only times. (previously these were
only available in the output.log)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 0af2cfe..8d243f0 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -112,9 +112,9 @@ if [ $reqpass -ne 0 ]; then
 fi
 
 if [ -n "$commit" ]; then
-            echo "git checkout $commit"
+            echo "git checkout -f $commit"
             git pull > /dev/null 2>&1
-            git checkout $commit || exit 1
+            git checkout -f $commit || exit 1
             git pull > /dev/null 2>&1
 fi
 
@@ -144,8 +144,9 @@ log () {
 # Config stuff
 #
 
-rev=$(git rev-parse HEAD) || exit 1
-log "Git revision is $rev"
+branch=`git branch 2>&1 | grep "^* " | tr -d "* "`
+gitcommit=$(git rev-parse HEAD)  || exit 1
+log "Running on $branch:$gitcommit"
 
 source ./oe-init-build-env $OUTDIR/build >/dev/null || exit 1
 cd $OUTDIR/build
@@ -175,6 +176,8 @@ echo "CONNECTIVITY_CHECK_URIS =\"\"" >> conf/local.conf
 
 declare -a TIMES
 time_count=0
+declare -a SIZES
+size_count=0
 
 bbtime () {
     log "   Timing: bitbake $1"
@@ -240,10 +243,13 @@ do_sync () {
 }
 
 write_results() {
-    echo -n "`uname -n`,$rev," >> $globalres
+    echo -n "`uname -n`,$branch:$gitcommit,`git describe`," >> $globalres
     for i in "${TIMES[@]}"; do
         echo -n "$i," >> $globalres
     done
+    for i in "${SIZES[@]}"; do
+        echo -n "$i," >> $globalres
+    done
     echo >> $globalres
     sed -i '$ s/,$//' $globalres
 }
@@ -276,7 +282,9 @@ test1_p1 () {
     do_rmsstate
     do_sync
     bbtime "$IMAGE"
-    log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+    s=`du -sh tmp | sed 's/tmp//'`
+    SIZES[(( size_count++ ))]="$s"
+    log "SIZE of tmp dir is: $s"
     log "Buildstats are saved in $OUTDIR/buildstats-test1"
     mv tmp/buildstats $OUTDIR/buildstats-test1
 }
@@ -297,7 +305,9 @@ test1_p3 () {
     do_sync
     bbtime "$IMAGE"
     sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
-    log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+    s=`du -sh tmp | sed 's/tmp//'`
+    SIZES[(( size_count++ ))]="$s"
+    log "SIZE of tmp dir is: $s"
     log "Buildstats are saved in $OUTDIR/buildstats-test13"
     mv tmp/buildstats $OUTDIR/buildstats-test13
 }
-- 
1.8.1.4


