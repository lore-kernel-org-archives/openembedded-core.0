Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE0160290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 17:46:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2016 09:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="637950340"
Received: from unknown (HELO mqz-osx-suse64.fi.intel.com) ([10.252.18.3])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2016 09:46:44 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 19:46:40 +0200
Message-Id: <1453398401-32288-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] build-perf-test.sh: more generic timing function
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
X-List-Received-Date: Thu, 21 Jan 2016 17:46:46 -0000

Make it possible to time also other than bitbake commands. The name of
the log file is changed from bitbake.log to commands.log.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test.sh | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index cdd7885..105b54b 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -128,7 +128,7 @@ rev=$(git rev-parse --short HEAD)  || exit 1
 OUTDIR="$clonedir/build-perf-test/results-$rev-`date "+%Y%m%d%H%M%S"`"
 BUILDDIR="$OUTDIR/build"
 resultsfile="$OUTDIR/results.log"
-bboutput="$OUTDIR/bitbake.log"
+cmdoutput="$OUTDIR/commands.log"
 myoutput="$OUTDIR/output.log"
 globalres="$clonedir/build-perf-test/globalres.log"
 
@@ -180,14 +180,13 @@ time_count=0
 declare -a SIZES
 size_count=0
 
-bbtime () {
-    local arg="$@"
-    log "   Timing: bitbake ${arg}"
+time_cmd () {
+    log "   Timing: $*"
 
     if [ $verbose -eq 0 ]; then 
-        /usr/bin/time -v -o $resultsfile bitbake ${arg} >> $bboutput
+        /usr/bin/time -v -o $resultsfile "$@" >> $cmdoutput
     else
-        /usr/bin/time -v -o $resultsfile bitbake ${arg}
+        /usr/bin/time -v -o $resultsfile "$@"
     fi
     ret=$?
     if [ $ret -eq 0 ]; then
@@ -206,12 +205,16 @@ bbtime () {
     log "More stats can be found in ${resultsfile}.${i}"    
 }
 
+bbtime () {
+    time_cmd bitbake "$@"
+}
+
 #we don't time bitbake here
 bbnotime () {
     local arg="$@"
     log "   Running: bitbake ${arg}"
     if [ $verbose -eq 0 ]; then
-        bitbake ${arg} >> $bboutput
+        bitbake ${arg} >> $cmdoutput
     else
         bitbake ${arg}
     fi
-- 
2.1.4


