Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF51C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3662.1787303405450794324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJqpecZz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso6306085e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303404; x=1787908204; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9dLTO8pW9n3x0U+sJ2AN98oEhOroj58HdpQmXgo/x0=;
        b=NJqpecZzKyXFNQf+74asMataa/g21/quBBCMU+z44cFAWkUc4ecgYp10IjpIMZMzQQ
         887UuG7brez8I5JQvKVSbn/GrogygZK4rndoJNW4xa2Ha7HH/SkhdMgkOv50Nj44//Y5
         W067HTNn699LwqdLYhqQgTcv0S/VD/4WyXQG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303404; x=1787908204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9dLTO8pW9n3x0U+sJ2AN98oEhOroj58HdpQmXgo/x0=;
        b=Uo4KCQB42y6OICjRrya7EL4VDIptGynJ6lpfsyf/LJXMgFTlGU/q0RgJKkQ/1L0reu
         7ncFDPP0Wm5G5z/hlpwM0AUhwVEWuCAmCo48NFTeuPxIcn3pmcZFLyELX2Sqj50kPudt
         hEt2c6uyMx82SdPZ0bxEoOnEIIg1cVhH1I/Iryoz9bAHQ+Ym7M2gnVcQn3cLuC7eG1t8
         P4uQojFAbMi23EgV0rWRwmBdvVPX4Pz7J7jDAeFB9T65EsFp85X6s3L+zgA61+s8MS3e
         2Ya8l/3eZJfa0gnWfvtgVWaDpUQLZs+vu8p7nYTuEKHEdKID6DKHx6FGtyQ8JuZJmGHC
         e6gw==
X-Gm-Message-State: AOJu0Ywg3jsR+Z1wh1SVz4FtVAX6tqgf/axEGOOIm4AffQaFyaARhrrQ
	TCJlsE5JxS+5mao3RhDtqP9bR5PTGVyM6bo9SCFKxWTG7f6ed2XzfSUeTZ+4x81vCp2h5wdLW71
	GOxBHnDY=
X-Gm-Gg: AR+sD13nuvWXZvyae7AdfneUBp/vcfX7uGYzyXBtlyenKLpaRfT5eqWQNTj26gz5gkj
	bcWd9W0tMcD6y+Xg81mxuQc+ZoTjYf1KzTasRo7nWsP+1v21an0mRlJ5A3YEhqFFxWU4+SQ0lHE
	jxkyuYUEliJ+swnfrxyiYL6E6CySQCo/VdIctjZDTsrVWSaMnD9nzBSEtVwtiWRFpKYN2B1wymE
	hGrH2mKzFLYdUxudc6WXNdVyza/BozNqcmCLGVHl0r2fPk0D3phEqiVPOJOZO6MSrI6zwUe7tQs
	5scYKhXDVERJNA0AD8BYUx6m2yNRzwPkxKySpORgUdnJAb+FnF3vrhHyEqaN4wH1f3S6xgBr6kZ
	mxzL77NDwGzRIIo4gxt7o6zfA847SslLQP4iFmF3OrKwZ1OKQPSNQ0hdBacmNy7aoxmAg2o7NgY
	xlhO+yT3bO2KVY7cI9lTui+M0Fi3+UV0qdegoujyUz6bChEMUkMLjJnHCF7RFzVRqalcXbyq9HS
	KlDeupk9AM7XXyd3rllKsfeciogqw==
X-Received: by 2002:a05:600c:a087:b0:499:86ce:465e with SMTP id 5b1f17b1804b1-499b8324b09mr81885235e9.4.1787303403610;
        Fri, 21 Aug 2026 02:10:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] mesa: upgrade 26.2.0 -> 26.2.1
Date: Fri, 21 Aug 2026 10:09:54 +0100
Message-ID: <20260821090959.3859632-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
References: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243910

https://docs.mesa3d.org/relnotes/26.2.1.html

New features

    None

