Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90BCC6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 18:54:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.28106.1678474473738041199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 10:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UxHDJGgs;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bw19so5942692wrb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678474472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uni+Q+XMwI66x4ca1c8CXjJHPuIS7paY5pT28ntJ41E=;
        b=UxHDJGgsIbluTZm9nypibOP5NY6+vY1qZWqCekUdMCHFGY0JeXqcSeEVVI7IiNVjSv
         WUR2ndDXOIE5Vp1Gw+w8xPXJsTJUuLHuA7hhJmhr/z2RBiuA3muIh+XvPbKUCSehz4cs
         WupdITk160j1RhRLnHlXv72nF+q+pig9VjSj82fjB0mRf4ND3k/Qjlz/+b3g/jsqyKUa
         8A/k5mRX/bWPjfWHQtoCYu100+EvrFvrzSGWZNJPPuU8NaVu7dG7s8fpIT55YPDQUBx/
         xANgL+cEPCk9qX9OobeqIke2blaidam03/GAq5Z14HnGlDt6HFc/Y8+EfB3Gs/1qWKrx
         ysTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678474472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uni+Q+XMwI66x4ca1c8CXjJHPuIS7paY5pT28ntJ41E=;
        b=B/tI3wZ24twc2CAU8m4MTDXhu1aR+jVDAszCGofYZSJ4TVMQzJwziVEuWGUoLDLRFj
         IwgL2zKH1gJdUG3+lamYmAkJJ+R85dB5G5wZBPGjv48PeHNcLZpdBHdWFUt/65grcrKo
         2pLgs1gqfW+PSjCLfxNyXIXFTQ5RsOnXkk2kwHc93BfLL7K9RLaavKuL4QpWjnLZqsrF
         qlft80mEa4CHmr6YEDF+DLME9DQW16VGKo6WyXlRWXKrpgOc6uD8Yr+HTYfmsJMKqUfD
         kLgATA+4i2NM8TV56vl9fG2+SD3kp4E4lwu2W69z7OjHb3PVDeHTNX/1neOdmHERR0uE
         GaGg==
X-Gm-Message-State: AO0yUKW4rBJkATlmBzk22pveGootaWDYngLbEXqhvcab/fcDSOIBu2Lq
	tcmMkQ9t2V6u8JaUQDG6UVabQAVwgfc=
X-Google-Smtp-Source: AK7set/1pm5iuQAnpu1d53G9SO1XLojtaZv7NbHgALdQW0ozP8KIY/uwRcDtcrNjZZGbDz4RRIUbjA==
X-Received: by 2002:a5d:43d0:0:b0:2c7:1c4e:1d11 with SMTP id v16-20020a5d43d0000000b002c71c4e1d11mr16676685wrr.63.1678474471770;
        Fri, 10 Mar 2023 10:54:31 -0800 (PST)
Received: from localhost.localdomain (2a01cb000c0d3d00488c42bf7f506bd5.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:488c:42bf:7f50:6bd5])
        by smtp.gmail.com with ESMTPSA id p3-20020a1c7403000000b003dc42d48defsm701379wmc.6.2023.03.10.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:54:31 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v5 1/2] qemu: split out qemu-guest-agent, add startup scripts
Date: Fri, 10 Mar 2023 19:54:22 +0100
Message-Id: <20230310185423.171619-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 18:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178342

Split out the QEMU guest agent into a separate package. The agent is
intended to be installed within a QEMU VM guest where a user is likely
to not want to have the rest of the QEMU installation within it.

Additionally, an initscript, udev rules file, and systemd unit file are
added to the package so that the guest agent can start automatically;
the former two come from Debian's packaging for qemu-guest-agent.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Changes since v4:
 - remove debian comment
 - add note about debian origin + license

Changes since v3:
 - fix missing comma in udev rule

Changes since v2:
 - Add missing files
 - rebase on top of master

Changes since v1:
 - Fix systemd-service using PN where it should not

 meta/recipes-devtools/qemu/qemu.inc           | 35 ++++++++-
 .../qemu/qemu/qemu-guest-agent.init           | 75 +++++++++++++++++++
 .../qemu/qemu/qemu-guest-agent.udev           |  2 +
 3 files changed, 111 insertions(+), 1 deletion(-)
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
index 0000000000..5ebaaddeae
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Initially written by: Michael Tokarev <mjt@tls.msk.ru>
+# For QEMU Debian downstream package
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
index 0000000000..47097057e3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
@@ -0,0 +1,2 @@
+SUBSYSTEM=="virtio-ports", ATTR{name}=="org.qemu.guest_agent.0", \
+  TAG+="systemd", ENV{SYSTEMD_WANTS}="qemu-guest-agent.service"
-- 
2.34.1


