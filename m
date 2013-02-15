Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U6P2E-000227-Il
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 18:25:18 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 7D0F725434ED;
	Fri, 15 Feb 2013 17:25:15 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1U6Omg-00033l-9x; Fri, 15 Feb 2013 18:09:14 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 18:09:00 +0100
Message-Id: <1360948140-11663-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [PATCH] dropbear: Do not kill client connections on stop and restart
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
X-List-Received-Date: Fri, 15 Feb 2013 17:25:23 -0000

Use the pidfile functionality of start-stop-daemon to only kill
the dropbear server process and not the active client connections.

OE-classic used to have this functionality, a patch for it was
applied in revision 6adaccf00601e1bc3ce1ede5417eabcdf1671768.
---
 meta/recipes-core/dropbear/dropbear.inc  |    2 +-
 meta/recipes-core/dropbear/dropbear/init |    9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 8d94e5b..85b35ef 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core/dropbear/dropbear/init
index 5cc2d65..e8fed3f 100755
--- a/meta/recipes-core/dropbear/dropbear/init
+++ b/meta/recipes-core/dropbear/dropbear/init
@@ -15,6 +15,7 @@ PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 DAEMON=/usr/sbin/dropbear
 NAME=dropbear
 DESC="Dropbear SSH server"
+PIDFILE=/var/run/dropbear.pid
 
 DROPBEAR_PORT=22
 DROPBEAR_EXTRA_ARGS=
@@ -80,24 +81,24 @@ case "$1" in
 	KEY_ARGS=""
 	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
 	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
-	start-stop-daemon -S \
+	start-stop-daemon -S -p $PIDFILE \
 	  -x "$DAEMON" -- $KEY_ARGS \
 	    -p "$DROPBEAR_PORT" $DROPBEAR_EXTRA_ARGS
 	echo "$NAME."
 	;;
   stop)
 	echo -n "Stopping $DESC: "
-	start-stop-daemon -K -x "$DAEMON"
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
 	echo "$NAME."
 	;;
   restart|force-reload)
 	echo -n "Restarting $DESC: "
-	start-stop-daemon -K -x "$DAEMON"
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
 	sleep 1
 	KEY_ARGS=""
 	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
 	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
-	start-stop-daemon -S \
+	start-stop-daemon -S -p $PIDFILE \
 	  -x "$DAEMON" -- $KEY_ARGS \
 	    -p "$DROPBEAR_PORT" $DROPBEAR_EXTRA_ARGS
 	echo "$NAME."
-- 
1.7.10.4



