Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB396C369A3
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:53:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.10512.1743677597745516118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ieIAHh+4;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so406117f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677595; x=1744282395; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wL+JCTFwfUlAvTGjEUi/1fzrvwyxMqJwGBM6Qiyr2g=;
        b=ieIAHh+4z/x6ohoOfo/9vv9B/kMlD0v2EAom69NHu64jNjI24s8ZQI49z/gBiJ+f8W
         YVNcqhYn5aUgZhiF2YkUWtfhGslf4ckLIrFaxKgQKq/WUtWiW47UyJEBzjH8/TT0Q1g7
         qLgMK7g1HHIrsU7YuWbTDcIJLoSGekOaHK/NMHaTgPgJnH4vOA64JeI4O/g5JAJ0edQL
         JfqteiZu26XCjO/G+vmlhuG16toY8Uu70A7cH5Cb+i8EkpLZ3d2lJqGpZlbEIuvnDcLp
         KXVfB2UGbLx7MVW/CPG1GTt1Eb155ioDCkk3OSkTuN1xhRwvcgxcHCXMDlqhQKtLjLrS
         jCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677595; x=1744282395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wL+JCTFwfUlAvTGjEUi/1fzrvwyxMqJwGBM6Qiyr2g=;
        b=OK7vgpS4QUQViPtMhsKHZqjDQv7OKm88Yas5rjDAW+xcSc5WtcS06tL4bQoaygYKfK
         B/o6T5pQ+rTmEO43b8A7sTjzle+WGRckucwApWF/1ZpiTIiIDPRAgXa/+J9Y3fqE5vKv
         IfJLL0zIn/QWXb1VJHIWOEHuUNgIif0Q1KmVgJQdj5dRPT4ojymztO4n4KRhhdwO3vvN
         sk4IiA8OU7/pf4rQRBWkW7AQh6ECrw+tuIMmPfTnK2mUzQPWPuKimXZE3NUQgCOKks2n
         cS13XYdgzwT/Yt+ILrkxY9abPB2tTu3jGWh8QHlThUKT9pm7N5PvKQTJxgT7gALEXUI/
         ypGQ==
X-Gm-Message-State: AOJu0YyBgGs4A0HmfDaF7bDGE9bu61iuVQ3xI8YgL5ZzFlBhYsz7xSdi
	PK8oqe39hfWnszjlqgPefzRN1M/zy1ckpnGvNE0lqoJH9fgs88pJLCUkZoWw
X-Gm-Gg: ASbGncvOSnXRPbbgA0/2Dpv2GvwWkk3vOeyqq4FGlkvMt1OC2flwGe2Sdc6iL8punPK
	YZp5Hn+kJPACbkvVzNtb9WbuPvfj2yuic9q9lo/7cU/s3sX5xyJ6EF1iDBX0D2Eg5ZFepO9ZYtD
	UYPZvnsBj3guOl8jXjW6DGWLzuAKdkbU0ri2CvysUHGWwLyLPy99dzl6KblnXCVPoZ00Hyfb4Ua
	8xRMqt+xSN1noo6py8rK+vQqLxF7IMofxTnLJPpZ95m/LI6wg0TYsfxByrnHoJuEMb6a84G2peg
	OMw3N/IOCzYjmjTbCTo6BBehlWc4W5PIBO2mJxLjS4nsimDeuYySmWo5VlWGS0FpuA2OLdiRN2W
	GyOpsF2oQ7bYVQaTmUO3xBg==
X-Google-Smtp-Source: AGHT+IEcoi4l3p7e5WOozSS1AntvXfIiSzZQhvNeRw7LLsov9lPBOV3c9Gw4PzAHYPTLSQX7ITKopg==
X-Received: by 2002:adf:e952:0:b0:391:3028:c779 with SMTP id ffacd0b85a97d-39c2f9444ecmr1548864f8f.45.1743677595164;
        Thu, 03 Apr 2025 03:53:15 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm18346865e9.5.2025.04.03.03.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:53:14 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 03 Apr 2025 10:52:59 +0000
Subject: [PATCH OE-Core v2 6/6] connman: Rework to avoid splitting into
 many single binary packages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-connman-v2-6-8bb637312ba8@gmail.com>
References: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
In-Reply-To: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214317

This recipe predates PACKAGECONFIG (or maybe widespread usage?) and so to use
the VPN options they had to be both enabled at the PACKAGECONFIG level and then
included as a separate package. In addition the list of VPN packages has
drifted so (for example) wireguard was not delivered this way.

