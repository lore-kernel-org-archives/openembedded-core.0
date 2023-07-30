Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0797BC04A94
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.77633.1690740087027167521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HGdU9f8Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68336d06620so3821381b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740086; x=1691344886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qIPm35JUU6y0T8URTY6s/NfhzjouvCjcr68qVTHNtU=;
        b=HGdU9f8Q8perbgLh7BHT0NVzKFVxd+FzxoJPiGE/ZoAJsIBof2U6vhC9yoM8+tFuYj
         RpPmCOWJ5YgDAVapPqroOiQfTHpuIJB3jU7wrdJ2QX5+OVVdS5O8k9ERlfbWuyWxTLJ0
         KxkvjZyroKeG9170+A7VGNWpkDQQUId4UH7U3N1HuC77ERBH0eaCjzWr4CeRpttROJyL
         MyBzeZWLuPpjkAavHUoptucJFK012ll9TbYFxXixHIghK3fhqQ6hIJbhYsyRBEY3uuBx
         A9eKHNRxAlGzKZRaF0Kzu4tlmpcMipvyTjzdClHyG9VwLGOQL7kLvyY9XxnSwvHDwuvd
         HYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740086; x=1691344886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qIPm35JUU6y0T8URTY6s/NfhzjouvCjcr68qVTHNtU=;
        b=Ofd39RVVddcgZiQhOH6TuGZ9JnBJN14dTrDeGCViXoFepyryayAtEs+5PB+LDe9fzy
         XKS6n+VyIH115A7PyVplenYCFA+mivE6phgPdwOCzCaxEoKtRz2dIIZc1KGg3M0G5ia+
         bMZNEwttmDN9kmsFCrYxmHLnkkm9mL2si6tw4zJSzscVjZE12GcE9ZMv2gdHfPRiBaHW
         nMq5qa9dkAUxX1/uLg/r9+NTS0k1nYu9GIDuFvFfhTBtWoaYZq9CbBqXS6rWTSCS9EC/
         yGGHjIe5vMToCh5wFcE8fBJr3tLWcLiAHdTOM+voNBN6TG/YyCfN3c8koYRgFruhRzFh
         dQkA==
X-Gm-Message-State: ABy/qLayRtPJzbLZvPO5cri0VIHjVCdwyT3bRDoGzSvzrTs/dSv7hrZa
	CrReSBlO2cCV4hhJeD3zjOZVIX5Ned/5eXdmXXAfTQ==
X-Google-Smtp-Source: APBJJlFwDIpjavYIHc3DjQh9S7W3jciZieuWyzUWshE9f7+f2eYThxPWOZAyIaWuRjG/FLuL9cXCeg==
X-Received: by 2002:a05:6a20:549a:b0:13c:ca8b:7e29 with SMTP id i26-20020a056a20549a00b0013cca8b7e29mr8467880pzk.12.1690740085440;
        Sun, 30 Jul 2023 11:01:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/30] gcc : upgrade to v11.4
Date: Sun, 30 Jul 2023 08:00:37 -1000
Message-Id: <de9c30e986d3144a5858cca1f18a1df3e939c0be.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185092

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

gcc stable version upgraded from v11.3 to v11.4

For changes in v11.4 see - https://gcc.gnu.org/gcc-11/changes.html

Below is the bug fix list for v11.4
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&order=short_desc%2Cbug_status%2Cpriority%2Cassigned_to%2Cbug_id&query_format=advanced&resolution=FIXED&target_milestone=11.4

There are a total 115 bugs are fixed in this release, below is the list of bugs fixed excluding the regression fixes.

