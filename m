Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF8DD33A2B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.27959.1730832361288112320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LJn1aQQx;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso4065251a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832360; x=1731437160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFGTtyB0UoXJKfCKm4sPjI3NvpYh9W/Lj62duw7nYvM=;
        b=LJn1aQQxnyxQ7RBjw46NLxTZWgOTvU2EPYwFWa2ww36DbfxcsK3p5UGy+zKHlwOCc9
         hao7L42A8wosCuTnO1Y0l+VhUpvI2LTDkyInafUWiZAhDEzHxc4fMK0T58oYBmhLWjRY
         UYmdbiI8gh3tQKr5YkOAJB9IBvzUplZ+nKAN3zqG0Qk9WS8SBbBOlbL3MMzVBhP18Q8E
         rrV8eniXzBxDd+kqZJlADZxa4XnkpPszs1OmKApXa06wDc4h2cMVH2cIdvzrnHO6jjUD
         JJ0zq+B+r8nj76ylIC1JR5caH1nkl1Ti9WoHhDHWN7DurAaONlLBLdpQcKOB6SBn0i/4
         Q5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832360; x=1731437160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFGTtyB0UoXJKfCKm4sPjI3NvpYh9W/Lj62duw7nYvM=;
        b=lqDsGjxJMKFTy+djRWhZe8SAwdftrzl0V74taXZHxUtvUODNKNm4mOfYtI/+inn4/m
         nKCu6IUuIVvWH7arhnbo7uwimcC2jsHCY4/p7ymHtrh78J9aBzkNVM02U9iQAXLSM7X/
         BKonI1VYahj/dA4FWKVcBxV7KfwQ8OZOfiLX6w6IqWLYbs400ufi37nwjkvsel4Fw6de
         jaNQjl8+BaWsVmgoRZiMOUFdG3vEVqrZZxIYFcU5QUj6ytV62HDtZBhznl8Y9rvecIhi
         /BQDEdWEA3CtPoCgUM7Nit3F9x6D12HSsWfyXxFGYH9Fx23y0Bet6Z1l3sudd8XXBFd5
         TgOg==
X-Gm-Message-State: AOJu0YxMRZ97ODGpOHGjt8nHB8jRlGyHmxzCgflxxDTQziaSVym49y6M
	A7VHHaeU9ItmWYm/Hm3PIiiGojAtGPHT/9NW3In3BkJLyGDzK3IGuAp0kg==
X-Google-Smtp-Source: AGHT+IG3Hu5MhTaanA0xvfoN0Z7Du6yWNI/qw0mB5mUqlq1Ju1Ok6QEWS5oiHD8wxl2BHvdUW2PIZg==
X-Received: by 2002:a17:90b:1350:b0:2e0:9a63:9017 with SMTP id 98e67ed59e1d1-2e94c2e2108mr25169511a91.23.1730832360417;
        Tue, 05 Nov 2024 10:46:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:46:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 19/19] mesa: add support for rusticl
Date: Tue,  5 Nov 2024 10:45:38 -0800
Message-ID: <20241105184540.3450302-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206747

From: Markus Volk <f_l_k@t-online.de>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n.build-workaround-for-rusticl-build.patch | 27 +++++++++++
 ...6da9458c9d0348f2390dc0bea67cf140b1a0.patch | 47 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 33 +++++++++----
 3 files changed, 97 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch
 create mode 100644 meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch b/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch
