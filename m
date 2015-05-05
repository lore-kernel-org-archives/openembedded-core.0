Return-Path: <fabien.proriol@jdsu.com>
Received: from ks.kazoe.org (ks.kazoe.org [91.121.82.209])
	by mail.openembedded.org (Postfix) with ESMTP id 7417F736B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 09:33:44 +0000 (UTC)
From: fabien.proriol@jdsu.com
To: cristian.iorga@intel.com
Date: Tue,  5 May 2015 11:31:41 +0200
Message-Id: <1430818301-20647-1-git-send-email-fabien.proriol@jdsu.com>
X-Mailer: git-send-email 2.0.5
Cc: Fabien Proriol <fabien.proriol@jdsu.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] bluez5: Add init script to start obex service with sysvinit
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
X-List-Received-Date: Tue, 05 May 2015 09:33:44 -0000

From: Fabien Proriol <fabien.proriol@jdsu.com>

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  9 ++++-
 .../bluez5/bluez5/bluez5-obexd.init                | 39 ++++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5/obexd.conf | 12 +++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluez5-obexd.init
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/obexd.conf

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d216002..66e0df2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -20,6 +20,8 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     file://bluetooth.conf \
     file://bluez.init \
+    file://bluez5-obexd.init \
+    file://obexd.conff \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
@@ -34,9 +36,11 @@ EXTRA_OECONF = "\
   --enable-library \
 "
 
-INITSCRIPT_PACKAGES = "${PN}
+INITSCRIPT_PACKAGES = "${PN} ${PN}-obex"
 INITSCRIPT_NAME_${PN} = "${PN}"
 INITSCRIPT_PARAMS_${PN} = "start 16 5 . stop 01 0 1 6 ."
+INITSCRIPT_NAME_${PN}-obex = "${PN}-obexd"
+INITSCRIPT_PARAMS_${PN}-obex = "start 18 5 . stop 01 0 1 6 ."
 
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
@@ -67,6 +71,9 @@ do_install_append() {
 	done
 	install -d ${D}/etc/init.d
 	install -m 0755 ${WORKDIR}/bluez5.init ${D}${sysconfdir}/init.d/bluez5
+	install -d ${D}/etc/dbus-1/system.d
+	install -m 0644 ${WORKDIR}/obexd.conf ${D}${sysconfdir}/dbus-1/system.d
+	install -m 0755 ${WORKDIR}/bluez5-obexd.init ${D}${sysconfdir}/init.d/bluez5-obexd
 }
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluez5-obexd.init b/meta/recipes-connectivity/bluez5/bluez5/bluez5-obexd.init
new file mode 100644
index 0000000..c958e03
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/bluez5-obexd.init
@@ -0,0 +1,39 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides: bluez5-obex
+# Default-Start:  5
+# Default-Stop:   016
+# Short-Description: run bluez5-obex daemon
+# Description: Linux Bluetooth stack V5 userland components..
+### END INIT INFO
+
+export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
+export DBUS_SESSION_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket
+
+test -x /usr/lib/bluez5/bluetooth/obexd || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting Obexd"
+        mkdir -p /tmp/bluetooth-inbox
+        mount /tmp/bluetooth-inbox
+        start-stop-daemon --start --quiet --background --exec /usr/lib/bluez5/bluetooth/obexd -- --root=/tmp/bluetooth-inbox -l -d
+        echo "."
+        ;;
+    stop)
+        echo -n "Stopping Obexd"
+        start-stop-daemon --stop --retry TERM/20/KILL/5 --quiet --exec /usr/lib/bluez5/bluetooth/obexd
+        umount -f /tmp/bluetooth-inbox
+        echo "."
+        ;;
+    restart)
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: /etc/init.d/bluez5-obexd {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta/recipes-connectivity/bluez5/bluez5/obexd.conf b/meta/recipes-connectivity/bluez5/bluez5/obexd.conf
new file mode 100644
index 0000000..939d544
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/obexd.conf
@@ -0,0 +1,12 @@
+<!-- This configuration file specifies the required security policies
+     for Obex core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop/DTD D-BUS Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+	<policy user="root">
+		<allow own="org.bluez.obex"/>
+		<allow send_destination="org.bluez.obex"/>
+		<allow send_interface="org.bluez.obex"/>
+	</policy>
+</busconfig>
-- 
2.0.5

