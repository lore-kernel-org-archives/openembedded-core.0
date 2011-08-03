Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojjh-0004U0-Ag
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912949"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:04 -0700
Message-Id: <ffde5a4714d24e32ec11ac8a5d003f849aa04011.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 20/33] connman_test.sh: Rework for busybox 'ps'
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:22 -0000

From: Tom Rini <tom_rini@mentor.com>

This script has two problems today.  First, it does 'ps -ef cmd'
in failure which real ps doesn't grok and busybox ps just ignores
the argument on.  Switch that to 'ps -ef'.  Second, busybox ps -o
doesn't understand cmd but does understand comm.  Using comm lets
us simplify the test logic as well, so switch to that.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 scripts/qemuimage-tests/tools/connman_test.sh |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qemuimage-tests/tools/connman_test.sh b/scripts/qemuimage-tests/tools/connman_test.sh
index d7e63e7..c4a66ee 100644
--- a/scripts/qemuimage-tests/tools/connman_test.sh
+++ b/scripts/qemuimage-tests/tools/connman_test.sh
@@ -27,21 +27,21 @@ if [ ! -f /usr/sbin/connmand ]; then
 fi
 
 # Check if connmand is running in background
-count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`
+count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
 
 if [ $count -ne 1 ]; then
 	Target_Info "connmand has issue when running in background, Pls, check the output of ps"
-	ps -ef cmd | grep connmand
+	ps -ef | grep connmand
 	exit 1
 fi
 
 # Check if there is always only one connmand running in background
 if [ connmand > /dev/null 2>&1 ]; then
 	Target_Info "connmand command run without problem"
-	count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`
+	count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
 	if [ $count -ne 1 ]; then
 		Target_Info "There are more than one connmand running in background, Pls, check the output of ps"
-		ps -ef cmd | grep connmand
+		ps -ef | grep connmand
 		exit 1
 	else
 		Target_Info "There is always one connmand running in background, test pass"
-- 
1.7.3.4



