Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 0A80860617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 10E7D60168B
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Nov 2015 15:38:16 +0100
Message-Id: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/2] dbus: build with systemd support
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
X-List-Received-Date: Fri, 20 Nov 2015 14:38:30 -0000

It's good to have the extra functionality, such as seat support
provided with systemd support. Not least of all to support
systemd user-sessions.

This commit also changes references to the system unit path
from ${systemd_unitdir}/system to ${systemd_system_unitdir},
a new variable provided by bitbake.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/dbus/dbus_1.10.2.bb | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb b/meta/recipes-core/dbus/dbus_1.10.2.bb
index 1abe067..f7ab39b 100644
--- a/meta/recipes-core/dbus/dbus_1.10.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
@@ -68,7 +68,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${datadir}/dbus-1/session.conf \
                ${datadir}/dbus-1/system.d \
                ${datadir}/dbus-1/system.conf \
-               ${systemd_unitdir}/system/"
+               ${systemd_system_unitdir}"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-tool"
@@ -90,8 +90,7 @@ pkg_postinst_dbus() {
 EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
-                --disable-libaudit \
-                --disable-systemd"
+                --disable-libaudit"
 
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
@@ -100,9 +99,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-# Would like to --enable-systemd but that's a circular build-dependency between
-# systemd<->dbus
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
 
@@ -117,12 +114,12 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		for i in dbus.target.wants sockets.target.wants multi-user.target.wants; do \
-			install -d ${D}${systemd_unitdir}/system/$i; done
-		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
+			install -d ${D}${systemd_system_unitdir}/$i; done
+		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/
 		cd ${D}${systemd_unitdir}/system/dbus.target.wants/
-		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.target.wants/dbus.socket
-		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/sockets.target.wants/dbus.socket
-		ln -fs ../dbus.service ${D}${systemd_unitdir}/system/multi-user.target.wants/dbus.service
+		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/dbus.target.wants/dbus.socket
+		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/sockets.target.wants/dbus.socket
+		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
 	fi
 
 	install -d ${D}${sysconfdir}/default/volatiles
-- 
2.5.0


