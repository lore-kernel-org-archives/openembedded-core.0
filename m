Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A53D44D51
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 11:28:06 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.43643.1730892478009403694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 03:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJoxZzIi;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so63053181fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 03:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730892476; x=1731497276; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ut+yMAq5vprhGyYHe2q9yhzLWYrltUtetInwwBn0feI=;
        b=KJoxZzIi6CcI59GwNE6F2Ja94e/lV2cO5zEyd7xBekVgILaHWaiKkPwQ4R0Tpcb7lh
         vjd9SbxG1GSaO2v/9+s1oTwuX89jEGEfQ8GPDpE1BRpUcT+ZXgL961HoB/tpWAotMLbm
         UViuFBM9NX4MzeJ9AnLARYRVosEgCydyUJ2YZqvaELdoU2agXLCbv3UtpsBHa7FQn0VS
         soPuRHFfWyPVCLHV623YStc2LLulevlBDakOV0Y2552TGWKkfrUxMGvxBlCC2T8un2rz
         CyaFLnBxwvm2yZX523noCs1rgsUs8fiaHvhNqcuN02/r6wnXpml8Z5oaYN5nSNP46LBV
         z63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892476; x=1731497276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut+yMAq5vprhGyYHe2q9yhzLWYrltUtetInwwBn0feI=;
        b=qGGKnjzfzmVwj9Px8m+V//SMlVZuoBaADMrPPTFu+vIHg3Ed4rtyY7hH4OZ4l4fDBq
         sQ60yfreecNNaCqaOOQrNwY0KRGERG9ApIy4AECzeF8PzsnZ2is5U3QeMtLjmJaOhJ1R
         jPnDZ+xLaJzO6K2TWGmayzhkZa+4lqYWxWUtzYyfWAe7kW6XO3bLnvMAVK4YTmE9AbUM
         Orq/p5TgBXoOvDug3xq32+8R3v50jGxJEmLXJH9tl8Goz6o4lhKzTFlB6JVitD8RYdTb
         b1MoOnMBdoPnWWQ+LOXSBbc4gtPveYP/ZOXlQ0Lm7nTxQrQBmKjHY64K37TG5vvwKqHc
         TNvQ==
X-Gm-Message-State: AOJu0Yw48KjI8EIPPBdllRrZKpz4S9SHIuSQZz208+OTMtYvi1q+8GRm
	cHVOCNaI1wwcR0GeTo60jEdKMxRivmjArSfG5taibAOUyAj0ljjtju8frXwul5I02DO3Ipv0hLQ
	V6JaXHftJAUg94CNvNjfvmKkioj4=
X-Google-Smtp-Source: AGHT+IHBbTl2n6FLzCW2ZeJOxw4GUayEOG7OZ7lDZ21BpFctan5ssccx1avI+vF+TI6tZxPeYSEKWd5bWhZ2jE4+C20=
X-Received: by 2002:a05:651c:154b:b0:2fb:4a63:92c0 with SMTP id
 38308e7fff4ca-2fd0590dd3amr116345691fa.14.1730892475703; Wed, 06 Nov 2024
 03:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20241105184540.3450302-1-raj.khem@gmail.com> <20241105184540.3450302-19-raj.khem@gmail.com>
In-Reply-To: <20241105184540.3450302-19-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Nov 2024 12:27:44 +0100
Message-ID: <CANNYZj-xNNQ_+3Gi4kBGb_D5S6Ewp70rCcQXgbTx8oc8Jp7fKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/19] mesa: add support for rusticl
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 11:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206765

Thanks for the patchset! This last patch should be left out, as it
contains a workaround for an issue that is not full understood, and
isn't necessary for the overall clang support or mesa upgrade. We
should get back to it once the rest merges into core.

Alex

