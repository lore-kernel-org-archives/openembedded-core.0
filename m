Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4015FECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 05:11:32 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.8242.1661836289808887641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 22:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 93C0A1111F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 07:11:27 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.39.244]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oStX3-1ZEiFF0; Tue, 30 Aug 2022 07:11:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] packagegroup-base.bb: add a configure option to set
 the wireless-daemon
Date: Tue, 30 Aug 2022 07:11:08 +0200
Message-Id: <20220830051108.86092-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661836285-01447F1E-262C253C/0/0 CLEAN NORMAL
X-TOI-MSGID: 4a0e4038-296e-4e8b-a30f-2aaf2904e4f7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 05:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170064

Possible options would be wpa-supplicant or iwd.

iwd is a wireless daemon written by intel and supported by all major netw=
ork managers.
It can be run in standalone mode and configured with 'iwctl' from the ter=
minal, and
with 'iwgtk' or 'iwdgui' from the gui. It can also work as a wpa_supplica=
nt drop-in
replacement for network-manager, connman or systemd-networkd.

iwd makes heavy use of the kernel api, so it is not portable but does not=
 need
additional external libraries like openssl.

The PACKAGECONFIG name for wpa-supplicant in the connman recipe is change=
d accordingly,
so that it also works there when WIRELESS_DAEMON is set globally.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-connectivity/connman/connman.inc        | 4 ++--
 meta/recipes-core/packagegroups/packagegroup-base.bb | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
index 9a518cdb2b..ea6cfd34a2 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -31,7 +31,7 @@ EXTRA_OECONF +=3D "\
 # For smooth operation it would be best to start only one wireless daemo=
n at a time.
 # If wpa_supplicant is running, connman will use it preferentially.
 # Select either wpa_supplicant or iwd
-WIRELESS_DAEMON ??=3D "wpa_supplicant"
+WIRELESS_DAEMON ??=3D "wpa-supplicant"
=20
 PACKAGECONFIG ??=3D "wispr iptables client\
                    ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d=
)} \
@@ -47,7 +47,7 @@ PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${s=
ystemd_system_unitdir}/ --wit
 PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi"
 PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, bluez=
5, bluez5"
 PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono, ofono"
-PACKAGECONFIG[wpa_supplicant] =3D ",,wpa-supplicant,wpa-supplicant"
+PACKAGECONFIG[wpa-supplicant] =3D ",,wpa-supplicant,wpa-supplicant"
 PACKAGECONFIG[iwd] =3D "--enable-iwd,--disable-iwd,,iwd"
 PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindir}=
/openvpn,--disable-openvpn,,openvpn"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
index 7489ef61b0..d60e177471 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -267,11 +267,14 @@ RRECOMMENDS:packagegroup-base-ipsec =3D "\
 # packagegroup-base-wifi contain everything needed to get WiFi working
 # WEP/WPA connection needs to be supported out-of-box
 #
+# Choose either 'wpa-supplicant' or 'iwd' as wireless-daemon
+WIRELESS_DAEMON ??=3D "wpa-supplicant"
 SUMMARY:packagegroup-base-wifi =3D "WiFi support"
 RDEPENDS:packagegroup-base-wifi =3D "\
     iw \
     wireless-regdb-static \
-    wpa-supplicant"
+    ${WIRELESS_DAEMON} \
+"
=20
 RRECOMMENDS:packagegroup-base-wifi =3D "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
zd1211rw', '',d)} \
--=20
2.34.1


