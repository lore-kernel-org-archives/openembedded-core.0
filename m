Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 38CCF6A9CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 15:06:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2013 08:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="352064164"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2013 08:06:57 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id BB4776A4092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 08:06:46 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 18:07:20 +0300
Message-Id: <18d3270bff2b2d28d879db0c9646a588d457b688.1371049273.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1371049273.git.stefanx.stanacar@intel.com>
References: <cover.1371049273.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1371049273.git.stefanx.stanacar@intel.com>
References: <cover.1371049273.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/2] scripts/contrib/build-perf-test.sh: fix passing arguments
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

Don't pass arguments to bitbake as a single one,
because this will break when the bitbake double-exec
is removed.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 8d243f0..ce0fb9a 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -180,12 +180,13 @@ declare -a SIZES
 size_count=0
 
 bbtime () {
-    log "   Timing: bitbake $1"
+    local arg="$@"
+    log "   Timing: bitbake ${arg}"
 
     if [ $verbose -eq 0 ]; then 
-        /usr/bin/time -v -o $resultsfile bitbake "$1" >> $bboutput
+        /usr/bin/time -v -o $resultsfile bitbake ${arg} >> $bboutput
     else
-        /usr/bin/time -v -o $resultsfile bitbake "$1" 
+        /usr/bin/time -v -o $resultsfile bitbake ${arg}
     fi
     ret=$?
     if [ $ret -eq 0 ]; then
@@ -206,18 +207,19 @@ bbtime () {
 
 #we don't time bitbake here
 bbnotime () {
-    log "   Running: bitbake $1"
+    local arg="$@"
+    log "   Running: bitbake ${arg}"
     if [ $verbose -eq 0 ]; then
-        bitbake "$1" >> $bboutput
+        bitbake ${arg} >> $bboutput
     else
-        bitbake "$1" 
+        bitbake ${arg}
     fi
     ret=$?
     if [ $ret -eq 0 ]; then
-        log "   Finished bitbake $1"
+        log "   Finished bitbake ${arg}"
     else
         log "ERROR: exit status was non-zero. Exit.."
-        exit $?
+        exit $ret
     fi
 
 }
@@ -277,11 +279,11 @@ write_results() {
 
 test1_p1 () {
     log "Running Test 1, part 1/3: Measure wall clock of bitbake $IMAGE and size of tmp/ dir"
-    bbnotime "$IMAGE -c fetchall"
+    bbnotime $IMAGE -c fetchall
     do_rmtmp
     do_rmsstate
     do_sync
-    bbtime "$IMAGE"
+    bbtime $IMAGE
     s=`du -sh tmp | sed 's/tmp//'`
     SIZES[(( size_count++ ))]="$s"
     log "SIZE of tmp dir is: $s"
@@ -292,9 +294,9 @@ test1_p1 () {
 
 test1_p2 () {
     log "Running Test 1, part 2/3: bitbake virtual/kernel -c cleansstate and time bitbake virtual/kernel"
-    bbnotime "virtual/kernel -c cleansstate"
+    bbnotime virtual/kernel -c cleansstate
     do_sync
-    bbtime "virtual/kernel"
+    bbtime virtual/kernel
 }
 
 test1_p3 () {
@@ -303,7 +305,7 @@ test1_p3 () {
     do_rmtmp
     do_rmsstate
     do_sync
-    bbtime "$IMAGE"
+    bbtime $IMAGE
     sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
     s=`du -sh tmp | sed 's/tmp//'`
     SIZES[(( size_count++ ))]="$s"
@@ -323,7 +325,7 @@ test2 () {
     log "Running Test 2: Measure wall clock of bitbake $IMAGE -c rootfs with sstate"
     do_rmtmp
     do_sync
-    bbtime "$IMAGE -c rootfs"
+    bbtime $IMAGE -c rootfs
 }
 
 
@@ -340,11 +342,11 @@ test3 () {
     log "Running Test 3: Parsing time metrics (bitbake -p)"
     log "   Removing tmp/cache && cache"
     rm -rf tmp/cache cache
-    bbtime "-p"
+    bbtime -p
     log "   Removing tmp/cache/default-eglibc/"
     rm -rf tmp/cache/default-eglibc/
-    bbtime "-p"
-    bbtime "-p"
+    bbtime -p
+    bbtime -p
 }
 
 
-- 
1.8.1.4


