Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C16EC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:12:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.13666.1676902319518945551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id 5B295255CC
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 15:11:35 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.230.185]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pU6tC-0fBlCb0; Mon, 20 Feb 2023 15:11:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] libportal: allow to build without gtk4 backend
Date: Mon, 20 Feb 2023 15:11:27 +0100
Message-Id: <20230220141127.16779-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676902295-C8C30DB0-806082F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 6b78fb01-7584-4b3f-92b9-7528ba90b09b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177405

This allows to build libportal for platforms without opengl support

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/libportal/libportal_0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes=
-gnome/libportal/libportal_0.6.bb
index ca58ef4138..bf38fc85fd 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -15,6 +15,6 @@ GIDOCGEN_MESON_OPTION =3D 'docs'
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 gtk4"
+DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 ${@bb.utils.contains('DISTR=
O_FEATURES', 'opengl', 'gtk4', '', d)}"
=20
-EXTRA_OEMESON =3D "-Dbackends=3Dgtk3,gtk4"
+EXTRA_OEMESON =3D "-Dbackends=3Dgtk3${@bb.utils.contains('DISTRO_FEATURE=
S', 'opengl', ',gtk4', '', d)}"
--=20
2.34.1


