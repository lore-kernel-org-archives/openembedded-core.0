Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF4EC71A26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:29:01 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 004DCB81F65; Wed, 30 Nov 2016 13:22:31 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:22:30 +0100
Message-Id: <1480508551-26893-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] connman: Simplify and fix packaging of VPN plug-ins
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
X-List-Received-Date: Wed, 30 Nov 2016 12:29:05 -0000

- Use simple static packaging.
- Move VPN runtime dependencies from connman to the individual plug-ins.
- Create a connmann-ppp package containing libppp-plugin.so, which is
  a shared library needed by l2tp and pptp plug-ins.
- Let connman suggest VPN packages instead of recommending them, so they
  don't get installed by default.
- Remove unknown configure options (--with-pptp --with-l2tp)

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/connman/connman.inc | 95 +++++++++------------------
 1 file changed, 32 insertions(+), 63 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 35a7eed..091e402 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -46,24 +46,17 @@ PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-suppli
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
-PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
-PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
-PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,,xl2tpd"
-PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
+PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn"
+PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc"
+PACKAGECONFIG[l2tp] = "--enable-l2tp,--disable-l2tp"
+PACKAGECONFIG[pptp] = "--enable-pptp,--disable-pptp"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-python __anonymous () {
-    systemd_packages = "${PN}"
-    pkgconfig = d.getVar('PACKAGECONFIG', True)
-    if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
-        systemd_packages += " ${PN}-vpn"
-    d.setVar('SYSTEMD_PACKAGES', systemd_packages)
-}
-
+SYSTEMD_PACKAGES = "${PN} ${PN}-vpn"
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
@@ -103,36 +96,6 @@ RDEPENDS_${PN} = "\
 	dbus \
 	"
 
-PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
-
-def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_skip):
-    plugintype = pkg.split( '-' )[-1]
-    if plugintype in depmap:
-        rdepends = map(lambda x: multilib_prefix + x, \
-                       depmap[plugintype].split())
-        d.setVar("RDEPENDS_%s" % pkg, " ".join(rdepends))
-    if add_insane_skip:
-        d.appendVar("INSANE_SKIP_%s" % pkg, "dev-so")
-
-python populate_packages_prepend() {
-    depmap = dict(pppd="ppp")
-    multilib_prefix = (d.getVar("MLPREFIX", True) or "")
-
-    hook = lambda file,pkg,x,y,z: \
-        add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, False)
-    plugin_dir = d.expand('${libdir}/connman/plugins/')
-    plugin_name = d.expand('${PN}-plugin-%s')
-    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, \
-        '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
-
-    hook = lambda file,pkg,x,y,z: \
-        add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, True)
-    plugin_dir = d.expand('${libdir}/connman/plugins-vpn/')
-    plugin_name = d.expand('${PN}-plugin-vpn-%s')
-    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, \
-        '${PN} VPN plugin for %s', extra_depends='', hook=hook, prepend=True )
-}
-
 PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
 
 FILES_${PN}-tools = "${bindir}/wispr"
@@ -152,7 +115,12 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
 
 FILES_${PN}-dev += "${libdir}/connman/*/*.la"
 
-PACKAGES =+ "${PN}-vpn ${PN}-wait-online"
+PACKAGES =+ "${PN}-vpn ${PN}-wait-online \
+             ${PN}-ppp \
+             ${PN}-plugin-vpn-l2tp \
+             ${PN}-plugin-vpn-openvpn \
+             ${PN}-plugin-vpn-pptp \
+             ${PN}-plugin-vpn-vpnc"
 
 SUMMARY_${PN}-vpn = "A daemon for managing VPN connections within embedded devices"
 DESCRIPTION_${PN}-vpn = "The ConnMan VPN provides a daemon for \
@@ -161,10 +129,10 @@ operating system.  The connman-vpnd handles all the VPN connections \
 and starts/stops VPN client processes when necessary. The connman-vpnd \
 provides a DBus API for managing VPN connections. All the different \
 VPN technogies are implemented using plug-ins."
