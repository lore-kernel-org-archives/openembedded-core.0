Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6P-0006N3-Ty
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:31 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4s0D009104; Thu, 21 Mar 2013 16:04:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UTwe9sP-cR65; Thu, 21 Mar 2013 16:04:58 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4oLs009091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:51 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpo-0006Mm-Is; Thu, 21 Mar 2013 15:55:20 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:15 +0000
Message-Id: <1363881315-24352-16-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 16/16] scripts/qemu-testlib: Add more debugging information
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
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

This extra information should allow better forensics if the sanity tests
fail as they're currently doing occasionaly on the autobuilder for unknown
reasons.

The patch also tightens up certain checks to remove pointless noise and
error output from the logs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/qemuimage-testlib |   31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 11768d0..551011c 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -69,7 +69,7 @@ Test_Update_IPSAVE()
 	local pid=$1
 	local ip_addr=$2
 
-	if [ "$TEST_SERIALIZE" -eq 1 ]; then
+	if [ "$TEST_SERIALIZE" -eq 1 -a "$pid" != "0" -a "$pid" != "" -a "$ip_addr" != "" -a "$ip_addr" != "" ]; then
 		echo "Saving $pid $ip_addr to $TARGET_IPSAVE"
 		echo "$pid $ip_addr" > $TARGET_IPSAVE
 	fi
@@ -234,15 +234,19 @@ Test_Kill_Qemu()
 	fi
 
 	if [ $k -eq 1 ]; then
-		running=`ps -wwfp $QEMUPID`
-		if [ $? -eq 0 ]; then
-			echo "killing $QEMUPID"
-			kill $QEMUPID
+		if [ "$QEMUPID" != "0" -a "$QEMUPID" != "" ]; then
+			running=`ps -wwfp $QEMUPID`
+			if [ $? -eq 0 ]; then
+				echo "killing $QEMUPID"
+				kill $QEMUPID
+			fi
 		fi
-		running=`ps -wwfp $XTERMPID`
-		if [ $? -eq 0 ]; then
-			echo "killing $XTERMPID"
-			kill $XTERMPID
+		if [ "$XTERMPID" != "0" -a "$XTERMPID" != "" ]; then
+			running=`ps -wwfp $XTERMPID`
+			if [ $? -eq 0 ]; then
+				echo "killing $XTERMPID"
+				kill $XTERMPID
+			fi
 		fi
 	fi
 
@@ -336,6 +340,11 @@ Test_Fetch_Target_IP()
 	local opid=$1
 	local ip_addr=0
 
+	if [ "$opid" = "0" -o "$opid" = "" ]; then
+		echo ""
+		return
+	fi
+
 	# Check if $1 pid exists and contains ipaddr of target
 	ip_addr=`ps -wwfp $opid | grep -o "192\.168\.7\.[0-9]*::" | awk -F":" '{print $1}'`
 
@@ -433,8 +442,10 @@ Test_Create_Qemu()
 	# Parse IP address of target from the qemu command line
 	TARGET_IPADDR=`Test_Fetch_Target_IP $QEMUPID`
 	echo "Target IP is ${TARGET_IPADDR}"
-	if [ -z ${TARGET_IPADDR} -o "${TARGET_IPADDR}" = "0" ]; then
+	if [ ${TARGET_IPADDR} = "" -o "${TARGET_IPADDR}" = "0" ]; then
 		Test_Info "There is no qemu process or qemu ip address found, return failed"
+		ps -wwf
+		ps axww -O ppid
 		return 1
 	fi
 
-- 
1.7.10.4



