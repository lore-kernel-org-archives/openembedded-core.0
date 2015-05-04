Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C46AB73C8C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 14:15:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 May 2015 07:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,366,1427785200"; d="scan'208";a="689613084"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2015 07:15:42 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 17:15:38 +0300
Message-Id: <3cd7346304aac934738db52394a468aba581d05d.1430748903.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430748903.git.cristian.iorga@intel.com>
References: <cover.1430748903.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430748903.git.cristian.iorga@intel.com>
References: <cover.1430748903.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] connman: code cleanup
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
X-List-Received-Date: Mon, 04 May 2015 14:15:43 -0000

- cleanup multiple inherit lines;
- RDEPENDS cleanup, use PACKAGECONFIG[] instead.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d068ba8..17dc4b9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
-inherit bluetooth
+inherit autotools pkgconfig systemd update-rc.d bluetooth
 
 DEPENDS  = "dbus glib-2.0 ppp iptables"
 
@@ -43,9 +43,9 @@ PACKAGECONFIG ??= "wispr \
 # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
 
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
-PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
-PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}"
-PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
+PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
+PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
+PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
@@ -69,8 +69,6 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
-inherit autotools pkgconfig systemd update-rc.d
-
 # This allows *everyone* to access ConnMan over DBus, without any access
 # control.  Really the at_console flag should work, which would mean that
 # both this and the xuser patch can be dropped.
@@ -114,9 +112,6 @@ RPROVIDES_${PN} = "\
 
 RDEPENDS_${PN} = "\
 	dbus \
-	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', '${BLUEZ}', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', '3g','ofono', '', d)} \
 	${@base_conditional('ROOTLESS_X', '1', 'xuser-account', '', d)} \
 	"
 
-- 
2.1.0


