Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C57AC48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 18:14:53 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.49937.1707934490927572033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 10:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id E3D0DFEC
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 19:14:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1raJmP-0p8owz0; Wed, 14 Feb 2024 19:14:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: update 23.3.5 -> 24.0.0
Date: Wed, 14 Feb 2024 19:14:53 +0100
Message-ID: <20240214181453.795654-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1707934485-D8F62DC7-EF68BC53/0/0 CLEAN NORMAL
X-TOI-MSGID: fe3296ab-5cf4-4f69-aa63-4b959168b156
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 18:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195492

- refresh 0001-meson.build-check-for-all-linux-host_os-combinations.patch
- rework VIDEO_CODECS. mesa now provides options for 'all' and 'all_free'
  Adjust accordingly.
  Free codecs are built by default:
    Codecs                       : av1dec av1enc vp9dec
  If LICENSE_FLAGS_ACCEPTED contains 'commercial' all supported codecs ar=
e built:
    Codecs                       : vc1dec h264dec h264enc h265dec h265enc
                                   av1dec av1enc vp9dec

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ld-check-for-all-linux-host_os-combinations.patch | 12 ++++++------
 .../mesa/{mesa-gl_23.3.5.bb =3D> mesa-gl_24.0.0.bb}    |  0
 meta/recipes-graphics/mesa/mesa.inc                  |  8 ++++----
 .../mesa/{mesa_23.3.5.bb =3D> mesa_24.0.0.bb}          |  0
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.3.5.bb =3D> mesa-gl_24.0.0=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.3.5.bb =3D> mesa_24.0.0.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0=
001-meson.build-check-for-all-linux-host_os-combinations.patch
index fadd6ee201..b0be8d0feb 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
@@ -23,21 +23,21 @@ diff --git a/meson.build b/meson.build
 index 35cc5f1..9a49c0d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -121,7 +121,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
+@@ -128,7 +128,7 @@
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi =3D with_shared_glapi and with_any_opengl
 =20
--system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
)
-+system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
) or host_machine.system().startswith('linux')
+-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_mach=
ine.system())
++system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_mach=
ine.system()) or host_machine.system().startswith('linux')
 =20
  gallium_drivers =3D get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-@@ -956,7 +956,7 @@ if cc.has_function('fmemopen')
+@@ -998,7 +998,7 @@
  endif
 =20
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid'].contains(host_machine.system())
-+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system()) or host_machine.system().startswith('linux')
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid', 'managarm'].contains(host_machine.system())
++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid', 'managarm'].contains(host_machine.system()) or host_machine.system(=
).startswith('linux')
    pre_args +=3D '-D_GNU_SOURCE'
  elif host_machine.system() =3D=3D 'sunos'
    pre_args +=3D '-D__EXTENSIONS__'
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.3.5.bb b/meta/recipes-=
graphics/mesa/mesa-gl_24.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.3.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 3a7b91f637..fabc52f0e7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
 "
=20
-SRC_URI[sha256sum] =3D "69ccb1278641ff5bad71ca0f866188aeb1a92aadc4dbb9d3=
5f50aebec5b8b50f"
+SRC_URI[sha256sum] =3D "dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56=
fb07be2b8c304c36"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -81,12 +81,12 @@ def strip_comma(s):
=20
 PACKAGECONFIG =3D " \
 	gallium \
+	video-codecs \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm =
virgl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
-	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'video-cod=
ecs', '', d)} \
 "
=20
 PACKAGECONFIG:append:class-native =3D "gallium-llvm r600"
@@ -203,8 +203,8 @@ PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dli=
bunwind=3Ddisabled,libunwind"
=20
 PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabl=
ed,lmsensors"
=20
-VIDEO_CODECS =3D "vc1dec,h264dec,h264enc,h265dec,h265enc"
-PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${@strip_comma('${VIDE=
O_CODECS}')}, -Dvideo-codecs=3D''"
+VIDEO_CODECS ?=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'comme=
rcial', 'all', 'all_free', d)}"
+PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODECS}, -Dvid=
eo-codecs=3D''"
=20
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
diff --git a/meta/recipes-graphics/mesa/mesa_23.3.5.bb b/meta/recipes-gra=
phics/mesa/mesa_24.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.3.5.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.0.bb
--=20
2.43.0


