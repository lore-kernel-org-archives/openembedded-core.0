Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RQutc-0005Ih-6i
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 06:52:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Nov 2011 21:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="76566324"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2011 21:44:56 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 14:05:49 +0800
Message-Id: <f6328ed6e9a96d7e66d95f479bc1ac8796cbd3e2.1321509543.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1321509543.git.jiajun.xu@intel.com>
References: <cover.1321509543.git.jiajun.xu@intel.com>
Subject: [PATCH 1/2] sanitytest: use different option for command ps from busybox and procps
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
X-List-Received-Date: Thu, 17 Nov 2011 05:52:24 -0000

Current sanitytest use option -e for ps command, which only works for ps
from procps. It fails if ps is provided by busybox. Add check to use different
option for command from busybox and procps.

[YOCTO #1756]

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 scripts/qemuimage-tests/tools/connman_test.sh |   28 +++++++++++++++++++++---
 1 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/qemuimage-tests/tools/connman_test.sh b/scripts/qemuimage-tests/tools/connman_test.sh
index c4a66ee..8ed8b8b 100644
--- a/scripts/qemuimage-tests/tools/connman_test.sh
+++ b/scripts/qemuimage-tests/tools/connman_test.sh
@@ -20,6 +20,16 @@ Target_Err()
 	echo -e "\tTARGET: #####    End    #####"
 }
 
+# Check if ps comes from Procps or busybox first
+ls -l `which ps` | grep -q "busybox"
+RET=$?
+
+if [ $RET -eq 0 ]; then
+	PS="ps"
+else
+	PS="ps -ef"
+fi
+
 # Check if connmand is in target
 if [ ! -f /usr/sbin/connmand ]; then
 	Target_Info "No connmand command found"
@@ -27,21 +37,31 @@ if [ ! -f /usr/sbin/connmand ]; then
 fi
 
 # Check if connmand is running in background
-count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
+if [ $RET -eq 0 ]; then
+	count=`ps | awk '{print $5}' | grep -c connmand`
+else
+	count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
+fi
 
 if [ $count -ne 1 ]; then
 	Target_Info "connmand has issue when running in background, Pls, check the output of ps"
-	ps -ef | grep connmand
+	${PS} | grep connmand
 	exit 1
 fi
 
 # Check if there is always only one connmand running in background
 if [ connmand > /dev/null 2>&1 ]; then
 	Target_Info "connmand command run without problem"
-	count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
+
+	if [ $RET -eq 0 ]; then
+		count=`ps | awk '{print $5}' | grep -c connmand`
+	else
+		count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
+	fi
+
 	if [ $count -ne 1 ]; then
 		Target_Info "There are more than one connmand running in background, Pls, check the output of ps"
-		ps -ef | grep connmand
+		${PS} | grep connmand
 		exit 1
 	else
 		Target_Info "There is always one connmand running in background, test pass"
-- 
1.7.1



