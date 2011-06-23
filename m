Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZj99-0007dy-1Q
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:36:35 +0200
Received: by wwg12 with SMTP id 12so1559493wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 05:32:59 -0700 (PDT)
Received: by 10.216.144.2 with SMTP id m2mr1141615wej.53.1308832379145;
	Thu, 23 Jun 2011 05:32:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r20sm834873wec.31.2011.06.23.05.32.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 05:32:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 14:32:54 +0200
Message-Id: <1308832374-31767-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus: update to 1.4.12
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
X-List-Received-Date: Thu, 23 Jun 2011 12:36:35 -0000

The tmpdir patch has been regenerated and can now be applied with git-am, no functional changes.

The biggest improvement is that dbus will log to syslog nowadays:

[   22.238708] <29>dbus[237]: [system] Activating service name='fi.w1.wpa_supplicant1' (using servicehelper)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/dbus-1.4.1/dbus-1.init   |  121 -----------------------
 meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch  |   36 -------
 meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init  |  121 +++++++++++++++++++++++
 meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch |   44 ++++++++
 meta/recipes-core/dbus/dbus_1.4.1.bb            |    6 -
 meta/recipes-core/dbus/dbus_1.4.12.bb           |    4 +
 6 files changed, 169 insertions(+), 163 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-1.4.1/dbus-1.init
 delete mode 100644 meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch
 create mode 100644 meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
 create mode 100644 meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.1.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.4.12.bb

