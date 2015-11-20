Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 098D360112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 464D0601A27
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Nov 2015 15:38:17 +0100
Message-Id: <73c4db7e6c63768735002961feb9c95815d352ea.1448030272.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
In-Reply-To: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
Subject: [PATCH 2/2] dbus: add user sessions support
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

Enable the user-sessions support with a PACKAGECONFIG flag.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/dbus/dbus_1.10.2.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb b/meta/recipes-core/dbus/dbus_1.10.2.bb
index f7ab39b..445f7ef 100644
--- a/meta/recipes-core/dbus/dbus_1.10.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
@@ -68,7 +68,9 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${datadir}/dbus-1/session.conf \
                ${datadir}/dbus-1/system.d \
                ${datadir}/dbus-1/system.conf \
-               ${systemd_system_unitdir}"
+               ${systemd_system_unitdir} \
+               ${systemd_user_unitdir} \
+"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-tool"
@@ -99,9 +101,10 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir} --with-systemduserunitdir=${systemd_user_unitdir},--disable-systemd --without-systemdsystemunitdir --without-systemduserunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
+PACKAGECONFIG[user-session] = "--enable-user-session,--disable-user-session"
 
 do_install() {
 	autotools_do_install
-- 
2.5.0


