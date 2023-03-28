Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3217C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:27:44 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.60393.1679988456397426585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout08.t-online.de (Postfix) with SMTP id 86E8821AED;
	Tue, 28 Mar 2023 09:27:03 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph3jP-1Bnhom0; Tue, 28 Mar 2023 09:26:59 +0200
Message-ID: <5af38197-ac9b-c5ab-baa1-45da3562d5df@t-online.de>
Date: Tue, 28 Mar 2023 09:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe-core][PATCHv4] webkitgtk: update 2.38.5 -> 2.40.0
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
References: <17507FB5CB63E584.14179@lists.openembedded.org>
 <6d514983-364b-99a0-4a5c-528bf6cb26bc@t-online.de>
 <20230328071714e8631733@mail.local>
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20230328071714e8631733@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1679988419-EFFFCC53-F3DA7412/0/0 CLEAN NORMAL
X-TOI-MSGID: d83b4005-9cad-459c-b34f-951043d750ff
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179205

This patch is standalone. There is still the problem for Epiphany with 
libadwaita. But that would require a decision that should not be made by me.

Am 28.03.23 um 09:17 schrieb Alexandre Belloni via lists.openembedded.org:
> Is th patch standalone or does it need the other series to build?
>
> On 28/03/2023 07:59:33+0200, Markus Volk wrote:
>> v4 adds Khems fix for riscv64
>>
>> Am 28.03.23 um 07:57 schrieb Markus Volk:
>>> - added PACKAGECONFIGs for av1 support, gamepad and sandboxing
>>> - cmake tries to find where bwrap and xdg-dbus-proxy are located on target and reads the path from
>>>     ${STAGING_BINDIR_NATIVE}. This breaks reproducibility and runtime. Fix by adding the needed paths manually.
>>> - ccache seems to be working well now. Enable by default. It significantly improves buildtime on rebuilds.
>>> - webkitgtk can be built with both, gtk+3 and gtk4 but it cant be built with support for both at once.
>>>     there are still some packages that require the gtk3 variant, nameably surf, gnome-online-accounts and wxwidgets
>>>     while ephiphany for example has a hard dependency on webkitgtk built with gtk4. This is why we need to provide
>>>     recipes for both variants. If built with gtk+3 webkitgtk provides the 4.0 api, if built with gtk4 it'll provide the
>>>     6.0 api. The only conflicting file between those two is the WebKitWebDriver binary. This was renamed for the gtk3
>>>     variant so both variants can be installed into the same image.
>>> - update dependencies
>>> - wpebackend-fdo: update
>>> - add fixes that have been sent by kai.kang@eng.windriver.com
>>> - add fix for riscv64 that has been sent by raj.khem@gmail.com
>>>
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> ---
>>>    meta/conf/distro/include/maintainers.inc      |   1 +
>>>    ...spection.cmake-prefix-variables-obta.patch |   0
>>>    ...ibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch |  34 ++++
>>>    ...44e17d258106617b0e6d783d073b188a2548.patch |  32 +++-
>>>    .../webkit/files/disable_wasm_riscv64.patch   |  24 +++
>>>    .../reproducibility.patch                     |   0
>>>    .../recipes-sato/webkit/webkitgtk-3_2.40.0.bb | 173 ++++++++++++++++++
>>>    ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 ---
>>>    ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.0.bb} |  78 ++++----
>>>    ...fdo_1.14.0.bb => wpebackend-fdo_1.14.1.bb} |   2 +-
>>>    10 files changed, 296 insertions(+), 78 deletions(-)
>>>    rename meta/recipes-sato/webkit/{webkitgtk => files}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch (100%)
>>>    create mode 100644 meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch
>>>    rename meta/recipes-sato/webkit/{webkitgtk => files}/0d3344e17d258106617b0e6d783d073b188a2548.patch (87%)
>>>    create mode 100644 meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
>>>    rename meta/recipes-sato/webkit/{webkitgtk => files}/reproducibility.patch (100%)
>>>    create mode 100644 meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
>>>    delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>>>    rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.0.bb} (71%)
>>>    rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.1.bb} (90%)
>>>
>>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>>> index c76447a25d..1fec9bc6f4 100644
>>> --- a/meta/conf/distro/include/maintainers.inc
>>> +++ b/meta/conf/distro/include/maintainers.inc
>>> @@ -825,6 +825,7 @@ RECIPE_MAINTAINER:pn-wayland = "Denys Dmytriyenko <denis@denix.org>"
>>>    RECIPE_MAINTAINER:pn-wayland-protocols = "Denys Dmytriyenko <denis@denix.org>"
>>>    RECIPE_MAINTAINER:pn-wayland-utils = "Denys Dmytriyenko <denis@denix.org>"
>>>    RECIPE_MAINTAINER:pn-webkitgtk = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>> +RECIPE_MAINTAINER:pn-webkitgtk-3 = "Markus Volk <f_l_k@t-online.de>"
>>>    RECIPE_MAINTAINER:pn-weston = "Denys Dmytriyenko <denis@denix.org>"
>>>    RECIPE_MAINTAINER:pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
>>>    RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>>> similarity index 100%
>>> rename from meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>>> rename to meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>>> diff --git a/meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch b/meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch
>>> new file mode 100644
>>> index 0000000000..dc56bbb92c
>>> --- /dev/null
>>> +++ b/meta/recipes-sato/webkit/files/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch
>>> @@ -0,0 +1,34 @@
>>> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/11913]
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +
>>> +From de30f1a1caf81902d254e046e382f9cf9cd62c58 Mon Sep 17 00:00:00 2001
>>> +From: Kai Kang <kai.kang@windriver.com>
>>> +Date: Fri, 24 Mar 2023 17:58:29 +0800
>>> +Subject: [PATCH] FindLibGcrypt.cmake: check PC_GCRYPT_FOUND
>>> +
>>> +After `pkg_check_modules(PC_GCRYPT QUIET libgcrypt)` in
>>> +FindLibGcrypt.cmake, PC_GCRYPT_FOUND will be set but PC_GCRYPT is kept
>>> +empty. So check PC_GCRYPT_FOUND instead.
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +---
>>> + Source/cmake/FindLibGcrypt.cmake | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Source/cmake/FindLibGcrypt.cmake b/Source/cmake/FindLibGcrypt.cmake
>>> +index 8bee72963902..2e84cfc4e9b1 100644
>>> +--- a/Source/cmake/FindLibGcrypt.cmake
>>> ++++ b/Source/cmake/FindLibGcrypt.cmake
>>> +@@ -49,7 +49,7 @@ if (PkgConfig_FOUND)
>>> +     set(LibGcrypt_VERSION ${PC_GCRYPT_VERSION})
>>> + endif ()
>>> +
>>> +-if (LIBGCRYPTCONFIG_SCRIPT AND NOT PC_GCRYPT)
>>> ++if (LIBGCRYPTCONFIG_SCRIPT AND NOT PC_GCRYPT_FOUND)
>>> +     execute_process(
>>> +         COMMAND "${LIBGCRYPTCONFIG_SCRIPT}" --prefix
>>> +         RESULT_VARIABLE CONFIGSCRIPT_RESULT
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/files/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> similarity index 87%
>>> rename from meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> rename to meta/recipes-sato/webkit/files/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> index 32f92f7ff5..d47e7ac419 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> +++ b/meta/recipes-sato/webkit/files/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> @@ -35,14 +35,16 @@ Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
>>>    Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
>>> - .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
>>> + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
>>>     .../graphics/filters/DistantLightSource.h     |  4 ++
>>>     .../platform/graphics/filters/FELighting.h    |  7 ---
>>>     .../graphics/filters/PointLightSource.h       |  4 ++
>>>     .../graphics/filters/SpotLightSource.h        |  4 ++
>>>     .../software/FELightingSoftwareApplier.h      | 16 ++++++
>>> - 7 files changed, 57 insertions(+), 36 deletions(-)
>>> + 7 files changed, 56 insertions(+), 35 deletions(-)
>>> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
>>> +index f6ff8c20..42a97ffc 100644
>>>    --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
>>>    +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
>>>    @@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
>>> @@ -63,6 +65,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     {
>>>         // Calling a powf function from the assembly code would require to save
>>>         // and reload a lot of NEON registers. Since the base is in range [0..1]
>>> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>>> +index b17c603d..e4629cda 100644
>>>    --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>>>    +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>>>    @@ -24,14 +24,15 @@
>>> @@ -104,7 +108,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>             0,
>>>             0,
>>>             0,
>>> -@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
>>> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
>>>         // Set light source arguments.
>>>         floatArguments.constOne = 1;
>>> @@ -133,7 +137,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>             floatArguments.lightX = spotLightSource.position().x();
>>>             floatArguments.lightY = spotLightSource.position().y();
>>>             floatArguments.lightZ = spotLightSource.position().z();
>>> -@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
>>> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
>>>             if (spotLightSource.specularExponent() == 1)
>>>                 neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
>>>         } else {
>>> @@ -142,7 +146,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>             floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
>>>             floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
>>>             floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
>>> -@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
>>> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
>>>         // Set lighting arguments.
>>>         floatArguments.surfaceScale = data.surfaceScale;
>>>         floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
>>> @@ -192,16 +196,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>                 }
>>>                 parallelJobs.execute();
>>>                 return;
>>> -@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
>>> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
>>>     } // namespace WebCore
>>>     #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
>>>    -
>>>    -#endif // FELightingNEON_h
>>> +diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>>> +index 70c6512f..b032c82e 100644
>>>    --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>>>    +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>>> -@@ -25,6 +25,10 @@
>>> - #include "LightSource.h"
>>> +@@ -26,6 +26,10 @@
>>> + #include <wtf/ArgumentCoder.h>
>>>     #include <wtf/Ref.h>
>>>    +namespace WTF {
>>> @@ -211,6 +217,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     namespace WebCore {
>>>     class DistantLightSource : public LightSource {
>>> +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
>>> +index 53beb596..e78a9354 100644
>>>    --- a/Source/WebCore/platform/graphics/filters/FELighting.h
>>>    +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
>>>    @@ -35,8 +35,6 @@
>>> @@ -222,7 +230,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     class FELighting : public FilterEffect {
>>>     public:
>>>         const Color& lightingColor() const { return m_lightingColor; }
>>> -@@ -67,11 +65,6 @@ protected:
>>> +@@ -64,11 +62,6 @@ protected:
>>>         std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
>>> @@ -234,6 +242,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>         Color m_lightingColor;
>>>         float m_surfaceScale;
>>>         float m_diffuseConstant;
>>> +diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
>>> +index 3a5723f0..675d63f5 100644
>>>    --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
>>>    +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
>>>    @@ -26,6 +26,10 @@
>>> @@ -247,6 +257,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     namespace WebCore {
>>>     class PointLightSource : public LightSource {
>>> +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>>> +index 684626f7..dea58389 100644
>>>    --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>>>    +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>>>    @@ -26,6 +26,10 @@
>>> @@ -260,6 +272,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     namespace WebCore {
>>>     class SpotLightSource : public LightSource {
>>> +diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
>>> +index c974d921..e2896660 100644
>>>    --- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
>>>    +++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
>>>    @@ -36,6 +36,7 @@
>>> diff --git a/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch b/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
>>> new file mode 100644
>>> index 0000000000..eac942fddc
>>> --- /dev/null
>>> +++ b/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
>>> @@ -0,0 +1,24 @@
>>> +Provide a way to override enabling wasm from CMake
>>> +by setting -DENABLE_WEBASSEMBLY=OFF for RISCV64
>>> +
>>> +Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=254553]
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +
>>> +--- a/Source/WTF/wtf/PlatformEnable.h
>>> ++++ b/Source/WTF/wtf/PlatformEnable.h
>>> +@@ -613,13 +613,14 @@
>>> + #endif
>>> +
>>> + #if CPU(RISCV64)
>>> +-#undef ENABLE_WEBASSEMBLY
>>> ++#if !defined(ENABLE_WEBASSEMBLY)
>>> + #define ENABLE_WEBASSEMBLY 1
>>> + #undef ENABLE_WEBASSEMBLY_B3JIT
>>> + #define ENABLE_WEBASSEMBLY_B3JIT 0
>>> + #undef ENABLE_WEBASSEMBLY_BBQJIT
>>> + #define ENABLE_WEBASSEMBLY_BBQJIT 0
>>> + #endif
>>> ++#endif
>>> +
>>> + #if !defined(ENABLE_C_LOOP)
>>> + #if ENABLE(JIT) || CPU(X86_64) || CPU(ARM64)
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/files/reproducibility.patch
>>> similarity index 100%
>>> rename from meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
>>> rename to meta/recipes-sato/webkit/files/reproducibility.patch
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
>>> new file mode 100644
>>> index 0000000000..a9d6af2626
>>> --- /dev/null
>>> +++ b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
>>> @@ -0,0 +1,173 @@
>>> +SUMMARY = "WebKit web rendering engine for the GTK+ platform"
>>> +HOMEPAGE = "https://www.webkitgtk.org/"
>>> +BUGTRACKER = "https://bugs.webkit.org/"
>>> +
>>> +LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
>>> +LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
>>> +                    file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
>>> +                    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
>>> +                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
>>> +                    "
>>> +
>>> +SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
>>> +           file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
>>> +           file://0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch \
>>> +           file://reproducibility.patch \
>>> +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
>>> +           file://disable_wasm_riscv64.patch \
>>> +           "
>>> +SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
>>> +
>>> +S = "${WORKDIR}/webkitgtk-${PV}"
>>> +
>>> +inherit ccache cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen mime-xdg
>>> +
>>> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>>> +
>>> +CVE_PRODUCT = "webkitgtk webkitgtk\+"
>>> +
>>> +DEPENDS += " \
>>> +          atk \
>>> +          cairo \
>>> +          gperf-native \
>>> +          gstreamer1.0 \
>>> +          gstreamer1.0-plugins-base \
>>> +          gstreamer1.0-plugins-bad \
>>> +          ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \
>>> +          gtk+3 \
>>> +          harfbuzz \
>>> +          jpeg \
>>> +          libnotify \
>>> +          libsoup \
>>> +          libtasn1 \
>>> +          libwebp \
>>> +          libxslt \
>>> +          ruby-native \
>>> +          unifdef-native \
>>> +          "
>>> +
>>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 opengl', d)} \
>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl gst-gl', '', d)} \
>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'webgl gles2 gst-gl', '', d)} \
>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \
>>> +                   enchant \
>>> +                   libsecret \
>>> +                  "
>>> +
>>> +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland wayland-native libwpe wpebackend-fdo"
>>> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_EGL=ON,-DUSE_ANGLE_EGL=OFF,virtual/egl"
>>> +PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,bubblewrap-native libseccomp xdg-dbus-proxy-native,bubblewrap xdg-dbus-proxy"
>>> +PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
>>> +PACKAGECONFIG[libavif] = "-DUSE_AVIF=ON,-DUSE_AVIF=OFF,libavif"
>>> +PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
>>> +PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>>> +PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
>>> +PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
>>> +PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
>>> +PACKAGECONFIG[opengl] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF,virtual/egl libepoxy"
>>> +PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
>>> +PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
>>> +PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
>>> +PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
>>> +PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
>>> +PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
>>> +PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
>>> +PACKAGECONFIG[gst-gl] ="-DUSE_GSTREAMER_GL=ON,-DUSE_GSTREAMER_GL=OFF"
>>> +PACKAGECONFIG[gst-transcoder] ="-DUSE_GSTREAMER_TRANSCODER=ON,-DUSE_GSTREAMER_TRANSCODER=OFF,gstreamer1.0-plugins-bad"
>>> +
>>> +# webkitgtk is full of /usr/bin/env python, particular for generating docs
>>> +do_configure[postfuncs] += "setup_python_link"
>>> +setup_python_link() {
>>> +	if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
>>> +		ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
>>> +	fi
>>> +}
>>> +
>>> +EXTRA_OECMAKE = " \
>>> +		-DENABLE_2022_GLIB_API=OFF \
>>> +		-DPORT=GTK \
>>> +		-DUSE_GTK4=OFF \
>>> +		-DUSE_XDGMIME=ON \
>>> +		-DBWRAP_EXECUTABLE=${bindir}/bwrap \
>>> +		-DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy \
>>> +		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>>> +		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
>>> +		-DENABLE_MINIBROWSER=ON \
>>> +                -DPYTHON_EXECUTABLE=`which python3` \
>>> +		"
>>> +
>>> +# Javascript JIT is not supported on ARC
>>> +EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
>>> +# By default 25-bit "medium" calls are used on ARC
>>> +# which is not enough for binaries larger than 32 MiB
>>> +CFLAGS:append:arc = " -mlong-calls"
>>> +CXXFLAGS:append:arc = " -mlong-calls"
>>> +
>>> +# Needed for non-mesa graphics stacks when x11 is disabled
>>> +CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>>> +
>>> +# Javascript JIT is not supported on powerpc
>>> +EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
>>> +EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
>>> +
>>> +# ARM JIT code does not build on ARMv4/5/6 anymore
>>> +EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
>>> +EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
>>> +EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
>>> +
>>> +EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
>>> +EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
>>> +
>>> +# JIT and WASM does not work on RISCV
>>> +EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
>>> +EXTRA_OECMAKE:append:riscv64 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
>>> +
>>> +# JIT not supported on MIPS either
>>> +EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
>>> +
>>> +# JIT not supported on X32
>>> +# An attempt was made to upstream JIT support for x32 in
>>> +# https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
>>> +# unresolved due to limited X32 adoption.
>>> +EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
>>> +
>>> +SECURITY_CFLAGS:remove:aarch64 = "-fpie"
>>> +SECURITY_CFLAGS:append:aarch64 = " -fPIE"
>>> +
>>> +FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle"
>>> +
>>> +RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
>>> +
>>> +# http://errors.yoctoproject.org/Errors/Details/20370/
>>> +ARM_INSTRUCTION_SET:armv4 = "arm"
>>> +ARM_INSTRUCTION_SET:armv5 = "arm"
>>> +ARM_INSTRUCTION_SET:armv6 = "arm"
>>> +
>>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
>>> +# https://bugs.webkit.org/show_bug.cgi?id=159880
>>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
>>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
>>> +ARM_INSTRUCTION_SET:armv7a = "thumb"
>>> +ARM_INSTRUCTION_SET:armv7r = "thumb"
>>> +ARM_INSTRUCTION_SET:armv7ve = "thumb"
>>> +
>>> +# introspection inside qemu-arm hangs forever on musl/arm builds
>>> +# therefore disable GI_DATA
>>> +GI_DATA_ENABLED:libc-musl:armv7a = "False"
>>> +GI_DATA_ENABLED:libc-musl:armv7ve = "False"
>>> +
>>> +PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
>>> +src_package_preprocess () {
>>> +        # Trim build paths from comments in generated sources to ensure reproducibility
>>> +        sed -i -e "s,${WORKDIR},,g" \
>>> +            ${B}/JavaScriptCore/DerivedSources/*.h \
>>> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
>>> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
>>> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
>>> +            ${B}/WebKitGTK/DerivedSources/webkit/*.h
>>> +}
>>> +
>>> +do_install:append() {
>>> +	# webkitwebdriver conflicts between webkitgtk and webkitgtk-3 ... move
>>> +	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver-3
>>> +}
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>>> deleted file mode 100644
>>> index 1ff9dcea7e..0000000000
>>> --- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>>> +++ /dev/null
>>> @@ -1,30 +0,0 @@
>>> -From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
>>> -From: Michael Catanzaro <mcatanzaro@redhat.com>
>>> -Date: Mon, 16 Jan 2023 16:55:26 -0800
>>> -Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include in
>>> - ANGLE https://bugs.webkit.org/show_bug.cgi?id=250689
>>> -
>>> -Unreviewed build fix.
>>> -
>>> -* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
>>> -
>>> -Canonical link: https://commits.webkit.org/258968@main
>>> -
>>> -Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=250689]
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
>>> - 1 file changed, 1 insertion(+)
>>> -
>>> -diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
>>> -index 94cb93e01fc0..ec7bda372f30 100644
>>> ---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
>>> -+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
>>> -@@ -12,6 +12,7 @@
>>> -
>>> - #include <algorithm>
>>> - #include <array>
>>> -+#include <cstdint>
>>> - #include <string>
>>> - #include <vector>
>>> -
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
>>> similarity index 71%
>>> rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
>>> rename to meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
>>> index e52920883a..e219cbf6d4 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
>>> @@ -11,64 +11,69 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
>>>    SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>>               file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
>>> +           file://0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch \
>>>               file://reproducibility.patch \
>>>               file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
>>> -           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
>>> +           file://disable_wasm_riscv64.patch \
>>>               "
>>> -SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
>>> +SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
>>> -inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
>>> +inherit cmake ccache pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen mime-xdg
>>>    ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>>> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
>>> +REQUIRED_DISTRO_FEATURES = "opengl"
>>>    CVE_PRODUCT = "webkitgtk webkitgtk\+"
>>>    DEPENDS += " \
>>> -          ruby-native \
>>> -          gperf-native \
>>> +          atk \
>>>              cairo \
>>> +          gperf-native \
>>> +          gstreamer1.0 \
>>> +          gstreamer1.0-plugins-base \
>>> +          gstreamer1.0-plugins-bad \
>>> +          ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \
>>>              harfbuzz \
>>>              jpeg \
>>> -          atk \
>>> +          libnotify \
>>> +          libsoup \
>>> +          libtasn1 \
>>>              libwebp \
>>> -          gtk+3 \
>>>              libxslt \
>>> -          libtasn1 \
>>> -          libnotify \
>>> -          gstreamer1.0 \
>>> -          gstreamer1.0-plugins-base \
>>> +          ruby-native \
>>> +          unifdef-native \
>>>              "
>>> -PACKAGECONFIG_SOUP ?= "soup3"
>>> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
>>> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
>>> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
>>> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
>>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 opengl', d)} \
>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl gst-gl', '', d)} \
>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'webgl gles2 gst-gl', '', d)} \
>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \
>>> +                   gtk4 \
>>>                       enchant \
>>>                       libsecret \
>>> -                   ${PACKAGECONFIG_SOUP} \
>>>                      "
>>> -PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
>>> -PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
>>> +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland wayland-native libwpe wpebackend-fdo"
>>> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_EGL=ON,-DUSE_ANGLE_EGL=OFF,virtual/egl"
>>> +PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,bubblewrap-native libseccomp xdg-dbus-proxy-native,bubblewrap xdg-dbus-proxy"
>>>    PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
>>> +PACKAGECONFIG[libavif] = "-DUSE_AVIF=ON,-DUSE_AVIF=OFF,libavif"
>>> +PACKAGECONFIG[gtk4] = "-DUSE_GTK4=ON,-DUSE_GTK4=OFF,gtk4"
>>> +PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
>>>    PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>>>    PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
>>>    PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
>>>    PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
>>> -PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
>>> -PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
>>> +PACKAGECONFIG[opengl] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF,virtual/egl libepoxy"
>>>    PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
>>>    PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
>>>    PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
>>>    PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
>>> -PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
>>>    PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
>>>    PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
>>> -PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
>>> -PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
>>>    PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
>>> +PACKAGECONFIG[gst-gl] ="-DUSE_GSTREAMER_GL=ON,-DUSE_GSTREAMER_GL=OFF"
>>> +PACKAGECONFIG[gst-transcoder] ="-DUSE_GSTREAMER_TRANSCODER=ON,-DUSE_GSTREAMER_TRANSCODER=OFF,gstreamer1.0-plugins-bad"
>>>    # webkitgtk is full of /usr/bin/env python, particular for generating docs
>>>    do_configure[postfuncs] += "setup_python_link"
>>> @@ -79,13 +84,15 @@ setup_python_link() {
>>>    }
>>>    EXTRA_OECMAKE = " \
>>> +		-DENABLE_2022_GLIB_API=ON \
>>>    		-DPORT=GTK \
>>> +		-DUSE_XDGMIME=ON \
>>> +		-DBWRAP_EXECUTABLE=${bindir}/bwrap \
>>> +		-DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy \
>>>    		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>>>    		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
>>>    		-DENABLE_MINIBROWSER=ON \
>>>                    -DPYTHON_EXECUTABLE=`which python3` \
>>> -                -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
>>> -                -DENABLE_GAMEPAD=OFF \
>>>    		"
>>>    # Javascript JIT is not supported on ARC
>>> @@ -110,9 +117,9 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
>>>    EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
>>>    EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
>>> -# JIT and gold linker does not work on RISCV
>>> -EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
>>> -EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
>>> +# JIT and WASM does not work on RISCV
>>> +EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
>>> +EXTRA_OECMAKE:append:riscv64 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
>>>    # JIT not supported on MIPS either
>>>    EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
>>> @@ -126,7 +133,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
>>>    SECURITY_CFLAGS:remove:aarch64 = "-fpie"
>>>    SECURITY_CFLAGS:append:aarch64 = " -fPIE"
>>> -FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
>>> +FILES:${PN} += "${libdir}/webkitgtk-6.*/injected-bundle"
>>>    RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
>>> @@ -148,9 +155,6 @@ ARM_INSTRUCTION_SET:armv7ve = "thumb"
>>>    GI_DATA_ENABLED:libc-musl:armv7a = "False"
>>>    GI_DATA_ENABLED:libc-musl:armv7ve = "False"
>>> -# Can't be built with ccache
>>> -CCACHE_DISABLE = "1"
>>> -
>>>    PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
>>>    src_package_preprocess () {
>>>            # Trim build paths from comments in generated sources to ensure reproducibility
>>> @@ -158,8 +162,6 @@ src_package_preprocess () {
>>>                ${B}/JavaScriptCore/DerivedSources/*.h \
>>>                ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
>>>                ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
>>> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
>>> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
>>> -
>>> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
>>> +            ${B}/WebKitGTK/DerivedSources/webkit/*.h
>>>    }
>>> -
>>> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
>>> similarity index 90%
>>> rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
>>> rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
>>> index 708201043b..9f2ea0b7de 100644
>>> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
>>> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
>>> @@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
>>>    REQUIRED_DISTRO_FEATURES = "opengl"
>>>    SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>>> -SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
>>> +SRC_URI[sha256sum] = "01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50"
>>>    # Especially helps compiling with clang which enable this as error when
>>>    # using c++11
>>>
>>>
>>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179203): https://lists.openembedded.org/g/openembedded-core/message/179203
> Mute This Topic: https://lists.openembedded.org/mt/97899808/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