diff --git a/meta/recipes-core/dbus/dbus-1.4.1/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.1/dbus-1.init
deleted file mode 100644
index 4abc4cb..0000000
--- a/meta/recipes-core/dbus/dbus-1.4.1/dbus-1.init
+++ /dev/null
@@ -1,121 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          dbus
-# Required-Start:    $remote_fs $syslog
-# Required-Stop:     $remote_fs $syslog
-# Default-Start:     2 3 4 5
-# Default-Stop:      1
-# Short-Description: D-Bus systemwide message bus
-# Description:       D-Bus is a simple interprocess messaging system, used
-#                    for sending messages between applications.
-### END INIT INFO
-#
-# -*- coding: utf-8 -*-
-# Debian init.d script for D-BUS
-# Copyright © 2003 Colin Walters <walters@debian.org>
-
-set -e
-
-DAEMON=/usr/bin/dbus-daemon
-NAME=dbus
-DAEMONUSER=messagebus
-PIDDIR=/var/run/dbus
-PIDFILE=$PIDDIR/pid
-UUIDDIR=/var/lib/dbus
-DESC="system message bus"
-EVENTDIR=/etc/dbus-1/event.d
-
-test -x $DAEMON || exit 0
-
-# Source defaults file; edit that file to configure this script.
-ENABLED=1
-PARAMS=""
-if [ -e /etc/default/dbus ]; then
-  . /etc/default/dbus
-fi
-
-test "$ENABLED" != "0" || exit 0
-
-start_it_up()
-{
-  if [ ! -d $PIDDIR ]; then
-    mkdir -p $PIDDIR
-    chown $DAEMONUSER $PIDDIR
-    chgrp $DAEMONUSER $PIDDIR
-  fi
-  if [ -e $PIDFILE ]; then
-    PIDDIR=/proc/$(cat $PIDFILE)
-    if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then 
-      echo "$DESC already started; not starting."
-    else
-      echo "Removing stale PID file $PIDFILE."
-      rm -f $PIDFILE
-    fi
-  fi
-
-  if [ ! -d $UUIDDIR ]; then
-    mkdir -p $UUIDDIR
-    chown $DAEMONUSER $UUIDDIR
-    chgrp $DAEMONUSER $UUIDDIR
-  fi
- 
-  dbus-uuidgen --ensure  
-
-  echo -n "Starting $DESC: "
-  start-stop-daemon --start --quiet --pidfile $PIDFILE \
-    --user $DAEMONUSER --exec $DAEMON -- --system $PARAMS
-  echo "$NAME."
-  if [ -d $EVENTDIR ]; then
-      run-parts --arg=start $EVENTDIR
-  fi
-}
-
-shut_it_down()
-{
-  if [ -d $EVENTDIR ]; then
-      # TODO: --reverse when busybox supports it
-      run-parts --arg=stop $EVENTDIR
-  fi
-  echo -n "Stopping $DESC: "
-  start-stop-daemon --stop  --quiet --pidfile $PIDFILE \
-    --user $DAEMONUSER
-  # We no longer include these arguments so that start-stop-daemon
-  # can do its job even given that we may have been upgraded.
-  # We rely on the pidfile being sanely managed
-  # --exec $DAEMON -- --system $PARAMS
-  echo "$NAME."
-  rm -f $PIDFILE
-}
-
-reload_it()
-{
-  echo -n "Reloading $DESC config: "
-  dbus-send --print-reply --system --type=method_call \
-            --dest=org.freedesktop.DBus \
-            / org.freedesktop.DBus.ReloadConfig > /dev/null
-  # hopefully this is enough time for dbus to reload it's config file.
-  echo "done."
-}
-
-case "$1" in
-  start)
-    start_it_up
-  ;;
-  stop)
-    shut_it_down
-  ;;
-  reload|force-reload)
-    reload_it
-  ;;
-  restart)
-    shut_it_down
-    sleep 1
-    start_it_up
-  ;;
-  *)
-    echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-reload}" >&2
-    exit 1
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch
deleted file mode 100644
index de0766a..0000000
--- a/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [embedded]
-
-# avoid to check tmp dir at build time. instead uses hard coded /tmp here
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>
-
---- dbus-0.22/configure.in.orig	2004-08-13 00:57:16.000000000 +0200
-+++ dbus-0.22/configure.in	2004-12-30 21:15:57.000000000 +0100
-@@ -1047,15 +1048,18 @@
- AC_SUBST(ABSOLUTE_TOP_BUILDDIR)
- 
- #### Find socket directories
--if ! test -z "$TMPDIR" ; then
--   DEFAULT_SOCKET_DIR=$TMPDIR
--elif ! test -z "$TEMP" ; then
--   DEFAULT_SOCKET_DIR=$TEMP
--elif ! test -z "$TMP" ; then
--   DEFAULT_SOCKET_DIR=$TMP
--else
--   DEFAULT_SOCKET_DIR=/tmp
--fi
-+#if ! test -z "$TMPDIR" ; then
-+#   DEFAULT_SOCKET_DIR=$TMPDIR
-+#elif ! test -z "$TEMP" ; then
-+#   DEFAULT_SOCKET_DIR=$TEMP
-+#elif ! test -z "$TMP" ; then
-+#   DEFAULT_SOCKET_DIR=$TMP
-+#else
-+#   DEFAULT_SOCKET_DIR=/tmp
-+#fi
-+
-+# checks disabled to avoid expanding this at build time
-+DEFAULT_SOCKET_DIR=/tmp
- 
- if ! test -z "$with_test_socket_dir" ; then
-    TEST_SOCKET_DIR="$with_test_socket_dir"
diff --git a/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
new file mode 100644
index 0000000..4abc4cb
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
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
diff --git a/meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch
new file mode 100644
index 0000000..bf086e1
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.4.12/tmpdir.patch
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
diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
deleted file mode 100644
index 252d160..0000000
--- a/meta/recipes-core/dbus/dbus_1.4.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include dbus.inc
-
-PR = "r6"
-
-SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
-SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
diff --git a/meta/recipes-core/dbus/dbus_1.4.12.bb b/meta/recipes-core/dbus/dbus_1.4.12.bb
new file mode 100644
index 0000000..ada53c9
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.4.12.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+SRC_URI[md5sum] = "104f2ea94c10a896dfb1edecb5714cb1"
+SRC_URI[sha256sum] = "da3c97fd546610558d588799e27c4fa81101e754acbcd34747a42c131f30dbe7"
+
-- 
1.6.6.1



