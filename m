Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB16EC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 16:38:26 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.112.1661272701379977210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 07FE4E57C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:38:19 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.34.135]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQWuw-2ZfdiL0; Tue, 23 Aug 2022 18:38:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
Date: Tue, 23 Aug 2022 18:38:09 +0200
Message-Id: <20220823163809.17214-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661272698-01441FA6-26B0881C/0/0 CLEAN NORMAL
X-TOI-MSGID: 139fdaae-b08b-45cb-b02e-bbce5c5581ee
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 16:38:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169717

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-connectivity/connman/connman.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
index 5880ecd5d4..d73a2a734f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -28,10 +28,15 @@ EXTRA_OECONF +=3D "\
     --enable-tools \
     --disable-polkit \
 "
+# For smooth operation it would be best to start only one wireless daemo=
n at a time.
+# If wpa_supplicant is running, connman will use it preferentially.
+# Select either wpa_supplicant or iwd
+WIRELESS_DAEMON ??=3D "wpa_supplicant"
=20
 PACKAGECONFIG ??=3D "wispr iptables client\
-                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wif=
i', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d=
)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', =
'bluez', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi=
 ${WIRELESS_DAEMON}', '', d)} \
 "
=20
 # If you want ConnMan to support VPN, add following statement into
@@ -39,9 +44,11 @@ PACKAGECONFIG ??=3D "wispr iptables client\
 # PACKAGECONFIG:append:pn-connman =3D " openvpn vpnc l2tp pptp"
=20
 PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_system_uni=
tdir}/ --with-tmpfilesdir=3D${sysconfdir}/tmpfiles.d/,--with-systemdunitd=
ir=3D'' --with-tmpfilesdir=3D''"
-PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplicant, =
wpa-supplicant"
+PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi"
 PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, bluez=
5, bluez5"
 PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono, ofono"
+PACKAGECONFIG[wpa_supplicant] =3D ",,wpa-supplicant,wpa-supplicant"
+PACKAGECONFIG[iwd] =3D "--enable-iwd,--disable-iwd,,,iwd"
 PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindir}=
/openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] =3D "--enable-vpnc --with-vpnc=3D${sbindir}/vpnc,--d=
isable-vpnc,,vpnc"
--=20
2.34.1


