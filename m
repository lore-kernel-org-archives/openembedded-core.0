Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0540C54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.33723.1674440510838867656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XeJHRd4d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id c85so7746570pfc.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9khNSTFMu8ErdBesuUiGi6dGQXZi4/2BIzMTc5Vftrg=;
        b=XeJHRd4dUB3R4qn6YtiQ/30SULeppGY8+Xo2eL0Wlp40TjuWPFv6I8XxVSQ1nPhTQj
         G15CzjN5sJqdsU98hBLbwA4iaDBiKb6S0qIqWa+dCzvIogG1uo2zxkK+OyQn0ykiBSI8
         VkzHOQVQOzdZPz/Sfw+qir4eQIRWFrBUwM4TyN5m5rmDzY11cxBGIssZlEIN5Ki7IQjc
         t/PZ1IECk1oNF9CZemr7rAd2FAPD8MzFAJGpHMrpdiV0RGsXfuKiDTmvipuLfi3BloMU
         tBjbra5lWvZk3DhN11POYi04IBHVQTEt/dwNx8lsUDEK2g6Z2xXPGKBbeixq36mGMlqS
         RhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9khNSTFMu8ErdBesuUiGi6dGQXZi4/2BIzMTc5Vftrg=;
        b=eJKwuNUT+hxmSJyGsFkzitXW5FZCTEwfxrwsFA1s/hBtCCJKMTFeohiu1HWUqQ6fXX
         uwX3u6V7IBKp8+iNtJFrzKeHya+CBQlj6n0s8jhs2Y958OLJ0UBjyZGcXz8T9cLVPIIB
         l8fC4lVJ1kgT5JCT7oBBCXTg/aKq++CrD+ZlZhXj89igFL58KfpyfgwhhQo9U/Y2TK4m
         /nIKI6lG2AXQlcgaYg1xOO3weOoWjqknTmHOeXLcwCC3UY+TZ6VMp9tVuSL3IYvjd16b
         Qk1ZBjDpFu0lNE7CJvjjSDtaAdJdNMsTpyIVwV5No8UWubybmgDZ1DkW5/IjD7kMH8lt
         0Xjw==
X-Gm-Message-State: AFqh2koIT3KY3R0ZBnfmENloBqlrqXvKO0PzNXIOIGyDMssr9+y/8z8M
	iJrJXreIzedt2EP5ewUe0Covj3/vCO/lnjLjfQ4=
X-Google-Smtp-Source: AMrXdXuUlL77lusFyKq+vJuuNQw9ec7yas6eIq3hSUQkzaPNRS8fsxI+CIS3hnMuSobPrhknv3ITsg==
X-Received: by 2002:a62:ea0e:0:b0:577:d10d:6eab with SMTP id t14-20020a62ea0e000000b00577d10d6eabmr24314818pfh.21.1674440541419;
        Sun, 22 Jan 2023 18:22:21 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/32] gcc: Refactor linker patches and fix linker on arm with usrmerge
Date: Sun, 22 Jan 2023 16:21:13 -1000
Message-Id: <d821a602c56a8d0c8171ee0d2ce31613121be3a6.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176283

From: Pavel Zhukov <pavel@zhukoff.net>

