Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E9EC6FA90
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:19:02 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.20060.1664133539090878329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xtI0l4GJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d82so4727011pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=XqWnD5tO4Co+LFmNSECkeB997jpSwpoZTT000mw366U=;
        b=xtI0l4GJ1XYEzpymxkR0ttwPvpo/dJujn9x/vJWySjEobGA7B2SmXM2PC4bdA+cte3
         6X3IPozKXG7X5pq8GGIHOemMn22k5MBF3bz5GtGcvd8lZAaCjaXQPxr2zHI+3n+FTbai
         CLZW1KGainszJC8aektfN8MmXP2f2pfNh2xznMBvBoahEr0E3pOqVzjZP8FHT48xZldR
         NBLkoQTgGJp9YuiFPQ+bFOFy+VX5novKj47e8h4ZO0kjdBRFJsWtwfNG0FW0UeSO8wF4
         9RNcAbL5r4ZPzliZa97EkYCtAA48cHp3zEwfDMHveI9rlOpnEQxSNeU5A/u4XTOE8m3k
         aPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XqWnD5tO4Co+LFmNSECkeB997jpSwpoZTT000mw366U=;
        b=z6VhGcPvT5ePsW8s6ruOei+0oF7mTHeGGnG+II64VTHjhtXGBdCyFl6SH2iddduGdo
         b/f3cwLtfc7et8eVatNkA2z9UxLX4X8u/8hxzu/f5D4a34pVqXPcbrLs00aF27uQ+2GC
         lu19OG/GRPaucUMmKrHomOjjxg40HagzX2+WqtuL0uhHm9sqvY6U19Pp9EueAFbPF7HE
         kc6e/qwNAKeGKrxPzNf4KI/6Y3j8mtscLNC1r5i8zQkplitl74D2TIje/WpKPjFmHEwC
         X6HYKd8KEOh4jB1Y0ba8wGyn/iZ14XJyb7t9pcU/B8met3rCI04Sm0+GDnyjqZkzHN9f
         /W/A==
X-Gm-Message-State: ACrzQf0/dp9ENd8CCZ+Nt8Gxd49ugTh83zemPjybJDhib5YO7lVcRetb
	DxU+QyA/bVIcpEENWXAXDYvcRpIC1ziAQMJa
X-Google-Smtp-Source: 
 AMsMyM49jNAIyKgFoPO4QuvQk1vQ3qQzpLSUU8Vxc8/cLVcVwzIUA5WK8lDh2g2/rDUf9Rj7fk0QDQ==
X-Received: by 2002:a63:1c13:0:b0:43b:f037:9d98 with SMTP id
 c19-20020a631c13000000b0043bf0379d98mr16959984pgc.454.1664133537701;
        Sun, 25 Sep 2022 12:18:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/33] gcc: add arm-v9 support
Date: Sun, 25 Sep 2022 09:17:41 -1000
Message-Id: 
 <450639bf4b46b963480b2ab4efe72e443d0524b3.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171044

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

Backport some patches from GCC 12 to support arm-v9.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   5 +
 ...rch64-Update-Neoverse-N2-core-defini.patch |  42 +++
 .../0002-aarch64-add-armv9-a-to-march.patch   |  89 ++++++
 ...le-FP16-feature-by-default-for-Armv9.patch |  38 +++
 ...rm-add-armv9-a-architecture-to-march.patch | 294 ++++++++++++++++++
 5 files changed, 468 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index 2cebeb2bc8..27074a06ae 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -65,7 +65,12 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+	   file://0001-aarch64-Update-Neoverse-N2-core-defini.patch \
+	   file://0002-aarch64-add-armv9-a-to-march.patch \
+	   file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
+	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
 "
+
 SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
