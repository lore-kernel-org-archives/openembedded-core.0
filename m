Return-Path: <ben.shelton@ni.com>
X-Greylist: delayed 1761 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Jul 2014 21:28:43 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00E377018F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:28:43 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6GLSijP012138 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:28:44 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071616284465-457065 ;
	Wed, 16 Jul 2014 16:28:44 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 16:28:32 -0500
Message-Id: <1405546112-14100-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 04:28:44 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 04:28:44 PM,
	Serialize complete at 07/16/2014 04:28:44 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-16_07:2014-07-16, 2014-07-16,
	1970-01-01 signatures=0
Subject: [PATCH] openssh: use pidfile in initscript
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
X-List-Received-Date: Wed, 16 Jul 2014 21:28:46 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Stopping sshd must only kill the listening (top-level) daemon; it must
not stop any other sshd process, because those are forked ssh
connections which may include e.g. the connection that called
/etc/init.d/sshd stop.

This initscript uses "start-stop-daemon -x <exe>" for starting/stopping.
When that is provided by busybox, this behavior is broken:
`/etc/init.d/sshd stop` stops *all* sshd processes. This was caused by a
fix to busybox 1.20: 17eedcad9406c43beddab3906c8c693626c351fb
"ssd: compat: match -x EXECUTABLE by /proc/pid/exe too".

The fix is to use a pidfile. All initscripts in upstream openssh do this,
as does dropbear.

Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-connectivity/openssh/openssh/init | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 37c8e7b..70d4a34 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -1,6 +1,8 @@
 #! /bin/sh
 set -e
 
+PIDFILE=/var/run/sshd.pid
+
 # source function library
 . /etc/init.d/functions
 
@@ -70,12 +72,12 @@ case "$1" in
 	echo "Starting OpenBSD Secure Shell server: sshd"
 	check_keys
 	check_privsep_dir
-	start-stop-daemon -S -x /usr/sbin/sshd -- $SSHD_OPTS
+	start-stop-daemon -S -p $PIDFILE -x /usr/sbin/sshd -- $SSHD_OPTS
         echo "done."
 	;;
   stop)
         echo -n "Stopping OpenBSD Secure Shell server: sshd"
-	start-stop-daemon -K -x /usr/sbin/sshd
+	start-stop-daemon -K -p $PIDFILE -x /usr/sbin/sshd
         echo "."
 	;;
 
@@ -84,7 +86,7 @@ case "$1" in
 	check_keys
 	check_config
         echo -n "Reloading OpenBSD Secure Shell server's configuration"
-	start-stop-daemon -K -s 1 -x /usr/sbin/sshd
+	start-stop-daemon -K -p $PIDFILE -s 1 -x /usr/sbin/sshd
 	echo "."
 	;;
 
@@ -92,11 +94,11 @@ case "$1" in
   	check_keys
 	check_config
         echo -n "Restarting OpenBSD Secure Shell server: sshd"
-	start-stop-daemon -K --oknodo -x /usr/sbin/sshd
+	start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/sbin/sshd
 	check_for_no_start
 	check_privsep_dir
 	sleep 2
-	start-stop-daemon -S -x /usr/sbin/sshd -- $SSHD_OPTS
+	start-stop-daemon -S -p $PIDFILE -x /usr/sbin/sshd -- $SSHD_OPTS
 	echo "."
 	;;
 
-- 
2.0.1


