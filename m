Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6806C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 14:23:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.447.1701440607406687938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 06:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id E109A40D27
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Dec 2023 15:22:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.79]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r94Pp-33ZqUr0; Fri, 1 Dec 2023 15:22:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: upgrade 23.2.1 -> 23.3.0
Date: Fri,  1 Dec 2023 15:23:09 +0100
Message-ID: <20231201142309.339816-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701440569-5CF5D979-DB713A08/0/0 CLEAN NORMAL
X-TOI-MSGID: 02ef24ff-22d1-48bc-b8a4-9c5054cd7ffd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 14:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191670

- build amd vulkan driver for x86 platforms
- drop included patch
[https://gitlab.freedesktop.org/mesa/mesa/-/blob/1fbdd37d4c1133ced5eb9812=
daa1fff04cbf5daa/meson.build#L1711]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-cmake-dependency-detector-for-llvm.patch | 42 -------------------
 .../{mesa-gl_23.2.1.bb =3D> mesa-gl_23.3.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  7 ++--
 .../mesa/{mesa_23.2.1.bb =3D> mesa_23.3.0.bb}   |  0
 4 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-c=
make-dependency-detector-for-llvm.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_23.2.1.bb =3D> mesa-gl_23.3.0=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.2.1.bb =3D> mesa_23.3.0.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-de=
pendency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-=
meson-Disable-cmake-dependency-detector-for-llvm.patch
deleted file mode 100644
index 4cded0546d..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependenc=
y-detector-for-llvm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Sep 2023 15:34:22 -0700
-Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking =
errors with meson 1.2.1
-
-meson dependency auto dependency detection uses cmake and then
-config-tool to process dependencies, in mesa the logic to detect llvm is
-using auto detection which means if it finds cmake then it will try to
-use cmake method. Cmake method works ok except a case when llvm-dev
-package is installed on the build host then it generates its own
-native.meson file and ignores OE supplied meson.native file which has
-correct llvm-config tool specified which is pointing to llvm-config from
-native sysroot. The generated meson.native file points to one found in
-/usr/bin and there onwards detector finds native install of llvm and
-configures that into building native mesa package.
-
-Since cmake detector does not always work, disable it by default and use
-config-tool which works in all cases. This is suggested in below issues
-too
-
-A similar issue is open in meson upstream [1] and mesa [2]
-
-[1] https://github.com/mesonbuild/meson/issues/10483
-[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/25438]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/meson.build
-+++ b/meson.build
-@@ -1659,6 +1659,7 @@ with_llvm =3D false
- if _llvm.allowed()
-   dep_llvm =3D dependency(
-     'llvm',
-+    method : host_machine.system() =3D=3D 'windows' ? 'auto' : 'config-=
tool',
-     version : _llvm_version,
-     modules : llvm_modules,
-     optional_modules : llvm_optional_modules,
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb b/meta/recipes-=
graphics/mesa/mesa-gl_23.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index e5c405a972..b3df71cb60 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,9 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
-           file://0001-meson-Disable-cmake-dependency-detector-for-llvm.=
patch \
 "
=20
-SRC_URI[sha256sum] =3D "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8=
a259b20df8bbc1cc"
+SRC_URI[sha256sum] =3D "50f729dd60ed6335b989095baad81ef5edf7cfdd4b4b48b9=
b955917cb07d69c5"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -105,8 +104,8 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Dd=
isabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >=3D =
3.9
 VULKAN_DRIVERS =3D ""
-VULKAN_DRIVERS:append:x86 =3D ",intel"
-VULKAN_DRIVERS:append:x86-64 =3D ",intel"
+VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
+VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
 # i686 is a 32 bit override for mesa-native
 VULKAN_DRIVERS:append:i686 =3D ",intel"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ',freedreno', '', d)}"
diff --git a/meta/recipes-graphics/mesa/mesa_23.2.1.bb b/meta/recipes-gra=
phics/mesa/mesa_23.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.2.1.bb
rename to meta/recipes-graphics/mesa/mesa_23.3.0.bb
--=20
2.42.1


