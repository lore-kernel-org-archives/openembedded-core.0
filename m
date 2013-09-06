Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 332B16186C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 62869349633
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5w5SoFomhL0K
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 9A989349617
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 851665DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 7A44B1C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 7916D3404E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:12:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r86GCLp7012341
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2013 18:12:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r86GCLLm012338
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Sep 2013 18:12:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 18:12:17 +0200
Message-Id: <8455f1f49363caff9ceb89a81d9b9a4650dd8ece.1378483732.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1378483732.git.pkj@axis.com>
References: <cover.1378483732.git.pkj@axis.com>
In-Reply-To: <cover.1378483732.git.pkj@axis.com>
References: <cover.1378483732.git.pkj@axis.com>
Subject: [PATCH 1/2] bb-matrix: Clean before, rather than after, building
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
X-List-Received-Date: Fri, 06 Sep 2013 16:12:23 -0000

This makes sure the the first build starts from a clean state. Otherwise
one could have the first build affected by any leftover state from
a previous build.

This also leaves a working state behind after the final build.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/contrib/bb-perf/bb-matrix.sh | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
index 37721fe..1064565 100755
--- a/scripts/contrib/bb-perf/bb-matrix.sh
+++ b/scripts/contrib/bb-perf/bb-matrix.sh
@@ -63,6 +63,10 @@ for BB in $BB_RANGE; do
 		date
 		echo "BB=$BB PM=$PM Logging to $BB_LOG"
 
+		echo -n "  Preparing the work directory... "
+		rm -rf pseudodone tmp sstate-cache tmp-eglibc &> /dev/null
+		echo "done"
+
 		# Export the variables under test and run the bitbake command
 		# Strip any leading zeroes before passing to bitbake
 		export BB_NUMBER_THREADS=$(echo $BB | sed 's/^0*//')
@@ -70,12 +74,6 @@ for BB in $BB_RANGE; do
 		/usr/bin/time -f "$BB $PM $TIME_STR" -a -o $RUNTIME_LOG $BB_CMD &> $BB_LOG
 
 		echo "  $(tail -n1 $RUNTIME_LOG)"
-		echo -n "  Cleaning up..."
-		mv tmp/buildstats $RUNDIR/$BB-$PM-buildstats
-		rm -f pseudodone &> /dev/null
-		rm -rf tmp &> /dev/null
-		rm -rf sstate-cache &> /dev/null
-		rm -rf tmp-eglibc &> /dev/null
-		echo "done"
+		cp -a tmp/buildstats $RUNDIR/$BB-$PM-buildstats
 	done
 done
-- 
1.8.2.1


