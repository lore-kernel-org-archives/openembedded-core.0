Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187F5C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:07:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.13703.1678295254927022802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PUCLDFKc;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id r18so16085423wrx.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678295253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHLC38TUTIPPsuAe+eAbd4NN1RYqz6QhwQTlEanzNaM=;
        b=PUCLDFKcdE+P3XBILUZ6c/q2jwy/Mibd2Br4GWsezTPNeX6rMAzjxClcsCGmH5FRAA
         7NPWX53exSZMkE6WOdKUshHVbYXw8P4TCd9lg52HbStvvz3xkDjnxafMXN6yD6rbEe4Y
         6CRVYCneaSjfTkzXYXUMtRBxqheIWXQXglUy8Q+Hu5aHWdn8ZSXFi6QdZ8JnZJoFUNNj
         uSjYUZ8tNrIB45yHUYCAeXhgpudbIMSl3cs5vCw8zSm8s+VxHK1Gm+jVNf7o0NW8Z4Xv
         ittXr5T2dFGztAdM2F5r4Frsu4x+zq1yBof+Rn5kG5A8LlhkJX1hBcx5mjC6rUngbbAq
         zCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678295253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHLC38TUTIPPsuAe+eAbd4NN1RYqz6QhwQTlEanzNaM=;
        b=B9Ls2i3dgxLn5xYD7BTW0tReHax4rkmYDMrhjWbwgx6b4yJqHIwKQDxbiDmJy8PHIH
         eAXgr2phb7P6Ah7DADljnIJVchKH2YqqboGg0QhTDj1vafKg3M/Vuct0pXBWb8YtISRZ
         m5nAhcnCLg9/vcOGgcqTFqDfdkRPT+jb0JLcU0sxBt3EPnviRgaAPoXVXn8UTxFfero0
         OeWtJTaQMs9F3E57eH7lMHE6aPU+bqhR/LRqchxaL/7uFbbyk9FR0vQGtS/tcsMv1Y6C
         cm9FX9Wb4gBu+SAnKQhOFUmXcRq0EpTHGPkabIx56iZy6y+iI+E9wI5KIhNtIdGQH3LC
         Owjw==
X-Gm-Message-State: AO0yUKV2QUMfhT6oBc9VumtuDbNl0uHzORdP1KymNMCoA8dAiKQHCq1w
	O2rEDjNR/HHLsxKvhfkr5k5jQ7G8w0w=
X-Google-Smtp-Source: AK7set+AfS+3x45lLyHaAxozV7ckZYXo3VP5Tq46iFfT8u6Wn28QtbdvZCSWFhTy4tjGOF1QRHdgMg==
X-Received: by 2002:a05:6000:12c9:b0:2cc:4dad:e484 with SMTP id l9-20020a05600012c900b002cc4dade484mr11301879wrx.42.1678295252839;
        Wed, 08 Mar 2023 09:07:32 -0800 (PST)
Received: from localhost.localdomain (2a01cb000c0d3d0045a625b6f3ed646c.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:45a6:25b6:f3ed:646c])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b002c569acab1esm15796876wrm.73.2023.03.08.09.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 09:07:32 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v3 1/2] qemu: split out qemu-guest-agent, add startup scripts
Date: Wed,  8 Mar 2023 18:07:27 +0100
Message-Id: <20230308170728.33056-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178179

Split out the QEMU guest agent into a separate package. The agent is
intended to be installed within a QEMU VM guest where a user is likely
to not want to have the rest of the QEMU installation within it.

Additionally, an initscript, udev rules file, and systemd unit file are
added to the package so that the guest agent can start automatically;
the former two come from Debian's packaging for qemu-guest-agent.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Changes since v2:
 - Add missing files
 - rebase on top of master

Changes since v1:
 - Fix systemd-service using PN where it should not


 meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
 .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++++
 .../qemu/qemu/qemu-guest-agent.udev           |  2 +
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1e768b560d..b41055fe5d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
-inherit pkgconfig ptest
+inherit pkgconfig ptest update-rc.d systemd
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -32,6 +32,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
            file://0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch \
            file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch \
