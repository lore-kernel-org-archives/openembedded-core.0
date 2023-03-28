Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91083C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:32:45 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.62742.1679999554883509700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id DC3E61C45E
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:32:32 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.166]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph6cy-17U9EU0; Tue, 28 Mar 2023 12:32:32 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv5 6/8] webkitgtk: update 2.38.5 -> 2.40.0
Date: Tue, 28 Mar 2023 12:31:42 +0200
Message-Id: <20230328103144.5757-6-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328103144.5757-1-f_L_K@t-online.de>
References: <20230328103144.5757-1-f_L_K@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679999552-8556AC08-3BB696E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ab21cb5-d141-4890-8f3c-fcce6b686d02
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179222

From: Markus Volk <f_l_k@t-online.de>

- added PACKAGECONFIGs for av1 support, gamepad and sandboxing
- cmake tries to find where bwrap and xdg-dbus-proxy are located on targe=
t and reads the path from
  ${STAGING_BINDIR_NATIVE}. This breaks reproducibility and runtime. Fix =
by adding the needed paths manually.
- ccache seems to be working well now. Enable by default. It significantl=
y improves buildtime on rebuilds.
- webkitgtk can be built with both, gtk+3 and gtk4 but it cant be built w=
ith support for both at once.
  there are still some packages that require the gtk3 variant, nameably s=
urf, gnome-online-accounts and wxwidgets
  while ephiphany for example has a hard dependency on webkitgtk built wi=
th gtk4. This is why we need to provide
  recipes for both variants. If built with gtk+3 webkitgtk provides the 4=
.0 api, if built with gtk4 it'll provide the
  6.0 api. The only conflicting file between those two is the WebKitWebDr=
iver binary. This was renamed for the gtk3
  variant so both variants can be installed into the same image.
- update dependencies
- wpebackend-fdo: update
- add fixes that have been sent by kai.kang@eng.windriver.com
- add fix for riscv64 that has been sent by raj.khem@gmail.com

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 ...spection.cmake-prefix-variables-obta.patch |   0
 ...ibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch |  34 ++++
 ...44e17d258106617b0e6d783d073b188a2548.patch |  32 +++-
 .../webkit/files/disable_wasm_riscv64.patch   |  24 +++
 .../reproducibility.patch                     |   0
 .../recipes-sato/webkit/webkitgtk-3_2.40.0.bb | 173 ++++++++++++++++++
 ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 ---
 ...ebkitgtk_2.38.5.bb =3D> webkitgtk_2.40.0.bb} |  78 ++++----
 ...fdo_1.14.0.bb =3D> wpebackend-fdo_1.14.1.bb} |   2 +-
 10 files changed, 296 insertions(+), 78 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk =3D> files}/0001-FindGObjectI=
ntrospection.cmake-prefix-variables-obta.patch (100%)
 create mode 100644 meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cma=
ke-check-PC_GCRYPT_FOUND.patch
 rename meta/recipes-sato/webkit/{webkitgtk =3D> files}/0d3344e17d2581066=
17b0e6d783d073b188a2548.patch (87%)
 create mode 100644 meta/recipes-sato/webkit/files/disable_wasm_riscv64.p=
atch
 rename meta/recipes-sato/webkit/{webkitgtk =3D> files}/reproducibility.p=
