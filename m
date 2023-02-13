Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C59C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:42:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.11537.1676284963599026902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id B3D45FEBD
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:42:41 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.111]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRWIC-0SNbxR0; Mon, 13 Feb 2023 11:42:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
Date: Mon, 13 Feb 2023 11:42:28 +0100
Message-Id: <20230213104228.1067057-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676284961-7FFF80AF-0049931E/0/0 CLEAN NORMAL
X-TOI-MSGID: 75c8ac47-ee7b-4ba8-b0b4-0d8a4dd28b52
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177093

Not all arm platforms support neon and runtime detection for this feature=
 is
currently not reliable. Add a PACKAGECONFIG that disables neon support fo=
r arm
but can be manually enabled.

Enable neon for aarch64 by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..0efe6520d8 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -11,7 +11,9 @@ SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c70=
27bcff52f5ec2367c25ec859da3
=20
 # gtk4 & mutter 41.0 requires graphene build with introspection
 PACKAGECONFIG ?=3D "introspection"
+PACKAGECONFIG:aarch64 +=3D "neon"
 PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
+PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


