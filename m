Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B03FC433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 06:16:44 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.12518.1653718602707334103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 23:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id 0E4921AA88
	for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 08:16:40 +0200 (CEST)
Received: from localhost.localdomain ([84.154.162.194]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nupkd-2Fvy4n0; Sat, 28 May 2022 08:16:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gcr: build with gtk+3 for wayland
Date: Sat, 28 May 2022 08:16:28 +0200
Message-Id: <20220528061628.681873-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653718599-014331F7-CE97789D/0/0 CLEAN NORMAL
X-TOI-MSGID: e1103728-5158-4ce0-ba6a-52df60ab471c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 06:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166221

Also build with gtk+3 dependency if building for wayland without DISTRO_F=
EATURE "x11".
This fixes an error of missing gcr dependency for gnome-keyring

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gcr/gcr_3.40.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gc=
r/gcr_3.40.0.bb
index 717c31c325..b6e591fb6e 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -22,7 +22,10 @@ SRC_URI +=3D "file://0001-gcr-meson.build-fix-one-para=
llel-build-failure.patch \
=20
 SRC_URI[archive.sha256sum] =3D "b9d3645a5fd953a54285cc64d4fc046736463dbd=
4dcc25caf5c7b59bed3027f5"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk=
', '', d)}"
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
+"
 PACKAGECONFIG[gtk] =3D "-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3"
=20
 FILES:${PN} +=3D " \
--=20
2.25.1


