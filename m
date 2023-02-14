Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D2EC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 05:43:32 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.454.1676353409931061546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 21:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout08.t-online.de (Postfix) with SMTP id 9C9CD13C11
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 06:43:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.220]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRo65-3BdUMT0; Tue, 14 Feb 2023 06:43:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv6] graphene: add a PACKAGECONFIG for arm_neon
Date: Tue, 14 Feb 2023 06:43:10 +0100
Message-Id: <20230214054310.4790-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676353401-432C3378-8D3E262E/0/0 CLEAN NORMAL
X-TOI-MSGID: d15677ec-afd4-48ec-b17a-09bcd4cea5f7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 05:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177121

Not all arm platforms support neon and runtime detection for this feature=
 is
currently not reliable.
Disable neon support by default on ARM-32 platforms because of the
following upstream bug: https://github.com/ebassi/graphene/issues/215

Enable neon for aarch64 by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..75c8258d99 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -10,8 +10,12 @@ inherit gnomebase gobject-introspection gtk-doc
 SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
=20
 # gtk4 & mutter 41.0 requires graphene build with introspection
-PACKAGECONFIG ?=3D "introspection"
+# Disable neon support by default on ARM-32 platforms because of the
+# following upstream bug: https://github.com/ebassi/graphene/issues/215
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


