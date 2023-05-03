Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4661C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:33:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14840.1683106419569373547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76EF62F4;
	Wed,  3 May 2023 02:34:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE9703F67D;
	Wed,  3 May 2023 02:33:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] waffle: upgrade 1.7.0 -> 1.7.2
Date: Wed,  3 May 2023 10:33:37 +0100
Message-Id: <20230503093337.2836546-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180796

Upstream now only generates CMake files on Windows, so remove all
references to CMake.

A zsh completion is now installed, remove this for now as we don't really
use zsh.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...build-request-native-wayland-scanner.patch |  9 ++++----
 ...-make-core-protocol-into-the-library.patch | 23 ++++---------------
 .../{waffle_1.7.0.bb =3D> waffle_1.7.2.bb}      |  8 +++----
 3 files changed, 13 insertions(+), 27 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.7.0.bb =3D> waffle_1.7.2.b=
b} (92%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request=
-native-wayland-scanner.patch b/meta/recipes-graphics/waffle/waffle/0001-=
meson.build-request-native-wayland-scanner.patch
index 1b62db92e9f..4b3a0e7c4a9 100644
--- a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native=
-wayland-scanner.patch
+++ b/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native=
-wayland-scanner.patch
@@ -1,4 +1,4 @@
-From 2195cec1e5bc66128d72049c11ff381ca4516a4b Mon Sep 17 00:00:00 2001
+From 0961787d2bf0d359a3ead89e9cec642818b32dea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 5 Jul 2022 11:51:39 +0200
 Subject: [PATCH] meson.build: request native wayland-scanner
@@ -8,15 +8,16 @@ try to use a cross-binary, and fail.
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/waffle/-=
/merge_requests/110]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 0bb6128..0b6da1f 100644
+index ca6a212..3177bde 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -108,7 +108,7 @@ else
+@@ -110,7 +110,7 @@ else
      'wayland-egl', version : '>=3D 9.1', required : get_option('wayland=
'),
    )
    dep_wayland_scanner =3D dependency(
@@ -24,4 +25,4 @@ index 0bb6128..0b6da1f 100644
 +    'wayland-scanner', version : '>=3D 1.15', required : get_option('wa=
yland'), native: true,
    )
    if dep_wayland_scanner.found()
-     prog_wayland_scanner =3D find_program(dep_wayland_scanner.get_pkgco=
nfig_variable('wayland_scanner'))
+     prog_wayland_scanner =3D find_program(dep_wayland_scanner.get_varia=
ble(pkgconfig: 'wayland_scanner'))
diff --git a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-=
core-protocol-into-the-library.patch b/meta/recipes-graphics/waffle/waffl=
e/0001-waffle-do-not-make-core-protocol-into-the-library.patch
index 24b2de5d9c2..60e6318f7a4 100644
--- a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-pr=
otocol-into-the-library.patch
+++ b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-pr=
otocol-into-the-library.patch
@@ -1,4 +1,4 @@
-From 7610ec4b572d3a54d30fca6798f0c406f3fd8a46 Mon Sep 17 00:00:00 2001
+From 71f9399d6cea1e2e885a98b98d82eb628832a86e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 26 Oct 2021 08:52:17 +0200
 Subject: [PATCH] waffle: do not make core protocol into the library
@@ -9,28 +9,13 @@ wayland.xml from the host.
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
- meson.build            | 4 ----
  src/waffle/meson.build | 7 -------
- 2 files changed, 11 deletions(-)
+ 1 file changed, 7 deletions(-)
=20
-diff --git a/meson.build b/meson.build
-index ffc02ff..0bb6128 100644
---- a/meson.build
-+++ b/meson.build
-@@ -104,10 +104,6 @@ else
-   dep_wayland_client =3D dependency(
-     'wayland-client', version : '>=3D 1.10', required : get_option('way=
land'),
-   )
--  if dep_wayland_client.found()
--    wayland_core_xml =3D join_paths(dep_wayland_client.get_pkgconfig_va=
riable('pkgdatadir'),
--    'wayland.xml')
--  endif
-   dep_wayland_egl =3D dependency(
-     'wayland-egl', version : '>=3D 9.1', required : get_option('wayland=
'),
-   )
 diff --git a/src/waffle/meson.build b/src/waffle/meson.build
-index 01898c8..6245868 100644
+index e2636c7..3ff5762 100644
 --- a/src/waffle/meson.build
 +++ b/src/waffle/meson.build
 @@ -88,12 +88,6 @@ if build_surfaceless
diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-=
graphics/waffle/waffle_1.7.2.bb
similarity index 92%
rename from meta/recipes-graphics/waffle/waffle_1.7.0.bb
rename to meta/recipes-graphics/waffle/waffle_1.7.2.bb
index dc475908d00..cb917d88943 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
@@ -9,16 +9,16 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4c5154407c2490750dd461c50=
ad94797 \
                     file://include/waffle-1/waffle.h;endline=3D24;md5=3D=
61dbf8697f61c78645e75a93c585b1bf"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=3Dhtt=
ps;branch=3Dmaster \
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=3Dhtt=
ps;branch=3Dmaint-1.7 \
            file://0001-waffle-do-not-make-core-protocol-into-the-library=
.patch \
            file://0001-meson.build-request-native-wayland-scanner.patch =
\
            "
-SRCREV =3D "905c6c10f2483adf0cbfa024e2d3c2ed541fb300"
+SRCREV =3D "f3b42a7216105498842bc6ba77d8481b90d6f5f9"
 S =3D "${WORKDIR}/git"
=20
 inherit meson features_check lib_package bash-completion pkgconfig
=20
-DEPENDS:append =3D " python3 cmake-native"
+DEPENDS:append =3D " python3"
=20
 # This should be overridden per-machine to reflect the capabilities of t=
he GL
 # stack.
@@ -47,5 +47,5 @@ PACKAGECONFIG[surfaceless-egl] =3D "-Dsurfaceless_egl=3D=
enabled,-Dsurfaceless_egl=3Ddi
 # TODO: optionally build manpages and examples
=20
 do_install:append() {
-    sed -i -e "s,${WORKDIR},,g" ${D}/${libdir}/cmake/Waffle/WaffleConfig=
.cmake
+    rm -rf ${D}${datadir}/zsh
 }
--=20
2.34.1