new file mode 100644
index 0000000000..8429242348
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
@@ -0,0 +1,42 @@
+From 9f37d31324f89d0b7b2abac988a976d121ae29c6 Mon Sep 17 00:00:00 2001
+From: Andre Vieira <andre.simoesdiasvieira@arm.com>
+Date: Thu, 8 Sep 2022 06:02:18 +0000
+Subject: [PATCH 1/4] aarch64: Update Neoverse N2 core definition
+
+commit 9f37d31324f89d0b7b2abac988a976d121ae29c6 from upstream.
+
+gcc/ChangeLog:
+
+        * config/aarch64/aarch64-cores.def: Update Neoverse N2 core entry.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64-cores.def | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
+index 4643e0e27..3478e567a 100644
+--- a/gcc/config/aarch64/aarch64-cores.def
++++ b/gcc/config/aarch64/aarch64-cores.def
+@@ -145,9 +145,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cortexa57, 8_4A,  AARCH64_FL_FOR
+ /* Qualcomm ('Q') cores. */
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -1)
+ 
+-/* Armv8.5-A Architecture Processors.  */
+-AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
+-
+ /* ARMv8-A big.LITTLE implementations.  */
+ 
+ AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
+@@ -163,4 +160,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cortexa55, cortexa53, 8_2A,  AAR
+ /* Armv8-R Architecture Processors.  */
+ AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARCH8_R, cortexa53, 0x41, 0xd15, -1)
+ 
++/* Armv9-A Architecture Processors. */
++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0xd49, -1)
++
+ #undef AARCH64_CORE
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch b/meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
new file mode 100644
index 0000000000..2b1c17f53e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
@@ -0,0 +1,89 @@
+From d3cf45d15b2fabc767b2d10a0c6bb9fb845e4f99 Mon Sep 17 00:00:00 2001
+From: Przemyslaw Wirkus <przemyslaw.wirkus@arm.com>
+Date: Fri, 1 Oct 2021 10:06:45 +0100
+Subject: [PATCH 2/4] aarch64: add armv9-a to -march
+
+commit f0688d42c9b74a6999548ff2e79ae440b049b87f from upstream
+
+gcc/ChangeLog:
+
+	* config/aarch64/aarch64-arches.def (AARCH64_ARCH): Added
+	armv9-a.
+	* config/aarch64/aarch64.h (AARCH64_FL_V9): New.
+	(AARCH64_FL_FOR_ARCH9): New flags for Armv9-A.
+	(AARCH64_ISA_V9): New ISA flag.
+	* doc/invoke.texi: Update docs.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64-arches.def | 1 +
+ gcc/config/aarch64/aarch64.h          | 5 +++++
+ gcc/doc/invoke.texi                   | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/gcc/config/aarch64/aarch64-arches.def b/gcc/config/aarch64/aarch64-arches.def
+index b7497277b..c47ca622c 100644
+--- a/gcc/config/aarch64/aarch64-arches.def
++++ b/gcc/config/aarch64/aarch64-arches.def
+@@ -38,5 +38,6 @@ AARCH64_ARCH("armv8.4-a",     generic,	     8_4A,	8,  AARCH64_FL_FOR_ARCH8_4)
+ AARCH64_ARCH("armv8.5-a",     generic,	     8_5A,	8,  AARCH64_FL_FOR_ARCH8_5)
+ AARCH64_ARCH("armv8.6-a",     generic,	     8_6A,	8,  AARCH64_FL_FOR_ARCH8_6)
+ AARCH64_ARCH("armv8-r",       generic,	     8R  ,	8,  AARCH64_FL_FOR_ARCH8_R)
++AARCH64_ARCH("armv9-a",       generic,	     9A  ,	9,  AARCH64_FL_FOR_ARCH9)
+ 
+ #undef AARCH64_ARCH
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
+index bfffbcd6a..b914bfb5c 100644
+--- a/gcc/config/aarch64/aarch64.h
++++ b/gcc/config/aarch64/aarch64.h
+@@ -230,6 +230,8 @@ extern unsigned aarch64_architecture_version;
+ 
+ /* Pointer Authentication (PAUTH) extension.  */
+ #define AARCH64_FL_PAUTH      (1ULL << 40)
++/* Armv9.0-A.  */
++#define AARCH64_FL_V9         (1ULL << 41)  /* Armv9.0-A Architecture.  */
+ 
+ /* Has FP and SIMD.  */
+ #define AARCH64_FL_FPSIMD     (AARCH64_FL_FP | AARCH64_FL_SIMD)
+@@ -257,6 +259,8 @@ extern unsigned aarch64_architecture_version;
+    | AARCH64_FL_I8MM | AARCH64_FL_BF16)
+ #define AARCH64_FL_FOR_ARCH8_R     \
+   (AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_V8_R)
++#define AARCH64_FL_FOR_ARCH9       \
++  (AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_V9)
+ 
+ /* Macros to test ISA flags.  */
+ 
+@@ -295,6 +299,7 @@ extern unsigned aarch64_architecture_version;
+ #define AARCH64_ISA_SB		   (aarch64_isa_flags & AARCH64_FL_SB)
+ #define AARCH64_ISA_V8_R	   (aarch64_isa_flags & AARCH64_FL_V8_R)
+ #define AARCH64_ISA_PAUTH	   (aarch64_isa_flags & AARCH64_FL_PAUTH)
++#define AARCH64_ISA_V9		   (aarch64_isa_flags & AARCH64_FL_V9)
+ 
+ /* Crypto is an optional extension to AdvSIMD.  */
+ #define TARGET_CRYPTO (TARGET_SIMD && AARCH64_ISA_CRYPTO)
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index c47cfd472..7184a62d0 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -18270,6 +18270,8 @@ and the features that they enable by default:
+ @item @samp{armv8.4-a} @tab Armv8.4-A @tab @samp{armv8.3-a}, @samp{+flagm}, @samp{+fp16fml}, @samp{+dotprod}
+ @item @samp{armv8.5-a} @tab Armv8.5-A @tab @samp{armv8.4-a}, @samp{+sb}, @samp{+ssbs}, @samp{+predres}
+ @item @samp{armv8.6-a} @tab Armv8.6-A @tab @samp{armv8.5-a}, @samp{+bf16}, @samp{+i8mm}
++@item @samp{armv8.7-a} @tab Armv8.7-A @tab @samp{armv8.6-a}, @samp{+ls64}
++@item @samp{armv9-a} @tab Armv9-A @tab @samp{armv8.5-a}, @samp{+sve}, @samp{+sve2}
+ @item @samp{armv8-r} @tab Armv8-R @tab @samp{armv8-r}
+ @end multitable
+ 
+@@ -19692,6 +19694,7 @@ Permissible names are:
+ @samp{armv8.4-a},
+ @samp{armv8.5-a},
+ @samp{armv8.6-a},
++@samp{armv9-a},
+ @samp{armv7-r},
+ @samp{armv8-r},
+ @samp{armv6-m}, @samp{armv6s-m},
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
new file mode 100644
index 0000000000..2e85384b43
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
@@ -0,0 +1,38 @@
+From 49bfa1927813ae898dfa4e0d2bbde033c353e3dc Mon Sep 17 00:00:00 2001
+From: Andre Vieira <andre.simoesdiasvieira@arm.com>
+Date: Tue, 22 Mar 2022 11:44:06 +0000
+Subject: [PATCH 3/4] aarch64: Enable FP16 feature by default for Armv9
+
+commit 0bae246acc758d4b11dd575b05207fd69169109b from upstream
+
+This patch adds the feature bit for FP16 to the feature set for Armv9 since
+Armv9 requires SVE to be implemented and SVE requires FP16 to be implemented.
+
+2022-03-22  Andre Vieira  <andre.simoesdiasvieira@arm.com>
+
+	* config/aarch64/aarch64.h (AARCH64_FL_FOR_ARCH9): Add FP16 feature
+	bit.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
+index b914bfb5c..55b60d540 100644
+--- a/gcc/config/aarch64/aarch64.h
++++ b/gcc/config/aarch64/aarch64.h
+@@ -260,7 +260,8 @@ extern unsigned aarch64_architecture_version;
+ #define AARCH64_FL_FOR_ARCH8_R     \
+   (AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_V8_R)
+ #define AARCH64_FL_FOR_ARCH9       \
+-  (AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_V9)
++  (AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_V9 \
++   | AARCH64_FL_F16)
+ 
+ /* Macros to test ISA flags.  */
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
new file mode 100644
index 0000000000..c38d1b9119
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
@@ -0,0 +1,294 @@
+From e66a37acae62236611f951e706e9a2bfbd753f39 Mon Sep 17 00:00:00 2001
+From: Przemyslaw Wirkus <przemyslaw.wirkus@arm.com>
+Date: Tue, 9 Nov 2021 09:40:05 +0000
+Subject: [PATCH 4/4] arm: add armv9-a architecture to -march
+
+commit 32ba7860ccaddd5219e6dae94a3d0653e124c9dd from upstream
+
+In this patch:
+	+ Add `armv9-a` to -march.
+	+ Update multilib with armv9-a and armv9-a+simd.
+
+gcc/ChangeLog:
+
+	* config/arm/arm-cpus.in (armv9): New define.
+	(ARMv9a): New group.
+	(armv9-a): New arch definition.
+	* config/arm/arm-tables.opt: Regenerate.
+	* config/arm/arm.h (BASE_ARCH_9A): New arch enum value.
+	* config/arm/t-aprofile: Added armv9-a and armv9+simd.
+	* config/arm/t-arm-elf: Added arm9-a, v9_fps and all_v9_archs
+	to MULTILIB_MATCHES.
+	* config/arm/t-multilib: Added v9_a_nosimd_variants and
+	v9_a_simd_variants to MULTILIB_MATCHES.
+	* doc/invoke.texi: Update docs.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/arm/multilib.exp: Update test with armv9-a entries.
+	* lib/target-supports.exp (v9a): Add new armflag.
+	(__ARM_ARCH_9A__): Add new armdef.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/arm/arm-cpus.in                | 19 +++++++++++++++++
+ gcc/config/arm/arm-tables.opt             |  7 +++++--
+ gcc/config/arm/arm.h                      |  3 ++-
+ gcc/config/arm/t-aprofile                 | 25 +++++++++++++++++++----
+ gcc/config/arm/t-arm-elf                  |  9 ++++++++
+ gcc/config/arm/t-multilib                 | 12 +++++++++++
+ gcc/doc/invoke.texi                       |  1 +
+ gcc/testsuite/gcc.target/arm/multilib.exp |  8 ++++++++
+ gcc/testsuite/lib/target-supports.exp     |  3 ++-
+ 9 files changed, 79 insertions(+), 8 deletions(-)
+
+diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
+index bcc9ebe9f..58d83829c 100644
+--- a/gcc/config/arm/arm-cpus.in
++++ b/gcc/config/arm/arm-cpus.in
+@@ -132,6 +132,9 @@ define feature cmse
+ # Architecture rel 8.1-M.
+ define feature armv8_1m_main
+ 
++# Architecture rel 9.0.
++define feature armv9
++
+ # Floating point and Neon extensions.
+ # VFPv1 is not supported in GCC.
+ 
+@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 cmse tdiv
+ define fgroup ARMv8m_main ARMv7m armv8 cmse
+ define fgroup ARMv8r      ARMv8a
+ define fgroup ARMv8_1m_main ARMv8m_main armv8_1m_main
++define fgroup ARMv9a      ARMv8_5a armv9
+ 
+ # Useful combinations.
+ define fgroup VFPv2	vfpv2
+@@ -751,6 +755,21 @@ begin arch armv8.1-m.main
+  option cdecp7 add cdecp7
+ end arch armv8.1-m.main
+ 
++begin arch armv9-a
++ tune for cortex-a53
++ tune flags CO_PROC
++ base 9A
++ profile A
++ isa ARMv9a
++ option simd add FP_ARMv8 DOTPROD
++ option fp16 add fp16 fp16fml FP_ARMv8 DOTPROD
++ option crypto add FP_ARMv8 CRYPTO DOTPROD
++ option nocrypto remove ALL_CRYPTO
++ option nofp remove ALL_FP
++ option i8mm add i8mm FP_ARMv8 DOTPROD
++ option bf16 add bf16 FP_ARMv8 DOTPROD
++end arch armv9-a
++
+ begin arch iwmmxt
+  tune for iwmmxt
+  tune flags LDSCHED STRONG XSCALE
+diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
+index 5692d4fb7..ae3dd9414 100644
+--- a/gcc/config/arm/arm-tables.opt
++++ b/gcc/config/arm/arm-tables.opt
+@@ -380,10 +380,13 @@ EnumValue
+ Enum(arm_arch) String(armv8.1-m.main) Value(30)
+ 
+ EnumValue
+-Enum(arm_arch) String(iwmmxt) Value(31)
++Enum(arm_arch) String(armv9-a) Value(31)
+ 
+ EnumValue
+-Enum(arm_arch) String(iwmmxt2) Value(32)
++Enum(arm_arch) String(iwmmxt) Value(32)
++
++EnumValue
++Enum(arm_arch) String(iwmmxt2) Value(33)
+ 
+ Enum
+ Name(arm_fpu) Type(enum fpu_type)
+diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
+index 47c13a9e5..088c7725c 100644
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
+@@ -456,7 +456,8 @@ enum base_architecture
+   BASE_ARCH_8A = 8,
+   BASE_ARCH_8M_BASE = 8,
+   BASE_ARCH_8M_MAIN = 8,
+-  BASE_ARCH_8R = 8
++  BASE_ARCH_8R = 8,
++  BASE_ARCH_9A = 9
+ };
+ 
+ /* The major revision number of the ARM Architecture implemented by the target.  */
+diff --git a/gcc/config/arm/t-aprofile b/gcc/config/arm/t-aprofile
+index 8574ac3e2..68e2251c7 100644
+--- a/gcc/config/arm/t-aprofile
++++ b/gcc/config/arm/t-aprofile
+@@ -26,8 +26,8 @@
+ 
+ # Arch and FPU variants to build libraries with
+ 
+-MULTI_ARCH_OPTS_A       = march=armv7-a/march=armv7-a+fp/march=armv7-a+simd/march=armv7ve+simd/march=armv8-a/march=armv8-a+simd
+-MULTI_ARCH_DIRS_A       = v7-a v7-a+fp v7-a+simd v7ve+simd v8-a v8-a+simd
++MULTI_ARCH_OPTS_A       = march=armv7-a/march=armv7-a+fp/march=armv7-a+simd/march=armv7ve+simd/march=armv8-a/march=armv8-a+simd/march=armv9-a/march=armv9-a+simd
++MULTI_ARCH_DIRS_A       = v7-a v7-a+fp v7-a+simd v7ve+simd v8-a v8-a+simd v9-a v9-a+simd
+ 
+ # ARMv7-A - build nofp, fp-d16 and SIMD variants
+ 
+@@ -46,6 +46,11 @@ MULTILIB_REQUIRED	+= mthumb/march=armv8-a/mfloat-abi=soft
+ MULTILIB_REQUIRED	+= mthumb/march=armv8-a+simd/mfloat-abi=hard
+ MULTILIB_REQUIRED	+= mthumb/march=armv8-a+simd/mfloat-abi=softfp
+ 
++# Armv9-A - build nofp and SIMD variants.
++MULTILIB_REQUIRED	+= mthumb/march=armv9-a/mfloat-abi=soft
++MULTILIB_REQUIRED	+= mthumb/march=armv9-a+simd/mfloat-abi=hard
++MULTILIB_REQUIRED	+= mthumb/march=armv9-a+simd/mfloat-abi=softfp
++
+ # Matches
+ 
+ # Arch Matches
+@@ -129,17 +134,29 @@ MULTILIB_MATCHES	+= march?armv8-a=march?armv8.6-a
+ MULTILIB_MATCHES	+= $(foreach ARCH, $(v8_6_a_simd_variants), \
+ 			     march?armv8-a+simd=march?armv8.6-a$(ARCH))
+ 
++# Armv9 without SIMD: map down to base architecture
++MULTILIB_MATCHES	+= $(foreach ARCH, $(v9_a_nosimd_variants), \
++			     march?armv9-a=march?armv9-a$(ARCH))
++
++# Armv9 with SIMD: map down to base arch + simd
++MULTILIB_MATCHES	+= march?armv9-a+simd=march?armv9-a+crc+simd \
++			   $(foreach ARCH, $(filter-out +simd, $(v9_a_simd_variants)), \
++			     march?armv9-a+simd=march?armv9-a$(ARCH) \
++			     march?armv9-a+simd=march?armv9-a+crc$(ARCH))
++
+ # Use Thumb libraries for everything.
+ 
+ MULTILIB_REUSE		+= mthumb/march.armv7-a/mfloat-abi.soft=marm/march.armv7-a/mfloat-abi.soft
+ 
+ MULTILIB_REUSE		+= mthumb/march.armv8-a/mfloat-abi.soft=marm/march.armv8-a/mfloat-abi.soft
+ 
++MULTILIB_REUSE		+= mthumb/march.armv9-a/mfloat-abi.soft=marm/march.armv9-a/mfloat-abi.soft
++
+ MULTILIB_REUSE		+= $(foreach ABI, hard softfp, \
+-			     $(foreach ARCH, armv7-a+fp armv7-a+simd armv7ve+simd armv8-a+simd, \
++			     $(foreach ARCH, armv7-a+fp armv7-a+simd armv7ve+simd armv8-a+simd armv9-a+simd, \
+ 			       mthumb/march.$(ARCH)/mfloat-abi.$(ABI)=marm/march.$(ARCH)/mfloat-abi.$(ABI)))
+ 
+ # Softfp but no FP, use the soft-float libraries.
+ MULTILIB_REUSE		+= $(foreach MODE, arm thumb, \
+-			     $(foreach ARCH, armv7-a armv8-a, \
++			     $(foreach ARCH, armv7-a armv8-a armv9-a, \
+ 			       mthumb/march.$(ARCH)/mfloat-abi.soft=m$(MODE)/march.$(ARCH)/mfloat-abi.softfp))
+diff --git a/gcc/config/arm/t-arm-elf b/gcc/config/arm/t-arm-elf
+index d68def308..b3a900e8c 100644
+--- a/gcc/config/arm/t-arm-elf
++++ b/gcc/config/arm/t-arm-elf
+@@ -38,6 +38,8 @@ v7ve_fps	:= vfpv3-d16 vfpv3 vfpv3-d16-fp16 vfpv3-fp16 vfpv4 neon \
+ # it seems to work ok.
+ v8_fps		:= simd fp16 crypto fp16+crypto dotprod fp16fml
+ 
++v9_fps		:= simd fp16 crypto fp16+crypto dotprod fp16fml
++
+ # We don't do anything special with these.  Pre-v4t probably doesn't work.
+ all_early_nofp	:= armv4 armv4t armv5t
+ 
+@@ -49,6 +51,8 @@ all_v7_a_r	:= armv7-a armv7ve armv7-r
+ all_v8_archs	:= armv8-a armv8-a+crc armv8.1-a armv8.2-a armv8.3-a armv8.4-a \
+ 		   armv8.5-a armv8.6-a
+ 
++all_v9_archs	:= armv9-a
++
+ # No floating point variants, require thumb1 softfp
+ all_nofp_t	:= armv6-m armv6s-m armv8-m.base
+ 
+@@ -110,6 +114,11 @@ MULTILIB_MATCHES     += $(foreach ARCH, $(all_v8_archs), \
+ 			  $(foreach FPARCH, $(v8_fps), \
+ 			    march?armv7+fp=march?$(ARCH)+$(FPARCH)))
+ 
++MULTILIB_MATCHES     += $(foreach ARCH, $(all_v9_archs), \
++			  march?armv7+fp=march?$(ARCH) \
++			  $(foreach FPARCH, $(v9_fps), \
++			    march?armv7+fp=march?$(ARCH)+$(FPARCH)))
++
+ MULTILIB_MATCHES     += $(foreach ARCH, armv7e-m armv8-m.mainline, \
+ 			  march?armv7+fp=march?$(ARCH)+fp.dp)
+ 
+diff --git a/gcc/config/arm/t-multilib b/gcc/config/arm/t-multilib
+index ddc5033bf..d789b86ee 100644
+--- a/gcc/config/arm/t-multilib
++++ b/gcc/config/arm/t-multilib
+@@ -78,6 +78,8 @@ v8_4_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ v8_5_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ v8_6_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ v8_r_nosimd_variants	:= +crc
++v9_a_nosimd_variants	:= +crc
++v9_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ 
+ ifneq (,$(HAS_APROFILE))
+ include $(srcdir)/config/arm/t-aprofile
+@@ -202,6 +204,16 @@ MULTILIB_MATCHES	+= march?armv7=march?armv8.6-a
+ MULTILIB_MATCHES	+= $(foreach ARCH, $(v8_6_a_simd_variants), \
+ 			     march?armv7+fp=march?armv8.6-a$(ARCH))
+ 
++# Armv9
++MULTILIB_MATCHES	+= march?armv7=march?armv9-a
++MULTILIB_MATCHES	+= $(foreach ARCH, $(v9_a_nosimd_variants), \
++			     march?armv7=march?armv9-a$(ARCH))
++
++# Armv9 with SIMD
++MULTILIB_MATCHES	+= march?armv7+fp=march?armv9-a+crc+simd \
++			   $(foreach ARCH, $(v9_a_simd_variants), \
++			     march?armv7+fp=march?armv9-a$(ARCH) \
++			     march?armv7+fp=march?armv9-a+crc$(ARCH))
+ endif		# Not APROFILE.
+ 
+ # Use Thumb libraries for everything.
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 7184a62d0..9a712c0d6 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -19701,6 +19701,7 @@ Permissible names are:
+ @samp{armv7-m}, @samp{armv7e-m},
+ @samp{armv8-m.base}, @samp{armv8-m.main},
+ @samp{armv8.1-m.main},
++@samp{armv9-a},
+ @samp{iwmmxt} and @samp{iwmmxt2}.
+ 
+ Additionally, the following architectures, which lack support for the
+diff --git a/gcc/testsuite/gcc.target/arm/multilib.exp b/gcc/testsuite/gcc.target/arm/multilib.exp
+index 4b30025db..e3f06c316 100644
+--- a/gcc/testsuite/gcc.target/arm/multilib.exp
++++ b/gcc/testsuite/gcc.target/arm/multilib.exp
+@@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
+ 	{-march=armv8.6-a+simd+fp16 -mfloat-abi=softfp} "thumb/v8-a+simd/softfp"
+ 	{-march=armv8.6-a+simd+fp16+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
+ 	{-march=armv8.6-a+simd+nofp+fp16 -mfloat-abi=softfp} "thumb/v8-a+simd/softfp"
++	{-march=armv9-a+crypto -mfloat-abi=soft} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+crypto -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
++	{-march=armv9-a+simd+crypto+nofp -mfloat-abi=softfp} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+nofp+crypto -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
++	{-march=armv9-a+fp16 -mfloat-abi=soft} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+fp16 -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
++	{-march=armv9-a+simd+fp16+nofp -mfloat-abi=softfp} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+nofp+fp16 -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
+ 	{-mcpu=cortex-a53+crypto -mfloat-abi=hard} "thumb/v8-a+simd/hard"
+ 	{-mcpu=cortex-a53+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
+ 	{-march=armv8-a+crc -mfloat-abi=hard -mfpu=vfp} "thumb/v8-a+simd/hard"
+diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
+index 857e57218..52e043917 100644
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
+@@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
+ 	v8m_base "-march=armv8-m.base -mthumb -mfloat-abi=soft"
+ 		__ARM_ARCH_8M_BASE__
+ 	v8m_main "-march=armv8-m.main -mthumb" __ARM_ARCH_8M_MAIN__
+-	v8_1m_main "-march=armv8.1-m.main -mthumb" __ARM_ARCH_8M_MAIN__ } {
++	v8_1m_main "-march=armv8.1-m.main -mthumb" __ARM_ARCH_8M_MAIN__
++	v9a "-march=armv9-a" __ARM_ARCH_9A__ } {
+     eval [string map [list FUNC $armfunc FLAG $armflag DEFS $armdefs ] {
+ 	proc check_effective_target_arm_arch_FUNC_ok { } {
+ 	    return [check_no_compiler_messages arm_arch_FUNC_ok assembly {
+-- 
+2.34.1
+
-- 
2.25.1


