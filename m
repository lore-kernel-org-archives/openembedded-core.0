Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C122772A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:07 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so79777436pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Rbki7l5PpUwgwyc2qT4+ISDnGOUYgBKi+dU7BqxlaK4=;
	b=yjg1VyeoFKO258tuzCn0JEr6NOspIVwzEL+0zYHnHfvLg28bOaK4NXg8ev2O312ayO
	gs4g4cEgkREkJy+akuKspB0DRsIVH8Us2lE63yEA4PEJ23OO2TBIg/hsFy6vDzDdKHvw
	N1maVsEOjmRnUW6L27ciKpQzZSVXKpunyF2FJyjmiOR1VWf9UXhAQfi6BsWXHTsbHQtD
	YBiH3F7r+5FOVH0mYsAE2atXQ6RBa4CowHFJ8WT9exGpmKlCyyXXDEE9jxE7ipz3qWe1
	PC3YDLRJXgnLXdGI1lGwwFlgL/PMeNGiTD7/kTU3cc+Phz1C/XNaDx+Lx6Z0bHJdBclJ
	s4Gw==
X-Received: by 10.66.163.131 with SMTP id yi3mr27268565pab.44.1447371667894;
	Thu, 12 Nov 2015 15:41:07 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.41.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:06 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:36 -0700
Message-Id: <b8da77cc20364ffb317e9cf84ce9b12f75c9101d.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/7] bluez5: enable sysvinit support
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:08 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is from Shrikant Bobade <Shrikant_Bobade@mentor.com>.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc  |  8 +++-
 meta/recipes-connectivity/bluez5/bluez5/init | 68 ++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/init

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index df42c88..13fd600 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,10 +18,11 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
+    file://init \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools-brokensep pkgconfig systemd
+inherit autotools-brokensep pkgconfig systemd update-rc.d
 
 EXTRA_OECONF = "\
   --enable-tools \
@@ -42,6 +43,9 @@ NOINST_TOOLS = " \
 "
 
 do_install_append() {
+	install -d ${D}${INIT_D_DIR}
+	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
+
 	install -d ${D}${sysconfdir}/bluetooth/
 	if [ -f ${S}/profiles/audio/audio.conf ]; then
 	    install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
@@ -100,5 +104,7 @@ FILES_${PN}-dbg += "\
 RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
 
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "bluetooth"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/init b/meta/recipes-connectivity/bluez5/bluez5/init
new file mode 100644
index 0000000..1606a5c
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/init
@@ -0,0 +1,68 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DESC=bluetooth
+
+DAEMON=/usr/lib/bluez5/bluetooth/bluetoothd
+
+# If you want to be ignore error of "org.freedesktop.hostname1",
+# please enable NOPLUGIN_OPTION.
+# NOPLUGIN_OPTION="--noplugin=hostname"
+NOPLUGIN_OPTION=""
+SSD_OPTIONS="--oknodo --quiet --exec $DAEMON -- $NOPLUGIN_OPTION"
+
+test -f $DAEMON || exit 0
+
+# FIXME: any of the sourced files may fail if/with syntax errors
+test -f /etc/default/bluetooth && . /etc/default/bluetooth
+test -f /etc/default/rcS && . /etc/default/rcS
+
+set -e
+
+case $1 in
+  start)
+	echo "Starting $DESC"
+
+	if test "$BLUETOOTH_ENABLED" = 0; then
+		echo "disabled. see /etc/default/bluetooth"
+		exit 0
+	fi
+
+	start-stop-daemon --start --background $SSD_OPTIONS
+	echo "${DAEMON##*/}"
+
+  ;;
+  stop)
+	echo "Stopping $DESC"
+	if test "$BLUETOOTH_ENABLED" = 0; then
+		echo "disabled."
+		exit 0
+	fi
+	start-stop-daemon --stop $SSD_OPTIONS
+	echo "${DAEMON}"
+  ;;
+  restart|force-reload)
+	$0 stop
+	sleep 1
+	$0 start
+  ;;
+  status)
+	 pidof ${DAEMON} >/dev/null
+	 status=$?
+        if [ $status -eq 0 ]; then
+                 echo "bluetooth is running."
+        else
+                echo "bluetooth is not running"
+        fi
+        exit $status
+   ;;
+   *)
+	N=/etc/init.d/bluetooth
+	echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
+
+# vim:noet
-- 
2.2.1