atch (100%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b9045=
3bc4e100dcf967243ecd98.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2.40=
.0.bb} (71%)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb =3D> wpebacken=
d-fdo_1.14.1.bb} (90%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 682ec2cfdf..2ad209ad0e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -826,6 +826,7 @@ RECIPE_MAINTAINER:pn-wayland =3D "Denys Dmytriyenko <=
denis@denix.org>"
 RECIPE_MAINTAINER:pn-wayland-protocols =3D "Denys Dmytriyenko <denis@den=
ix.org>"
 RECIPE_MAINTAINER:pn-wayland-utils =3D "Denys Dmytriyenko <denis@denix.o=
rg>"
 RECIPE_MAINTAINER:pn-webkitgtk =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
+RECIPE_MAINTAINER:pn-webkitgtk-3 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-weston =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-weston-init =3D "Denys Dmytriyenko <denis@denix.org=
>"
 RECIPE_MAINTAINER:pn-wget =3D "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospec=
tion.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/files/0=
001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
similarity index 100%
rename from meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospect=
ion.cmake-prefix-variables-obta.patch
rename to meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cm=
ake-prefix-variables-obta.patch
diff --git a/meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cmake-chec=
k-PC_GCRYPT_FOUND.patch b/meta/recipes-sato/webkit/files/0001-FindLibGcry=
pt.cmake-check-PC_GCRYPT_FOUND.patch
new file mode 100644
index 0000000000..dc56bbb92c
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cmake-check-PC_GC=
RYPT_FOUND.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/11913]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From de30f1a1caf81902d254e046e382f9cf9cd62c58 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 24 Mar 2023 17:58:29 +0800
+Subject: [PATCH] FindLibGcrypt.cmake: check PC_GCRYPT_FOUND
+
+After `pkg_check_modules(PC_GCRYPT QUIET libgcrypt)` in
+FindLibGcrypt.cmake, PC_GCRYPT_FOUND will be set but PC_GCRYPT is kept
+empty. So check PC_GCRYPT_FOUND instead.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Source/cmake/FindLibGcrypt.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/cmake/FindLibGcrypt.cmake b/Source/cmake/FindLibGcry=
pt.cmake
+index 8bee72963902..2e84cfc4e9b1 100644
+--- a/Source/cmake/FindLibGcrypt.cmake
++++ b/Source/cmake/FindLibGcrypt.cmake
+@@ -49,7 +49,7 @@ if (PkgConfig_FOUND)
+     set(LibGcrypt_VERSION ${PC_GCRYPT_VERSION})
+ endif ()
+=20
+-if (LIBGCRYPTCONFIG_SCRIPT AND NOT PC_GCRYPT)
++if (LIBGCRYPTCONFIG_SCRIPT AND NOT PC_GCRYPT_FOUND)
+     execute_process(
+         COMMAND "${LIBGCRYPTCONFIG_SCRIPT}" --prefix
+         RESULT_VARIABLE CONFIGSCRIPT_RESULT
+--=20
+2.34.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d7=
83d073b188a2548.patch b/meta/recipes-sato/webkit/files/0d3344e17d25810661=
7b0e6d783d073b188a2548.patch
similarity index 87%
rename from meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d78=
3d073b188a2548.patch
rename to meta/recipes-sato/webkit/files/0d3344e17d258106617b0e6d783d073b=
188a2548.patch
index 32f92f7ff5..d47e7ac419 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b=
188a2548.patch
+++ b/meta/recipes-sato/webkit/files/0d3344e17d258106617b0e6d783d073b188a=
2548.patch
@@ -35,14 +35,16 @@ Upstream-Status: Submitted [https://github.com/WebKit=
/WebKit/pull/1233]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
- .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
  .../graphics/filters/DistantLightSource.h     |  4 ++
  .../platform/graphics/filters/FELighting.h    |  7 ---
  .../graphics/filters/PointLightSource.h       |  4 ++
  .../graphics/filters/SpotLightSource.h        |  4 ++
  .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 7 files changed, 57 insertions(+), 36 deletions(-)
+ 7 files changed, 56 insertions(+), 35 deletions(-)
=20
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEO=
N.cpp
+index f6ff8c20..42a97ffc 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
 @@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
@@ -63,6 +65,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
      // Calling a powf function from the assembly code would require to =
save
      // and reload a lot of NEON registers. Since the base is in range [=
0..1]
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
h
+index b17c603d..e4629cda 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 @@ -24,14 +24,15 @@
@@ -104,7 +108,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          0,
          0,
          0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
+@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
      // Set light source arguments.
      floatArguments.constOne =3D 1;
 =20
@@ -133,7 +137,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          floatArguments.lightX =3D spotLightSource.position().x();
          floatArguments.lightY =3D spotLightSource.position().y();
          floatArguments.lightZ =3D spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
