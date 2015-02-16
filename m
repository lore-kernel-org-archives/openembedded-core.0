Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B069A727D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 15:07:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 06:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,588,1418112000"; d="scan'208";a="528207581"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 16 Feb 2015 06:58:08 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 17:06:20 +0200
Message-Id: <55669c769dc281c9d9c26ee68293919ce0ef0c7f.1424098977.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
Subject: [PATCH 10/11] connman: depend on distro provider of bluez
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
X-List-Received-Date: Mon, 16 Feb 2015 15:07:16 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

connman currently supports both bluez4 and bluez5 without distinguishing
them at configuration time.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 736b324..1062641 100644
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
@@ -114,7 +116,7 @@ RPROVIDES_${PN} = "\
 
 RDEPENDS_${PN} = "\
 	dbus \
-	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', '${BLUEZ}', '', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', '3g','ofono', '', d)} \
 	xuser-account \
-- 
2.1.0


