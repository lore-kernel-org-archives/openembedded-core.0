Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81D3C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:02:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12863.1743609747385590314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 09:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJi9gmCM;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39727fe912cso2694584f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743609745; x=1744214545; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq0EPlPpZuHlRzrxuFpZuR/gR2YJwok5E2yWc17Aos0=;
        b=eJi9gmCMjKCpSlh1ne2M5i6Ghfw2SowGY2+nYTMYyj32wckjAkUyADDpCc0g6QeTXi
         XQgUU/H98q3jVHLgGT6HdBDC0n2xE+8gplh1rxa4ma51kzxLMOYnktJ8sOIs1gU7kqOL
         ZMjjHyb0qX1MGL6hRe/96HAqzVUSXy7H0MCvRFOVFKOvNMrynGHTznj/H57WPBbpiod/
         FL1LgHEijFodLhUvwx2FTVHHh946sHBAGgMo+JYC/Sfc89fnANVFHEFeUUkDZ340ZiiY
         nLt0iDwFB3BFBXM5ITgt+AXCxUcXLcn0M3FrB8ASDwei+EeM9MnCqLsryNtzNyKYAl9A
         8M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609745; x=1744214545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq0EPlPpZuHlRzrxuFpZuR/gR2YJwok5E2yWc17Aos0=;
        b=KTk2Q/Wk9Ild+vhPpI3wxVFsXeKuAU8W0c2p/Wynyok9C9FnwZOFmcICYfqaKr8gdd
         h1vkp++c8Qrcaj4WUXw/kCzqbgbzD97Cgn/PmtoNGrcye/XebXHT/LMTl68T3Sd353ef
         JQRCBHHxOTu6wI9vUZcnubbbLwCfNPHyjygWcFvaobaEWq0/B2zizt2QBltKPWpuQFHA
         zLK9GAAZ58ae8C1kELLtnVvEIQ0QdpFkg5eYnAmy+GIX/umDdBf12SdovEaj3Erzh/R4
         3QuOQoZnUpSHX/cjQvABOtXE4jXDvxwbpDo/a9feunuIovV0Gex4CwZdBGOBsyugTIJf
         APnA==
X-Gm-Message-State: AOJu0YxvZmfsQJQVQvywEdvCEh+/MHrlm3Ejgbgu0xqo81rpBHcslq8q
	KAYgUQjeIxxiK4kVbqb8Ww0cdBuSPB6JMRTipeSQGZx6J3BkgSSB7R/G3A==
X-Gm-Gg: ASbGncs6/cRMBJ6FV8qEOGqhk6IzW0fFPEySouZLnjEXzEMfTdbj5qrkAHBV71qMuXi
	A/XhL9a0d4Q77jgWbmhZnfG1AF1lEtA69w0CBLxK2PZDpIykH3xk1rsJ9WzMYeSYX3vT693Cqqo
	PnBGAOKKendTa1Xcd7sUR4Vp7hZEvwecFfXMMNgwe9AzyPungTfspSIolQZAuSO5U3JGdTP8g8h
	NdKPiqBgGaQVJiY4lv3nOR5N6OcEvn6WRuNAwbOzFoL3T8ycIyAa7Nmae4WbpjwKnxHD8rJXRR+
	ILTj3mD5osqJCjsJDHyHGUgFly/bpcFoVm8FSJm1kuXfRynv1/Z+h+nql8UQpDg40UTeFXGlZpp
	1fobviyDaPKI=
X-Google-Smtp-Source: AGHT+IE+CmWnnx/yhZIbrcvsWDr9irFG3w6eha7TZq0TX2pfZsvV+YOKygOokoo+zIyN8h9Iwqm7Sw==
X-Received: by 2002:a5d:47ac:0:b0:399:7916:a164 with SMTP id ffacd0b85a97d-39c29767a19mr3076681f8f.31.1743609744965;
        Wed, 02 Apr 2025 09:02:24 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm17543565f8f.71.2025.04.02.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:02:24 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 02 Apr 2025 16:02:16 +0000
Subject: [PATCH OE-Core 4/5] connman: Add all build options as
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
In-Reply-To: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 16:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214284

Add all missing build options as PACKAGECONFIG items. Add CONNMAN_FIREWALL to
select iptables or nftables (one is required).

Set dns-backend automatically based on systemd-resolved in DISTRO_FEATURES,
then drop "connman.service: stop systemd-resolved when we use connman" as we
now use connman's systemd-resolved support.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...vice-stop-systemd-resolved-when-we-use-co.patch | 26 -------
 meta/recipes-connectivity/connman/connman_1.44.bb  | 85 +++++++++++++---------
 2 files changed, 50 insertions(+), 61 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
deleted file mode 100644
index 4597fe68fcdf6f301247747c52b1d4636ebec631..0000000000000000000000000000000000000000
--- a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 19aff57e4da920d9ca972903582305b4efe81ef3 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 12 Jun 2017 16:52:39 +0300
-Subject: [PATCH] connman.service: stop systemd-resolved when we use connman
-
-Stop systemd-resolved service when we use connman as network manager.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/connman.service.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/connman.service.in b/src/connman.service.in
-index 7376346..79e75d6 100644
---- a/src/connman.service.in
-+++ b/src/connman.service.in
-@@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
- After=dbus.service network-pre.target systemd-sysusers.service
- Before=network.target multi-user.target shutdown.target
- Wants=network.target
-+Conflicts=systemd-resolved.service
- 
- [Service]
- Type=dbus
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index aa9da070dec1b4aac02019ae9c3158256b534c61..2622a8ebfed0ceec7ac39fcf3ffad76291de5797 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -12,65 +12,79 @@ LICENSE  = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
-inherit autotools pkgconfig systemd update-rc.d update-alternatives
-
 CVE_PRODUCT = "connman connection_manager"
 
 DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-           file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-           "