-FILES_${PN}-vpn += "${sbindir}/connman-vpnd \
-                    ${sysconfdir}/dbus-1/system.d/connman-vpn-dbus.conf \
-                    ${datadir}/dbus-1/system-services/net.connman.vpn.service \
-                    ${systemd_unitdir}/system/connman-vpn.service"
+FILES_${PN}-vpn = "${sbindir}/connman-vpnd \
+                   ${sysconfdir}/dbus-1/system.d/connman-vpn-dbus.conf \
+                   ${datadir}/dbus-1/system-services/net.connman.vpn.service \
+                   ${systemd_unitdir}/system/connman-vpn.service"
 
 SUMMARY_${PN}-wait-online = "A program that will return once ConnMan has connected to a network"
 DESCRIPTION_${PN}-wait-online = "A service that can be enabled so that \
@@ -175,31 +143,32 @@ FILES_${PN}-wait-online += "${sbindir}/connmand-wait-online \
 SUMMARY_${PN}-plugin-vpn-openvpn = "An OpenVPN plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-openvpn = "The ConnMan OpenVPN plugin uses openvpn client \
 to create a VPN connection to OpenVPN server."
-FILES_${PN}-plugin-vpn-openvpn += "${libdir}/connman/scripts/openvpn-script \
-                                   ${libdir}/connman/plugins-vpn/openvpn.so"
-RDEPENDS_${PN}-plugin-vpn-openvpn += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','openvpn','${PN}-plugin-vpn-openvpn', '', d)}"
+FILES_${PN}-plugin-vpn-openvpn = "${libdir}/connman/scripts/openvpn-script \
+                                  ${libdir}/connman/plugins-vpn/openvpn.so"
+RDEPENDS_${PN}-plugin-vpn-openvpn = "${PN}-vpn openvpn"
+RSUGGESTS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','openvpn','${PN}-plugin-vpn-openvpn', '', d)}"
 
 SUMMARY_${PN}-plugin-vpn-vpnc = "A vpnc plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-vpnc = "The ConnMan vpnc plugin uses vpnc client \
 to create a VPN connection to Cisco3000 VPN Concentrator."
-FILES_${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script \
-                                ${libdir}/connman/plugins-vpn/vpnc.so"
-RDEPENDS_${PN}-plugin-vpn-vpnc += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
+FILES_${PN}-plugin-vpn-vpnc = "${libdir}/connman/scripts/openconnect-script \
+                               ${libdir}/connman/plugins-vpn/vpnc.so"
+RDEPENDS_${PN}-plugin-vpn-vpnc = "${PN}-vpn vpnc"
+RSUGGESTS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
 
 SUMMARY_${PN}-plugin-vpn-l2tp = "A L2TP plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-l2tp = "The ConnMan L2TP plugin uses xl2tpd daemon \
 to create a VPN connection to L2TP server."
-FILES_${PN}-plugin-vpn-l2tp += "${libdir}/connman/scripts/libppp-plugin.so* \
-                                ${libdir}/connman/plugins-vpn/l2tp.so"
-RDEPENDS_${PN}-plugin-vpn-l2tp += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','l2tp','${PN}-plugin-vpn-l2tp', '', d)}"
+FILES_${PN}-plugin-vpn-l2tp = "${libdir}/connman/plugins-vpn/l2tp.so"
+RDEPENDS_${PN}-plugin-vpn-l2tp = "${PN}-vpn ${PN}-ppp xl2tpd"
+RSUGGESTS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','l2tp','${PN}-plugin-vpn-l2tp', '', d)}"
 
 SUMMARY_${PN}-plugin-vpn-pptp = "A PPTP plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-pptp = "The ConnMan PPTP plugin uses pptp-linux client \
 to create a VPN connection to PPTP server."
-FILES_${PN}-plugin-vpn-pptp += "${libdir}/connman/scripts/libppp-plugin.so* \
-                                ${libdir}/connman/plugins-vpn/pptp.so"
-RDEPENDS_${PN}-plugin-vpn-pptp += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
+FILES_${PN}-plugin-vpn-pptp = "${libdir}/connman/plugins-vpn/pptp.so"
+RDEPENDS_${PN}-plugin-vpn-pptp = "${PN}-vpn ${PN}-ppp pptp-linux"
+RSUGGESTS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
+
+FILES_${PN}-ppp = "${libdir}/connman/scripts/libppp-plugin.so"
+RDEPENDS_${PN}-ppp = "ppp"
-- 
2.7.4


