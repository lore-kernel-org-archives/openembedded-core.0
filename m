Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id BA70777242
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:05:05 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:470:6f:49f:b1a8:b5ad:1702:2017])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	(Authenticated sender: andrewsh)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AAB7265C27;
	Tue,  2 Feb 2016 17:05:04 +0000 (GMT)
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Feb 2016 18:04:51 +0100
Message-Id: <5507a5b8c53e9a00c4c1da0f91c2d2c0849dc6a4.1454429175.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/2] dbus: use ${systemd_system_unitdir}
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
X-List-Received-Date: Tue, 02 Feb 2016 17:05:08 -0000

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/recipes-core/dbus/dbus_1.10.6.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.6.bb b/meta/recipes-core/dbus/dbus_1.10.6.bb
index 5ba3f21..fec68a4 100644
--- a/meta/recipes-core/dbus/dbus_1.10.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.6.bb
@@ -69,7 +69,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${datadir}/dbus-1/session.conf \
                ${datadir}/dbus-1/system.d \
                ${datadir}/dbus-1/system.conf \
-               ${systemd_unitdir}/system/"
+               ${systemd_system_unitdir}"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
@@ -102,7 +102,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 
@@ -117,12 +117,12 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		for i in dbus.target.wants sockets.target.wants multi-user.target.wants; do \
-			install -d ${D}${systemd_unitdir}/system/$i; done
-		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
-		cd ${D}${systemd_unitdir}/system/dbus.target.wants/
-		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.target.wants/dbus.socket
-		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/sockets.target.wants/dbus.socket
-		ln -fs ../dbus.service ${D}${systemd_unitdir}/system/multi-user.target.wants/dbus.service
+			install -d ${D}${systemd_system_unitdir}/$i; done
+		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/
+		cd ${D}${systemd_system_unitdir}/dbus.target.wants/
+		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/dbus.target.wants/dbus.socket
+		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/sockets.target.wants/dbus.socket
+		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
 	fi
 
 	install -d ${D}${sysconfdir}/default/volatiles
-- 
2.5.0