Backport fix from master to allow gcc to use proper linker path for
musl [Yocto #14977].

Fixes:
| qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or directory

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 -
 ...rm-add-armv9-a-architecture-to-march.patch |  89 +++---
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++++++++-----
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  10 +-
 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 --
 5 files changed, 245 insertions(+), 149 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index 27074a06ae..ab2ece3cce 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -48,7 +48,6 @@ SRC_URI = "\
            file://0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
            file://0017-handle-sysroot-support-for-nativesdk-gcc.patch \
            file://0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
            file://0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
            file://0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0022-sync-gcc-stddef.h-with-musl.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
index c38d1b9119..864c8b3017 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
@@ -43,10 +43,10 @@ Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
  gcc/testsuite/lib/target-supports.exp     |  3 ++-
  9 files changed, 79 insertions(+), 8 deletions(-)
 
-diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
-index bcc9ebe9f..58d83829c 100644
---- a/gcc/config/arm/arm-cpus.in
-+++ b/gcc/config/arm/arm-cpus.in
+Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/arm-cpus.in
++++ gcc-11.3.0/gcc/config/arm/arm-cpus.in
 @@ -132,6 +132,9 @@ define feature cmse
  # Architecture rel 8.1-M.
  define feature armv8_1m_main
@@ -57,7 +57,7 @@ index bcc9ebe9f..58d83829c 100644
  # Floating point and Neon extensions.
  # VFPv1 is not supported in GCC.
  
-@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 cmse tdiv
+@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 c
  define fgroup ARMv8m_main ARMv7m armv8 cmse
  define fgroup ARMv8r      ARMv8a
  define fgroup ARMv8_1m_main ARMv8m_main armv8_1m_main
@@ -87,10 +87,10 @@ index bcc9ebe9f..58d83829c 100644
  begin arch iwmmxt
   tune for iwmmxt
   tune flags LDSCHED STRONG XSCALE
-diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
-index 5692d4fb7..ae3dd9414 100644
---- a/gcc/config/arm/arm-tables.opt
-+++ b/gcc/config/arm/arm-tables.opt
+Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/arm-tables.opt
++++ gcc-11.3.0/gcc/config/arm/arm-tables.opt
 @@ -380,10 +380,13 @@ EnumValue
  Enum(arm_arch) String(armv8.1-m.main) Value(30)
  
@@ -107,10 +107,10 @@ index 5692d4fb7..ae3dd9414 100644
  
  Enum
  Name(arm_fpu) Type(enum fpu_type)
-diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
-index 47c13a9e5..088c7725c 100644
---- a/gcc/config/arm/arm.h
-+++ b/gcc/config/arm/arm.h
+Index: gcc-11.3.0/gcc/config/arm/arm.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/arm.h
++++ gcc-11.3.0/gcc/config/arm/arm.h
 @@ -456,7 +456,8 @@ enum base_architecture
    BASE_ARCH_8A = 8,
    BASE_ARCH_8M_BASE = 8,
@@ -121,10 +121,10 @@ index 47c13a9e5..088c7725c 100644
  };
  
  /* The major revision number of the ARM Architecture implemented by the target.  */
-diff --git a/gcc/config/arm/t-aprofile b/gcc/config/arm/t-aprofile
-index 8574ac3e2..68e2251c7 100644
---- a/gcc/config/arm/t-aprofile
-+++ b/gcc/config/arm/t-aprofile
+Index: gcc-11.3.0/gcc/config/arm/t-aprofile
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/t-aprofile
++++ gcc-11.3.0/gcc/config/arm/t-aprofile
 @@ -26,8 +26,8 @@
  
  # Arch and FPU variants to build libraries with
@@ -136,7 +136,7 @@ index 8574ac3e2..68e2251c7 100644
  
  # ARMv7-A - build nofp, fp-d16 and SIMD variants
  
-@@ -46,6 +46,11 @@ MULTILIB_REQUIRED	+= mthumb/march=armv8-a/mfloat-abi=soft
+@@ -46,6 +46,11 @@ MULTILIB_REQUIRED	+= mthumb/march=armv8-
  MULTILIB_REQUIRED	+= mthumb/march=armv8-a+simd/mfloat-abi=hard
  MULTILIB_REQUIRED	+= mthumb/march=armv8-a+simd/mfloat-abi=softfp
  
@@ -148,7 +148,7 @@ index 8574ac3e2..68e2251c7 100644
  # Matches
  
  # Arch Matches
-@@ -129,17 +134,29 @@ MULTILIB_MATCHES	+= march?armv8-a=march?armv8.6-a
+@@ -129,17 +134,29 @@ MULTILIB_MATCHES	+= march?armv8-a=march?
  MULTILIB_MATCHES	+= $(foreach ARCH, $(v8_6_a_simd_variants), \
  			     march?armv8-a+simd=march?armv8.6-a$(ARCH))
  
