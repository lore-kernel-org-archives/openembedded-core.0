Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB48C54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:22:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1044.1785565364904922175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KouGLIwf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso7046825e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785565363; x=1786170163; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf7ywW/DgT1MiqWu2UrnhEN6Wc4D0bK46xvIqa1zKHI=;
        b=KouGLIwfn/QUQlT/zs+jBedCvcmkEaDkFDOqLm9RTkQjXNbwLPRor+T3/t5iKNrukk
         sxXKLyMC3ZxYiXthJWXYG8vzhzsw+HyRv+rAK+QpsDDZkTXXKdmrJxwuezqzWOvzpOh1
         /B9paMKKxM13HcHoEs3Lc9TJPfroHbM79fx5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785565363; x=1786170163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mf7ywW/DgT1MiqWu2UrnhEN6Wc4D0bK46xvIqa1zKHI=;
        b=i+ApS6CpY2w/sGGRb4nNdhv0I+mhoUeKWDiMama8wS/+6mq7uM1/jh1p9bzTVdZq+s
         AO+AMZxrT847knWU/6QM+NKxHw1vb+Rkryv2/Gj7FoahqcXjTNcbJqxpWz4BrhGI/yP+
         Mo6bvJR3JggmGRAo6OmgBQd1fFt495mCmilVE+YaYONFlaM4xMqhcpJBXwgSL154Cvva
         kIQBc6T486ROy7fcc15h3pEAyGcdPB4CZQFvbYI+6t4ZcEUeHC3XJVFGkYDtTkTuBO2f
         AVoF9Imlme4KyZcx4qgBXWFfNSA5BhLEL7qgmN6jKGr7OpJiDxW/65HeIMBlIzdAWVoS
         mwug==
X-Gm-Message-State: AOJu0YxPFDisyo0TX1drSoNZ5sUZ05i7RjUAK6c0TJHTF6WU19Lvjb7a
	XD0TPSOyGWU6hMSgGIV9WmxJKrXFxTRhWFd3ReSXFbaFK9ogxVP9TLI3w1CNH+QStg6WfdR0Sj/
	R5TdSUfI=
X-Gm-Gg: AR+sD127T/HCNR/yMWpGyrINuFD5BmHKSrQK7vgmUjx8CzZr2dpuqnh7Z6nocqyxbfI
	r7IemY91XqEsQ2jkNu5t3IxJnnuyrVNBtDOn/mDzvmaaDuafXNudn380ElvO/ySvRQAiaKYYJUK
	jSA4AebRNcznSwExknzGsPFwY/LNxcfNVRTpz25GztCmT268VnSMCfuITaHGZQl+J1wrh9lnqP2
	FQV5moRqmRV9BR+EmNlyoTTpU1yzbKh+Mpxx8UX3J6fqPqEr31mhXmhqiaYUAX8umZSc4TrUugw
	IJl0mSFekXvi8alwCMUPhVZdHNde90WJZQrd7/tjH44v1t25w6nxq7rtndnrtWw6vF9CFVhN0Y4
	zJ/mCSIxZT+BxvVp0aJGCqO7UnDp8phnj7lFSWqryrHWOiBRL7LosPlCeDPIuMINFLdQFqVv9/r
	HafvlD6fVmeI4jat5nVgpVeumujNAZTA+NvAbgZLnbv5riwb1/vM2OL1dVqjCLuldpWi6vQtNWc
	o8elN4EA1LwvPmlDg==
X-Received: by 2002:a05:600c:8b14:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4980c66c94bmr19145545e9.4.1785565362955;
        Fri, 31 Jul 2026 23:22:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm13921262f8f.0.2026.07.31.23.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:22:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] mesa: upgrade 26.1.5 -> 26.1.6
Date: Sat,  1 Aug 2026 07:22:34 +0100
Message-ID: <20260801062235.2497102-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
References: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242473

Mesa 26.1.6 Release Notes / 2026-07-29

Bug fixes

