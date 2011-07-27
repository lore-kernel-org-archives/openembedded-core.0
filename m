Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmCEf-0003F8-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 00:05:49 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RM1XMf024302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:01:33 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:01:35 -0700
Message-Id: <1311804095-3244-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] connman_test.sh: Rework for busybox 'ps'
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
X-List-Received-Date: Wed, 27 Jul 2011 22:05:49 -0000

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
index d7e63e7..dd5554c 100644
--- a/scripts/qemuimage-tests/tools/connman_test.sh
+++ b/scripts/qemuimage-tests/tools/connman_test.sh
@@ -27,21 +27,21 @@ if [ ! -f /usr/sbin/connmand ]; then
 fi
 
 # Check if connmand is running in background
-count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`
+count=`ps -eo comm | grep -c connmand`
 
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
+	count=`ps -eo comm | grep -c connmand`
 	if [ $count -ne 1 ]; then
 		Target_Info "There are more than one connmand running in background, Pls, check the output of ps"
-		ps -ef cmd | grep connmand
+		ps -ef | grep connmand
 		exit 1
 	else
 		Target_Info "There is always one connmand running in background, test pass"
-- 
1.7.0.4