@@ -180,11 +180,11 @@ index 8574ac3e2..68e2251c7 100644
 -			     $(foreach ARCH, armv7-a armv8-a, \
 +			     $(foreach ARCH, armv7-a armv8-a armv9-a, \
  			       mthumb/march.$(ARCH)/mfloat-abi.soft=m$(MODE)/march.$(ARCH)/mfloat-abi.softfp))
-diff --git a/gcc/config/arm/t-arm-elf b/gcc/config/arm/t-arm-elf
-index d68def308..b3a900e8c 100644
---- a/gcc/config/arm/t-arm-elf
-+++ b/gcc/config/arm/t-arm-elf
-@@ -38,6 +38,8 @@ v7ve_fps	:= vfpv3-d16 vfpv3 vfpv3-d16-fp16 vfpv3-fp16 vfpv4 neon \
+Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/t-arm-elf
++++ gcc-11.3.0/gcc/config/arm/t-arm-elf
+@@ -38,6 +38,8 @@ v7ve_fps	:= vfpv3-d16 vfpv3 vfpv3-d16-fp
  # it seems to work ok.
  v8_fps		:= simd fp16 crypto fp16+crypto dotprod fp16fml
  
@@ -202,7 +202,7 @@ index d68def308..b3a900e8c 100644
  # No floating point variants, require thumb1 softfp
  all_nofp_t	:= armv6-m armv6s-m armv8-m.base
  
-@@ -110,6 +114,11 @@ MULTILIB_MATCHES     += $(foreach ARCH, $(all_v8_archs), \
+@@ -110,6 +114,11 @@ MULTILIB_MATCHES     += $(foreach ARCH,
  			  $(foreach FPARCH, $(v8_fps), \
  			    march?armv7+fp=march?$(ARCH)+$(FPARCH)))
  
@@ -214,11 +214,11 @@ index d68def308..b3a900e8c 100644
  MULTILIB_MATCHES     += $(foreach ARCH, armv7e-m armv8-m.mainline, \
  			  march?armv7+fp=march?$(ARCH)+fp.dp)
  
-diff --git a/gcc/config/arm/t-multilib b/gcc/config/arm/t-multilib
-index ddc5033bf..d789b86ee 100644
---- a/gcc/config/arm/t-multilib
-+++ b/gcc/config/arm/t-multilib
-@@ -78,6 +78,8 @@ v8_4_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+Index: gcc-11.3.0/gcc/config/arm/t-multilib
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/t-multilib
++++ gcc-11.3.0/gcc/config/arm/t-multilib
+@@ -78,6 +78,8 @@ v8_4_a_simd_variants	:= $(call all_feat_
  v8_5_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
  v8_6_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
  v8_r_nosimd_variants	:= +crc
@@ -227,7 +227,7 @@ index ddc5033bf..d789b86ee 100644
  
  ifneq (,$(HAS_APROFILE))
  include $(srcdir)/config/arm/t-aprofile
-@@ -202,6 +204,16 @@ MULTILIB_MATCHES	+= march?armv7=march?armv8.6-a
+@@ -202,6 +204,16 @@ MULTILIB_MATCHES	+= march?armv7=march?ar
  MULTILIB_MATCHES	+= $(foreach ARCH, $(v8_6_a_simd_variants), \
  			     march?armv7+fp=march?armv8.6-a$(ARCH))
  
@@ -244,10 +244,10 @@ index ddc5033bf..d789b86ee 100644
  endif		# Not APROFILE.
  
  # Use Thumb libraries for everything.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 7184a62d0..9a712c0d6 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
+Index: gcc-11.3.0/gcc/doc/invoke.texi
+===================================================================
+--- gcc-11.3.0.orig/gcc/doc/invoke.texi
++++ gcc-11.3.0/gcc/doc/invoke.texi
 @@ -19701,6 +19701,7 @@ Permissible names are:
  @samp{armv7-m}, @samp{armv7e-m},
  @samp{armv8-m.base}, @samp{armv8-m.main},
@@ -256,10 +256,10 @@ index 7184a62d0..9a712c0d6 100644
  @samp{iwmmxt} and @samp{iwmmxt2}.
  
  Additionally, the following architectures, which lack support for the
-diff --git a/gcc/testsuite/gcc.target/arm/multilib.exp b/gcc/testsuite/gcc.target/arm/multilib.exp
-index 4b30025db..e3f06c316 100644
---- a/gcc/testsuite/gcc.target/arm/multilib.exp
-+++ b/gcc/testsuite/gcc.target/arm/multilib.exp
+Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
+===================================================================
+--- gcc-11.3.0.orig/gcc/testsuite/gcc.target/arm/multilib.exp
++++ gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
 @@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
  	{-march=armv8.6-a+simd+fp16 -mfloat-abi=softfp} "thumb/v8-a+simd/softfp"
  	{-march=armv8.6-a+simd+fp16+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
@@ -275,10 +275,10 @@ index 4b30025db..e3f06c316 100644
  	{-mcpu=cortex-a53+crypto -mfloat-abi=hard} "thumb/v8-a+simd/hard"
  	{-mcpu=cortex-a53+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
  	{-march=armv8-a+crc -mfloat-abi=hard -mfpu=vfp} "thumb/v8-a+simd/hard"
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index 857e57218..52e043917 100644
---- a/gcc/testsuite/lib/target-supports.exp
-+++ b/gcc/testsuite/lib/target-supports.exp
+Index: gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
+===================================================================
+--- gcc-11.3.0.orig/gcc/testsuite/lib/target-supports.exp
++++ gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
 @@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
  	v8m_base "-march=armv8-m.base -mthumb -mfloat-abi=soft"
  		__ARM_ARCH_8M_BASE__
@@ -289,6 +289,3 @@ index 857e57218..52e043917 100644
      eval [string map [list FUNC $armfunc FLAG $armflag DEFS $armdefs ] {
  	proc check_effective_target_arm_arch_FUNC_ok { } {
  	    return [check_no_compiler_messages arm_arch_FUNC_ok assembly {
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index ef19eef822..b3515c9734 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001
+From 4de00af67b57b5440bdf61ab364ad959ad0aeee7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -12,28 +12,37 @@ SH, sparc, alpha for possible future support (if any)
 
 Removes the do_headerfix task in metadata
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Refresh patch from master to deduplicate patches and fix arm linker
+Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
 ---
  gcc/config/aarch64/aarch64-linux.h |  4 ++--
  gcc/config/alpha/linux-elf.h       |  4 ++--
- gcc/config/arm/linux-eabi.h        |  4 ++--
+ gcc/config/arm/linux-eabi.h        |  6 +++---
  gcc/config/arm/linux-elf.h         |  2 +-
- gcc/config/i386/linux.h            |  2 +-
- gcc/config/i386/linux64.h          |  6 +++---
+ gcc/config/i386/linux.h            |  4 ++--
+ gcc/config/i386/linux64.h          | 12 ++++++------
  gcc/config/linux.h                 |  8 ++++----
- gcc/config/mips/linux.h            | 12 ++++++------
- gcc/config/riscv/linux.h           |  2 +-
+ gcc/config/microblaze/linux.h      |  4 ++--
+ gcc/config/mips/linux.h            | 18 +++++++++---------
+ gcc/config/nios2/linux.h           |  4 ++--
+ gcc/config/riscv/linux.h           |  4 ++--
  gcc/config/rs6000/linux64.h        | 15 +++++----------
- gcc/config/sh/linux.h              |  2 +-
+ gcc/config/rs6000/sysv4.h          |  4 ++--
+ gcc/config/s390/linux.h            |  8 ++++----
+ gcc/config/sh/linux.h              |  4 ++--
  gcc/config/sparc/linux.h           |  2 +-
  gcc/config/sparc/linux64.h         |  4 ++--
- 13 files changed, 31 insertions(+), 36 deletions(-)
+ 17 files changed, 53 insertions(+), 58 deletions(-)
 
-diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 7f2529a2a1d..4bcae7f3110 100644
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
+Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/aarch64/aarch64-linux.h
++++ gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
  #ifndef GCC_AARCH64_LINUX_H
  #define GCC_AARCH64_LINUX_H
@@ -47,11 +56,11 @@ index 7f2529a2a1d..4bcae7f3110 100644
  
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
-diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index c1dae8ca2cf..3ce2b76c1a4 100644
---- a/gcc/config/alpha/linux-elf.h
-+++ b/gcc/config/alpha/linux-elf.h
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/alpha/linux-elf.h
++++ gcc-11.3.0/gcc/config/alpha/linux-elf.h
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
  #define EXTRA_SPECS \
  { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
  
@@ -62,10 +71,10 @@ index c1dae8ca2cf..3ce2b76c1a4 100644
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 85d0136e76e..6bd95855827 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
+Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
  
@@ -77,10 +86,19 @@ index 85d0136e76e..6bd95855827 100644
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 0c1c4e70b6b..6bd643ade11 100644
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
+@@ -89,7 +89,7 @@
+ #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
+ #endif
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+ 
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/linux-elf.h
++++ gcc-11.3.0/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
  
  #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
@@ -90,11 +108,11 @@ index 0c1c4e70b6b..6bd643ade11 100644
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 04b274f1654..7aafcf3ac2d 100644
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-11.3.0/gcc/config/i386/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/i386/linux.h
++++ gcc-11.3.0/gcc/config/i386/linux.h
+@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
  <http://www.gnu.org/licenses/>.  */
  
  #define GNU_USER_LINK_EMULATION "elf_i386"
@@ -102,12 +120,13 @@ index 04b274f1654..7aafcf3ac2d 100644
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
  
  #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index b3822ced528..92d303e80d6 100644
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
-@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
+Index: gcc-11.3.0/gcc/config/i386/linux64.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/i386/linux64.h
++++ gcc-11.3.0/gcc/config/i386/linux64.h
+@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
  
@@ -119,12 +138,19 @@ index b3822ced528..92d303e80d6 100644
 +#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
  
  #undef MUSL_DYNAMIC_LINKER32
- #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 4e1db60fced..87efc5f69fe 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
+ #undef MUSL_DYNAMIC_LINKERX32
+-#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
+Index: gcc-11.3.0/gcc/config/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/linux.h
++++ gcc-11.3.0/gcc/config/linux.h
+@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTI
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
     supporting both 32-bit and 64-bit compilation.  */
@@ -139,11 +165,33 @@ index 4e1db60fced..87efc5f69fe 100644
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 44a85e410d9..8d41b5574f6 100644
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-11.3.0/gcc/config/microblaze/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/microblaze/linux.h
++++ gcc-11.3.0/gcc/config/microblaze/linux.h
+@@ -28,7 +28,7 @@
+ #undef TLS_NEEDS_GOT
+ #define TLS_NEEDS_GOT 1
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+ 
+ #if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
+@@ -38,7 +38,7 @@
+ #endif
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
+ 
+ #undef  SUBTARGET_EXTRA_SPECS
+ #define SUBTARGET_EXTRA_SPECS \
+Index: gcc-11.3.0/gcc/config/mips/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/mips/linux.h
++++ gcc-11.3.0/gcc/config/mips/linux.h
+@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
  #define GLIBC_DYNAMIC_LINKER32 \
@@ -170,11 +218,36 @@ index 44a85e410d9..8d41b5574f6 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index fce5b896e6e..03aa55cb5ab 100644
---- a/gcc/config/riscv/linux.h
-+++ b/gcc/config/riscv/linux.h
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
+-  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+ #define MUSL_DYNAMIC_LINKER64 \
+-  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ #define MUSL_DYNAMIC_LINKERN32 \
+-  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ 
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+Index: gcc-11.3.0/gcc/config/nios2/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/nios2/linux.h
++++ gcc-11.3.0/gcc/config/nios2/linux.h
+@@ -29,7 +29,7 @@
+ #undef CPP_SPEC
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
+Index: gcc-11.3.0/gcc/config/riscv/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/riscv/linux.h
++++ gcc-11.3.0/gcc/config/riscv/linux.h
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
      GNU_USER_TARGET_OS_CPP_BUILTINS();				\
    } while (0)
  
@@ -183,10 +256,19 @@ index fce5b896e6e..03aa55cb5ab 100644
  
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index e3f2cd254f6..a11e01faa3d 100644
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
+@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.
+   "%{mabi=lp64d:}"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
+ 
+ /* Because RISC-V only has word-sized atomics, it requries libatomic where
+    others do not.  So link libatomic by default, as needed.  */
+Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/rs6000/linux64.h
++++ gcc-11.3.0/gcc/config/rs6000/linux64.h
 @@ -336,24 +336,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
@@ -217,12 +299,55 @@ index e3f2cd254f6..a11e01faa3d 100644
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index 7558d2f7195..3aaa6c3a078 100644
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
-@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
-   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
+Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/rs6000/sysv4.h
++++ gcc-11.3.0/gcc/config/rs6000/sysv4.h
+@@ -780,10 +780,10 @@ GNU_USER_TARGET_CC1_SPEC
+ 
+ #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ 
+ #ifndef GNU_USER_DYNAMIC_LINKER
+ #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
+Index: gcc-11.3.0/gcc/config/s390/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/s390/linux.h
++++ gcc-11.3.0/gcc/config/s390/linux.h
+@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
+ #define MULTILIB_DEFAULTS { "m31" }
+ #endif
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib/ld64.so.1"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-s390.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-s390.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-s390x.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-s390x.so.1"
+ 
+ #undef  LINK_SPEC
+ #define LINK_SPEC \
+Index: gcc-11.3.0/gcc/config/sh/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/sh/linux.h
++++ gcc-11.3.0/gcc/config/sh/linux.h
+@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
++  SYSTEMLIBS_DIR "ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
    "%{mfdpic:-fdpic}.so.1"
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
@@ -230,11 +355,11 @@ index 7558d2f7195..3aaa6c3a078 100644
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 2550d7ee8f0..a94f4cd8ba2 100644
---- a/gcc/config/sparc/linux.h
-+++ b/gcc/config/sparc/linux.h
-@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+Index: gcc-11.3.0/gcc/config/sparc/linux.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/sparc/linux.h
++++ gcc-11.3.0/gcc/config/sparc/linux.h
+@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -243,11 +368,11 @@ index 2550d7ee8f0..a94f4cd8ba2 100644
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 95af8afa9b5..63127afb074 100644
---- a/gcc/config/sparc/linux64.h
-+++ b/gcc/config/sparc/linux64.h
-@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-11.3.0/gcc/config/sparc/linux64.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/sparc/linux64.h
++++ gcc-11.3.0/gcc/config/sparc/linux64.h
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
     When the -shared link option is used a final link is not being
     done.  */
  
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index ac139542f1..0f94936140 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -18,13 +18,13 @@ Upstream-Status: Pending
  gcc/config/arm/linux-eabi.h | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 6bd95855827..77befab5da8 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
+Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
-   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+   SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
  
 +/* For armv4 we pass --fix-v4bx to linker to support EABI */
 +#undef TARGET_FIX_V4BX_SPEC
diff --git a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
deleted file mode 100644
index 76ebfd7f77..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97]
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/nios2/linux.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 08edf1521f6..15696d86241 100644
---- a/gcc/config/nios2/linux.h
-+++ b/gcc/config/nios2/linux.h
-@@ -30,6 +30,7 @@
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
- 
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
-- 
2.25.1


