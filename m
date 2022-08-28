Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879D3ECAAD5
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 16:58:50 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.60840.1661705922847227295
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 09:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id CDB83879C
	for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 18:58:38 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.46.178]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oSLcM-1hqjDt0; Sun, 28 Aug 2022 18:58:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] packagegroup-base.bb: remove wpa_supplicant preset
 from packagegroup-base-wifi
Date: Sun, 28 Aug 2022 18:58:30 +0200
Message-Id: <20220828165830.12594-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661705918-01452C5E-04C1E935/0/0 CLEAN NORMAL
X-TOI-MSGID: 17dcb315-b0ab-4627-9989-0888462ce5b5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 16:58:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169987

This removes wpa_supplicant from packagegroup-base-wifi so that the decis=
ion
of which wireless daemon to use can be made within the recipes.
Possible choices would be wpa_supplicant or iwd.

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

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
index 7489ef61b0..a70a107dac 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -271,7 +271,7 @@ SUMMARY:packagegroup-base-wifi =3D "WiFi support"
 RDEPENDS:packagegroup-base-wifi =3D "\
     iw \
     wireless-regdb-static \
-    wpa-supplicant"
+"
=20
 RRECOMMENDS:packagegroup-base-wifi =3D "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
zd1211rw', '',d)} \
--=20
2.34.1


