Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808CFEB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 17:50:28 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.4996.1687542624525994085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 10:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout08.t-online.de (Postfix) with SMTP id 8870310923
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 19:50:22 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.164.95]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qCkvO-3GSfZZ0; Fri, 23 Jun 2023 19:50:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] python3-pygobject: disable features_check for class-native
Date: Fri, 23 Jun 2023 19:50:13 +0200
Message-Id: <20230623175013.103510-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1687542622-BE7E29BF-E720D7E7/0/0 CLEAN NORMAL
X-TOI-MSGID: 776387c3-0085-48ce-8f5f-96ec33d78976
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 17:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183351

https://git.yoctoproject.org/poky/commit/?id=3D1ee93dc114df26d94310682e6a=
632327e8bce062
mandates gobject-introspection-data DISTRO_FEATURE which is not availabe =
for native.
Thus python3-pygobject-native gets unbuildable

ERROR: Nothing PROVIDES 'python3-pygobject-native'
python3-pygobject-native was skipped: missing required distro feature 'go=
bject-introspection-data' (not in DISTRO_FEATURES)

Limit the requirement for gobject-introspection-data to class-target

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/python/python3-pygobject_3.44.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.44.1.bb
index 6f7d9a09ec..f6fb9688ca 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
@@ -10,7 +10,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase setuptools3-base gobject-introspection upstream-versio=
n-is-even features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES:class-target =3D "gobject-introspection-data"
=20
 DEPENDS +=3D "python3 glib-2.0"
=20
--=20
2.34.1


