Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA4086065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3Prpd024288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 20:25:53 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:42 +0800
Message-ID: <0502058d180d47c81b6431d01868dd9bba6653f5.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] sysvinit: add init.d/bootlogd status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init |   28 ++++++++++++++++++---
 1 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index f8f07a0..455d001 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -13,6 +13,9 @@ DAEMON=/sbin/bootlogd
 NAME=bootlogd
 DESC="Bootlog daemon"
 
+# source function library
+. /etc/init.d/functions
+
 test -f $DAEMON || exit 0
 
 [ -r /etc/default/bootlogd ] && . /etc/default/bootlogd
@@ -37,6 +40,19 @@ case "$0" in
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
@@ -44,9 +60,9 @@ case "$ACTION" in
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
@@ -70,13 +86,17 @@ case "$ACTION" in
 		echo -n "Restarting $DESC: "
 		start-stop-daemon --stop --quiet --exec $DAEMON
 		sleep 1
-		start-stop-daemon --start --quiet --exec $DAEMON
+		start-stop-daemon --start --quiet --exec $DAEMON -- -l $logfile
 		echo "$NAME."
 		;;
+	status)
+		status $DAEMON
+		exit $?
+		;;
 	*)
 		N=${0##*/}
 		N=${N#[SK]??}
-		echo "Usage: $N {start|stop|restart|force-reload}" >&2
+		echo "Usage: $N {start|stop|status|restart|force-reload}" >&2
 		exit 1
 		;;
 esac
-- 
1.7.4.1


