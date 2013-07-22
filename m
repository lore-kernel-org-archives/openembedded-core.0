Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6844A6B1FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 08:14:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6M8F0PU027840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 01:15:00 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 22 Jul 2013 01:14:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jul 2013 16:14:55 +0800
Message-ID: <799e99cf845e29f2bcac04cee403f89cf600fa82.1374480160.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1374480160.git.jackie.huang@windriver.com>
References: <cover.1374480160.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dbus: add -o option into start-stop-daemon arguments
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
X-List-Received-Date: Mon, 22 Jul 2013 08:15:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

/etc/init.d/dbus-1 use "set -e" to let the script exit when any command failes.
This will cause "dbus-1 restart" command can't start dbus when dbus is stopped.
so add --oknodo option to let start-stop-daemon exit with friendly return value.
Then commands will work well.

Signed-off-by: Song.Li <Song.Li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
index 64f2170..0351190 100644
--- a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
@@ -57,7 +57,7 @@ start_it_up()
   dbus-uuidgen --ensure  
 
   echo -n "Starting $DESC: "
-  start-stop-daemon --start --quiet --pidfile $PIDFILE \
+  start-stop-daemon -o --start --quiet --pidfile $PIDFILE \
     --user $DAEMONUSER --exec $DAEMON -- --system $PARAMS
   echo "$NAME."
   if [ -d $EVENTDIR ]; then
@@ -72,7 +72,7 @@ shut_it_down()
       run-parts --arg=stop $EVENTDIR
   fi
   echo -n "Stopping $DESC: "
-  start-stop-daemon --stop  --quiet --pidfile $PIDFILE \
+  start-stop-daemon -o --stop  --quiet --pidfile $PIDFILE \
     --user $DAEMONUSER
   # We no longer include these arguments so that start-stop-daemon
   # can do its job even given that we may have been upgraded.
-- 
1.7.4.1