+@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
          if (spotLightSource.specularExponent() =3D=3D 1)
              neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
      } else {
@@ -142,7 +146,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          floatArguments.lightX =3D paintingData.initialLightingData.ligh=
tVector.x();
          floatArguments.lightY =3D paintingData.initialLightingData.ligh=
tVector.y();
          floatArguments.lightZ =3D paintingData.initialLightingData.ligh=
tVector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
+@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
      // Set lighting arguments.
      floatArguments.surfaceScale =3D data.surfaceScale;
      floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScal=
e / 4;
@@ -192,16 +196,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
              }
              parallelJobs.execute();
              return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
+@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
  } // namespace WebCore
 =20
  #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
 -
 -#endif // FELightingNEON_h
+diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource=
.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+index 70c6512f..b032c82e 100644
 --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -25,6 +25,10 @@
- #include "LightSource.h"
+@@ -26,6 +26,10 @@
+ #include <wtf/ArgumentCoder.h>
  #include <wtf/Ref.h>
 =20
 +namespace WTF {
@@ -211,6 +217,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  namespace WebCore {
 =20
  class DistantLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Sou=
rce/WebCore/platform/graphics/filters/FELighting.h
+index 53beb596..e78a9354 100644
 --- a/Source/WebCore/platform/graphics/filters/FELighting.h
 +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
 @@ -35,8 +35,6 @@
@@ -222,7 +230,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  class FELighting : public FilterEffect {
  public:
      const Color& lightingColor() const { return m_lightingColor; }
-@@ -67,11 +65,6 @@ protected:
+@@ -64,11 +62,6 @@ protected:
 =20
      std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override;
 =20
@@ -234,6 +242,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Color m_lightingColor;
      float m_surfaceScale;
      float m_diffuseConstant;
+diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h=
 b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+index 3a5723f0..675d63f5 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
@@ -247,6 +257,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  namespace WebCore {
 =20
  class PointLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h =
b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+index 684626f7..dea58389 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
@@ -260,6 +272,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  namespace WebCore {
 =20
  class SpotLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/software/FELightin=
gSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FE=
LightingSoftwareApplier.h
+index c974d921..e2896660 100644
 --- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
 +++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
 @@ -36,6 +36,7 @@
diff --git a/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch b/=
meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
new file mode 100644
index 0000000000..eac942fddc
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
@@ -0,0 +1,24 @@
+Provide a way to override enabling wasm from CMake
+by setting -DENABLE_WEBASSEMBLY=3DOFF for RISCV64
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=3D25=
4553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/WTF/wtf/PlatformEnable.h
++++ b/Source/WTF/wtf/PlatformEnable.h
+@@ -613,13 +613,14 @@
+ #endif
+=20
+ #if CPU(RISCV64)
+-#undef ENABLE_WEBASSEMBLY
++#if !defined(ENABLE_WEBASSEMBLY)
+ #define ENABLE_WEBASSEMBLY 1
+ #undef ENABLE_WEBASSEMBLY_B3JIT
+ #define ENABLE_WEBASSEMBLY_B3JIT 0
+ #undef ENABLE_WEBASSEMBLY_BBQJIT
+ #define ENABLE_WEBASSEMBLY_BBQJIT 0
+ #endif
++#endif
+=20
+ #if !defined(ENABLE_C_LOOP)
+ #if ENABLE(JIT) || CPU(X86_64) || CPU(ARM64)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/m=
eta/recipes-sato/webkit/files/reproducibility.patch
similarity index 100%
rename from meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
rename to meta/recipes-sato/webkit/files/reproducibility.patch
diff --git a/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb b/meta/recipe=
s-sato/webkit/webkitgtk-3_2.40.0.bb
new file mode 100644
index 0000000000..a9d6af2626
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
@@ -0,0 +1,173 @@
+SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
+HOMEPAGE =3D "https://www.webkitgtk.org/"
+BUGTRACKER =3D "https://bugs.webkit.org/"
+
+LICENSE =3D "BSD-2-Clause & LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c=
6d6397a5d84286dda758da57bd691 \
+                    file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082=
c40bcf298c285f8bab0b12 \
+                    file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde=
2b64ae177b2494445b79d21 \
+                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33=
ef338abbaf8b8a7c36b6eec80 \
+                    "
+
+SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
+           file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
+           file://0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch \
+           file://reproducibility.patch \
+           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
+           file://disable_wasm_riscv64.patch \
+           "
+SRC_URI[sha256sum] =3D "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60c=
c71d6a8aab7ab393"
+
+S =3D "${WORKDIR}/webkitgtk-${PV}"
+
+inherit ccache cmake pkgconfig gobject-introspection perlnative features=
_check upstream-version-is-even gi-docgen mime-xdg
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
+
+DEPENDS +=3D " \
+          atk \
+          cairo \
+          gperf-native \
+          gstreamer1.0 \
+          gstreamer1.0-plugins-base \
+          gstreamer1.0-plugins-bad \
+          ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'gstreamer=
1.0-libav', '', d)} \
+          gtk+3 \
+          harfbuzz \
+          jpeg \
+          libnotify \
+          libsoup \
+          libtasn1 \
+          libwebp \
+          libxslt \
+          ruby-native \
+          unifdef-native \
+          "
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 =
opengl', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl gst-gl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland open=
gl', 'webgl gles2 gst-gl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'j=
ournald', '', d)} \
+                   enchant \
+                   libsecret \
+                  "
+
+PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAN=
D_TARGET=3DOFF,wayland wayland-native libwpe wpebackend-fdo"
+PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,vir=
tual/egl"
+PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DENABLE=
_BUBBLEWRAP_SANDBOX=3DOFF,bubblewrap-native libseccomp xdg-dbus-proxy-nat=
ive,bubblewrap xdg-dbus-proxy"
+PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DO=
FF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
+PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=3DOFF,libavif"
+PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF=
,libmanette"
+PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATI=
ON=3DOFF,geoclue"
+PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2"
+PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtu=
al/libgles2"
+PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtu=
al/egl"
+PACKAGECONFIG[opengl] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3D=
OFF,virtual/egl libepoxy"
+PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF=
,libsecret"
+PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF=
,libhyphen"
+PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
+PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,op=
enjpeg"
+PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_=
BUILD_TYPE=3DRelease,,"
+PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
+PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNAL=
D_LOG=3DOFF,systemd"
+PACKAGECONFIG[gst-gl] =3D"-DUSE_GSTREAMER_GL=3DON,-DUSE_GSTREAMER_GL=3DO=
FF"
+PACKAGECONFIG[gst-transcoder] =3D"-DUSE_GSTREAMER_TRANSCODER=3DON,-DUSE_=
GSTREAMER_TRANSCODER=3DOFF,gstreamer1.0-plugins-bad"
+
+# webkitgtk is full of /usr/bin/env python, particular for generating do=
cs
+do_configure[postfuncs] +=3D "setup_python_link"
+setup_python_link() {
+	if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
+		ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
+	fi
+}
+
+EXTRA_OECMAKE =3D " \
+		-DENABLE_2022_GLIB_API=3DOFF \
+		-DPORT=3DGTK \
+		-DUSE_GTK4=3DOFF \
+		-DUSE_XDGMIME=3DON \
+		-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \
+		-DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy \
+		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTIO=
N=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
+		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATI=
ON=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
+		-DENABLE_MINIBROWSER=3DON \
+                -DPYTHON_EXECUTABLE=3D`which python3` \
+		"
+
+# Javascript JIT is not supported on ARC
+EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
+# By default 25-bit "medium" calls are used on ARC
+# which is not enough for binaries larger than 32 MiB
+CFLAGS:append:arc =3D " -mlong-calls"
+CXXFLAGS:append:arc =3D " -mlong-calls"
+
+# Needed for non-mesa graphics stacks when x11 is disabled
+CXXFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL=
_NO_X11=3D1', d)}"
+
+# Javascript JIT is not supported on powerpc
+EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF "
+EXTRA_OECMAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF "
+
+# ARM JIT code does not build on ARMv4/5/6 anymore
+EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
+EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
+EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
+
+EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
+EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
+
+# JIT and WASM does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 =3D " -DENABLE_JIT=3DOFF -DENABLE_WEBASSEMB=
LY=3DOFF"
+EXTRA_OECMAKE:append:riscv64 =3D " -DENABLE_JIT=3DOFF -DENABLE_WEBASSEMB=
LY=3DOFF"
+
+# JIT not supported on MIPS either
+EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=3D=
ON "
+
+# JIT not supported on X32
+# An attempt was made to upstream JIT support for x32 in
+# https://bugs.webkit.org/show_bug.cgi?id=3D100450, but this was closed =
as
+# unresolved due to limited X32 adoption.
+EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF "
+
+SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
+SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
+
+FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle"
+
+RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
+
+# http://errors.yoctoproject.org/Errors/Details/20370/
+ARM_INSTRUCTION_SET:armv4 =3D "arm"
+ARM_INSTRUCTION_SET:armv5 =3D "arm"
+ARM_INSTRUCTION_SET:armv6 =3D "arm"
+
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
+# https://bugs.webkit.org/show_bug.cgi?id=3D159880
+# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
+# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthum=
b).
+ARM_INSTRUCTION_SET:armv7a =3D "thumb"
+ARM_INSTRUCTION_SET:armv7r =3D "thumb"
+ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
+
+# introspection inside qemu-arm hangs forever on musl/arm builds
+# therefore disable GI_DATA
+GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
+GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
+
+PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure =
reproducibility
+        sed -i -e "s,${WORKDIR},,g" \
+            ${B}/JavaScriptCore/DerivedSources/*.h \
+            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
+            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.h
+}
+
+do_install:append() {
+	# webkitwebdriver conflicts between webkitgtk and webkitgtk-3 ... move
+	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver-3
+}
diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e10=
0dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b=
90453bc4e100dcf967243ecd98.patch
deleted file mode 100644
index 1ff9dcea7e..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967=
243ecd98.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 16 Jan 2023 16:55:26 -0800
-Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include=
 in
- ANGLE https://bugs.webkit.org/show_bug.cgi?id=3D250689
-
-Unreviewed build fix.
-
-* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
-
-Canonical link: https://commits.webkit.org/258968@main
-
-Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=3D250=
689]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Sour=
ce/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-index 94cb93e01fc0..ec7bda372f30 100644
---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-@@ -12,6 +12,7 @@
-=20
- #include <algorithm>
- #include <array>
-+#include <cstdint>
- #include <string>
- #include <vector>
-=20
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.40.0.bb
similarity index 71%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
index e52920883a..e219cbf6d4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
@@ -11,64 +11,69 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/CO=
PYING.LIB;md5=3Dd0c6d6397a5d842
=20
 SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
+           file://0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://disable_wasm_riscv64.patch \
            "
-SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389bb08=
aee08c5b0bb0c1a7"
+SRC_URI[sha256sum] =3D "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60c=
c71d6a8aab7ab393"
=20
-inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
+inherit cmake ccache pkgconfig gobject-introspection perlnative features=
_check upstream-version-is-even gi-docgen mime-xdg
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'w=
ayland', 'opengl', '', d)}"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
=20
 DEPENDS +=3D " \
-          ruby-native \
-          gperf-native \
+          atk \
           cairo \
+          gperf-native \
+          gstreamer1.0 \
+          gstreamer1.0-plugins-base \
+          gstreamer1.0-plugins-bad \
+          ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'gstreamer=
1.0-libav', '', d)} \
           harfbuzz \
           jpeg \
-          atk \
+          libnotify \
+          libsoup \
+          libtasn1 \
           libwebp \
-          gtk+3 \
           libxslt \
-          libtasn1 \
-          libnotify \
-          gstreamer1.0 \
-          gstreamer1.0-plugins-base \
+          ruby-native \
+          unifdef-native \
           "
=20
-PACKAGECONFIG_SOUP ?=3D "soup3"
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayl=
and x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'w=
ebgl gles2', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl-or-es', '', d)} \
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 =
opengl', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl gst-gl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland open=
gl', 'webgl gles2 gst-gl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'j=
ournald', '', d)} \
+                   gtk4 \
                    enchant \
                    libsecret \
-                   ${PACKAGECONFIG_SOUP} \
                   "
=20
-PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAN=
D_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native"
-PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF=
"
+PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAN=
D_TARGET=3DOFF,wayland wayland-native libwpe wpebackend-fdo"
+PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,vir=
tual/egl"
+PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DENABLE=
_BUBBLEWRAP_SANDBOX=3DOFF,bubblewrap-native libseccomp xdg-dbus-proxy-nat=
ive,bubblewrap xdg-dbus-proxy"
 PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DO=
FF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
+PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=3DOFF,libavif"
+PACKAGECONFIG[gtk4] =3D "-DUSE_GTK4=3DON,-DUSE_GTK4=3DOFF,gtk4"
+PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF=
,libmanette"
 PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATI=
ON=3DOFF,geoclue"
 PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2"
 PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtu=
al/libgles2"
 PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtu=
al/egl"
-PACKAGECONFIG[opengl] =3D "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GR=
APHICS_CONTEXT_GL=3DOFF,virtual/egl"
-PACKAGECONFIG[opengl-or-es] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR=
_ES=3DOFF"
+PACKAGECONFIG[opengl] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3D=
OFF,virtual/egl libepoxy"
 PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF=
,libsecret"
 PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF=
,libhyphen"
 PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
 PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,op=
enjpeg"
-PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,syste=
md"
 PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_=
BUILD_TYPE=3DRelease,,"
 PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
-PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4=
,,,soup3"
-PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNAL=
D_LOG=3DOFF,systemd"
+PACKAGECONFIG[gst-gl] =3D"-DUSE_GSTREAMER_GL=3DON,-DUSE_GSTREAMER_GL=3DO=
FF"
+PACKAGECONFIG[gst-transcoder] =3D"-DUSE_GSTREAMER_TRANSCODER=3DON,-DUSE_=
GSTREAMER_TRANSCODER=3DOFF,gstreamer1.0-plugins-bad"
=20
 # webkitgtk is full of /usr/bin/env python, particular for generating do=
cs
 do_configure[postfuncs] +=3D "setup_python_link"
@@ -79,13 +84,15 @@ setup_python_link() {
 }
=20
 EXTRA_OECMAKE =3D " \
+		-DENABLE_2022_GLIB_API=3DON \
 		-DPORT=3DGTK \
+		-DUSE_XDGMIME=3DON \
+		-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \
+		-DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTIO=
N=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
 		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATI=
ON=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
 		-DENABLE_MINIBROWSER=3DON \
                 -DPYTHON_EXECUTABLE=3D`which python3` \
-                -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \
-                -DENABLE_GAMEPAD=3DOFF \
 		"
=20
 # Javascript JIT is not supported on ARC
@@ -110,9 +117,9 @@ EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
 EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
 EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
=20
-# JIT and gold linker does not work on RISCV
-EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
-EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
+# JIT and WASM does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 =3D " -DENABLE_JIT=3DOFF -DENABLE_WEBASSEMB=
LY=3DOFF"
+EXTRA_OECMAKE:append:riscv64 =3D " -DENABLE_JIT=3DOFF -DENABLE_WEBASSEMB=
LY=3DOFF"
=20
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=3D=
ON "
@@ -126,7 +133,7 @@ EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF=
 "
 SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
 SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
=20
-FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtk=
injectedbundle.so"
+FILES:${PN} +=3D "${libdir}/webkitgtk-6.*/injected-bundle"
=20
 RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
=20
@@ -148,9 +155,6 @@ ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
 GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
 GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
=20
-# Can't be built with ccache
-CCACHE_DISABLE =3D "1"
-
 PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
 src_package_preprocess () {
         # Trim build paths from comments in generated sources to ensure =
reproducibility
@@ -158,8 +162,6 @@ src_package_preprocess () {
             ${B}/JavaScriptCore/DerivedSources/*.h \
             ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
             ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
-
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.h
 }
-
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/rec=
ipes-sato/webkit/wpebackend-fdo_1.14.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
index 708201043b..9f2ea0b7de 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e=
06865efec5809155"
+SRC_URI[sha256sum] =3D "01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c85=
50a3dbdbcc6bbb50"
=20
 # Especially helps compiling with clang which enable this as error when
 # using c++11
--=20
2.34.1