Bug fixes

    RadeonSI VA-API: vertical color discontinuity / split on YouTube (AV1/VP9) with RX 7900 XTX
    Recording on AMD GPU using gpu-screen-recorder with VAAPI H.264 backend produces corrupted output since Mesa 26.0.0
    Regression: HEVC hardware decoding (VA-API) fails with “invalid UVD command 5!” on Stoney Ridge (amdgpu) in Mesa 26+
    V3D driver (Mesa) does not expose GL_EXT_shader_texture_lod, breaking raspberry Pi5 WebGL in Firefox (e.g. Google Maps with Street View)
    Witchfire - black artifacts
    [ANV][BMG] llama.cpp Flaky unit test results with latest Mesaï» on Arc B70 (Regression)
    [NVK/Kepler] NAK compiler panic in assign_regs.rs: “Failed to find free register” when launching wgpu application (Zed)
    [RADV] Insurgency Sandstorm - black Z-fighting geometry
    [meson] rust crate downloading for subbprojects blocked
    [radv] Anisotropic filtering glitch in Wolfenstein II: The New Colossus
    i915 GPU hang on Alder Lake-HX GT1 (8086:4688) with Mesa 26.2.0 OpenGL — works on 26.1.6
    radeonsi/VCN: HEVC VAAPI encode corrupts P-frames on Van Gogh (gfx1033) since Mesa 26.0 — I-frames and H.264 unaffected
    radeonsi: black screen in picom after ae36b9e3459766a953fe6318545463f9a773d119
    radeonsi: null-deref in validate_io() during glUseProgramStages on separable, SPIR-V-ingested program pipeline
    radv: vkCopyMemoryToImage segmentation fault with block-compressed formats when memoryRowLength is non-zero
    tu/anv: pDependencyInfos dereferenced as a single pointer instead of an array in CmdWaitEvents2
    tu: assertions in tu_formats.cc: Assertion `fmt.fmt != FMT6_NONE’ failed

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...lib-avoid-builtin_cpu_supports-for-avx2-detecti.patch | 9 ++++-----
 ...freedreno-don-t-encode-build-path-into-binaries.patch | 9 +++------
 ...01-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 ...ntel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 4 ++--
 ...til-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                      | 4 ++--
 6 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index 7234f76b397..07a4f66af8a 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,3 +1,4 @@
+From 539870cc9dc54989c588f9a6bcf71f19f3ca45f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
@@ -16,8 +17,8 @@ entirely and works with both GCC and Clang.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43820]
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- src/amd/addrlib/src/core/addrswizzlersimd.h | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
+ src/amd/addrlib/src/core/addrswizzlersimd.h | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/src/amd/addrlib/src/core/addrswizzlersimd.h b/src/amd/addrlib/src/core/addrswizzlersimd.h
 index fd53e40..ce30204 100644
@@ -31,7 +32,7 @@ index fd53e40..ce30204 100644
 +#include <cpuid.h>
  #endif
  #include <immintrin.h>
-
+ 
 @@ -85,7 +87,18 @@ static inline bool CpuSupportsAvx2() {
  #if _MSC_VER
      return IsProcessorFeaturePresent(PF_AVX2_INSTRUCTIONS_AVAILABLE);
@@ -52,5 +53,3 @@ index fd53e40..ce30204 100644
  #else
  #error "What platform is this?"
  #endif
---
-2.43.0
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index a5e6570af85..590851f6f1d 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 1ae1feb55885c8ec26ed2ef148fa75c6240d9804 Mon Sep 17 00:00:00 2001
+From ea7f29215915d3e08111b4ed489defedc0f30c8b Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index e8f01b880bc..8144a75bd1c 100644
+index e8f01b8..8144a75 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
@@ -42,7 +42,7 @@ index e8f01b880bc..8144a75bd1c 100644
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false, disabler : true)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
 diff --git a/src/freedreno/registers/meson.build b/src/freedreno/registers/meson.build
-index 9318ce48fe5..8d2b305d202 100644
+index 9318ce4..8d2b305 100644
 --- a/src/freedreno/registers/meson.build
 +++ b/src/freedreno/registers/meson.build
 @@ -16,6 +16,8 @@ freedreno_copyright = files(copyright_file)
@@ -54,6 +54,3 @@ index 9318ce48fe5..8d2b305d202 100644
  subdir('adreno')
  
  foreach f : xml_adreno_files
--- 
-2.55.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 5d90bb2319f..9d148ed46bf 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 1217bf10e7c79f8e7f716fae8f7ac2f2211c35d2 Mon Sep 17 00:00:00 2001
+From 82b7419010da29c7d2e1968a369f3682bc1010ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 72b6d10b0f6..4a4836b6bf7 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 43090e97a7c586a682eb845442191236f3963242 Mon Sep 17 00:00:00 2001
+From 26b14d36b941b7839d13f82d12a8ca569b718235 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
-index 8307044..abf175a 100644
+index 3b819cb..34b8877 100644
 --- a/src/intel/compiler/jay/jay_ir.h
 +++ b/src/intel/compiler/jay/jay_ir.h
 @@ -518,7 +518,7 @@ jay_type_is_any_float(enum jay_type t)
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index 55c9c6e1d08..801c872c71f 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 2e41d846e6da26e73418d31b782f6b65eca48c45 Mon Sep 17 00:00:00 2001
+From 425aa8da2249c01f852fade871721e5e2f25555f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8ee7db50edd..7a3e0a26c61 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            "
 
-SRC_URI[sha256sum] = "efd4bb08cdb7c365a812cd4e6c9202ab55b2f22cdcd13c7d6c4f9647b799a4ef"
-PV = "26.2.0"
+SRC_URI[sha256sum] = "c47e81bddc4760360a41ac3c5acec38acb81f9d750ecef47e7f3adc7021a4442"
+PV = "26.2.1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

