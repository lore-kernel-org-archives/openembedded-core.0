Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7A1606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:55 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uiwWE; Sun, 08 Feb 2015 11:42:57 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:22 -0600
Message-Id: <4c4d84987e45e4d4ab0215ec2463a333db3956c1.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 10/10] connman: depend on distro provider of bluez
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:57 -0000

connman currently supports both bluez4 and bluez5 without distinguishing
them at configuration time.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/connman/connman.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 736b324..bbe6059 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,6 +13,8 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
+inherit bluetooth
+
 DEPENDS  = "dbus glib-2.0 ppp iptables"
 
 INC_PR = "r20"
@@ -32,7 +34,7 @@ EXTRA_OECONF += "\
 PACKAGECONFIG ??= "wispr \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g','3g', '', d)} \
 "
 
@@ -42,7 +44,7 @@ PACKAGECONFIG ??= "wispr \
 
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
-PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
+PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
-- 
1.9.1


