Return-Path: <awichmann@emacinc.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 68B7D731F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:50:48 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id y8so160019igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 09:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4BMrHI5a0Rzd8GMHabImzvOguZFvm93S5+ZV0xtTxBY=;
	b=L5JT0+CqXLwemuOm/sIXg1jRtdqPKsUG9d/mNUohRSc0PxnQVxGNFNE7oIP2QZl9HS
	6wKRDglfWZUVqsjaaMupRS4MCmahs2ximUfHxzNiEpzRQstJn4SjQri+gG+ItHCGDTUL
	nmaiaklSp2UAgmbsJMIVhIkcpTUcNRq7/gjJsXTyzcc7txNPgosRdQTUcUo4rynfnBRW
	ySEWKwso5RAdtdaytWmLhAVkcWB8PrkP1tFGHiN/gCibLOqqTM0wEPHmDfNZJVBqnSh5
	gUKAfkavKybPld5lfWp2yuMl8KvAW+E4hTvmvvd3Y95lhMjS7Om1aT4QXZ+U7I03UofG
	ImVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4BMrHI5a0Rzd8GMHabImzvOguZFvm93S5+ZV0xtTxBY=;
	b=F7CT976nYBjVntMZO83OQJZpIHcBRngQs9xrQTTgnIE5GpKT34jCTXaYTLXaUQbsz0
	Ese20aFRT55svW/+pNu3iOslPG7u8tI2loPvXeqGVUWS08KZABwC7uqWrkJaQbXH4e8Y
	G98d2n9xrS9s0nv1xRd/AWIW2FgteslM7Y6GLBTNNqFkWwyDgZMCJZC7YW4COsG2xENp
	Hw1ibmWX9HlhqsABPL5OGENj+KJw4TfSfibxMg0L6fDDKFOJHRmM0CBbw2RgDF+yQWR0
	ce8BsjMf4+MJVhQyKb7RlKb2QpfJiGNdIpkITf6jOZnSmpAGapgWXHWaCqrpQs6gFK/2
	vmYA==
X-Gm-Message-State: AD7BkJKml3gz9xa99wHTy/KieOiufpKr5GWcKO4O9SIaY07HslhjD9nkGnBZVKGb8SXzr1zq
X-Received: by 10.50.43.194 with SMTP id y2mr10830666igl.96.1456768249073;
	Mon, 29 Feb 2016 09:50:49 -0800 (PST)
Received: from ENG-26-LX.EMACINC.COM ([66.186.100.194])
	by smtp.gmail.com with ESMTPSA id f6sm234320igo.20.2016.02.29.09.50.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 09:50:48 -0800 (PST)
From: Andrew Wichmann <awichmann@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 11:49:43 -0600
Message-Id: <1456768183-7248-1-git-send-email-awichmann@emacinc.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] wpa-supplicant.sh: updated to modern init script format, refactoring, and new restart functionality
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
X-List-Received-Date: Mon, 29 Feb 2016 17:50:52 -0000

Refactored the script by placing the logic of starting and stopping into separate functions,
added a switch statement to act on $1, then refactored multiple if statements into one line tests.
Check_socket function was extracted to increase the readability of the start function.
Created restart functionality by calling stop then start
Added a BEGIN INIT INFO comment section (should be verified for accuracy)
Sourced the rcS default file to use the VERBOSE variable instead of VERBOSITY
Defined WPA_COMMON_CTRL_IFACE = "/var/run/wpa_supplicant" that was previously acted upon but not defined.

Signed-off-by: Andrew Wichmann <awichmann@emacinc.com>
---
 .../wpa-supplicant/wpa-supplicant.sh               | 91 +++++++++++++---------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
index 5c9e5d3..3623cbe 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
@@ -1,72 +1,62 @@
-#!/bin/sh
+#!/bin/sh -e
+### BEGIN INIT INFO
+# Provides:			wpa_supplicant
+# Required-Start:	$local_fs
+# Required-Stop:	$local_fs
+# Default-Start:	2 3 4 5
+# Default-Stop:		0 1 6
+# Short-Description: A script to start, stop, or restart the wpa_supplicant daemon.
+### END INIT INFO
 
 
+IFACE="wlan0"
 WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
 WPA_SUP_PNAME="wpa_supplicant"
 WPA_SUP_PIDFILE="/var/run/wpa_supplicant.$IFACE.pid"
 WPA_SUP_OPTIONS="-B -P $WPA_SUP_PIDFILE -i $IFACE"
+WPA_COMMON_CTRL_IFACE="/var/run/wpa_supplicant"
+IF_WPA_CONF="/etc/wpa_supplicant.conf"
 
-VERBOSITY=0
 
+[ -s "/etc/default/rcS" ] && . "/etc/default/rcS"
 
-if [ -s "$IF_WPA_CONF" ]; then
-	WPA_SUP_CONF="-c $IF_WPA_CONF"
-else
-	exit 0
-fi
+[ ! -s "$IF_WPA_CONF" ] && exit 0
+WPA_SUP_CONF="-c $IF_WPA_CONF"
 
 if [ ! -x "$WPA_SUP_BIN" ]; then
 	
-	if [ "$VERBOSITY" = "1" ]; then
-		echo "$WPA_SUP_PNAME: binaries not executable or missing from $WPA_SUP_BIN"
-	fi
+	[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: binaries not executable or missing from $WPA_SUP_BIN"
 	
 	exit 1
 fi
 
-if [ "$MODE" = "start" ] ; then
+start() {
 	# driver type of interface, defaults to wext when undefined
 	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
 		IF_WPA_DRIVER=$(cat "/etc/wpa_supplicant/driver.$IFACE")
 	elif [ -z "$IF_WPA_DRIVER" ]; then
 		
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: wpa-driver not provided, using \"wext\""
-		fi
-		
+		[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: wpa-driver not provided, using \"wext\""
+	
 		IF_WPA_DRIVER="wext"
 	fi
 	
 	# if we have passed the criteria, start wpa_supplicant
 	if [ -n "$WPA_SUP_CONF" ]; then
 		
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
-		fi
-		
+		[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: $WPA_SUP_BIN $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
+
 		start-stop-daemon --start --quiet \
 			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN --pidfile $WPA_SUP_PIDFILE \
 			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER
 	fi
+	check_socket
+}
 
-	# if the interface socket exists, then wpa_supplicant was invoked successfully
-	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
-	
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: ctrl_interface socket located at $WPA_COMMON_CTRL_IFACE/$IFACE"
-		fi
-
-		exit 0
-		
-	fi
-	
-elif [ "$MODE" = "stop" ]; then
-
+stop() {
 	if [ -f "$WPA_SUP_PIDFILE" ]; then
 		
-		if [ "$VERBOSITY" = "1" ]; then
-			echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME daemon"
-		fi
+		[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME daemon"
 		
 		start-stop-daemon --stop --quiet \
 			--name $WPA_SUP_PNAME --pidfile	$WPA_SUP_PIDFILE
@@ -79,7 +69,34 @@ elif [ "$MODE" = "stop" ]; then
 			rm -f $WPA_SUP_PIDFILE
 		fi
 	fi
+	exit 0
+}
 
-fi
+check_socket(){
+	# if the interface socket exists, then wpa_supplicant was invoked successfully
+	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]
+	then
+		[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: ctrl_interface socket located at$WPA_COMMON_CTRL_IFACE/$IFACE"
+		exit 0
+	fi
+	exit 1
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	*)
+		echo "Usage: /etc/init.d/wpa_supplicant {start|stop|restart}"
+		exit 1
+
+esac
 
-exit 0
+exit 1
-- 
1.9.1


