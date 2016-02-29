Return-Path: <awichmann@emacinc.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB9F731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 18:27:49 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g203so195814725iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tHZr4y+B5yabFozFrA3P0mEPL2QmdZ0Apdd3vaQxYMw=;
	b=ksc5P9kZQdRoaCjs4aDPcMWwm0E1fNLXOZkjhRicrhZBEy3XfE3zZ9f1F36d7iUhQ/
	D6cVPwZdV3HQdmJbGXSN8HCRXqKfkZedAv1R1Biti7TE9l/BzoGcyH++rtQxt8Qxxv8g
	808li17sIf+CfqYkHF0kpf4hinSM6QcRSfXirD9ZF/q+ptmQQCVkFg89dMtcu1GgVlHU
	6Gx3tml5L1/MxPWAHxdt3EnWW9XGhdLkEpZJfIN9+xEY3NLBvbdOHtuvZyQSsYvfYyFd
	biQ2f8VS2WYpAZj+JwQq9IAv7ptEJwtKUkOhxg9vDbuXnfmy4aiu6QKwlPTTeyve9XG+
	TZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tHZr4y+B5yabFozFrA3P0mEPL2QmdZ0Apdd3vaQxYMw=;
	b=iLHlTVrbMznAINq74w9gT3aZUvtujfEQRoQZE2Bilz3WirOee6UV3igSbWpTpKQ1Cc
	Ifble9p6CeRxjBloyQbAKp6jmnvL93EbuYS6HiZiFRmh2wgZsJ4MnmQTutsARrMI/Qx0
	nZqnHrb+zjREriEqkeyt22yblXxaCKK41/7oEk3SnayeGJsWQ0PkgREMZXY+pFcEM0aH
	pucK+YcJGSSPCgU04Z/NWt7mp2A6Hu1b6vjzq+v2FY6IPcFW8NELbXuXT3bGRAD837YT
	K2Smv2o5YFPTu0WEU9l0dxGV1+IiXSG5bPNG9e/x0L4wlMKHlNEYxdSCVE3g8Qy86gs1
	x77g==
X-Gm-Message-State: AG10YORQOI6UDVbDs7moYTq2MDX8h954YHb86mNAOpc5X5SH9/ZrkGK4v58YgXrZlOcLyQMQ
X-Received: by 10.107.37.12 with SMTP id l12mr18878479iol.138.1456770470660;
	Mon, 29 Feb 2016 10:27:50 -0800 (PST)
Received: from ENG-26-LX.EMACINC.COM ([66.186.100.194])
	by smtp.gmail.com with ESMTPSA id
	o201sm11225401ioe.15.2016.02.29.10.27.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 10:27:49 -0800 (PST)
From: Andrew Wichmann <awichmann@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 12:27:35 -0600
Message-Id: <1456770455-7805-1-git-send-email-awichmann@emacinc.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] wpa-supplicant.sh: updated to modern init script format, refactoring, and new restart functionality
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
X-List-Received-Date: Mon, 29 Feb 2016 18:27:50 -0000

Fixed a bug in the original commit where restart exited success without starting the daemon.
Now both start and stop call check_socket to verify the socket was added/removed, and success is
returned at the end of the script instead of in the body.

Signed-off-by: Andrew Wichmann <awichmann@emacinc.com>
---
 .../wpa-supplicant/wpa-supplicant.sh               | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
index 3623cbe..e8ca51b 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
@@ -50,7 +50,7 @@ start() {
 			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN --pidfile $WPA_SUP_PIDFILE \
 			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER
 	fi
-	check_socket
+	check_socket "start"
 }
 
 stop() {
@@ -69,16 +69,26 @@ stop() {
 			rm -f $WPA_SUP_PIDFILE
 		fi
 	fi
-	exit 0
+	check_socket "stop"
 }
 
 check_socket(){
-	# if the interface socket exists, then wpa_supplicant was invoked successfully
-	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]
-	then
-		[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: ctrl_interface socket located at$WPA_COMMON_CTRL_IFACE/$IFACE"
-		exit 0
+	if [ $1 = "start" ]; then
+		# if the interface socket exists, then wpa_supplicant start was invoked successfully
+		if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
+			[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: ctrl_interface socket located at$WPA_COMMON_CTRL_IFACE/$IFACE"
+			return
+		fi
+
+	else if [$1 = "stop" ]; then
+	# if the interface socket does not exists, then wpa_supplicant stop was invoked successfully
+		if [ ! -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ];then
+			[ "$VERBOSE" = "yes" ] && echo "$WPA_SUP_PNAME: ctrl_interface socket was removed"
+			return
+		fi
 	fi
+
+	# if the program reaches this line, then wpa_supplicant was invoked incorrectly
 	exit 1
 }
 
@@ -99,4 +109,4 @@ case "$1" in
 
 esac
 
-exit 1
+exit 0
-- 
1.9.1


