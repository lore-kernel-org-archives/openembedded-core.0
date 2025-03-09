Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747D7C282D1
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 06:55:58 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.11386.1741503353742692448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Mar 2025 22:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id EB634A3F
	for <openembedded-core@lists.openembedded.org>; Sun,  9 Mar 2025 07:55:45 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.73]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1trAZb-1vgOlV0; Sun, 9 Mar 2025 07:55:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libsdl2: fix build with pipewire 1.4.0
Date: Sun,  9 Mar 2025 07:56:27 +0100
Message-ID: <20250309065627.154824-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741503343-C67FB9FB-1EC3C3A3/10/3626336762 SUSPECT URL
X-TOI-MSGID: fa54ac0b-377c-4d75-9de5-32f9a69eb827
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 06:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212476

This commit adds a backport patch to address a build issue with pipewire =
1.4.0

| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libsdl2/2.32.2/SDL2-=
2.32.2/src/audio/pipewire/SDL_pipewire.c:593:37: error: passing argument =
1 of 'pw_node_enum_params' from incompatible pointer type [-Wincompatible=
-pointer-types]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...9fe9c7931738ed63d257b1d7fb8a07b66824.patch | 35 +++++++++++++++++++
 .../libsdl2/libsdl2_2.32.2.bb                 |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c793173=
8ed63d257b1d7fb8a07b66824.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c7931738ed63d2=
57b1d7fb8a07b66824.patch b/meta/recipes-graphics/libsdl2/libsdl2/9e079fe9=
c7931738ed63d257b1d7fb8a07b66824.patch
new file mode 100644
index 0000000000..f8c0598130
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/9e079fe9c7931738ed63d257b1d7f=
b8a07b66824.patch
@@ -0,0 +1,35 @@
+From 9e079fe9c7931738ed63d257b1d7fb8a07b66824 Mon Sep 17 00:00:00 2001
+From: Neal Gompa <neal@gompa.dev>
+Date: Mon, 10 Feb 2025 05:00:56 -0500
+Subject: [PATCH] pipewire: Ensure that the correct struct is used for
+ enumeration APIs
+
+PipeWire now requires the correct struct type is used, otherwise
+it will fail to compile.
+
+Reference: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/188=
d920733f0791413d3386e5536ee7377f71b2f
+
+Fixes: https://github.com/libsdl-org/SDL/issues/12224
+(cherry picked from commit d35bef64e913dd7d5dd3153a4b61f10ef837dad6)
+(cherry picked from commit 6be87ceb33a9aad3bf5204bb13b3a5e8b498fd26)
+
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/9e07=
9fe9c7931738ed63d257b1d7fb8a07b66824]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/audio/pipewire/SDL_pipewire.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/audio/pipewire/SDL_pipewire.c b/src/audio/pipewire/SDL_=
pipewire.c
+index 889e05decb293..5d1bfc28dedb7 100644
+--- a/src/audio/pipewire/SDL_pipewire.c
++++ b/src/audio/pipewire/SDL_pipewire.c
+@@ -590,7 +590,7 @@ static void node_event_info(void *object, const stru=
ct pw_node_info *info)
+=20
+         /* Need to parse the parameters to get the sample rate */
+         for (i =3D 0; i < info->n_params; ++i) {
+-            pw_node_enum_params(node->proxy, 0, info->params[i].id, 0, =
0, NULL);
++            pw_node_enum_params((struct pw_node*)node->proxy, 0, info->=
params[i].id, 0, 0, NULL);
+         }
+=20
+         hotplug_core_sync(node);
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.32.2.bb
index 2b28b3dfa9..d075b335f5 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
@@ -22,6 +22,7 @@ LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PAC=
KAGECONFIG', 'arm-neon', 'f
 PROVIDES =3D "virtual/libsdl2"
=20
 SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
+SRC_URI +=3D "file://9e079fe9c7931738ed63d257b1d7fb8a07b66824.patch"
=20
 S =3D "${WORKDIR}/SDL2-${PV}"
=20
--=20
2.48.1