+           file://qemu-guest-agent.init \
+           file://qemu-guest-agent.udev \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -132,6 +134,20 @@ do_configure[cleandirs] += "${B}"
 do_install () {
 	export STRIP=""
 	oe_runmake 'DESTDIR=${D}' install
+
+	# If we built the guest agent, also install startup/udev rules
+	if [ -e "${D}${bindir}/qemu-ga" ]; then
+		install -d ${D}${sysconfdir}/init.d/
+		install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/init.d/qemu-guest-agent
+		sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/qemu-guest-agent
+
+		install -d ${D}${sysconfdir}/udev/rules.d/
+		install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
+
+		install -d ${D}${systemd_unitdir}/system/
+		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${systemd_unitdir}/system
+		sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unitdir}/system/qemu-guest-agent.service
+	fi
 }
 
 # The following fragment will create a wrapper for qemu-mips user emulation
@@ -210,3 +226,20 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 INSANE_SKIP:${PN} = "arch"
 
 FILES:${PN} += "${datadir}/icons"
+
+# Put the guest agent in a separate package
+PACKAGES =+ "${PN}-guest-agent"
+SUMMARY:${PN}-guest-agent = "QEMU guest agent"
+FILES:${PN}-guest-agent += " \
+    ${bindir}/qemu-ga \
+    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
+    ${sysconfdir}/init.d/qemu-guest-agent \
+    ${systemd_unitdir}/system/qemu-guest-agent.service \
+"
+
+INITSCRIPT_PACKAGES = "${PN}-guest-agent"
+INITSCRIPT_NAME:${PN}-guest-agent = "qemu-guest-agent"
+INITSCRIPT_PARAMS:${PN}-guest-agent = "defaults"
+
+SYSTEMD_PACKAGES = "${PN}-guest-agent"
+SYSTEMD_SERVICE:${PN}-guest-agent = "qemu-guest-agent.service"
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
new file mode 100644
index 0000000000..493da0ef1a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
@@ -0,0 +1,84 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:		qemu-guest-agent
+# Required-Start:	$remote_fs $syslog
+# Required-Stop:	$remote_fs $syslog
+# Default-Start:	2 3 4 5
+# Default-Stop:		0 1 6
+# Short-Description:	QEMU Guest Agent
+### END INIT INFO
+#
+# Do not configure this file. Edit /etc/default/qemu-guest-agent
+#
+
+set -e
+
+. /etc/init.d/functions
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+DESC="QEMU Guest Agent"
+NAME=qemu-ga
+DAEMON=@bindir@/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+# config
+DAEMON_ARGS=""
+# default transport
+TRANSPORT=virtio-serial:/dev/virtio-ports/org.qemu.guest_agent.0
+NO_START=0
+
+test ! -r /etc/default/qemu-guest-agent || . /etc/default/qemu-guest-agent
+test "$NO_START" = "0" || exit 0
+test -x "$DAEMON" || exit 0
+
+#
+# Function that checks whenever system has necessary environment
+# It also splits $TRANSPORT into $method and $path
+#
+do_check_transport() {
+	method=${TRANSPORT%%:*};
+	path=${TRANSPORT#*:}
+	case "$method" in
+	    virtio-serial | isa-serial)
+		if [ ! -e "$path" ]; then
+		    echo "$NAME: transport endpoint not found, not starting"
+		    return 1
+		fi
+		;;
+	esac
+}
+
+case "$1" in
+  start)
+	do_check_transport || exit 0
+	echo -n "Starting $DESC: "
+	start-stop-daemon -S -p $PIDFILE -x "$DAEMON" -- \
+		$DAEMON_ARGS -d -m "$method" -p "$path"
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
+	echo "$NAME."
+	;;
+  status)
+	status "$DAEMON"
+	exit $?
+	;;
+  restart|force-reload)
+	do_check_transport || exit 0
+	echo -n "Restarting $DESC: "
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
+	sleep 1
+	start-stop-daemon -S -p $PIDFILE -x "$DAEMON" -- \
+		$DAEMON_ARGS -d -m "$method" -p "$path"
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|status|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
new file mode 100644
index 0000000000..8a290abbd3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
@@ -0,0 +1,2 @@
+SUBSYSTEM=="virtio-ports", ATTR{name}=="org.qemu.guest_agent.0", \
+  TAG+="systemd" ENV{SYSTEMD_WANTS}="qemu-guest-agent.service"
-- 
2.34.1


