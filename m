Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UVLJn-0001TE-6o
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:30:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 05:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="292185966"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2013 05:11:01 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id 2A1B42C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 05:10:51 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:11:01 +0300
Message-Id: <206e29520aa00f7d050b360d8e89daf7df2d95ed.1366891465.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1366891465.git.stefanx.stanacar@intel.com>
References: <cover.1366891465.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1366891465.git.stefanx.stanacar@intel.com>
References: <cover.1366891465.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/3] scripts/contrib/build-perf-test.sh: change the global results format
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
X-List-Received-Date: Thu, 25 Apr 2013 12:31:07 -0000

When all builds have finished write the hostname, commit and times
on a single line in the global results file (useful for merging later
on files from multiple systems).
Also the final cleaning should be last after writing the results.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index ee30409..0af2cfe 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -239,6 +239,15 @@ do_sync () {
     sleep 3
 }
 
+write_results() {
+    echo -n "`uname -n`,$rev," >> $globalres
+    for i in "${TIMES[@]}"; do
+        echo -n "$i," >> $globalres
+    done
+    echo >> $globalres
+    sed -i '$ s/,$//' $globalres
+}
+
 ####
 
 #
@@ -338,15 +347,10 @@ test1_p3
 test2
 test3
 
+# if we got til here write to global results
+write_results
+
 log "All done, cleaning up..."
 
 do_rmtmp
 do_rmsstate
-
-# if we got til here write to global results
-echo "$rev" >> $globalres
-for i in "${TIMES[@]}"; do
-    echo -n "$i," >> $globalres
-done
-echo >> $globalres
-sed -i '$ s/,$//' $globalres
-- 
1.8.1.4



