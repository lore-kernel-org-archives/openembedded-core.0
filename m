Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3142C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 17:35:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.16508.1638984903567749526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 09:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9CF81042
	for <openembedded-core@lists.openembedded.org>;
 Wed,  8 Dec 2021 09:34:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 845F43F73D
	for <openembedded-core@lists.openembedded.org>;
 Wed,  8 Dec 2021 09:34:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-bad: clean up X11 dependencies
Date: Wed,  8 Dec 2021 17:34:54 +0000
Message-Id: <20211208173454.3839798-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 17:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159363

libxcb and xkbcommon are only needed in builds with X11 enabled, so add
a PACKAGECONFIG and respect the x11 DISTRO_FEATURE.

Strictly speaking these are only required if Vulkan and X11 are enabled,
but it's possible that more plugins will respect the flag.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.1=
8.5.bb
index b189eab63d6..d624c481b66 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
@@ -25,7 +25,7 @@ inherit gobject-introspection
 PACKAGECONFIG ??=3D " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)=
} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
@@ -87,12 +87,13 @@ PACKAGECONFIG[v4l2codecs]      =3D "-Dv4l2codecs=3Den=
abled,-Dv4l2codecs=3Ddisabled,lib
 PACKAGECONFIG[va]              =3D "-Dva=3Denabled,-Dva=3Ddisabled,libva=
"
 PACKAGECONFIG[voaacenc]        =3D "-Dvoaacenc=3Denabled,-Dvoaacenc=3Ddi=
sabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      =3D "-Dvoamrwbenc=3Denabled,-Dvoamrwbenc=3D=
disabled,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabl=
ed,vulkan-loader shaderc-native libxkbcommon"
+PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabl=
ed,vulkan-loader shaderc-native"
 PACKAGECONFIG[wayland]         =3D "-Dwayland=3Denabled,-Dwayland=3Ddisa=
bled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,l=
ibwebp"
 PACKAGECONFIG[webrtc]          =3D "-Dwebrtc=3Denabled,-Dwebrtc=3Ddisabl=
ed,libnice"
 PACKAGECONFIG[webrtcdsp]       =3D "-Dwebrtcdsp=3Denabled,-Dwebrtcdsp=3D=
disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            =3D "-Dzbar=3Denabled,-Dzbar=3Ddisabled,z=
bar"
+PACKAGECONFIG[x11]             =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,lib=
xcb libxkbcommon"
 PACKAGECONFIG[x265]            =3D "-Dx265=3Denabled,-Dx265=3Ddisabled,x=
265"
=20
 EXTRA_OEMESON +=3D " \
--=20
2.25.1


