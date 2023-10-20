Return-Path: <gs-yoctoproject.org@gluelogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88341C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:30:58 +0000 (UTC)
Received: from smtp1.atof.net (smtp1.atof.net [52.86.233.228])
 by mx.groups.io with SMTP id smtpd.web10.54234.1697808642990488032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gluelogic.com, ip: 52.86.233.228, mailfrom: gs-yoctoproject.org@gluelogic.com)
From: Glenn Strauss <gs-yoctoproject.org@gluelogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Glenn Strauss <gstrauss@gluelogic.com>
Subject: [PATCH 2/3] lighttpd: update init script
Date: Fri, 20 Oct 2023 09:30:25 -0400
Message-ID: <20231020133026.103646-3-gs-yoctoproject.org@gluelogic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
References: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.78
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189530

From: Glenn Strauss <gstrauss@gluelogic.com>

- add configtest option
- add configtest before starting, restart, reload, force-reload
- change reload,force-reload to use lighttpd graceful restart
  via kill signal USR1

Signed-off-by: Glenn Strauss <gstrauss@gluelogic.com>
---
 .../lighttpd/lighttpd/lighttpd                | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/lighttpd b/meta/recipes-extended/lighttpd/lighttpd/lighttpd
index 82fbaa523b..f369dce42c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/lighttpd
+++ b/meta/recipes-extended/lighttpd/lighttpd/lighttpd
@@ -6,9 +6,14 @@ NAME=lighttpd
 DESC="Lighttpd Web Server"
 OPTS="-f /etc/lighttpd/lighttpd.conf"
 
+configtest() {
+	"$DAEMON" $OPTS -tt || exit 1
+}
+
 case "$1" in
   start)
 	echo -n "Starting $DESC: "
+	configtest
 	start-stop-daemon --start -x "$DAEMON" -- $OPTS
 	echo "$NAME."
 	;;
@@ -17,16 +22,26 @@ case "$1" in
 	start-stop-daemon --stop -x "$DAEMON"
 	echo "$NAME."
 	;;
-  restart|force-reload)
+  restart)
 	echo -n "Restarting $DESC: "
+	configtest
 	start-stop-daemon --stop -x "$DAEMON"
 	sleep 1
 	start-stop-daemon --start -x "$DAEMON" -- $OPTS
 	echo "$NAME."
 	;;
+  reload|force-reload)
+	echo -n "Reloading $DESC: "
+	configtest
+	killall -USR1 "${DAEMON##*/}"
+	echo "$NAME."
+	;;
+  configtest)
+	configtest
+	;;
   *)
 	N=/etc/init.d/$NAME
-	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	echo "Usage: $N {start|stop|restart|reload|force-reload|configtest}" >&2
 	exit 1
 	;;
 esac
-- 
2.41.0

