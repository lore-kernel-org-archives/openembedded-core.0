Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U3bWQ-0006qh-No for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 01:08:55 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17NwSNK009027 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 23:58:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qs7bqj1G6sph
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2013 23:58:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17NwMeL009020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 23:58:25 GMT
Message-ID: <1360281168.10722.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 07 Feb 2013 23:52:48 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r17NwSNK009027
Subject: [PATCH] dbus: Drop old 1.5.12 version
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
X-List-Received-Date: Fri, 08 Feb 2013 00:08:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We have a newer default version...

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/recipe=
s-core/dbus/dbus-1.5.12/dbus-1.init
deleted file mode 100644
index 17b58ed..0000000
--- a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
+++ /dev/null
@@ -1,116 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          dbus
-# Required-Start:    $remote_fs $syslog
-# Required-Stop:     $remote_fs $syslog
-# Default-Start:     2 3 4 5
-# Default-Stop:      1
-# Short-Description: D-Bus systemwide message bus
-# Description:       D-Bus is a simple interprocess messaging system, us=
ed
-#                    for sending messages between applications.
-### END INIT INFO
-#
-# -*- coding: utf-8 -*-
-# Debian init.d script for D-BUS
-# Copyright =C2=A9 2003 Colin Walters <walters@debian.org>
-
-set -e
-
-DAEMON=3D/usr/bin/dbus-daemon
-NAME=3Ddbus
-DAEMONUSER=3Dmessagebus           # must match /etc/dbus-1/system.conf
-PIDFILE=3D/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
-UUIDDIR=3D/var/lib/dbus
-DESC=3D"system message bus"
-EVENTDIR=3D/etc/dbus-1/event.d
-
-test -x $DAEMON || exit 0
-
-# Source defaults file; edit that file to configure this script.
-ENABLED=3D1
-PARAMS=3D""
-if [ -e /etc/default/dbus ]; then
-  . /etc/default/dbus
-fi
-
-test "$ENABLED" !=3D "0" || exit 0
-
-start_it_up()
-{
-  mkdir -p "`dirname $PIDFILE`"
-  if [ -e $PIDFILE ]; then
-    PIDDIR=3D/proc/$(cat $PIDFILE)
-    if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${DAEMON}"=
 ]; then=20
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
-=20
-  dbus-uuidgen --ensure =20
-
-  echo -n "Starting $DESC: "
-  start-stop-daemon --start --quiet --pidfile $PIDFILE \
-    --user $DAEMONUSER --exec $DAEMON -- --system $PARAMS
-  echo "$NAME."
-  if [ -d $EVENTDIR ]; then
-      run-parts --arg=3Dstart $EVENTDIR
-  fi
-}
-
-shut_it_down()
-{
-  if [ -d $EVENTDIR ]; then
-      # TODO: --reverse when busybox supports it
-      run-parts --arg=3Dstop $EVENTDIR
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
-  dbus-send --print-reply --system --type=3Dmethod_call \
-            --dest=3Dorg.freedesktop.DBus \
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
-    echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-relo=
ad}" >&2
-    exit 1
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch b/meta/recip=
es-core/dbus/dbus-1.5.12/tmpdir.patch
deleted file mode 100644
index bf086e1..0000000
--- a/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5105fedd7fa13dadd2d0d864fb77873b83b79a4b Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 23 Jun 2011 13:52:09 +0200
-Subject: [PATCH] buildsys: hardcode socketdir to /tmp
-
-the TMPDIR env var isn't always pointing to the right target path
-
-Upstream-Status: Inappropriate [embedded]
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Original comment:
-
-	avoid to check tmp dir at build time. instead uses hard coded /tmp here
-	comment added by Kevin Tian <kevin.tian@intel.com>
----
- configure.ac |   11 +----------
- 1 files changed, 1 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 408054b..6d26180 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1483,16 +1483,7 @@ AC_SUBST(TEST_LAUNCH_HELPER_BINARY)
- AC_DEFINE_UNQUOTED(DBUS_TEST_LAUNCH_HELPER_BINARY, "$TEST_LAUNCH_HELPER=
_BINARY",
-                    [Full path to the launch helper test program in the =
builddir])
-=20
--#### Find socket directories
--if ! test -z "$TMPDIR" ; then
--   DEFAULT_SOCKET_DIR=3D$TMPDIR
--elif ! test -z "$TEMP" ; then
--   DEFAULT_SOCKET_DIR=3D$TEMP
--elif ! test -z "$TMP" ; then
--   DEFAULT_SOCKET_DIR=3D$TMP
--else
--   DEFAULT_SOCKET_DIR=3D/tmp
--fi
-+DEFAULT_SOCKET_DIR=3D/tmp
-=20
- DEFAULT_SOCKET_DIR=3D`echo $DEFAULT_SOCKET_DIR | sed 's/+/%2B/g'`
-=20
---=20
-1.6.6.1
-
diff --git a/meta/recipes-core/dbus/dbus_1.5.12.bb b/meta/recipes-core/db=
us/dbus_1.5.12.bb
deleted file mode 100644
index f41d170..0000000
--- a/meta/recipes-core/dbus/dbus_1.5.12.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-include dbus.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[md5sum] =3D "ddf18c86fd86ca0d766e18a514e368fd"
-SRC_URI[sha256sum] =3D "5d3e09a831259ca64b15357cfa1c60a5a7ab06ef469d5b82=
c2308de9cadf1094"
-
-DEFAULT_PREFERENCE =3D "-1"
-