ID	Product	Comp	    Resolution	Summary▲
108199	gcc	tree-opt	FIXE	Bitfields, unions and SRA and storage_order_attribute
107801	gcc	libstdc+	FIXE	Building cross compiler for H8 family fails in libstdc++ (c++17/memory_resource.cc)
108265	gcc	libstdc+	FIXE	chrono::hh_mm_ss can't be constructed from unsigned durations
104443	gcc	libstdc+	FIXE	common_iterator<I, S>::operator-> is not correctly implemented
98056	gcc	c++		FIXE	coroutines: ICE tree check: expected record_type or union_type or qual_union_type, have array_type since r11-2183-g0f66b8486cea8668
107061	gcc	target		FIXE	ENCODEKEY128 clobbers xmm4-xmm6
105433	gcc	testsuit	FIXE	FAIL: gcc.target/i386/iamcu/test_3_element_struct_and_unions.c
105095	gcc	testsuit	FIXE	gcc.dg/vect/complex/fast-math-complex-* tests are not executed
100474	gcc	c++		FIXE	ICE: in diagnose_trait_expr, at cp/constraint.cc:3706
105854	gcc	target		FIXE	ICE: in extract_constrain_insn, at recog.cc:2692 (insn does not satisfy its constraints: sse2_lshrv1ti3)
104462	gcc	target		FIXE	ICE: in extract_constrain_insn_cached, at recog.cc:2682 with -mavx512fp16 -mno-xsave
106045	gcc	libgomp		FIXE	Incorrect testcase in libgomp.c/target-31.c at -O0
56189	gcc	c++		FIXE	Infinite recursion with noexcept when instantiating function template
100295	gcc	c++		FIXE	Internal compiler error from generic lambda capturing parameter pack and expanding it in if constexpr
100613	gcc	jit		FIXE	libgccjit should produce dylib on macOS
104875	gcc	libstdc+	FIXE	libstdc++-v3/src/c++11/codecvt.cc:312:24: warning: left shift count >= width of type
107471	gcc	libstdc+	FIXE	mismatching constraints in common_iterator
105284	gcc	libstdc+	FIXE	missing syncstream and spanstream forward decl. in <iosfwd>
98821	gcc	c++		FIXE	modules : c++tools configures with CC but code fragments assume CXX.
109846	gcc	fortran		FIXE	Pointer-valued function reference rejected as actual argument
101324	gcc	target		FIXE	powerpc64le: hashst appears before mflr at -O1 or higher
102479	gcc	c++		FIXE	segfault when deducing class template arguments for tuple with libc++-14
105128	gcc	libstdc+	FIXE	source_location compile error for latest clang 15
106183	gcc	libstdc+	FIXE	std::atomic::wait might fail to be unblocked by notify_one/all on platforms without platform_wait()
102994	gcc	libstdc+	FIXE	std::atomic<ptr>::wait is not marked const
105324	gcc	libstdc+	FIXE	std::from_chars() assertion at floating_from_chars.cc:78 when parsing 1.11111111....
105375	gcc	libstdc+	FIXE	std::packaged_task has no deduction guide.
104602	gcc	libstdc+	FIXE	std::source_location::current uses cast from void*
106808	gcc	libstdc+	FIXE	std::string_view range concept requirement causes compile error with Boost.Filesystem
105725	gcc	c++		FIXE	[ICE] segfault with `-Wmismatched-tags`
105920	gcc	target		FIXE	__builtin_cpu_supports ("f16c") should check AVX

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-11.3.inc => gcc-11.4.inc}        |   6 +-
 ...ian_11.3.bb => gcc-cross-canadian_11.4.bb} |   0
 .../{gcc-cross_11.3.bb => gcc-cross_11.4.bb}  |   0
 ...-crosssdk_11.3.bb => gcc-crosssdk_11.4.bb} |   0
 ...cc-runtime_11.3.bb => gcc-runtime_11.4.bb} |   0
 ...itizers_11.3.bb => gcc-sanitizers_11.4.bb} |   0
 ...{gcc-source_11.3.bb => gcc-source_11.4.bb} |   0
 ...rch64-Update-Neoverse-N2-core-defini.patch |  20 ++--
 ...rm-add-armv9-a-architecture-to-march.patch |  54 +++++-----
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 102 +++++++++---------
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 .../gcc/{gcc_11.3.bb => gcc_11.4.bb}          |   0
 ...initial_11.3.bb => libgcc-initial_11.4.bb} |   0
 .../gcc/{libgcc_11.3.bb => libgcc_11.4.bb}    |   0
 ...ibgfortran_11.3.bb => libgfortran_11.4.bb} |   0
 16 files changed, 93 insertions(+), 97 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.3.inc => gcc-11.4.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.3.bb => gcc-cross-canadian_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.3.bb => gcc-cross_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.3.bb => gcc-crosssdk_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.3.bb => gcc-runtime_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.3.bb => gcc-sanitizers_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.3.bb => gcc-source_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_11.3.bb => gcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.3.bb => libgcc-initial_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.3.bb => libgcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.3.bb => libgfortran_11.4.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1d5e070223..bfc14951fe 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -189,7 +189,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-11.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-11.4.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.4.inc
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-11.3.inc
rename to meta/recipes-devtools/gcc/gcc-11.4.inc
index ab2ece3cce..a907661df4 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.4.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "11.3.0"
+PV = "11.4.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "11.3.0"
+BINV = "11.4.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -70,7 +70,7 @@ SRC_URI = "\
 	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
 "
 
-SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
+SRC_URI[sha256sum] = "3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb2055ee72c1402cea73a8dd9"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.3.bb b/meta/recipes-devtools/gcc/gcc-cross_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_11.3.bb b/meta/recipes-devtools/gcc/gcc-source_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
index 8429242348..a0c9db72e1 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
@@ -19,24 +19,20 @@ diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-c
 index 4643e0e27..3478e567a 100644
 --- a/gcc/config/aarch64/aarch64-cores.def
 +++ b/gcc/config/aarch64/aarch64-cores.def
-@@ -145,9 +145,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cortexa57, 8_4A,  AARCH64_FL_FOR
- /* Qualcomm ('Q') cores. */
- AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -1)
- 
--/* Armv8.5-A Architecture Processors.  */
+@@ -147,7 +147,6 @@
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
+
+ /* Armv8.5-A Architecture Processors.  */
 -AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
--
+ AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
+
  /* ARMv8-A big.LITTLE implementations.  */
- 
- AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
-@@ -163,4 +160,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cortexa55, cortexa53, 8_2A,  AAR
+@@ -165,4 +164,7 @@
  /* Armv8-R Architecture Processors.  */
  AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARCH8_R, cortexa53, 0x41, 0xd15, -1)
- 
+
 +/* Armv9-A Architecture Processors. */
 +AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0xd49, -1)
 +
  #undef AARCH64_CORE
--- 
-2.32.0
 
diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
index 864c8b3017..b9b0988d5a 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
@@ -43,10 +43,10 @@ Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
  gcc/testsuite/lib/target-supports.exp     |  3 ++-
  9 files changed, 79 insertions(+), 8 deletions(-)
 
-Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
+Index: gcc/gcc/config/arm/arm-cpus.in
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/arm-cpus.in
-+++ gcc-11.3.0/gcc/config/arm/arm-cpus.in
+--- a/gcc/config/arm/arm-cpus.in
++++ b/gcc/config/arm/arm-cpus.in
 @@ -132,6 +132,9 @@ define feature cmse
  # Architecture rel 8.1-M.
  define feature armv8_1m_main
@@ -87,10 +87,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
  begin arch iwmmxt
   tune for iwmmxt
   tune flags LDSCHED STRONG XSCALE
-Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
+Index: gcc/gcc/config/arm/arm-tables.opt
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/arm-tables.opt
-+++ gcc-11.3.0/gcc/config/arm/arm-tables.opt
+--- a/gcc/config/arm/arm-tables.opt
++++ b/gcc/config/arm/arm-tables.opt
 @@ -380,10 +380,13 @@ EnumValue
  Enum(arm_arch) String(armv8.1-m.main) Value(30)
  
@@ -107,10 +107,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
  
  Enum
  Name(arm_fpu) Type(enum fpu_type)
