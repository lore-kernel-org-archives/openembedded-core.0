Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhTAT-0005bx-QI
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 23:09:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2011 14:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,531,1304319600"; d="scan'208";a="27787713"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.58])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2011 14:05:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2011 14:05:42 -0700
Message-Id: <3e0a1eff55415a317e061a39af7e81f7b9aae30e.1310677351.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310677351.git.dvhart@linux.intel.com>
References: <cover.1310677351.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1310677351.git.dvhart@linux.intel.com>
References: <cover.1310677351.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] bb-matrix: correct BB and PM number canonicalization
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2011 21:09:58 -0000

The bash string operation ${BB##*0} was greedy and in addition to converting
"02" to "2", also converted "20" to "", causing all builds for a BB value ending
in 0 to run with BB_NUMBER_THREADS=1.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/bb-perf/bb-matrix.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
index 64d5513..b9edd5f 100755
--- a/scripts/contrib/bb-perf/bb-matrix.sh
+++ b/scripts/contrib/bb-perf/bb-matrix.sh
@@ -62,8 +62,8 @@ for BB in $BB_RANGE; do
 		echo "BB=$BB PM=$PM Logging to $BB_LOG"
 
 		# Export the variables under test and run the bitbake command
-		export BB_NUMBER_THREADS="${BB##*0}"
-		export PARALLEL_MAKE="-j ${PM##*0}"
+		export BB_NUMBER_THREADS=$(echo $BB | sed 's/^0*//')
+		export PARALLEL_MAKE="-j $(echo $PM | sed 's/^0*//')"
 		/usr/bin/time -f "$BB $PM $TIME_STR" -a -o $RUNTIME_LOG $BB_CMD &> $BB_LOG
 		
 		echo "  $(tail -n1 $RUNTIME_LOG)"
-- 
1.7.1



