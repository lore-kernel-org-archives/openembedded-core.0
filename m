Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 691E0731EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:18:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jan 2016 08:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,558,1444719600"; d="scan'208";a="28050482"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2016 08:18:26 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BB2976A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:06:22 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 18:20:31 +0200
Message-Id: <1452615632-5232-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] connman: upgrade to 1.31
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
X-List-Received-Date: Tue, 12 Jan 2016 16:18:26 -0000

1.30 -> 1.31

Included newly introduced connman-wait-online service.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc              | 14 +++++++++++---
 .../connman/{connman_1.30.bb => connman_1.31.bb}           |  4 ++--
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.30.bb => connman_1.31.bb} (77%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 76e61b4..856ba44 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -43,7 +43,7 @@ PACKAGECONFIG ??= "wispr \
 # local.conf or distro config
 # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
 
-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
@@ -68,6 +68,7 @@ python __anonymous () {
 
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
+SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${datadir}/connman/wired-setup"
 
 do_compile_append() {
@@ -156,11 +157,12 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
-            ${datadir}/dbus-1/system-services/*"
+            ${datadir}/dbus-1/system-services/* \
+            ${sysconfdir}/tmpfiles.d/connman_resolvconf.conf"
 
 FILES_${PN}-dev += "${libdir}/connman/*/*.la"
 
-PACKAGES =+ "${PN}-vpn"
+PACKAGES =+ "${PN}-vpn ${PN}-wait-online"
 
 SUMMARY_${PN}-vpn = "A daemon for managing VPN connections within embedded devices"
 DESCRIPTION_${PN}-vpn = "The ConnMan VPN provides a daemon for \
@@ -174,6 +176,12 @@ FILES_${PN}-vpn += "${sbindir}/connman-vpnd \
                     ${datadir}/dbus-1/system-services/net.connman.vpn.service \
                     ${systemd_unitdir}/system/connman-vpn.service"
 
+SUMMARY_${PN}-wait-online = "A program that will return once ConnMan has connected to a network"
+DESCRIPTION_${PN}-wait-online = "A service that can be enabled so that \
+the system waits until a network connection is established."
+FILES_${PN}-wait-online += "${sbindir}/connmand-wait-online \
+                            ${systemd_unitdir}/system/connman-wait-online.service"
+
 SUMMARY_${PN}-plugin-vpn-openvpn = "An OpenVPN plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-openvpn = "The ConnMan OpenVPN plugin uses openvpn client \
 to create a VPN connection to OpenVPN server."
diff --git a/meta/recipes-connectivity/connman/connman_1.30.bb b/meta/recipes-connectivity/connman/connman_1.31.bb
similarity index 77%
rename from meta/recipes-connectivity/connman/connman_1.30.bb
rename to meta/recipes-connectivity/connman/connman_1.31.bb
index 7d65ac9..7b6bcfb 100644
--- a/meta/recipes-connectivity/connman/connman_1.30.bb
+++ b/meta/recipes-connectivity/connman/connman_1.31.bb
@@ -7,8 +7,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0003-Fix-header-inclusions-for-musl.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "4a3efdbd6796922db9c6f66da57887fa"
-SRC_URI[sha256sum] = "5c5e464bacc9c27ed4e7269fb9b5059f07947f5be26433b59212133663ffa991"
+SRC_URI[md5sum] = "cb1c413fcc4f49430294bbd7a92f5f3c"
+SRC_URI[sha256sum] = "88fcf0b6df334796b90e2fd2e434d6f5b36cd6f13b886a119b8c90276b72b8e2"
 
 RRECOMMENDS_${PN} = "connman-conf"
 
-- 
2.4.0