-Index: gcc-11.3.0/gcc/config/arm/arm.h
+Index: gcc/gcc/config/arm/arm.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/arm.h
-+++ gcc-11.3.0/gcc/config/arm/arm.h
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
 @@ -456,7 +456,8 @@ enum base_architecture
    BASE_ARCH_8A = 8,
    BASE_ARCH_8M_BASE = 8,
@@ -121,10 +121,10 @@ Index: gcc-11.3.0/gcc/config/arm/arm.h
  };
  
  /* The major revision number of the ARM Architecture implemented by the target.  */
-Index: gcc-11.3.0/gcc/config/arm/t-aprofile
+Index: gcc/gcc/config/arm/t-aprofile
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/t-aprofile
-+++ gcc-11.3.0/gcc/config/arm/t-aprofile
+--- a/gcc/config/arm/t-aprofile
++++ b/gcc/config/arm/t-aprofile
 @@ -26,8 +26,8 @@
  
  # Arch and FPU variants to build libraries with
@@ -180,10 +180,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-aprofile
 -			     $(foreach ARCH, armv7-a armv8-a, \
 +			     $(foreach ARCH, armv7-a armv8-a armv9-a, \
  			       mthumb/march.$(ARCH)/mfloat-abi.soft=m$(MODE)/march.$(ARCH)/mfloat-abi.softfp))
-Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
+Index: gcc/gcc/config/arm/t-arm-elf
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/t-arm-elf
-+++ gcc-11.3.0/gcc/config/arm/t-arm-elf
+--- a/gcc/config/arm/t-arm-elf
++++ b/gcc/config/arm/t-arm-elf
 @@ -38,6 +38,8 @@ v7ve_fps	:= vfpv3-d16 vfpv3 vfpv3-d16-fp
  # it seems to work ok.
  v8_fps		:= simd fp16 crypto fp16+crypto dotprod fp16fml
@@ -214,10 +214,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
  MULTILIB_MATCHES     += $(foreach ARCH, armv7e-m armv8-m.mainline, \
  			  march?armv7+fp=march?$(ARCH)+fp.dp)
  
