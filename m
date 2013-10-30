Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7436AA20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 09:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U9Bsks015753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 02:11:54 -0700 (PDT)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 02:11:54 -0700
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 17:12:29 +0800
Message-ID: <1383124349-8754-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] irda-utils: restart irda daemon correctly
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
X-List-Received-Date: Wed, 30 Oct 2013 09:11:54 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

irattach init script restart faulty logic prevents irda daemon
from restart correctly.

root@qemu0:~# /etc/init.d/irattach restart
Restarting IrDA: Terminated
root@qemu0:~# ps aux | grep irattach
root       541  0.0  0.2   2400   612 ttyS0    S+   09:05   0:00 grep irattach

As above shows, irattach not started after executing restart command.
This commit changed the restart command logic: firstly stop, then
start.
Prompt telling user irattach start successfully or failure also
added.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 .../irda-utils/irda-utils-0.9.18/init              |   38 ++++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
index b8038e0..6f29e9c 100755
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
@@ -8,6 +8,10 @@
 # Short-Description: Infrared port support
 ### END INIT INFO
 
+NAME="irattach"
+test -x "$IRDA_DAEMON" || IRDA_DAEMON=/usr/sbin/irattach
+test -z "$IRATTACH_PID" && IRATTACH_PID=/var/run/irattach.pid
+
 # Source function library.
 . /etc/init.d/functions
 
@@ -49,30 +53,26 @@ fi
 
 case "$1" in
   start)
-        echo -n "Starting IrDA: "
-		irattach ${DEVICE} ${ARGS} > /dev/null 2>&1 &
-        echo "$NAME."
-        ;;
+	echo -n "Starting IrDA: $NAME"
+	start-stop-daemon --start --quiet --exec "$IRDA_DAEMON" ${DEVICE} ${ARGS} --pidfile "$IRATTACH_PID"
+	sleep 1
+	[ -f /var/run/irattach.pid ] && echo " done" || echo " fail"
+	;;
   stop)
-        echo -n "Stopping IrDA: "
-		killall irattach > /dev/null 2>&1
-        echo "$NAME."
-        ;;
+	echo "Stopping IrDA: $NAME"
+	start-stop-daemon --stop --quiet --exec "$IRDA_DAEMON" --pidfile "$IRATTACH_PID"
+	;;
   restart|force-reload)
-        echo -n "Restarting IrDA: "
-		irattach ${DEVICE} ${ARGS} > /dev/null 2>&1 &
-        sleep 1
-		killall irattach > /dev/null 2>&1
-        echo "$NAME."
-        ;;
+	$0 stop
+	$0 start
+	;;
   status)
 	status irattach
 	exit $?
 	;;
   *)
-        N=/etc/init.d/$NAME
-        echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
-        exit 1
-        ;;
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
+	exit 1
+	;;
 esac
-
-- 
1.7.9.5


