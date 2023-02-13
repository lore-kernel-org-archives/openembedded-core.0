Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85BBC636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 18:04:09 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.22389.1676311440638533673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 10:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout05.t-online.de (Postfix) with SMTP id CE04111774
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 19:03:58 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.111]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRdBG-43OYAT0; Mon, 13 Feb 2023 19:03:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv5] graphene: add a PACKAGECONFIG for arm_neon
Date: Mon, 13 Feb 2023 19:03:51 +0100
Message-Id: <20230213180351.2695806-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676311438-D4F1E046-FCE81C84/0/0 CLEAN NORMAL
X-TOI-MSGID: d89241d9-0646-41f6-91b0-cda5a2c49d70
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 18:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177106

Not all arm platforms support neon and runtime detection for this feature=
 is
currently not reliable.
Disable neon support by default on ARM-32 platforms because of the
following upstream bug: https://github.com/ebassi/graphene/issues/215

Enable neon for aarch64 by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..199c460feb 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -10,8 +10,10 @@ inherit gnomebase gobject-introspection gtk-doc
 SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
=20
 # gtk4 & mutter 41.0 requires graphene build with introspection
-PACKAGECONFIG ?=3D "introspection"
+PACKAGECONFIG ?=3D "introspection ${@bb.utils.contains('TUNE_FEATURES', =
'aarch64', 'neon', '', d)}"
+
 PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
+PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