+"
 
 SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
 
+inherit autotools pkgconfig systemd update-rc.d update-alternatives
+
+RDEPENDS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'wifi', '${WIRELESS_DAEMON}', '', d)}"
 RRECOMMENDS:${PN} = "connman-conf"
-RCONFLICTS:${PN} = "networkmanager"
 
 EXTRA_OECONF += "\
-    ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
-    ac_cv_path_PPPD=${sbindir}/pppd \
-    --enable-debug \
-    --enable-loopback \
-    --enable-ethernet \
+    --enable-datafiles \
     --enable-tools \
-    --disable-polkit \
-    --runstatedir=/run \
+    --runstatedir='${runtimedir}' \
+    --with-dns-backend='${@bb.utils.contains("DISTRO_FEATURES", "systemd-resolved", "systemd-resolved", "internal", d)}' \
+    ac_cv_path_IP6TABLES_SAVE=${sbindir}/ip6tables-save \
+    ac_cv_path_IPTABLES_SAVE=${sbindir}/iptables-save \
+    ac_cv_path_PPPD=${sbindir}/pppd \
+    ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
 "
+
 # For smooth operation it would be best to start only one wireless daemon at a time.
 # If wpa-supplicant is running, connman will use it preferentially.
 # Select either wpa-supplicant or iwd
 WIRELESS_DAEMON ??= "wpa-supplicant"
 
-PACKAGECONFIG ??= "wispr iptables client\
-                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi ${WIRELESS_DAEMON}', '', d)} \
+# Choose "iptables" or "nftables"
+CONNMAN_FIREWALL ??= "iptables"
+
+# Default is 16kB
+CONNMAN_STATS_MAX_FILE_SIZE = "16384"
+
+PACKAGECONFIG ??= "client ethernet loopback wispr ${CONNMAN_FIREWALL} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', '3g bluetooth nfc polkit selinux systemd usbgadget wifi', d)} \
+                   ${@bb.utils.filter('WIRELESS_DAEMON', 'iwd', d)} \
 "
 
-# If you want ConnMan to support VPN, add following statement into
-# local.conf or distro config
-# PACKAGECONFIG:append:pn-connman = " openvpn vpnc l2tp pptp"
-
-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
-PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi"
-PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5, bluez5"
-PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
-PACKAGECONFIG[wpa-supplicant] = ",,wpa-supplicant,wpa-supplicant"
-PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd,,iwd"
-PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
-PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
-PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
+PACKAGECONFIG[3g] = "--enable-ofono,--disable-ofono,ofono"
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez5,bluez5"
+PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
+PACKAGECONFIG[dundee] = "--enable-dundee,--disable-dundee"
+PACKAGECONFIG[ethernet] = "--enable-ethernet,--disable-ethernet"
+PACKAGECONFIG[hh2serial-gps] = "--enable-hh2serial-gps,--disable-hh2serial-gps"
+PACKAGECONFIG[iospm] = "--enable-iospm,--disable-iospm"
+PACKAGECONFIG[iptables] = ",,iptables,iptables,nftables"
+PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd"
+PACKAGECONFIG[loopback] = "--enable-loopback,--disable-loopback"
+PACKAGECONFIG[nfc] = "--enable-neard,--disable-neard,neard"
+PACKAGECONFIG[nftables] = ",,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat,iptables"
+PACKAGECONFIG[nmcompat] = "--enable-nmcompat,--disable-nmcompat"
+PACKAGECONFIG[pacrunner] = "--enable-pacrunner,--disable-pacrunner"
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+PACKAGECONFIG[session-policy-local] = "--enable-session-policy-local,--disable-session-policy-local"
+PACKAGECONFIG[stats] = "--enable-stats --with-stats-max-file-size=${CONNMAN_STATS_MAX_FILE_SIZE},--disable-stats"
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/ --with-tmpfilesdir=${nonarch_libdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
+PACKAGECONFIG[test] = "--enable-test,--disable-test"
+PACKAGECONFIG[tist] = "--enable-tist,--disable-tist"
+PACKAGECONFIG[usbgadget] = "--enable-gadget,--disable-gadget"
+PACKAGECONFIG[wifi] = "--enable-wifi,--disable-wifi"
+PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls"
+
 PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,ppp,xl2tpd"
+PACKAGECONFIG[openconnect] = "--enable-openconnect --with-openconnect=${sbindir}/openconnect,--disable-openconnect,openconnect,openconnect"
+PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,ppp,pptp-linux"
-# WISPr support for logging into hotspots, requires TLS
-PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
-PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
-PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
-PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
-PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
+PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
 PACKAGECONFIG[wireguard] = "--enable-wireguard,--disable-wireguard,libmnl"
 
 INITSCRIPT_NAME = "connman"
@@ -115,6 +129,7 @@ do_install:append() {
 
 	# For read-only filesystem, do not create links during bootup
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${sysconfdir}
 		ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-conf.connman
 	fi
 }

-- 
2.25.1


