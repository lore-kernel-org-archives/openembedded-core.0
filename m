Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1EB6100E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 9FF78349622
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6l0lUtimbYag
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:14 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 0BA8111F7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:14 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E138161D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D642961A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id D4A303404E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r8ACKDdH001560
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r8ACKDDW001559
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Sep 2013 14:20:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 14:20:10 +0200
Message-Id: <38fc73dd9c6027282c5528cf9d18ad68ae7a3e43.1378815538.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1378815538.git.pkj@axis.com>
References: <cover.1378815538.git.pkj@axis.com>
In-Reply-To: <cover.1378815538.git.pkj@axis.com>
References: <cover.1378815538.git.pkj@axis.com>
Subject: [PATCH 1/1] bb-matrix-plot: Use interpolation for sparse data
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
X-List-Received-Date: Tue, 10 Sep 2013 12:20:13 -0000

If not every combination of BB_NUMBER_THREADS and PARALLEL_MAKE have
been tested by bb-matrix.sh, e.g., by using BB_RANGE="04 08 10 12 16"
and PM_RANGE="04 08 10 12 16", then the graph that gnuplot generates by
default looks very jagged due to the missing data points. By using
splines to interpolate the missing data the graph looks a lot better.

This should not change graphs where all data points are available in any
way, only improve sparse graphs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/contrib/bb-perf/bb-matrix-plot.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/bb-perf/bb-matrix-plot.sh
index 87e8cb1..136a255 100755
--- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
+++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
@@ -115,7 +115,7 @@ set xlabel "$XLABEL"
 set ylabel "$YLABEL"
 set style line 100 lt 5 lw 1.5
 $PM3D_FRAGMENT
-set dgrid3d $PM_CNT,$BB_CNT
+set dgrid3d $PM_CNT,$BB_CNT splines
 set ticslevel 0.2
 
 set term png size $SIZE
-- 
1.8.2.1


