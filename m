Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A395DC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 08:26:33 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.5843.1676103987744991272
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 00:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id B39D19939;
	Sat, 11 Feb 2023 09:26:25 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.42.158]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pQlD8-3BYXTt0; Sat, 11 Feb 2023 09:26:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe-core][PATCH] graphene: disable neon support on arm 32bits
Date: Sat, 11 Feb 2023 09:26:09 +0100
Message-Id: <20230211082609.6471-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676103978-D5F1C046-8CBCFB66/0/0 CLEAN NORMAL
X-TOI-MSGID: 6dd0fa38-05b2-4d61-9835-9ce9f7029609
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 08:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177000

From: Pablo Saavedra <psaavedra@igalia.com>

This disables neon support on arm devices only because it crashes otherwi=
se.

Upstream-status: Reported [https://github.com/ebassi/graphene/issues/215]
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..1bbe7ecca1 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -17,6 +17,9 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
=20
+# Disable ARM NEON support
+EXTRA_OEMESON:append:arm =3D " -Darm_neon=3Dfalse"
+
 FILES:${PN} +=3D "${libdir}/graphene-1.0"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


