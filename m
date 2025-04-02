Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0915BC3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:02:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.12826.1743609747872460527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 09:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TI2AC3QZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c14016868so3322821f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743609746; x=1744214546; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRgM1Pe7pyHMEIefzoNAMNtGX8C1xl1ulYnVoJI0Y14=;
        b=TI2AC3QZ/B+jC1WqnxR6clGtBVo6zr0pIdV3KBcfJ1ShE9EByG8bqRs5xerp/ynNNX
         Nyrrea0GGB2LJgsEWDO7N5j4u9iwVEsi8rb6mMCyvfBQrhngf2qrwWZAoMu1V6xRzfXR
         e01UuKuUFENnPxoaxFQsccu0L3m5PYb7BNKcEWbA3Ch8d/GFf+zwTJs5le0InK/bk3Lv
         RhhelZgEPyO38BfNkhV1wziOSjOwkvlODLLCIv11C/cJpNln+bJj7RCcNUUnuH8MbDV0
         E9jpWuN/fvvscB2XY/CC8SWgymUXGOsu1Pkhjlp+WSxTGiFv0Y9w64UJb3aslxjoRS9t
         rfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609746; x=1744214546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRgM1Pe7pyHMEIefzoNAMNtGX8C1xl1ulYnVoJI0Y14=;
        b=Na4a6GWiDCblsuZWbgo1HLMVlvJ4Ttc7OM285btexRwkZ1LDCuuWXH75lm6BgjtmPF
         MmMZ+7mNjyHehBw25Nj8BowHrmnNwty+tIHayg7FBnmrCZgr8dLsRLRaxLX1XhiAbtAA
         fRjUIosDeHUrFKb9z++NrRaT++qVKhuNbut7NztYw1K5FC1NazshGM+BfNwhJGxN7np7
         Xt/1E//l4TOwsJKW8+/Gcmv/Foyys1kRa+v19qBo3MTHaosZcOIky3TdQGskzNILVU/d
         TNRaCy5nqVnoPqK/KqU3+8ZAMSXNlkEpfouuAlOMRpFOTyUjaxbaOWzcTAcObuov9Np8
         Kqqw==
X-Gm-Message-State: AOJu0Yxh7LvUiYEpr8BcNV02Y5ria21P1tvXMHblVs9M+gbJhHP4g6qp
	Amc/JrskV4TC+/T9BVv1cW3yXPLymFpXgqFMF5SLd02j0Lb8apm3A1kT7A==
X-Gm-Gg: ASbGnctajCZ6qlluWjr4D5OpCDGa8Rpf1AnWRr/tBXZup7U6cFxOi5yuEMbtWcMypuj
	otemp1Kcs7U3CtuJqc3h4sMWMgvYLOE8HV4uaFDLaD6CSevy4vQlga01KLJ2+lQRyC35uqpIUq8
	nlD2x31746fEomLb7mrZ5daH6NZsXc0Mu8LfxjSPI2/cMGTaHq7sEGOBKIC2UbPvWFYGIcS14nD
	u7acA3waxvOyHkDC5NkjEt5VZKg91Lbc0EKrL7Pq2hJihlyl6W+q5bm1PxbZE19lnlQhON2iguB
	+pF7aP65nUIMowacJsK2UjgL2lBRdhMR8HMzHzWRNjEXY4GoaFRJeba8Srkfx8jsLu7LaLaGfKr
	kFMMgQYJUUXw=
X-Google-Smtp-Source: AGHT+IHoOL5436jh55jiQ1/v8KGzV2MPGcaXzSXRXvQhwZhRB4M4v7quNmX0lnRJyAzNQ8e45k6BSQ==
X-Received: by 2002:a05:6000:1867:b0:39c:12f2:2f86 with SMTP id ffacd0b85a97d-39c12f2306bmr13711490f8f.8.1743609745684;
        Wed, 02 Apr 2025 09:02:25 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm17543565f8f.71.2025.04.02.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:02:25 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 02 Apr 2025 16:02:17 +0000
Subject: [PATCH OE-Core 5/5] connman: Rework to avoid splitting into many
 single binary packages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-connman-v1-5-2e4fbbb7caf9@gmail.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
In-Reply-To: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 16:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214285

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
 meta/recipes-connectivity/connman/connman_1.44.bb | 159 +++++-----------------
 1 file changed, 34 insertions(+), 125 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 2622a8ebfed0ceec7ac39fcf3ffad76291de5797..b1616351b5c2b1a7d4f2ac577db19ab566ceac0e 100644
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
@@ -134,113 +125,31 @@ do_install:append() {
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
+RDEPENDS:${PN}-tests = "${PN}"
+ALLOW_EMPTY:${PN}-tests = "1"
+
+FILES:${PN}-tools = "${@ ' '.join([os.path.join('${bindir}', os.path.basename(noinst_program)) for noinst_program in NOINST_TOOLS.split()]) }"
+RDEPENDS:${PN}-tools = "${PN}"
+ALLOW_EMPTY:${PN}-tools = "1"

-- 
2.25.1


