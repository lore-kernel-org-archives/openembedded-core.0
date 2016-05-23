Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A74DD62137
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 09:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4N9WTPv007560 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 10:32:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ec9zQ5lMIZ9T
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 10:32:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4N9WNPC007554
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 10:32:24 +0100
Message-ID: <1463995943.9570.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 10:32:23 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] useradd: Fix infinite build loop
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
X-List-Received-Date: Mon, 23 May 2016 09:32:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

http://git.openembedded.org/openembedded-core-contrib/commit/?id=642c6cf0b6a0371de476513162bd0cefa9c438b3
introduces a problem if the USERADD_PARAM variable has trailing
whitespace as the code infinitely loops causing build hangs.

Add a similar sed expression to $remaining to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 67dae88..28dd341 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -55,14 +55,14 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	# Invoke multiple instances of groupadd for parameter lists
 	# separated by ';'
 	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
+	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	while test "x$opts" != "x"; do
 		perform_groupadd "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	done
 fi 
 
@@ -71,14 +71,14 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	# Invoke multiple instances of useradd for parameter lists
 	# separated by ';'
 	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
+	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	while test "x$opts" != "x"; do
 		perform_useradd "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	done
 fi
 
@@ -87,14 +87,14 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" != "x"; then
 	# Invoke multiple instances of groupmems for parameter lists
 	# separated by ';'
 	opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
+	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	while test "x$opts" != "x"; do
 		perform_groupmems "$SYSROOT" "$OPT $opts"
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+		remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
 	done
 fi
 }



