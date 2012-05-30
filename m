Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SZd7q-0007L2-S4
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 09:15:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2012 00:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="150150825"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.210])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2012 00:05:02 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 10:11:06 +0300
Message-Id: <1338361866-4176-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] dbus: update to version 1.4.20
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
X-List-Received-Date: Wed, 30 May 2012 07:15:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unstable version 1.5.12 also supported

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../dbus/{dbus-1.4.16 => dbus-1.4.20}/dbus-1.init  |    0
 .../dbus/{dbus-1.4.16 => dbus-1.4.20}/tmpdir.patch |    0
 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init     |  121 ++++++++++++++++++++
 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch    |   44 +++++++
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    7 --
 meta/recipes-core/dbus/dbus_1.4.20.bb              |    6 +
 meta/recipes-core/dbus/dbus_1.5.12.bb              |    9 ++
 7 files changed, 180 insertions(+), 7 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.4.20}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.4.20}/tmpdir.patch (100%)
 create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
 create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.4.20.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb

diff --git a/meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.4.20/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.4.20/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
new file mode 100644
index 0000000..4abc4cb
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
@@ -0,0 +1,121 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          dbus
+# Required-Start:    $remote_fs $syslog
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      1
+# Short-Description: D-Bus systemwide message bus
+# Description:       D-Bus is a simple interprocess messaging system, used
+#                    for sending messages between applications.
+### END INIT INFO
+#
+# -*- coding: utf-8 -*-
+# Debian init.d script for D-BUS
+# Copyright © 2003 Colin Walters <walters@debian.org>
+
+set -e
+
+DAEMON=/usr/bin/dbus-daemon
+NAME=dbus
+DAEMONUSER=messagebus
+PIDDIR=/var/run/dbus
+PIDFILE=$PIDDIR/pid
+UUIDDIR=/var/lib/dbus
+DESC="system message bus"
+EVENTDIR=/etc/dbus-1/event.d
+
+test -x $DAEMON || exit 0
+
+# Source defaults file; edit that file to configure this script.
+ENABLED=1
+PARAMS=""
+if [ -e /etc/default/dbus ]; then
+  . /etc/default/dbus
+fi
+
+test "$ENABLED" != "0" || exit 0
+
+start_it_up()
+{
+  if [ ! -d $PIDDIR ]; then
+    mkdir -p $PIDDIR
+    chown $DAEMONUSER $PIDDIR
+    chgrp $DAEMONUSER $PIDDIR
+  fi
+  if [ -e $PIDFILE ]; then
+    PIDDIR=/proc/$(cat $PIDFILE)
+    if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then 
+      echo "$DESC already started; not starting."
+    else
+      echo "Removing stale PID file $PIDFILE."
+      rm -f $PIDFILE
+    fi
+  fi
+
+  if [ ! -d $UUIDDIR ]; then
+    mkdir -p $UUIDDIR
+    chown $DAEMONUSER $UUIDDIR
+    chgrp $DAEMONUSER $UUIDDIR
+  fi
+ 
+  dbus-uuidgen --ensure  
+
+  echo -n "Starting $DESC: "
+  start-stop-daemon --start --quiet --pidfile $PIDFILE \
+    --user $DAEMONUSER --exec $DAEMON -- --system $PARAMS
+  echo "$NAME."
+  if [ -d $EVENTDIR ]; then
+      run-parts --arg=start $EVENTDIR
+  fi
+}
+
+shut_it_down()
+{
+  if [ -d $EVENTDIR ]; then
+      # TODO: --reverse when busybox supports it
+      run-parts --arg=stop $EVENTDIR
+  fi
+  echo -n "Stopping $DESC: "
+  start-stop-daemon --stop  --quiet --pidfile $PIDFILE \
+    --user $DAEMONUSER
+  # We no longer include these arguments so that start-stop-daemon
+  # can do its job even given that we may have been upgraded.
+  # We rely on the pidfile being sanely managed
+  # --exec $DAEMON -- --system $PARAMS
+  echo "$NAME."
+  rm -f $PIDFILE
+}
+
+reload_it()
+{
+  echo -n "Reloading $DESC config: "
+  dbus-send --print-reply --system --type=method_call \
+            --dest=org.freedesktop.DBus \
+            / org.freedesktop.DBus.ReloadConfig > /dev/null
+  # hopefully this is enough time for dbus to reload it's config file.
+  echo "done."
+}
+
+case "$1" in
+  start)
+    start_it_up
+  ;;
+  stop)
+    shut_it_down
+  ;;
+  reload|force-reload)
+    reload_it
+  ;;
+  restart)
+    shut_it_down
+    sleep 1
+    start_it_up
+  ;;
+  *)
+    echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-reload}" >&2
+    exit 1
+  ;;
+esac
+
+exit 0
diff --git a/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
new file mode 100644
index 0000000..bf086e1
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
@@ -0,0 +1,44 @@
+From 5105fedd7fa13dadd2d0d864fb77873b83b79a4b Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 23 Jun 2011 13:52:09 +0200
+Subject: [PATCH] buildsys: hardcode socketdir to /tmp
+
+the TMPDIR env var isn't always pointing to the right target path
+
+Upstream-Status: Inappropriate [embedded]
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Original comment:
+
+	avoid to check tmp dir at build time. instead uses hard coded /tmp here
+	comment added by Kevin Tian <kevin.tian@intel.com>
+---
+ configure.ac |   11 +----------
+ 1 files changed, 1 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 408054b..6d26180 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1483,16 +1483,7 @@ AC_SUBST(TEST_LAUNCH_HELPER_BINARY)
+ AC_DEFINE_UNQUOTED(DBUS_TEST_LAUNCH_HELPER_BINARY, "$TEST_LAUNCH_HELPER_BINARY",
+                    [Full path to the launch helper test program in the builddir])
+ 
+-#### Find socket directories
+-if ! test -z "$TMPDIR" ; then
+-   DEFAULT_SOCKET_DIR=$TMPDIR
+-elif ! test -z "$TEMP" ; then
+-   DEFAULT_SOCKET_DIR=$TEMP
+-elif ! test -z "$TMP" ; then
+-   DEFAULT_SOCKET_DIR=$TMP
+-else
+-   DEFAULT_SOCKET_DIR=/tmp
+-fi
++DEFAULT_SOCKET_DIR=/tmp
+ 
+ DEFAULT_SOCKET_DIR=`echo $DEFAULT_SOCKET_DIR | sed 's/+/%2B/g'`
+ 
+-- 
+1.6.6.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/dbus/dbus_1.4.16.bb
deleted file mode 100644
index 3cf8bb8..0000000
--- a/meta/recipes-core/dbus/dbus_1.4.16.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include dbus.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "44a2a10678e7e50460879c3eb4453a65"
-SRC_URI[sha256sum] = "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464ca9bdc84f411b29c6"
-
diff --git a/meta/recipes-core/dbus/dbus_1.4.20.bb b/meta/recipes-core/dbus/dbus_1.4.20.bb
new file mode 100644
index 0000000..1df49b7
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.4.20.bb
@@ -0,0 +1,6 @@
+include dbus.inc
+
+PR = "${INC_PR}.0"
+
+RC_URI[md5sum] = "79eca2f2c1894ac347acce128314428b"
+SRC_URI[sha256sum] = "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea62fcfd639520d5aaf"
diff --git a/meta/recipes-core/dbus/dbus_1.5.12.bb b/meta/recipes-core/dbus/dbus_1.5.12.bb
new file mode 100644
index 0000000..f41d170
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.5.12.bb
@@ -0,0 +1,9 @@
+include dbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ddf18c86fd86ca0d766e18a514e368fd"
+SRC_URI[sha256sum] = "5d3e09a831259ca64b15357cfa1c60a5a7ab06ef469d5b82c2308de9cadf1094"
+
+DEFAULT_PREFERENCE = "-1"
+
-- 
1.7.9.5