-   Ambient occlusion is broken in The Chronicles of Riddick - Assault on Dark Athena
-   Blockland crashes when shader quality turned up
-   Doom Eternal - Page Fault - somewhat reproducable. (RX9070)
-   Horizon Forbidden West misrendred lighting effects on BMG
-   Regression. VTK polydata. gl_PrimitiveID requires explicit geometry shader with versions 25.3.6 and later.
-   [ANV][PTL] - Horizon: Forbidden West regression in shader quirk
-   [VAOn12] Thread safety issues
-   [amdgpu] Little Inferno rendering issues starting with Mesa 21.1
-   [radeonsi] eglinfo ‘libEGL warning: failed to get driver name for fd -1’
-   anv: bottom-of-pipe timestamp latched before vkCmdDispatch completes (Arc B390 / Panther Lake, Mesa 26.1.4), breaking wgpu compute-pass timings
-   anv: cooperative matrix loads from shared memory return the wrong tile on Arc B390 (Xe3/PTL), matmul results are wrong
-   radeonsi/VCN: AV1/HEVC encode reports a coded size larger than the coded buffer, client segfaults reading the mapped buffer
-   radv: acceleration structure update (refit) of AABB geometry loses intersection candidates (NAVI32, Mesa 26.1.4)
-   segfault v3d raspberry Pi5 h265 hw decoding / regression mesa 26.1.3/26.1.4
-   vulkan/runtime: GetPipelineBinaryDataKHR incorrectly assumes `pPipelineBinaryDataSize` must be 0 initialized

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../0001-gallivm-Fix-armhf-build-against-LLVM-22.patch    | 4 ++--
 ...001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 ...intel-compiler-jay-fix-GCC-10-case-label-declara.patch | 5 +----
 ...intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 5 +----
 ...util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 8 ++++----
 meta/recipes-graphics/mesa/mesa.inc                       | 4 ++--
 7 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f4..9aa598b2cf7 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From 266f7047df67d500223b66f7eb9d8779be4f4ad1 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index a4bfd33..330b646 100644
+index e8f01b8..8144a75 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
index 065dd373a7b..32fac20d949 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From 8db6e909c3a540d31a73b79a0792e927cc2c6e83 Mon Sep 17 00:00:00 2001
 From: Alessandro Astone <ales.astone@gmail.com>
 Date: Sun, 1 Mar 2026 18:14:09 +0100
 Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
@@ -13,7 +13,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index d3ad342..c95d86e 100644
+index ce8ca02..86779f0 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 @@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index b039ac213ea..5d90bb2319f 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From 1217bf10e7c79f8e7f716fae8f7ac2f2211c35d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
index b8b87189798..8fb73d978fd 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
@@ -1,4 +1,4 @@
-From 0b4b577b7fc926d374234c80267a4bf9dcccb7ef Mon Sep 17 00:00:00 2001
+From e41dee25f266d434e39af66e216a945f0085533b Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Tue, 16 Jun 2026 09:12:34 +0000
 Subject: [PATCH] src/intel/compiler/jay: fix GCC 10 case label declaration
@@ -37,6 +37,3 @@ index 62b9576..a0a9498 100644
  
     case JAY_OPCODE_DESWIZZLE_EVEN:
        brw_set_default_exec_size(p, BRW_EXECUTE_16);
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 904b20d4400..2513b0324b8 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 3adae0d97f655c2991d5b428a3bc95a972e6228b Mon Sep 17 00:00:00 2001
+From 43090e97a7c586a682eb845442191236f3963242 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
@@ -34,6 +34,3 @@ index 8307044..abf175a 100644
     enum jay_conditional_mod conditional_mod;
  
     jay_def cond_flag; /**< conditional flag */
--- 
-2.47.3
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index be79e29e420..55c9c6e1d08 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 013717829278f02b0815d80a423e05e4bd567ae3 Mon Sep 17 00:00:00 2001
+From 2e41d846e6da26e73418d31b782f6b65eca48c45 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/util/u_math.c b/src/util/u_math.c
-index 337baa9..9ad03bf 100644
+index 722eac7..8bcfefa 100644
 --- a/src/util/u_math.c
 +++ b/src/util/u_math.c
-@@ -86,7 +86,7 @@ util_fpstate_get(void)
+@@ -90,7 +90,7 @@ util_fpstate_get(void)
     if (util_get_cpu_caps()->has_neon) {
  #ifdef HAVE___BUILTIN_ARM_GET_FPSCR
        fpstate = __builtin_arm_get_fpscr();
@@ -23,7 +23,7 @@ index 337baa9..9ad03bf 100644
        __asm__ volatile("vmrs %0, fpscr" : "=r"(fpstate));
  #endif
     }
-@@ -151,7 +151,7 @@ util_fpstate_set(unsigned fpstate)
+@@ -157,7 +157,7 @@ util_fpstate_set(unsigned fpstate)
     if (util_get_cpu_caps()->has_neon) {
  #ifdef HAVE___BUILTIN_ARM_SET_FPSCR
        __builtin_arm_set_fpscr(fpstate);
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15d56c804dc..cbf67e50ce0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122"
-PV = "26.1.5"
+SRC_URI[sha256sum] = "5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606"
+PV = "26.1.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

