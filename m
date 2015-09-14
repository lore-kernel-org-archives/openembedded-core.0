Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id E198876FD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:07:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 18DC43C88750
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 12:07:13 +0200
Message-Id: <1442225233-18899-7-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
Subject: [PATCH v2 7/7] dbus: build with systemd support
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
X-List-Received-Date: Mon, 14 Sep 2015 10:07:47 -0000

---
 meta/recipes-core/dbus/dbus_1.10.0.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.0.bb b/meta/recipes-core/dbus/dbus_1.10.0.bb
index 58210f4..d2bea13 100644
--- a/meta/recipes-core/dbus/dbus_1.10.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.0.bb
@@ -92,8 +92,7 @@ pkg_postinst_dbus() {
 EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
-                --disable-libaudit \
-                --disable-systemd"
+                --disable-libaudit"
 
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
@@ -102,9 +101,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-# Would like to --enable-systemd but that's a circular build-dependency between
-# systemd<->dbus
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
 PACKAGECONFIG[user-session] = "--enable-user-session,--disable-user-session"
-- 
2.1.4


