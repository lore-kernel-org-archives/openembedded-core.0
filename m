Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C957CECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 07:51:30 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web09.3839.1663746685638829250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 00:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id 383B85003
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 09:51:23 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.145]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oauVt-3gguoL0; Wed, 21 Sep 2022 09:51:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] virglrenderer: upgrade 0.9.1 -> 0.10.3
Date: Wed, 21 Sep 2022 09:51:13 +0200
Message-Id: <20220921075113.187693-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1663746681-EE7EE7E2-F7AAD30D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8473034f-3877-49d6-80a9-c7a2b5c708b7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 07:51:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170934

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../virglrenderer/virglrenderer_0.10.3.bb     | 33 +++++++++++++++++++
 .../virglrenderer/virglrenderer_0.9.1.bb      | 25 --------------
 2 files changed, 33 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.1=
0.3.bb
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.9=
.1.bb

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb =
b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
new file mode 100644
index 0000000000..567c62b570
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "VirGL virtual OpenGL renderer"
+DESCRIPTION =3D "Virgil is a research project to investigate the possibi=
lity of \
+creating a virtual 3D GPU for use inside qemu virtual machines, that all=
ows \
+the guest operating system to use the capabilities of the host GPU to \
+accelerate 3D rendering."
+HOMEPAGE =3D "https://virgil3d.github.io/"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76d=
b10"
+
+DEPENDS =3D "libdrm libepoxy virtual/egl virtual/libgbm"
+SRCREV =3D "0922041ec6730122e0fec11404e6859e2efc4bc0"
+SRC_URI =3D "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=
=3Dmaster \
+           file://0001-meson.build-use-python3-directly-for-python.patch=
 \
+           "
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig features_check
+
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'v=
enus-experimental', '', d)}"
+
+PACKAGECONFIG[venus-experimental] =3D "-Dvenus-experimental=3Dtrue,-Dven=
us-experimental=3Dfalse,vulkan-loader vulkan-headers"
+PACKAGECONFIG[va] =3D "-Dvideo=3Dtrue,-Dvideo=3Dfalse,libva"
+PACKAGECONFIG[render-server] =3D "-Drender-server=3Dtrue,-Drender-server=
=3Dfalse"
+PACKAGECONFIG[drm-msm-experimental] =3D "-Ddrm-msm-experimental=3Dtrue,-=
Ddrm-msm-experimental=3Dfalse"
+PACKAGECONFIG[minigbm_allocation] =3D "-Dminigbm_allocation=3Dtrue,-Dmin=
igbm_allocation=3Dfalse"
+PACKAGECONFIG[venus-validate] =3D "-Dvenus-validate=3Dtrue,-Dvenus-valid=
ate=3Dfalse"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,libcheck"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b=
/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
deleted file mode 100644
index ad3688e300..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "VirGL virtual OpenGL renderer"
-DESCRIPTION =3D "Virgil is a research project to investigate the possibi=
lity of \
-creating a virtual 3D GPU for use inside qemu virtual machines, that all=
ows \
-the guest operating system to use the capabilities of the host GPU to \
-accelerate 3D rendering."
-HOMEPAGE =3D "https://virgil3d.github.io/"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76d=
b10"
-
-DEPENDS =3D "libdrm virtual/egl virtual/libgbm libepoxy"
-SRCREV =3D "363915595e05fb252e70d6514be2f0c0b5ca312b"
-SRC_URI =3D "git://anongit.freedesktop.org/git/virglrenderer;branch=3Dbr=
anch-0.9.1 \
-           file://0001-meson.build-use-python3-directly-for-python.patch=
 \
-           file://cve-2022-0135.patch \
-           file://cve-2022-0175.patch \
-           "
-
-S =3D "${WORKDIR}/git"
-
-inherit meson pkgconfig features_check
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.34.1


