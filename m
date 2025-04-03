Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C81C369A2
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:53:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.10570.1743677595466333171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvMTJN4/;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13185135e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677593; x=1744282393; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKgHRp+KCryu1tfaIr4ltsx6sA1HvJeCrPE078aMM0U=;
        b=OvMTJN4/mcOaWTW3GRxeeb6f4AnamLoRgc3fSjh+qtNxsgi5RrAgQA2Wbof18lL9Q2
         zCA3MZiL2kl4NURdXOZtNsios1CB6xwikxhlTgalfAahkowTAqKFoP5bgPzDG+qMaJ3g
         iYv5Qminw9Agm9YSpqYEPSwPmUNn/iN9uraaHDlC1j/TpSXohTJqw/qh+FH6IosHi/xd
         IuFCWT7Fmty8WZbZgROxQC+eaiBOiqBIiDDrNV/Xv4mEUvpauNorg7J2QLZqNZrbObi7
         +r3iFGkgj+069cDNacD5N/5MFniB1+9w3JOlan1lfSUqqCzEH58Vds+OsIJL+mCMGs3o
         x/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677593; x=1744282393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKgHRp+KCryu1tfaIr4ltsx6sA1HvJeCrPE078aMM0U=;
        b=OgDXhxIy+clRRBhsvO3t4EJtlNRDjwJhuE4Pu/USqyeUGbN5Rvc+1BQsfnmJ9UB5h6
         xJKuWfJ8RomTRrfJWJDj0UxMdDBYlUCoABwHKtlM7641YNTidMsq8MIh4hhNZhWU14UV
         KJ5t5VJZQn4IHRe0MdijH5Qid3hQ1lMF4LM6+LYejs0vMfmBquE5hLVL9ARDp/cnKxXr
         L/iPpbhM06xNpiEISrtjY7Pk2jCq6imrGhOHkhxOpCoBVc1axtizaldc5NU3LBCDKvCU
         BXR5qt2gxJY6gtmRmk/paBsx80s4ET4bGEzG5YQmEhd/rqyu8yVwIWTe8TZOkddOcAGT
         LI5Q==
X-Gm-Message-State: AOJu0Yw4A0lv4RvWS57/K2yN4+T+mX5A4soLVyslTL50zyZlDJpM8pwF
	eZwhQrw/53GUda7uuBt0WzCyofJHCacl4pwCkNQ3zs0bULyMBWzROGHbCjsw
X-Gm-Gg: ASbGncsMJA0Y/RH/oGsgmp6qfIrZjQzrV9zUiXjMY2l/A6S2+7od5mYY3muJaeModr4
	VeUodokBWZeiJ85cBLPW+HI19lk5rkRne0QycBHMi9cVdrjnHGc5PMJ4iYZsfTRvQiYtJ7ezlzp
	wkSsIWWEzoO0St0KjMNTJoWw95brGUJC8HK96vPMokzfWAx8Ot6gWSoRtK9GcVKjto6jTT3x0DA
	FNK91EKher2JWj10FvzxSlKPAWOEVQP1l1G0HqXFhJCh21G3ghkyX1PsG0OeAXeUiE1+2jbHiOl
	/x1DLNAGDtmRXIk9PXppu5iDM9GAvopIlPzuISgZNjd5SiczykfLZMzY0uUeFEd88ziQD6y5p3O
	m+q8vVIH7og0=
X-Google-Smtp-Source: AGHT+IF3ucxeWHSWRNlgn8sI/iZVaw+O+JBPDFb2CWKB7NRc6sLbDrH8y73sFw2cGHzBU6w308GaCg==
X-Received: by 2002:a05:6000:240a:b0:391:bc8:564a with SMTP id ffacd0b85a97d-39c2e6510f0mr2814808f8f.22.1743677592795;
        Thu, 03 Apr 2025 03:53:12 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm18346865e9.5.2025.04.03.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:53:12 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 03 Apr 2025 10:52:57 +0000
Subject: [PATCH OE-Core v2 4/6] connman: Add all build options as
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-connman-v2-4-8bb637312ba8@gmail.com>
References: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
In-Reply-To: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214315

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
index aa9da070dec1b4aac02019ae9c3158256b534c61..f9c3291b5c4d234f08d17dcb06d93e69aeaf85f5 100644
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
+CONNMAN_STATS_MAX_FILE_SIZE ??= "16384"
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
+PACKAGECONFIG[iptables] = "--with-firewall=iptables,,iptables,,,nftables"
+PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd"
+PACKAGECONFIG[loopback] = "--enable-loopback,--disable-loopback"
+PACKAGECONFIG[nfc] = "--enable-neard,--disable-neard,neard"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat,iptables"
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
2.46.1