Remove most of the subordinate packages and just populate the main connman
package based on PACKAGECONFIG. Keep connman-client separate as `connmanctl`
has a dependency on readline (which is GPLv3 licensed) and separate out
connman-tools for `stats-tool` and connman-tests for all the test binaries
(which possibly in the future could be used as the basis of a ptest package).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 161 +++++-----------------
 1 file changed, 36 insertions(+), 125 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index f9c3291b5c4d234f08d17dcb06d93e69aeaf85f5..92641d36792fd3aedafc1a52f2e376fdcb9f40db 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -90,17 +90,11 @@ PACKAGECONFIG[wireguard] = "--enable-wireguard,--disable-wireguard,libmnl"
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
-python __anonymous () {
-    systemd_packages = "${PN} ${PN}-wait-online"
-    pkgconfig = d.getVar('PACKAGECONFIG')
-    if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
-        systemd_packages += " ${PN}-vpn"
-    d.setVar('SYSTEMD_PACKAGES', systemd_packages)
-}
-
-SYSTEMD_SERVICE:${PN} = "connman.service"
-SYSTEMD_SERVICE:${PN}-vpn = "connman-vpn.service"
-SYSTEMD_SERVICE:${PN}-wait-online = "connman-wait-online.service"
+SYSTEMD_SERVICE:${PN} = "\
+    connman.service \
+    connman-wait-online.service \
+    ${@bb.utils.contains_any('PACKAGECONFIG', ['openconnect', 'openvpn', 'vpnc', 'l2tp', 'pptp', 'wireguard'], 'connman-vpn.service', '', d)} \
+"
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
@@ -114,18 +108,15 @@ do_install:append() {
 		sed -i s%@DATADIR@%${datadir}% ${D}${sysconfdir}/init.d/connman
 	fi
 
-	install -d ${D}${bindir}
-	install -m 0755 ${B}/tools/*-test ${D}${bindir}
-	if [ -e ${B}/tools/wispr ]; then
-		install -m 0755 ${B}/tools/wispr ${D}${bindir}
-	fi
+	for noinst_program in ${NOINST_TESTS} ${NOINST_TOOLS}; do
+		if [ -r "${B}/$noinst_program" ]; then
+			install -d ${D}${bindir}
+			install -m 0755 "${B}/$noinst_program" ${D}${bindir}
+		fi
+	done
 
 	# We don't need to package an empty directory
-	rmdir --ignore-fail-on-non-empty ${D}${libdir}/connman/scripts
-
-	# Automake 1.12 won't install empty directories, but we need the
-	# plugins directory to be present for ownership
-	mkdir -p ${D}${libdir}/connman/plugins
+	rmdir --ignore-fail-on-non-empty ${D}${libdir}/connman/scripts ${D}${libdir}/connman
 
 	# For read-only filesystem, do not create links during bootup
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
@@ -134,113 +125,33 @@ do_install:append() {
 	fi
 }
 
-# These used to be plugins, but now they are core
-RPROVIDES:${PN} = "\
-	connman-plugin-loopback \
-	connman-plugin-ethernet \
-	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'wifi','connman-plugin-wifi', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)} \
-	"
-
-PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
-
-def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_skip):
-    plugintype = pkg.split( '-' )[-1]
-    if plugintype in depmap:
-        rdepends = map(lambda x: multilib_prefix + x, \
-                       depmap[plugintype].split())
-        d.setVar("RDEPENDS:%s" % pkg, " ".join(rdepends))
-    if add_insane_skip:
-        d.appendVar("INSANE_SKIP:%s" % pkg, "dev-so")
-
-python populate_packages:prepend() {
-    depmap = dict(pppd="ppp")
-    multilib_prefix = (d.getVar("MLPREFIX") or "")
-
-    hook = lambda file,pkg,x,y,z: \
-        add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, False)
-    plugin_dir = d.expand('${libdir}/connman/plugins/')
-    plugin_name = d.expand('${PN}-plugin-%s')
-    do_split_packages(d, plugin_dir, r'^(.*).so$', plugin_name, \
-        '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
-
-    hook = lambda file,pkg,x,y,z: \
-        add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, True)
-    plugin_dir = d.expand('${libdir}/connman/plugins-vpn/')
-    plugin_name = d.expand('${PN}-plugin-vpn-%s')
-    do_split_packages(d, plugin_dir, r'^(.*).so$', plugin_name, \
-        '${PN} VPN plugin for %s', extra_depends='', hook=hook, prepend=True )
-}
-
-PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
+NOINST_TESTS = "tools/supplicant-test tools/dhcp-test tools/dhcp-server-test \
+		tools/addr-test tools/web-test tools/resolv-test tools/dbus-test \
+		tools/polkit-test tools/wpad-test tools/private-network-test \
+		tools/session-test tools/dnsproxy-test tools/iptables-test tools/ip6tables-test \
+		tools/iptables-unit tools/dnsproxy-standalone \
+		unit/test-ippool unit/test-iptables \
+"
+NOINST_TOOLS = "tools/stats-tool tools/wispr"
 
-FILES:${PN}-tools = "${bindir}/wispr"
-RDEPENDS:${PN}-tools = "${PN}"
+PACKAGE_BEFORE_PN = "${PN}-client ${PN}-tests ${PN}-tools"
 
-FILES:${PN}-tests = "${bindir}/*-test"
+FILES:${PN} += " \
+    ${datadir}/dbus-1/system-services \
+    ${datadir}/dbus-1/system.d \
+    ${datadir}/polkit-1 \
+    ${nonarch_libdir}/tmpfiles.d/*.conf \
+"
 
 FILES:${PN}-client = "${bindir}/connmanctl"
 RDEPENDS:${PN}-client = "${PN}"
 
-FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
-            ${libdir}/connman/plugins \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} ${datadir} \
-            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
-            ${datadir}/dbus-1/system-services/* \
-            ${sysconfdir}/tmpfiles.d/connman_resolvconf.conf"
-
-FILES:${PN}-dev += "${libdir}/connman/*/*.la"
-
-PACKAGES =+ "${PN}-vpn ${PN}-wait-online"
-
-SUMMARY:${PN}-vpn = "A daemon for managing VPN connections within embedded devices"
-DESCRIPTION:${PN}-vpn = "The ConnMan VPN provides a daemon for \
-managing VPN connections within embedded devices running the Linux \
-operating system.  The connman-vpnd handles all the VPN connections \
-and starts/stops VPN client processes when necessary. The connman-vpnd \
-provides a DBus API for managing VPN connections. All the different \
-VPN technogies are implemented using plug-ins."
-FILES:${PN}-vpn += "${sbindir}/connman-vpnd \
-                    ${sysconfdir}/dbus-1/system.d/connman-vpn-dbus.conf \
-                    ${datadir}/dbus-1/system-services/net.connman.vpn.service \
-                    ${systemd_system_unitdir}/connman-vpn.service"
-
-SUMMARY:${PN}-wait-online = "A program that will return once ConnMan has connected to a network"
-DESCRIPTION:${PN}-wait-online = "A service that can be enabled so that \
-the system waits until a network connection is established."
-FILES:${PN}-wait-online += "${sbindir}/connmand-wait-online \
-                            ${systemd_system_unitdir}/connman-wait-online.service"
-
-SUMMARY:${PN}-plugin-vpn-openvpn = "An OpenVPN plugin for ConnMan VPN"
-DESCRIPTION:${PN}-plugin-vpn-openvpn = "The ConnMan OpenVPN plugin uses openvpn client \
-to create a VPN connection to OpenVPN server."
-FILES:${PN}-plugin-vpn-openvpn += "${libdir}/connman/scripts/openvpn-script \
-                                   ${libdir}/connman/plugins-vpn/openvpn.so"
-RDEPENDS:${PN}-plugin-vpn-openvpn += "${PN}-vpn"
-RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG','openvpn','${PN}-plugin-vpn-openvpn', '', d)}"
-
-SUMMARY:${PN}-plugin-vpn-vpnc = "A vpnc plugin for ConnMan VPN"
-DESCRIPTION:${PN}-plugin-vpn-vpnc = "The ConnMan vpnc plugin uses vpnc client \
-to create a VPN connection to Cisco3000 VPN Concentrator."
-FILES:${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script \
-                                ${libdir}/connman/plugins-vpn/vpnc.so \
-                                ${libdir}/connman/scripts/vpn-script"
-RDEPENDS:${PN}-plugin-vpn-vpnc += "${PN}-vpn"
-RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
-
-SUMMARY:${PN}-plugin-vpn-l2tp = "A L2TP plugin for ConnMan VPN"
-DESCRIPTION:${PN}-plugin-vpn-l2tp = "The ConnMan L2TP plugin uses xl2tpd daemon \
-to create a VPN connection to L2TP server."
-FILES:${PN}-plugin-vpn-l2tp += "${libdir}/connman/scripts/libppp-plugin.so* \
-                                ${libdir}/connman/plugins-vpn/l2tp.so"
-RDEPENDS:${PN}-plugin-vpn-l2tp += "${PN}-vpn"
-RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG','l2tp','${PN}-plugin-vpn-l2tp', '', d)}"
-
-SUMMARY:${PN}-plugin-vpn-pptp = "A PPTP plugin for ConnMan VPN"
-DESCRIPTION:${PN}-plugin-vpn-pptp = "The ConnMan PPTP plugin uses pptp-linux client \
-to create a VPN connection to PPTP server."
-FILES:${PN}-plugin-vpn-pptp += "${libdir}/connman/scripts/libppp-plugin.so* \
-                                ${libdir}/connman/plugins-vpn/pptp.so"
-RDEPENDS:${PN}-plugin-vpn-pptp += "${PN}-vpn"
-RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
+FILES:${PN}-tests = "${@ ' '.join([os.path.join('${bindir}', os.path.basename(noinst_program)) for noinst_program in NOINST_TESTS.split()]) }"
+RDEPENDS:${PN}-tests = "${PN} \
+			${@bb.utils.contains('PACKAGECONFIG', 'iptables', 'iptables', '', d)} \
+"
+ALLOW_EMPTY:${PN}-tests = "1"
+
+FILES:${PN}-tools = "${@ ' '.join([os.path.join('${bindir}', os.path.basename(noinst_program)) for noinst_program in NOINST_TOOLS.split()]) }"
+RDEPENDS:${PN}-tools = "${PN}"
+ALLOW_EMPTY:${PN}-tools = "1"

-- 
2.46.1


