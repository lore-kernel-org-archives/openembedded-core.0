Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B2EC3ABB0
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 20:32:13 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.119.1746217916457925406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 13:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DQx5asuJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542KVdLF486360
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 15:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746217899;
	bh=STMYX/S6bpqD/6j33z2Anjep44ri8Ak3MwGTNRhBjX8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DQx5asuJL+Ms3ej8rBadC0bCfy+A+SGb1z72nVlu1O+dubM6ihF3X07ZB8bBC+wOF
	 JB+UN2tEnil+vOSehxv2zjtedte2rEWeAIgbYqhrN01KXHkk157RZh3PkkDY0NhSyX
	 DkJicI4HFOS9/kaKZj1Pd9F/Ye52g77WgsTdl1NA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542KVdL7107081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 15:31:39 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 15:31:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 15:31:39 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542KVdGJ126709;
	Fri, 2 May 2025 15:31:39 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCH 2/3] weston-init: convert to virtual-emptty-conf
Date: Fri, 2 May 2025 15:28:40 -0500
Message-ID: <20250502202840.3148565-4-rs@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502202840.3148565-2-rs@ti.com>
References: <20250502202840.3148565-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215922

From: Randolph Sapp <rs@ti.com>

Convert this script package into a simple config for emptty using the
same weston user but leveraging the nopasswdlogin session provided by
emptty. Runtime provide virtual-emptty-conf as we need to set parameters
for the default session.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/wayland/weston-init.bb  | 61 +++------------
 .../wayland/weston-init/emptty.conf           | 77 +++++++++++++++++++
 .../recipes-graphics/wayland/weston-init/init | 54 -------------
 .../wayland/weston-init/weston-autologin      | 11 ---
 .../wayland/weston-init/weston-socket.sh      | 20 -----
 .../wayland/weston-init/weston-start          | 76 ------------------
 .../wayland/weston-init/weston.env            |  0
 .../wayland/weston-init/weston.service        | 71 -----------------
 .../wayland/weston-init/weston.socket         | 14 ----
 9 files changed, 89 insertions(+), 295 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 5723655a9b..d20cdd6803 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -1,17 +1,13 @@
-SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
+SUMMARY = "Autologin package for the Weston Wayland compositor"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "file://init \
-           file://weston.env \
+SRC_URI = "\
            file://weston.ini \
-           file://weston.service \
-           file://weston.socket \
-           file://weston-socket.sh \
-           file://weston-autologin \
-           file://weston-start"
+           file://emptty.conf \
+"
 
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
@@ -28,32 +24,8 @@ DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
-	# Install weston-start script
-	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
-		install -Dm755 ${S}/weston-start ${D}${bindir}/weston-start
-		sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
-		sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
-		install -Dm755 ${S}/init ${D}/${sysconfdir}/init.d/weston
-		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
-	fi
-
-	# Install Weston systemd service
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -D -p -m0644 ${S}/weston.service ${D}${systemd_system_unitdir}/weston.service
-		install -D -p -m0644 ${S}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-		install -D -p -m0644 ${S}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
-		sed -i -e s:/etc:${sysconfdir}:g \
-			-e s:/usr/bin:${bindir}:g \
-			-e s:/var:${localstatedir}:g \
-			${D}${systemd_system_unitdir}/weston.service
-	fi
-
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -p -m0644 ${S}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
-	fi
-
 	install -D -p -m0644 ${S}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
-	install -Dm644 ${S}/weston.env ${D}${sysconfdir}/default/weston
+	install -D -p -m0644 ${S}/emptty.conf ${D}${sysconfdir}/emptty/conf
 
 	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
@@ -74,9 +46,7 @@ do_install() {
 	install -dm 755 -o weston -g weston ${D}/home/weston
 }
 
-INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
-
-inherit update-rc.d systemd useradd
+inherit useradd
 
 USERADD_PACKAGES = "${PN}"
 
@@ -84,23 +54,16 @@ USERADD_PACKAGES = "${PN}"
 #
 require ${THISDIR}/required-distro-features.inc
 
-RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
-
-INITSCRIPT_NAME = "weston"
-INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+RDEPENDS:${PN} = "emptty weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 FILES:${PN} += "\
     ${sysconfdir}/xdg/weston/weston.ini \
-    ${sysconfdir}/profile.d/weston-socket.sh \
-    ${systemd_system_unitdir}/weston.service \
-    ${systemd_system_unitdir}/weston.socket \
-    ${sysconfdir}/default/weston \
-    ${sysconfdir}/pam.d/ \
+    ${sysconfdir}/emptty/conf \
     /home/weston \
     "
 
-CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
+CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} += "virtual-emptty-conf"
 
-SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,seat,wayland weston"
-GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r seat"
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,seat,nopasswdlogin weston"
+GROUPADD_PARAM:${PN} = "-r nopasswdlogin; -r render; -r seat"
diff --git a/meta/recipes-graphics/wayland/weston-init/emptty.conf b/meta/recipes-graphics/wayland/weston-init/emptty.conf
new file mode 100644
index 0000000000..7520bc0b9c
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/emptty.conf
@@ -0,0 +1,77 @@
+# TTY, where emptty will start.
+TTY_NUMBER=7
+
+# Enables switching to defined TTY number.
+SWITCH_TTY=true
+
+# Enables printing of /etc/issue in daemon mode.
+PRINT_ISSUE=true
+
+# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
+PRINT_MOTD=true
+
+# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
+DEFAULT_USER=weston
+
+# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
+AUTOLOGIN=true
+
+# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
+AUTOLOGIN_SESSION=Weston
+
+# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
+AUTOLOGIN_MAX_RETRY=0
+
+# Default LANG, if user does not have set own in init script.
+#LANG=en_US.UTF-8
+
+# Starts desktop with calling "dbus-launch".
+DBUS_LAUNCH=true
+
+# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
+XINITRC_LAUNCH=false
+
+# Prints available WM/DE each on new line instead of printing on single line.
+VERTICAL_SELECTION=false
+
+# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
+#LOGGING=rotate
+
+# Overrides path of log file
+#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
+
+# Arguments passed to Xorg server.
+#XORG_ARGS=
+
+# Allows to use dynamic motd script to generate custom MOTD.
+#DYNAMIC_MOTD=false
+
+# Allows to override default path to dynamic motd.
+#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
+
+# Allows to override default path to static motd.
+#MOTD_PATH=/etc/emptty/motd
+
+# Foreground color, available only in daemon mode.
+#FG_COLOR=LIGHT_BLACK
+
+# Background color, available only in daemon mode.
+#BG_COLOR=BLACK
+
+# Enables numlock in daemon mode. Possible values are "true" or "false".
+#ENABLE_NUMLOCK=false
+
+# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
+SESSION_ERROR_LOGGING=rotate
+
+# Overrides path of session errors log file
+#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
+
+# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
+#DEFAULT_XAUTHORITY=false
+
+#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
+#ROOTLESS_XORG=false
+
+#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
+IDENTIFY_ENVS=false
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
deleted file mode 100644
index a5c54e001e..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: weston
-# Required-Start: $local_fs $remote_fs
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-### END INIT INFO
-
-if test -e /etc/default/weston ; then
-        . /etc/default/weston
-fi
-
-killproc() {
-        pid=`/bin/pidof $1`
-        [ "$pid" != "" ] && kill $pid
-}
-
-read CMDLINE < /proc/cmdline
-for x in $CMDLINE; do
-        case $x in
-        weston=false)
-		echo "Weston disabled"
-		exit 0;
-                ;;
-        esac
-done
-
-case "$1" in
-  start)
-        . /etc/profile
-	      export HOME=ROOTHOME
-
-        WESTON_USER=weston weston-start $OPTARGS &
-  ;;
-
-  stop)
-        echo "Stopping Weston"
-        killproc weston
-  ;;
-
-  restart)
-	$0 stop
-        sleep 1
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-autologin b/meta/recipes-graphics/wayland/weston-init/weston-autologin
deleted file mode 100644
index f6e6d106de..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston-autologin
+++ /dev/null
@@ -1,11 +0,0 @@
-auth      required  pam_nologin.so
-auth      required  pam_unix.so     try_first_pass nullok
-
-account   required  pam_nologin.so
-account   required  pam_unix.so
-
-session   required  pam_env.so
-session   required  pam_unix.so
--session  optional  pam_systemd.so type=wayland class=user desktop=weston
--session  optional  pam_loginuid.so
-
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
deleted file mode 100755
index 86389d63a3..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-# set weston variables for use with global weston socket
-global_socket="/run/wayland-0"
-if [ -e "$global_socket" ]; then
-	weston_group=$(stat -c "%G" "$global_socket")
-	if [ "$(id -u)" = "0" ]; then
-		export WAYLAND_DISPLAY="$global_socket"
-	else
-		case "$(groups "$USER")" in
-			*"$weston_group"*)
-				export WAYLAND_DISPLAY="$global_socket"
-				;;
-			*)
-				;;
-		esac
-	fi
-	unset weston_group
-fi
-unset global_socket
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
deleted file mode 100755
index 3b13a0047a..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/sh
-# Copyright (C) 2016 O.S. Systems Software LTDA.
-# Copyright (C) 2016 Freescale Semiconductor
-
-export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
-
-usage() {
-	cat <<EOF
-	$0 [<weston options>]
-EOF
-}
-
-## Module support
-modules_dir=@DATADIR@/weston-start
-
-# Add weston extra argument
-add_weston_argument() {
-	weston_args="$weston_args $1"
-}
-
-## Add module to --modules argument
-add_weston_module() {
-	if [[ "x${weston_modules}" == "x" ]]; then
-		weston_modules="--modules "
-	fi;
-	weston_modules+="${1},"
-}
-
-if [ -n "$WAYLAND_DISPLAY" ]; then
-	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
-	exit 1
-fi
-
-if [ -n "$WESTON_USER" ]; then
-	if [ -z "$WESTON_GROUP" ]; then
-		# no explicit WESTON_GROUP given, therefore use WESTON_USER
-		export WESTON_GROUP="${WESTON_USER}"
-	fi
-fi
-
-weston_args=$*
-
-# Load and run modules
-if [ -d "$modules_dir" ]; then
-	for m in "$modules_dir"/*; do
-		# Skip backup files
-		if [ "`echo $m | sed -e 's/\~$//'`" != "$m" ]; then
-			continue
-		fi
-
-		# process module
-		. $m
-		if [[ x"{$weston_modules}" != "x" ]]; then
-			add_weston_argument "${weston_modules}"
-		fi;
-	done
-fi
-
-if test -z "$XDG_RUNTIME_DIR"; then
-	export XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}`
-	if test -d "$XDG_RUNTIME_DIR"; then
-	    # Check permissions on existing directory
-	    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" != "$(id -u ${WESTON_USER})-700" ]; then
-			echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
-			exit 1
-		fi
-	else
-		mkdir --mode 0700 --parents $XDG_RUNTIME_DIR
-		if [ -n "$WESTON_USER" ]
-		then
-			chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
-		fi
-	fi
-fi
-
-su -c "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR weston $weston_args --log=/tmp/weston.log" $WESTON_USER
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.env b/meta/recipes-graphics/wayland/weston-init/weston.env
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
deleted file mode 100644
index 80745998ed..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ /dev/null
@@ -1,71 +0,0 @@
-# This is a system unit for launching Weston with auto-login as the
-# user configured here.
-#
-# Weston must be built with systemd support, and your weston.ini must load
-# the plugin systemd-notify.so.
-[Unit]
-Description=Weston, a Wayland compositor, as a system service
-Documentation=man:weston(1) man:weston.ini(5)
-Documentation=http://wayland.freedesktop.org/
-
-# Make sure we are started after logins are permitted.
-Requires=systemd-user-sessions.service
-After=systemd-user-sessions.service
-
-# If Plymouth is used, we want to start when it is on its way out.
-After=plymouth-quit-wait.service
-
-# D-Bus is necessary for contacting logind. Logind is required.
-Wants=dbus.socket
-After=dbus.socket
-
-# Ensure the socket is present
-Requires=weston.socket
-
-# Since we are part of the graphical session, make sure we are started before
-# it is complete.
-Before=graphical.target
-
-# Prevent starting on systems without virtual consoles, Weston requires one
-# for now.
-ConditionPathExists=/dev/tty0
-
-[Service]
-# Requires systemd-notify.so Weston plugin.
-Type=notify
-EnvironmentFile=/etc/default/weston
-ExecStart=/usr/bin/weston --modules=systemd-notify.so
-
-# Optional watchdog setup
-#TimeoutStartSec=60
-#WatchdogSec=20
-
-# The user to run Weston as.
-User=weston
-Group=weston
-
-# Make sure the working directory is the users home directory
-WorkingDirectory=/home/weston
-
-# Set up a full user session for the user, required by Weston.
-PAMName=weston-autologin
-
-# A virtual terminal is needed.
-TTYPath=/dev/tty7
-TTYReset=yes
-TTYVHangup=yes
-TTYVTDisallocate=yes
-
-# Fail to start if not controlling the tty.
-StandardInput=tty-fail
-StandardOutput=journal
-StandardError=journal
-
-# Log this user with utmp, letting it show up with commands 'w' and 'who'.
-UtmpIdentifier=tty7
-UtmpMode=user
-
-[Install]
-# Note: If you only want weston to start on-demand, remove this line with a
-# service drop file
-WantedBy=graphical.target
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta/recipes-graphics/wayland/weston-init/weston.socket
deleted file mode 100644
index c1bdc83c05..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston.socket
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=Weston socket
-RequiresMountsFor=/run
-
-[Socket]
-ListenStream=/run/wayland-0
-SocketMode=0775
-SocketUser=weston
-SocketGroup=wayland
-RemoveOnStop=yes
-
-[Install]
-WantedBy=sockets.target
-
-- 
2.49.0


