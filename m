Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UaDgY-00011O-W6
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 01:22:43 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r48N3wRL023142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 16:03:58 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 16:03:58 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 16:03:58 -0700
Message-ID: <1368054238-21389-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] sysvinit: modify bootlog location
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
X-List-Received-Date: Wed, 08 May 2013 23:22:52 -0000
Content-Type: text/plain

The default location for bootlog is volatile,
so we change it to something that is not.
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index f8f07a0..4422166 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -37,6 +37,19 @@ case "$0" in
 		;;
 esac
 
+# default /var/log/boot is not an option since /var/log becomes
+# /var/volatile/log
+logfile=/var/local/bootlogd.log
+
+#
+# Create initial log files
+#
+if [ ! -f "$logfile" ] && touch "$logfile" >/dev/null 2>&1; then
+	echo "(Nothing has been logged yet.)" >| "$logfile"
+	chown root:adm "$logfile"
+	chmod 640 "$logfile"
+fi
+
 case "$ACTION" in
 	start)
 		echo -n "Starting $DESC: "
@@ -44,9 +57,9 @@ case "$ACTION" in
 		then
 			umask 027
 			start-stop-daemon --start --quiet \
-				--exec $DAEMON -- -r
+				--exec $DAEMON -- -r -l $logfile
 		else
-			$DAEMON -r
+			$DAEMON -r -l $logfile
 		fi
 		echo "$NAME."
 		;;
@@ -70,7 +83,7 @@ case "$ACTION" in
 		echo -n "Restarting $DESC: "
 		start-stop-daemon --stop --quiet --exec $DAEMON
 		sleep 1
-		start-stop-daemon --start --quiet --exec $DAEMON
+		start-stop-daemon --start --quiet --exec $DAEMON -- -l $logfile
 		echo "$NAME."
 		;;
 	*)
-- 
1.7.3.4