new file mode 100644
index 00000000000..9c953f961d0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaround-for-rusticl-build.patch
@@ -0,0 +1,27 @@
+From b34ee4014ee9e3466ebafbd53745d9f9a13379da Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 11 Jul 2024 22:52:16 +0200
+Subject: [PATCH] rusticl/meson.build: workaround for rusticl build
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ src/gallium/frontends/rusticl/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
+index eef09d8f01e..efac4cab964 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -211,6 +211,7 @@ rusticl_llvm_bindings_rs = rust.bindgen(
+   c_args : [
+     rusticl_bindgen_c_args,
+     pre_args,
++   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
+   ],
+   dependencies : [
+     dep_clang,
+-- 
+2.45.2
+
diff --git a/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch b/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch
new file mode 100644
index 00000000000..9c5c9c75ffb
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch
@@ -0,0 +1,47 @@
+From 93e96da9458c9d0348f2390dc0bea67cf140b1a0 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Sun, 18 Aug 2024 00:08:50 +0200
+Subject: [PATCH] rusticl: do not use CL vector types in bindings and code
+
+Bindgen seems to miscompile them and I kinda thought I've done this
+already in the past, but apparently not.
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/11722
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30710>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/93e96da9458c9d0348f2390dc0bea67cf140b1a0]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/gallium/frontends/rusticl/api/device.rs | 2 +-
+ src/gallium/frontends/rusticl/meson.build   | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/frontends/rusticl/api/device.rs b/src/gallium/frontends/rusticl/api/device.rs
+index 9793092db5ad4..c1cb7902e0371 100644
+--- a/src/gallium/frontends/rusticl/api/device.rs
++++ b/src/gallium/frontends/rusticl/api/device.rs
+@@ -196,7 +196,7 @@ impl CLInfo<cl_device_info> for cl_device_id {
+             // TODO proper retrival from devices
+             CL_DEVICE_MEM_BASE_ADDR_ALIGN => cl_prop::<cl_uint>(0x1000),
+             CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE => {
+-                cl_prop::<cl_uint>(size_of::<cl_ulong16>() as cl_uint)
++                cl_prop::<cl_uint>(16 * size_of::<cl_ulong>() as cl_uint)
+             }
+             CL_DEVICE_NAME => cl_prop::<&str>(&dev.screen().name()),
+             CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR => cl_prop::<cl_uint>(1),
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
+index 612e47bfe88e1..1fe75a611444d 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs = rust.bindgen(
+     '--raw-line', 'unsafe impl std::marker::Send for _cl_image_desc {}',
+     '--raw-line', 'unsafe impl std::marker::Sync for _cl_image_desc {}',
+     '--allowlist-type', 'cl_.*',
++    '--blocklist-type', '(__)?cl_.*[2348(16)]',
+     '--allowlist-type', 'cl.*_fn',
+     '--allowlist-var', 'CL_.*',
+     # needed for gl_sharing extension
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ecea7e94de8..04dec3fddc8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,8 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
+           file://0001-rusticl-meson.build-workaround-for-rusticl-build.patch \
+           file://93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch \
 "
 
 SRC_URI[sha256sum] = "fd077d3104edbe459e2b8597d2757ec065f9bd2d620b8c0b9cc88c2bf9891d02"
@@ -35,7 +37,7 @@ do_install:append() {
 }
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native python3-pyyaml-native gettext-native"
-DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
+DEPENDS:append:class-target = " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ' mesa-native gcc-runtime', '', d)}"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
@@ -46,7 +48,7 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit meson pkgconfig python3native gettext features_check
+inherit rust meson pkgconfig python3native gettext features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -73,8 +75,14 @@ EXTRA_OEMESON = " \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
 
-EXTRA_OEMESON:append:class-target:x86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
-EXTRA_OEMESON:append:class-native:x86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled -Dinstall-intel-clc=true', '', d)}"
+EXTRA_OEMESON:append:class-target:x86-64 = " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', '-Dintel-clc=system', '', d)}"
+EXTRA_OEMESON:append:class-native:x86-64 = " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', '-Dintel-clc=enabled -Dinstall-intel-clc=true -Dgallium-rusticl=false', '', d)}"
+
+do_configure:prepend() {
+	sed -i "s|@include@|${STAGING_INCDIR}|" ${S}/src/gallium/frontends/rusticl/meson.build
+	sed -i "s|@include_cpp@|${STAGING_INCDIR}\/c++\/14.2.0|" ${S}/src/gallium/frontends/rusticl/meson.build
+	sed -i "s|@include_cpp_target_sys@|${STAGING_INCDIR}\/c++\/14.2.0\/${TARGET_SYS}|" ${S}/src/gallium/frontends/rusticl/meson.build
+}
 
 def strip_comma(s):
     return s.strip(',')
@@ -104,10 +112,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', ',opencl', ',intel', '', d)},intel_hasvk,amd"
-VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},intel_hasvk,amd"
+VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',intel', '', d)},intel_hasvk,amd"
+VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',intel', '', d)},intel_hasvk,amd"
 # i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},intel_hasvk,amd"
+VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',intel', '', d)},intel_hasvk,amd"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
@@ -141,8 +149,10 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" requires libclc from meta-clang
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
+# "opencl-clover" requires libclc from meta-clang
+PACKAGECONFIG[opencl-clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
+# "opencl-rusticl" requires libclc, bindgen-cli and clang from meta-clang
+PACKAGECONFIG[opencl-rusticl] = "-Dgallium-rusticl=true,-Dgallium-rusticl=false,libclc bindgen-cli-native python3-ply-native clang"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
@@ -164,7 +174,7 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fre
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',iris', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',iris', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
@@ -239,6 +249,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
+             libopencl-rusticl libopencl-rusticl-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
@@ -333,6 +344,7 @@ FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-rusticl = "${libdir}/libRusticlOpenCL.so.* ${sysconfdir}/OpenCL/vendors/rusticl.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
@@ -347,6 +359,7 @@ FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/p
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
 FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
+FILES:libopencl-rusticl-dev = "${libdir}/libRusticlOpenCL.so"
 FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \

