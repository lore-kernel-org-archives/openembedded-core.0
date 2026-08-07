Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506A8C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:45:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36763.1786081494525233605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dmPQX+ht;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-480033bdcf4so45625f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 22:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786081493; x=1786686293; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDsXbtZB7HOoNUjjC/lDw3MP7PlugOMWIN1P5gTdr4U=;
        b=dmPQX+htqU3PA1clakJQ7L1wQw7/Ex6AUj/XS4tk2wBl1reDtlCnkLvv3TUcgAmryZ
         4k9dlveaxdzPURp2BGR/X2H6R8ffyRBld+GUE+ox/ia1PYPmvpTm8W0CxXVaYpRzw5bJ
         HkQDAHbmP3q45/GEmD5UCnebEhdces0nHoYss7E7QBNJIw4JNUhgTfOAT9ImZi5cwM71
         1kAJoCSFLaEk8lky0WrvoHKQ8kbkDa7RyfUpDGTPgm6bRjFCd69SO6W3RkZJkoRQXvni
         qqq4/NJEwcCR590cXgOt3sCqCvEpLW4ZQ3qd0SwTuFcC19lkh1mkSQLiBAGHREB++FAI
         hVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081493; x=1786686293;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wDsXbtZB7HOoNUjjC/lDw3MP7PlugOMWIN1P5gTdr4U=;
        b=ruU1Pwm1uGT3HDzOmmipQy3k9O7lD3B5CmcofXAvXc+3yS9vPXxXucx8UQhGOOP9D2
         QRFeA33PrB7hL50rMI4m7dX5QrXd5E00BgKPjeC758S0/NnkVHtd/73yoRnlyXgN+qBr
         5B7xf0ppq3djcZf0GxzY+Zz2wLBUKYoMxRaDIU0cyQGBtUXq96eyyknVyQs08w9GxHi8
         Ztue+0uEV8vniDp4h7AhsuaFFvBBiqVQWlzbA37r3vQYcFw9iLO7D6Gfj8cAeLd1nXBJ
         Tsk4bOIFKE8m4EFCSadGkvgBmdwk3aL5M3DfaH/WKYv6yzW623PetHVXib1ncxW26CJI
         MdUQ==
X-Gm-Message-State: AOJu0YxLfvuUDldD+Zr7KAOFoY70LuPJlkX9wreRW+y1LaVm//5mZ/9h
	hha0T062i+EgmgFz9WVVGbGJ9+fa5RyDDQxg13Uj+dDOTN+9zTe+RfQHSPr4nw==
X-Gm-Gg: AR+sD10f1lLO0zu5yE7Q2xikol6f4nxCME8MyS6pW1kPTsL8TENGhlakTD/fIE0ZIsI
	g/k+FzOTp6WU4R29ryxj4oVZuW8jI4Jbjxr+ds80Uebp2IljMv7BfPt/pMRxXLoAz97VKN+e9+A
	2iIrvFUvKEQsVRnEHzLy/6JiBpDAcKyRPrjLRpN6qtaNaM6pnGDC7Njsi7KIc8IQIWprX08deX2
	+objAIFfIfKAZBFHSw33ZEA8wbGJhx+og1ZlJdv+ST/YJKaqUkoVA4hCDypcGMv4BOzHFj8r0jI
	4L+5wXREdVwquE4iL/Ii09Yi5mwe+yL1G5YuAUJgX43mwGK+XjD2AMxwyB5dH4VNVCf8+M+OcGR
	xZ2fhToy7VNf2d/u9xs5b0tSWPPqndhngh2C1iNIAGgit3mFh4nXK8uNHP+swCp3f4s7lhv7ukj
	ESRzQ/qwmkaTZJoh4ijrGXtVHDzERXmq+63X7/+wU0D1m6PE/P2BBZ1mbuH/TDlSMCcjnS4Sj3N
	RyUX7DL0ziAbqAqrigMmA5eyAnT05WmdWBeFMDhmdk04FJ/MN34d54Fu26neyTRXjegCvdu9bRr
	1/Qz+eNnbMZRmH/wXaPzRutAHjPhubLVBrHz
X-Received: by 2002:a05:6000:4006:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47fec62e675mr29505080f8f.24.1786081492528;
        Thu, 06 Aug 2026 22:44:52 -0700 (PDT)
Received: from 2A0011100124613F533917970D022288.mobile.pool.telekom.hu (2A0011100124613F533917970D022288.mobile.pool.telekom.hu. [2a00:1110:124:613f:5339:1797:d02:2288])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm2743096f8f.18.2026.08.06.22.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:44:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 1/3] mesa: Upgrade to 26.2.0
Date: Fri,  7 Aug 2026 07:44:46 +0200
Message-ID: <20260807054448.1301957-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242981

Release notes:
https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html

Removed upstream patches:
* 0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
* 0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch

Adapted patches:
* 0001-freedreno-don-t-encode-build-path-into-binaries.patch
* 0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...on-t-encode-build-path-into-binaries.patch | 17 +++++---
 ...livm-Fix-armhf-build-against-LLVM-22.patch | 27 -------------
 ...er-jay-fix-GCC-10-case-label-declara.patch | 39 -------------------
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch |  8 ++--
 meta/recipes-graphics/mesa/mesa.inc           |  6 +--
 5 files changed, 17 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 9aa598b2cf..a5e6570af8 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 266f7047df67d500223b66f7eb9d8779be4f4ad1 Mon Sep 17 00:00:00 2001
+From 1ae1feb55885c8ec26ed2ef148fa75c6240d9804 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index e8f01b8..8144a75 100644
+index e8f01b880bc..8144a75bd1c 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
@@ -42,13 +42,18 @@ index e8f01b8..8144a75 100644
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false, disabler : true)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
 diff --git a/src/freedreno/registers/meson.build b/src/freedreno/registers/meson.build
-index f4be681..cd0caaf 100644
+index 9318ce48fe5..8d2b305d202 100644
 --- a/src/freedreno/registers/meson.build
 +++ b/src/freedreno/registers/meson.build
-@@ -43,4 +43,6 @@ if install_fd_decode_tools
-   endforeach
- endif
+@@ -16,6 +16,8 @@ freedreno_copyright = files(copyright_file)
+ 
+ freedreno_xml_header_files = []
  
 +devenv.set('RNN_PATH', meson.current_source_dir())
 +
  subdir('adreno')
+ 
+ foreach f : xml_adreno_files
+-- 
+2.55.0
+
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
deleted file mode 100644
index 32fac20d94..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8db6e909c3a540d31a73b79a0792e927cc2c6e83 Mon Sep 17 00:00:00 2001
-From: Alessandro Astone <ales.astone@gmail.com>
-Date: Sun, 1 Mar 2026 18:14:09 +0100
-Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
-
-StringMapIterator<bool> became StringMapIterBase<bool, false /* IsConst */>;
-Use `auto` to handle either case.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40161]
-Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index ce8ca02..86779f0 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
-       llvm::sys::getHostCPUFeatures(features);
-    #endif
- 
--   for (llvm::StringMapIterator<bool> f = features.begin();
-+   for (auto f = features.begin();
-         f != features.end();
-         ++f) {
-       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
deleted file mode 100644
index 8fb73d978f..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e41dee25f266d434e39af66e216a945f0085533b Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Tue, 16 Jun 2026 09:12:34 +0000
-Subject: [PATCH] src/intel/compiler/jay: fix GCC 10 case label declaration
- error
-
-GCC 10 (and earlier) does not allow a variable declaration immediately
-after a case label, because a label must be followed by a statement.
-
-  error: a label can only be part of a statement and a declaration is not a statement
-
-Wrap the case block for JAY_OPCODE_DESWIZZLE_ODD in braces to make the
-declaration a valid statement inside the block.
-
-Upstream-Status: Inappropriate [yocto host distro requirements]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- src/intel/compiler/jay/jay_to_binary.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/intel/compiler/jay/jay_to_binary.c b/src/intel/compiler/jay/jay_to_binary.c
-index 62b9576..a0a9498 100644
---- a/src/intel/compiler/jay/jay_to_binary.c
-+++ b/src/intel/compiler/jay/jay_to_binary.c
-@@ -362,11 +362,12 @@ emit(struct brw_codegen *p,
-       brw_BFN(p, dst, SRC(0), SRC(1), SRC(2), brw_imm_ud(jay_bfn_ctrl(I)));
-       break;
- 
--   case JAY_OPCODE_DESWIZZLE_ODD:
-+   case JAY_OPCODE_DESWIZZLE_ODD: {
-       bool hi = simd_offs ? true : jay_deswizzle_odd_src2_hi(I);
-       brw_MOV(p, dst,
-               byte_offset(to_brw_reg(f, I, simd_offs, 0, false), hi ? 64 : 0));
-       break;
-+   }
- 
-    case JAY_OPCODE_DESWIZZLE_EVEN:
-       brw_set_default_exec_size(p, BRW_EXECUTE_16);
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 2513b0324b..72b6d10b0f 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -16,7 +16,7 @@ diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
 index 8307044..abf175a 100644
 --- a/src/intel/compiler/jay/jay_ir.h
 +++ b/src/intel/compiler/jay/jay_ir.h
-@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
+@@ -518,7 +518,7 @@ jay_type_is_any_float(enum jay_type t)
     return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
  }
  
@@ -25,12 +25,12 @@ index 8307044..abf175a 100644
     /** No predication. */
     JAY_NOT_PREDICATED = 0,
  
-@@ -634,7 +634,7 @@ typedef struct jay_inst {
+@@ -592,7 +592,7 @@ typedef struct jay_inst {
     bool decrement_dep:1;
-    unsigned padding  :12;
+    uint8_t padding   :1;
  
 -   enum jay_predication predication;
 +   uint8_t predication;
-    enum jay_conditional_mod conditional_mod;
+    gen_condition conditional_mod;
  
     jay_def cond_flag; /**< conditional flag */
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cbf67e50ce..01981de968 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,14 +17,12 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
            file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
-           file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606"
-PV = "26.1.6"
+SRC_URI[sha256sum] = "efd4bb08cdb7c365a812cd4e6c9202ab55b2f22cdcd13c7d6c4f9647b799a4ef"
+PV = "26.2.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.55.0


