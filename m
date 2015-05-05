Return-Path: <fabien.proriol@jdsu.com>
Received: from ks.kazoe.org (ks.kazoe.org [91.121.82.209])
	by mail.openembedded.org (Postfix) with ESMTP id 517F9736B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 09:29:27 +0000 (UTC)
From: fabien.proriol@jdsu.com
To: cristian.iorga@intel.com
Date: Tue,  5 May 2015 11:20:58 +0200
Message-Id: <1430817658-20363-1-git-send-email-fabien.proriol@jdsu.com>
X-Mailer: git-send-email 2.0.5
Cc: Fabien Proriol <fabien.proriol@jdsu.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] bluez5: Add init script to start service with sysvinit
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
X-List-Received-Date: Tue, 05 May 2015 09:29:28 -0000

From: Fabien Proriol <fabien.proriol@jdsu.com>

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  9 +++++-
 .../recipes-connectivity/bluez5/bluez5/bluez5.init | 36 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluez5.init

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 67aafbb..d216002 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -19,10 +19,11 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     file://bluetooth.conf \
+    file://bluez.init \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools-brokensep pkgconfig systemd
+inherit autotools-brokensep pkgconfig systemd update-rc.d
 
 EXTRA_OECONF = "\
   --enable-tools \
@@ -33,6 +34,10 @@ EXTRA_OECONF = "\
   --enable-library \
 "
 
+INITSCRIPT_PACKAGES = "${PN}
+INITSCRIPT_NAME_${PN} = "${PN}"
+INITSCRIPT_PARAMS_${PN} = "start 16 5 . stop 01 0 1 6 ."
+
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??= ""
@@ -60,6 +65,8 @@ do_install_append() {
         for f in ${NOINST_TOOLS} ; do
 	    install -m 755 ${B}/$f ${D}/${bindir}
 	done
+	install -d ${D}/etc/init.d
+	install -m 0755 ${WORKDIR}/bluez5.init ${D}${sysconfdir}/init.d/bluez5
 }
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluez5.init b/meta/recipes-connectivity/bluez5/bluez5/bluez5.init
new file mode 100644
index 0000000..4d6b365
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/bluez5.init
@@ -0,0 +1,36 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides: bluez5
+# Default-Start:  5
+# Default-Stop:   016
+# Short-Description: run bluez5 daemon
+# Description: Linux Bluetooth stack V5 userland components..
+### END INIT INFO
+
+export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
+export DBUS_SESSION_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket
+
+test -x /usr/lib/bluez5/bluetooth/bluetoothd || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting Bluez"
+        start-stop-daemon --start --quiet --background --exec dbus-launch -- /usr/lib/bluez5/bluetooth/bluetoothd
+        echo "."
+        ;;
+    stop)
+        echo -n "Stopping Bluez"
+        start-stop-daemon --stop --retry TERM/20/KILL/5 --quiet --exec /usr/lib/bluez5/bluetooth/bluetoothd
+        echo "."
+        ;;
+    restart)
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: /etc/init.d/bluez5 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
-- 
2.0.5

