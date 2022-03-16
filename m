Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E025FC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 17:07:26 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web12.105.1647450445697761819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 5138E11007
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:07:24 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.155]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUX7K-0vpDec0; Wed, 16 Mar 2022 18:07:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/4] mesa: align target- and native build
Date: Wed, 16 Mar 2022 18:07:07 +0100
Message-Id: <20220316170709.2924162-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316170709.2924162-1-f_l_k@t-online.de>
References: <20220316170709.2924162-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647450442-0000C4DD-40E4637E/0/0 CLEAN NORMAL
X-TOI-MSGID: 14d8eba3-4e74-4369-89d3-89ccd902e1e9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 17:07:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163343

---
 meta/recipes-graphics/mesa/mesa.inc | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 2a89b8e8f0..116a9ed861 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -82,16 +82,14 @@ EXTRA_OEMESON =3D " \
 def strip_comma(s):
     return s.strip(',')
=20
-PACKAGECONFIG:class-target ??=3D "${@bb.utils.filter('DISTRO_FEATURES', =
'wayland vulkan', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl egl gles gbm gallium virgl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'x11 dri3', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',=
 'dri3', '', d)} \
-                   elf-tls \
-		   "
-PACKAGECONFIG:class-native ?=3D "gbm gallium egl opengl elf-tls x11"
-PACKAGECONFIG:class-nativesdk ?=3D "gbm gallium egl opengl elf-tls x11"
-
-PACKAGECONFIG:remove:libc-musl =3D "elf-tls"
+PACKAGECONFIG =3D " \
+	gallium \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm =
virgl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
+	${@bb.utils.contains('TCLIBC', 'glibc', 'elf-tls', '', d)} \
+"
=20
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
--=20
2.25.1


