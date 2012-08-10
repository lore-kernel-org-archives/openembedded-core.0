Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1SzudO-00018j-MG
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 21:12:34 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 9F8F91E48B;
	Fri, 10 Aug 2012 12:00:45 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2012 12:00:41 -0700
Message-Id: <1344625241-15300-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
Subject: [PATCH] dbus: Fix pid file in dbus init script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 19:12:35 -0000

The PIDFILE (/var/run/dbus/pid) referenced by /etc/init.d/dbus-1 did
not match the path (/var/run/messagebus.pid) configured in
/etc/dbus-1/system.conf, so the initscript could start the daemon, but
not stop it.  Also remove needless directory ownership logic
(dbus-daemon drops its pid file as root before calling setuid).

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init | 11 +++--------
 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init | 11 +++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
index 4abc4cb..17b58ed 100644
--- a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
@@ -18,9 +18,8 @@ set -e
 
 DAEMON=/usr/bin/dbus-daemon
 NAME=dbus
-DAEMONUSER=messagebus
-PIDDIR=/var/run/dbus
-PIDFILE=$PIDDIR/pid
+DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
+PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
 UUIDDIR=/var/lib/dbus
 DESC="system message bus"
 EVENTDIR=/etc/dbus-1/event.d
@@ -38,11 +37,7 @@ test "$ENABLED" != "0" || exit 0
 
 start_it_up()
 {
-  if [ ! -d $PIDDIR ]; then
-    mkdir -p $PIDDIR
-    chown $DAEMONUSER $PIDDIR
-    chgrp $DAEMONUSER $PIDDIR
-  fi
+  mkdir -p "`dirname $PIDFILE`"
   if [ -e $PIDFILE ]; then
     PIDDIR=/proc/$(cat $PIDFILE)
     if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then 
diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
index 4abc4cb..17b58ed 100644
--- a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
@@ -18,9 +18,8 @@ set -e
 
 DAEMON=/usr/bin/dbus-daemon
 NAME=dbus
-DAEMONUSER=messagebus
-PIDDIR=/var/run/dbus
-PIDFILE=$PIDDIR/pid
+DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
+PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
 UUIDDIR=/var/lib/dbus
 DESC="system message bus"
 EVENTDIR=/etc/dbus-1/event.d
@@ -38,11 +37,7 @@ test "$ENABLED" != "0" || exit 0
 
 start_it_up()
 {
-  if [ ! -d $PIDDIR ]; then
-    mkdir -p $PIDDIR
-    chown $DAEMONUSER $PIDDIR
-    chgrp $DAEMONUSER $PIDDIR
-  fi
+  mkdir -p "`dirname $PIDFILE`"
   if [ -e $PIDFILE ]; then
     PIDDIR=/proc/$(cat $PIDFILE)
     if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then 
-- 
1.7.11.2