-Index: gcc-11.3.0/gcc/config/arm/t-multilib
+Index: gcc/gcc/config/arm/t-multilib
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/t-multilib
-+++ gcc-11.3.0/gcc/config/arm/t-multilib
+--- a/gcc/config/arm/t-multilib
++++ b/gcc/config/arm/t-multilib
 @@ -78,6 +78,8 @@ v8_4_a_simd_variants	:= $(call all_feat_
  v8_5_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
  v8_6_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
@@ -244,10 +244,10 @@ Index: gcc-11.3.0/gcc/config/arm/t-multilib
  endif		# Not APROFILE.
  
  # Use Thumb libraries for everything.
-Index: gcc-11.3.0/gcc/doc/invoke.texi
+Index: gcc/gcc/doc/invoke.texi
 ===================================================================
---- gcc-11.3.0.orig/gcc/doc/invoke.texi
-+++ gcc-11.3.0/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
 @@ -19701,6 +19701,7 @@ Permissible names are:
  @samp{armv7-m}, @samp{armv7e-m},
  @samp{armv8-m.base}, @samp{armv8-m.main},
@@ -256,10 +256,10 @@ Index: gcc-11.3.0/gcc/doc/invoke.texi
  @samp{iwmmxt} and @samp{iwmmxt2}.
  
  Additionally, the following architectures, which lack support for the
-Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
+Index: gcc/gcc/testsuite/gcc.target/arm/multilib.exp
 ===================================================================
---- gcc-11.3.0.orig/gcc/testsuite/gcc.target/arm/multilib.exp
-+++ gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
+--- a/gcc/testsuite/gcc.target/arm/multilib.exp
++++ b/gcc/testsuite/gcc.target/arm/multilib.exp
 @@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
  	{-march=armv8.6-a+simd+fp16 -mfloat-abi=softfp} "thumb/v8-a+simd/softfp"
  	{-march=armv8.6-a+simd+fp16+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
@@ -275,10 +275,10 @@ Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
  	{-mcpu=cortex-a53+crypto -mfloat-abi=hard} "thumb/v8-a+simd/hard"
  	{-mcpu=cortex-a53+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
  	{-march=armv8-a+crc -mfloat-abi=hard -mfpu=vfp} "thumb/v8-a+simd/hard"
-Index: gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
+Index: gcc/gcc/testsuite/lib/target-supports.exp
 ===================================================================
---- gcc-11.3.0.orig/gcc/testsuite/lib/target-supports.exp
-+++ gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
 @@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
  	v8m_base "-march=armv8-m.base -mthumb -mfloat-abi=soft"
  		__ARM_ARCH_8M_BASE__
diff --git a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index b3515c9734..ece5873258 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -39,10 +39,10 @@ Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
  gcc/config/sparc/linux64.h         |  4 ++--
  17 files changed, 53 insertions(+), 58 deletions(-)
 
-Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
+Index: gcc/gcc/config/aarch64/aarch64-linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/aarch64/aarch64-linux.h
-+++ gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
  #ifndef GCC_AARCH64_LINUX_H
  #define GCC_AARCH64_LINUX_H
@@ -56,10 +56,10 @@ Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
  
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
-Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
+Index: gcc/gcc/config/alpha/linux-elf.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/alpha/linux-elf.h
-+++ gcc-11.3.0/gcc/config/alpha/linux-elf.h
+--- a/gcc/config/alpha/linux-elf.h
++++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
  #define EXTRA_SPECS \
  { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
@@ -71,10 +71,10 @@ Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+Index: gcc/gcc/config/arm/linux-eabi.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
-+++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
  
@@ -95,10 +95,10 @@ Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
  
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
-Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
+Index: gcc/gcc/config/arm/linux-elf.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/linux-elf.h
-+++ gcc-11.3.0/gcc/config/arm/linux-elf.h
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
  
  #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
@@ -108,10 +108,10 @@ Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-Index: gcc-11.3.0/gcc/config/i386/linux.h
+Index: gcc/gcc/config/i386/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/i386/linux.h
-+++ gcc-11.3.0/gcc/config/i386/linux.h
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
  <http://www.gnu.org/licenses/>.  */
  
@@ -122,10 +122,10 @@ Index: gcc-11.3.0/gcc/config/i386/linux.h
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
-Index: gcc-11.3.0/gcc/config/i386/linux64.h
+Index: gcc/gcc/config/i386/linux64.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/i386/linux64.h
-+++ gcc-11.3.0/gcc/config/i386/linux64.h
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
 @@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
@@ -146,10 +146,10 @@ Index: gcc-11.3.0/gcc/config/i386/linux64.h
  #undef MUSL_DYNAMIC_LINKERX32
 -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
-Index: gcc-11.3.0/gcc/config/linux.h
+Index: gcc/gcc/config/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/linux.h
-+++ gcc-11.3.0/gcc/config/linux.h
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTI
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
@@ -165,10 +165,10 @@ Index: gcc-11.3.0/gcc/config/linux.h
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-Index: gcc-11.3.0/gcc/config/microblaze/linux.h
+Index: gcc/gcc/config/microblaze/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/microblaze/linux.h
-+++ gcc-11.3.0/gcc/config/microblaze/linux.h
+--- a/gcc/config/microblaze/linux.h
++++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
  #undef TLS_NEEDS_GOT
  #define TLS_NEEDS_GOT 1
@@ -187,10 +187,10 @@ Index: gcc-11.3.0/gcc/config/microblaze/linux.h
  
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
-Index: gcc-11.3.0/gcc/config/mips/linux.h
+Index: gcc/gcc/config/mips/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/mips/linux.h
-+++ gcc-11.3.0/gcc/config/mips/linux.h
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
 @@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
@@ -230,10 +230,10 @@ Index: gcc-11.3.0/gcc/config/mips/linux.h
  
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
-Index: gcc-11.3.0/gcc/config/nios2/linux.h
+Index: gcc/gcc/config/nios2/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/nios2/linux.h
-+++ gcc-11.3.0/gcc/config/nios2/linux.h
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
 @@ -29,7 +29,7 @@
  #undef CPP_SPEC
  #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
@@ -243,10 +243,10 @@ Index: gcc-11.3.0/gcc/config/nios2/linux.h
  
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
-Index: gcc-11.3.0/gcc/config/riscv/linux.h
+Index: gcc/gcc/config/riscv/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/riscv/linux.h
-+++ gcc-11.3.0/gcc/config/riscv/linux.h
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
      GNU_USER_TARGET_OS_CPP_BUILTINS();				\
    } while (0)
@@ -265,10 +265,10 @@ Index: gcc-11.3.0/gcc/config/riscv/linux.h
  
  /* Because RISC-V only has word-sized atomics, it requries libatomic where
     others do not.  So link libatomic by default, as needed.  */
-Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
+Index: gcc/gcc/config/rs6000/linux64.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/rs6000/linux64.h
-+++ gcc-11.3.0/gcc/config/rs6000/linux64.h
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
 @@ -336,24 +336,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
@@ -299,10 +299,10 @@ Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
+Index: gcc/gcc/config/rs6000/sysv4.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/rs6000/sysv4.h
-+++ gcc-11.3.0/gcc/config/rs6000/sysv4.h
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
 @@ -780,10 +780,10 @@ GNU_USER_TARGET_CC1_SPEC
  
  #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
@@ -316,10 +316,10 @@ Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
  
  #ifndef GNU_USER_DYNAMIC_LINKER
  #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
-Index: gcc-11.3.0/gcc/config/s390/linux.h
+Index: gcc/gcc/config/s390/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/s390/linux.h
-+++ gcc-11.3.0/gcc/config/s390/linux.h
+--- a/gcc/config/s390/linux.h
++++ b/gcc/config/s390/linux.h
 @@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
  #define MULTILIB_DEFAULTS { "m31" }
  #endif
@@ -338,10 +338,10 @@ Index: gcc-11.3.0/gcc/config/s390/linux.h
  
  #undef  LINK_SPEC
  #define LINK_SPEC \
-Index: gcc-11.3.0/gcc/config/sh/linux.h
+Index: gcc/gcc/config/sh/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/sh/linux.h
-+++ gcc-11.3.0/gcc/config/sh/linux.h
+--- a/gcc/config/sh/linux.h
++++ b/gcc/config/sh/linux.h
 @@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
  
  #undef MUSL_DYNAMIC_LINKER
@@ -355,10 +355,10 @@ Index: gcc-11.3.0/gcc/config/sh/linux.h
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-Index: gcc-11.3.0/gcc/config/sparc/linux.h
+Index: gcc/gcc/config/sparc/linux.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/sparc/linux.h
-+++ gcc-11.3.0/gcc/config/sparc/linux.h
+--- a/gcc/config/sparc/linux.h
++++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
     When the -shared link option is used a final link is not being
     done.  */
@@ -368,10 +368,10 @@ Index: gcc-11.3.0/gcc/config/sparc/linux.h
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-Index: gcc-11.3.0/gcc/config/sparc/linux64.h
+Index: gcc/gcc/config/sparc/linux64.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/sparc/linux64.h
-+++ gcc-11.3.0/gcc/config/sparc/linux64.h
+--- a/gcc/config/sparc/linux64.h
++++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
     When the -shared link option is used a final link is not being
     done.  */
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 0f94936140..1ec942e977 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -18,10 +18,10 @@ Upstream-Status: Pending
  gcc/config/arm/linux-eabi.h | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
-Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+Index: gcc/gcc/config/arm/linux-eabi.h
 ===================================================================
---- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
-+++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
    SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
diff --git a/meta/recipes-devtools/gcc/gcc_11.3.bb b/meta/recipes-devtools/gcc/gcc_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_11.3.bb
rename to meta/recipes-devtools/gcc/gcc_11.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_11.3.bb b/meta/recipes-devtools/gcc/libgcc_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_11.3.bb
rename to meta/recipes-devtools/gcc/libgcc_11.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_11.3.bb b/meta/recipes-devtools/gcc/libgfortran_11.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_11.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.4.bb
-- 
2.34.1


