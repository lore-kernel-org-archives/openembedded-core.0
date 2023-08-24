Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E07C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:04:34 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.6919.1692867872689828860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id 8574444B8
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 11:04:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.18]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ6GS-1ardC50; Thu, 24 Aug 2023 11:04:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] qemu: fix libudev packageconfig for systemd images
Date: Thu, 24 Aug 2023 11:04:14 +0200
Message-ID: <20230824090414.9198-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692867868-0592EEBC-1F964A10/0/0 CLEAN NORMAL
X-TOI-MSGID: fac1d87b-37d4-415b-abbb-90c575ba26d8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186649

eudev is needed to provide libudev when not using systemd,
but including eudev breaks things for systemd. We can't
include eudev here since systemd provides libudev itself.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index ea02bf0c73..dfd4f1b97f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -199,7 +199,8 @@ PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--di=
sable-usb-redir,usbredir"
 PACKAGECONFIG[snappy] =3D "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs,glu=
sterfs"
 PACKAGECONFIG[xkbcommon] =3D "--enable-xkbcommon,--disable-xkbcommon,lib=
xkbcommon"
-PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-libudev,eudev"
+UDEV_PROVIDER =3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ''=
, 'eudev', d)}"
+PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-libudev,${UDEV_PR=
OVIDER}"
 PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
--=20
2.41.0


