Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A21C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 23:41:52 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web09.4574.1642722110724480184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 15:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 3D1C81555E
	for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 00:41:49 +0100 (CET)
Received: from localhost.localdomain ([84.163.38.111]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAh3r-23eohW0; Fri, 21 Jan 2022 00:41:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [OE-core][PATCH 2/2] libical: build gobject and vala introspection
Date: Fri, 21 Jan 2022 00:41:29 +0100
Message-Id: <20220120234129.4160546-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120234129.4160546-1-f_l_k@t-online.de>
References: <20220120234129.4160546-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642722107-00010BFA-3B4BA133/0/0 CLEAN NORMAL
X-TOI-MSGID: a0bbfb09-0eb3-41d3-882f-07d8ae79d8a3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 23:41:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160805

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/libical/libical_3.0.12.bb | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libical/libical_3.0.12.bb b/meta/recipe=
s-support/libical/libical_3.0.12.bb
index b2b2211b9b..fef569ea64 100644
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
@@ -32,10 +32,26 @@ EXTRA_OECMAKE +=3D "-DPERL_EXECUTABLE=3D${HOSTTOOLS_D=
IR}/perl"
 EXTRA_OECMAKE +=3D "-DLIBICAL_BUILD_TESTING=3Dfalse"
 # doc build fails with linker error (??) for libical-glib so disable it
 EXTRA_OECMAKE +=3D "-DICAL_BUILD_DOCS=3Dfalse"
+EXTRA_OECMAKE +=3D "-DGOBJECT_INTROSPECTION=3DON"
+EXTRA_OECMAKE +=3D "-DICAL_GLIB_VAPI=3DON"
=20
 # Tell the cross-libical where the tool it needs to build is
 EXTRA_OECMAKE:append:class-target =3D " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=
=3D${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
=20
+do_configure:append () {
+    # fix abs path for g-ir-scanner-wrapper
+    sed  -i ${B}/build.ninja \
+        -e 's: ${bindir}/g-ir-scanner-wrapper: ${STAGING_BINDIR}/g-ir-sc=
anner-wrapper:g'
+
+    # fix abs path for g-ir-compiler-wrapper
+    sed  -i ${B}/build.ninja \
+        -e 's: ${bindir}/g-ir-compiler-wrapper: ${STAGING_BINDIR}/g-ir-c=
ompiler-wrapper:g'
+
+    # fix abs path for vapigen
+    sed  -i ${B}/build.ninja \
+        -e 's: ${STAGING_BINDIR}/vapigen: ${STAGING_BINDIR_NATIVE}/vapig=
en:g'
+}
+
 do_install:append () {
     # Remove build host references (https://github.com/libical/libical/i=
ssues/532)
     sed -i \
--=20
2.25.1


