Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GD6-0001CN-Hb
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:27:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181507"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:41 +0300
Message-Id: <c6b77a8355ac7afadecf44acefee22aaacd3696f.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 54/64] dbus: Fix pid file in dbus init script
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:01 -0000

From: Andy Ross <andy.ross@windriver.com>

The PIDFILE (/var/run/dbus/pid) referenced by /etc/init.d/dbus-1 did
not match the path (/var/run/messagebus.pid) configured in
/etc/dbus-1/system.conf, so the initscript could start the daemon, but
not stop it.  Also remove needless directory ownership logic
(dbus-daemon drops its pid file as root before calling setuid).

Signed-off-by: Andy Ross <andy.ross@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init |   11 +++--------
 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init |   11 +++--------
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
1.7.7.6



