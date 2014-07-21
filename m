Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 057F060196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:51:07 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LFp8UH015387 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:51:08 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072110510860-32912 ;
	Mon, 21 Jul 2014 10:51:08 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 10:50:54 -0500
Message-Id: <1405957856-15114-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:51:08 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:51:08 AM,
	Serialize complete at 07/21/2014 10:51:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [PATCH 1/3] bootlogd: Honor VERBOSE
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
X-List-Received-Date: Mon, 21 Jul 2014 15:51:16 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

The messages echoed when starting and stopping bootlogd are currently
printed regardless of the setting of VERBOSE.  Adjust the initscript so
they're only printed when VERBOSE is enabled.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index 7d6518d..06af465 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -46,7 +46,7 @@ esac
 
 case "$ACTION" in
 	start)
-		echo -n "Starting $DESC: "
+		[ "${VERBOSE}" != "no" ] && echo -n "Starting $DESC: "
 		if [ -d /proc/1/. ]
 		then
 			umask 027
@@ -55,10 +55,12 @@ case "$ACTION" in
 		else
 			$DAEMON -r -c
 		fi
-		echo "$NAME."
+		[ "${VERBOSE}" != "no" ] && echo "$NAME."
 		;;
 	stop)
-		echo -n "Stopping $DESC: "
+		# stop may get called during bootup, so let it honor
+		# rcS VERBOSE setting
+		[ "${VERBOSE}" != "no" ] && echo -n "Stopping $DESC: "
 		start-stop-daemon --stop --quiet --exec $DAEMON
 
 		if [ "$STOPPER" ] && [ -f /var/log/boot ] && \
@@ -71,7 +73,7 @@ case "$ACTION" in
 			mv boot~ boot.0
 		fi
 
-		echo "$NAME."
+		[ "${VERBOSE}" != "no" ] && echo "$NAME."
 		;;
 	 restart|force-reload)
 		echo -n "Restarting $DESC: "
-- 
2.0.2


