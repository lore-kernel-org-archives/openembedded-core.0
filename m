Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B7FC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 15:13:45 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web08.8393.1643123624890025807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout09.t-online.de (Postfix) with SMTP id 275B2B972
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 16:13:42 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.159]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCNVs-3Ed6NF0; Tue, 25 Jan 2022 16:13:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3] libical: build gobject and vala introspection
Date: Tue, 25 Jan 2022 16:13:30 +0100
Message-Id: <20220125151330.68283-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643123620-00004E7B-650441AD/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ee1e0bc-c955-4958-a6d3-8d82e62f3127
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 15:13:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160941

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/libical/libical_3.0.12.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libical/libical_3.0.12.bb b/meta/recipe=
s-support/libical/libical_3.0.12.bb
index b2b2211b9b..832d244672 100644
--- a/meta/recipes-support/libical/libical_3.0.12.bb
+++ b/meta/recipes-support/libical/libical_3.0.12.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/=
download/v${PV}/${BP}.tar.g
 SRC_URI[sha256sum] =3D "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e=
9f8856cee6d35830"
 UPSTREAM_CHECK_URI =3D "https://github.com/libical/libical/releases"
=20
-inherit cmake pkgconfig
+inherit cmake pkgconfig gobject-introspection vala
=20
 DEPENDS +=3D "libical-native"
=20
@@ -32,6 +32,11 @@ EXTRA_OECMAKE +=3D "-DPERL_EXECUTABLE=3D${HOSTTOOLS_DI=
R}/perl"
 EXTRA_OECMAKE +=3D "-DLIBICAL_BUILD_TESTING=3Dfalse"
 # doc build fails with linker error (??) for libical-glib so disable it
 EXTRA_OECMAKE +=3D "-DICAL_BUILD_DOCS=3Dfalse"
+# gobject-introspection
+EXTRA_OECMAKE:append:class-target =3D " -DGObjectIntrospection_COMPILER=3D=
${STAGING_BINDIR}/g-ir-compiler-wrapper"
+EXTRA_OECMAKE:append:class-target =3D " -DGObjectIntrospection_SCANNER=3D=
${STAGING_BINDIR}/g-ir-scanner-wrapper"
+EXTRA_OECMAKE +=3D "-DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen"
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DG=
OBJECT_INTROSPECTION=3DON -DICAL_GLIB_VAPI=3DON', '-DGOBJECT_INTROSPECTIO=
N=3DOFF', d)}"
=20
 # Tell the cross-libical where the tool it needs to build is
 EXTRA_OECMAKE:append:class-target =3D " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=
=3D${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
--=20
2.25.1