On Tue, 5 Nov 2024 at 19:46, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> From: Markus Volk <f_l_k@t-online.de>
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...n.build-workaround-for-rusticl-build.patch | 27 +++++++++++
>  ...6da9458c9d0348f2390dc0bea67cf140b1a0.patch | 47 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           | 33 +++++++++----
>  3 files changed, 97 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch b/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch
> new file mode 100644
> index 00000000000..9c953f961d0
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch
> @@ -0,0 +1,27 @@
> +From b34ee4014ee9e3466ebafbd53745d9f9a13379da Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 11 Jul 2024 22:52:16 +0200
> +Subject: [PATCH] rusticl/meson.build: workaround for rusticl build
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + src/gallium/frontends/rusticl/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
> +index eef09d8f01e..efac4cab964 100644
> +--- a/src/gallium/frontends/rusticl/meson.build
> ++++ b/src/gallium/frontends/rusticl/meson.build
> +@@ -211,6 +211,7 @@ rusticl_llvm_bindings_rs = rust.bindgen(
> +   c_args : [
> +     rusticl_bindgen_c_args,
> +     pre_args,
> ++   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
> +   ],
> +   dependencies : [
> +     dep_clang,
> +--
> +2.45.2
> +
> diff --git a/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch b/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch
> new file mode 100644
> index 00000000000..9c5c9c75ffb
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch
> @@ -0,0 +1,47 @@
> +From 93e96da9458c9d0348f2390dc0bea67cf140b1a0 Mon Sep 17 00:00:00 2001
> +From: Karol Herbst <kherbst@redhat.com>
> +Date: Sun, 18 Aug 2024 00:08:50 +0200
> +Subject: [PATCH] rusticl: do not use CL vector types in bindings and code
> +
> +Bindgen seems to miscompile them and I kinda thought I've done this
> +already in the past, but apparently not.
> +
> +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/11722
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30710>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/93e96da9458c9d0348f2390dc0bea67cf140b1a0]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + src/gallium/frontends/rusticl/api/device.rs | 2 +-
> + src/gallium/frontends/rusticl/meson.build   | 1 +
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/frontends/rusticl/api/device.rs b/src/gallium/frontends/rusticl/api/device.rs
> +index 9793092db5ad4..c1cb7902e0371 100644
> +--- a/src/gallium/frontends/rusticl/api/device.rs
> ++++ b/src/gallium/frontends/rusticl/api/device.rs
> +@@ -196,7 +196,7 @@ impl CLInfo<cl_device_info> for cl_device_id {
> +             // TODO proper retrival from devices
> +             CL_DEVICE_MEM_BASE_ADDR_ALIGN => cl_prop::<cl_uint>(0x1000),
> +             CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE => {
> +-                cl_prop::<cl_uint>(size_of::<cl_ulong16>() as cl_uint)
> ++                cl_prop::<cl_uint>(16 * size_of::<cl_ulong>() as cl_uint)
> +             }
> +             CL_DEVICE_NAME => cl_prop::<&str>(&dev.screen().name()),
> +             CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR => cl_prop::<cl_uint>(1),
> +diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
> +index 612e47bfe88e1..1fe75a611444d 100644
> +--- a/src/gallium/frontends/rusticl/meson.build
> ++++ b/src/gallium/frontends/rusticl/meson.build
> +@@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs = rust.bindgen(
> +     '--raw-line', 'unsafe impl std::marker::Send for _cl_image_desc {}',
> +     '--raw-line', 'unsafe impl std::marker::Sync for _cl_image_desc {}',
> +     '--allowlist-type', 'cl_.*',
> ++    '--blocklist-type', '(__)?cl_.*[2348(16)]',
> +     '--allowlist-type', 'cl.*_fn',
> +     '--allowlist-var', 'CL_.*',
> +     # needed for gl_sharing extension
> +--
> +GitLab
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index ecea7e94de8..04dec3fddc8 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,6 +17,8 @@ PE = "2"
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
> +           file://0001-rusticl-meson.build-workaround-for-rusticl-build.patch \
> +           file://93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch \
>  "
>
>  SRC_URI[sha256sum] = "fd077d3104edbe459e2b8597d2757ec065f9bd2d620b8c0b9cc88c2bf9891d02"
> @@ -35,7 +37,7 @@ do_install:append() {
>  }
>
>  DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native python3-pyyaml-native gettext-native"
> -DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
> +DEPENDS:append:class-target = " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ' mesa-native gcc-runtime', '', d)}"
>  EXTRANATIVEPATH += "chrpath-native"
>  PROVIDES = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> @@ -46,7 +48,7 @@ PROVIDES = " \
>      virtual/mesa \
>      "
>
> -inherit meson pkgconfig python3native gettext features_check
> +inherit rust meson pkgconfig python3native gettext features_check
>
>  BBCLASSEXTEND = "native nativesdk"
>
> @@ -73,8 +75,14 @@ EXTRA_OEMESON = " \
>      -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
>  "
>
> -EXTRA_OEMESON:append:class-target:x86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
> -EXTRA_OEMESON:append:class-native:x86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled -Dinstall-intel-clc=true', '', d)}"
> +EXTRA_OEMESON:append:class-target:x86-64 = " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', '-Dintel-clc=system', '', d)}"
> +EXTRA_OEMESON:append:class-native:x86-64 = " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', '-Dintel-clc=enabled -Dinstall-intel-clc=true -Dgallium-rusticl=false', '', d)}"
> +
> +do_configure:prepend() {
> +       sed -i "s|@include@|${STAGING_INCDIR}|" ${S}/src/gallium/frontends/rusticl/meson.build
> +       sed -i "s|@include_cpp@|${STAGING_INCDIR}\/c++\/14.2.0|" ${S}/src/gallium/frontends/rusticl/meson.build
> +       sed -i "s|@include_cpp_target_sys@|${STAGING_INCDIR}\/c++\/14.2.0\/${TARGET_SYS}|" ${S}/src/gallium/frontends/rusticl/meson.build
> +}
>
>  def strip_comma(s):
>      return s.strip(',')
> @@ -104,10 +112,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
>  # Vulkan drivers need dri3 enabled
>  # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
>  VULKAN_DRIVERS = ""
> -VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', ',opencl', ',intel', '', d)},intel_hasvk,amd"
> -VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},intel_hasvk,amd"
> +VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',intel', '', d)},intel_hasvk,amd"
> +VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',intel', '', d)},intel_hasvk,amd"
>  # i686 is a 32 bit override for mesa-native
> -VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},intel_hasvk,amd"
> +VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',intel', '', d)},intel_hasvk,amd"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
> @@ -141,8 +149,10 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>
> -# "opencl" requires libclc from meta-clang
> -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
> +# "opencl-clover" requires libclc from meta-clang
> +PACKAGECONFIG[opencl-clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
> +# "opencl-rusticl" requires libclc, bindgen-cli and clang from meta-clang
> +PACKAGECONFIG[opencl-rusticl] = "-Dgallium-rusticl=true,-Dgallium-rusticl=false,libclc bindgen-cli-native python3-ply-native clang"
>
>  PACKAGECONFIG[broadcom] = ""
>  PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> @@ -164,7 +174,7 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fre
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
>  GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
> -GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',iris', '', d)}"
> +GALLIUMDRIVERS:append ="${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',iris', '', d)}"
>
>  # radeonsi requires LLVM
>  GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
> @@ -239,6 +249,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>               libgles2-mesa libgles2-mesa-dev \
>               libgles3-mesa libgles3-mesa-dev \
>               libopencl-mesa libopencl-mesa-dev \
> +             libopencl-rusticl libopencl-rusticl-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver mesa-vulkan-drivers \
>               mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
> @@ -333,6 +344,7 @@ FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
>  FILES:libgl-mesa = "${libdir}/libGL.so.*"
>  FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
>  FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
> +FILES:libopencl-rusticl = "${libdir}/libRusticlOpenCL.so.* ${sysconfdir}/OpenCL/vendors/rusticl.icd"
>  FILES:libglapi = "${libdir}/libglapi.so.*"
>  FILES:libosmesa = "${libdir}/libOSMesa.so.*"
>  FILES:libxatracker = "${libdir}/libxatracker.so.*"
> @@ -347,6 +359,7 @@ FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/p
>  FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
>  FILES:libgles3-mesa-dev = "${includedir}/GLES3"
>  FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
> +FILES:libopencl-rusticl-dev = "${libdir}/libRusticlOpenCL.so"
>  FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
>  FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
>                            ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206747): https://lists.openembedded.org/g/openembedded-core/message/206747
> Mute This Topic: https://lists.openembedded.org/mt/109411620/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

