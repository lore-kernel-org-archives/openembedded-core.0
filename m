Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5F071DA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 18:21:11 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id a189so12209016oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=baTxv7eBVJF+khF6FEHfs/Bt6Bc07KVdMO53uRlY0m8=;
	b=ZwIBLsP4wdDftKyQOuTm7DqMvW2W8l5EsYQ0aS5bF+GFhF2xujSCgbDO4rng0tgmki
	/ijTSAUPNh7HKRM8CpQCOJHDBjvglpiENXqlfiS6v1XNuvRNvnPD9pZXxnUFf4QuOsGg
	456NIP3wu9p2W8VMOeEkYtJxaVTTgBcd/AOclB4ARZ9xY03rTyAV0fsvBVqynP2SZHFU
	fgezANBOxs5K7bO1ehRnTWSKKpGypWBuesg1Mi1xd9NJ13h5Y7bGL2ch135h8mvwkGRe
	gU4ZEYcBEsWypFknint0o6XVLTnLzw4oGBiGvfvuGjq3RG9NNke53xLux08iMOL4nby0
	RgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=baTxv7eBVJF+khF6FEHfs/Bt6Bc07KVdMO53uRlY0m8=;
	b=igJOFM98ZAcDRootGmtyqRFEvMQMnnj2nM2CajkoDtnzPavpm0Zdn2M972ArnDCfOA
	dqoAUtemToTfKPdy0gpT6/r9feGN854plU7chsr+WqkODqrD8uYf/05/DSYyO/yDZA1B
	OUFZWEEHyGUfSY60M3+hg1eGiDv0y4MeVZPapbcrwRTWkPQ61H0wKofkMy91IvNFPjqv
	YeiFww3GPnBaWYShJT9glj1sStZHWCn0gttHfX9avYnaChVenAbbdxwUAt75m/lsnxrE
	x9e+KjYW3kplUy30gj2giQ0c1VfQ/v4QvANm4gQFsK0tyOoHGLwk8wzPKOs+GwqILLdN
	LkOQ==
X-Gm-Message-State: AN3rC/7ANpoxD63EEkJPwTDiw5tv0xJBxeV7UIHoRH3WDiNp+aUgdBgu
	UNmzITj5C9Kg/w==
X-Received: by 10.84.238.198 with SMTP id l6mr11578100pln.95.1492712473019;
	Thu, 20 Apr 2017 11:21:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e131sm11795417pfg.10.2017.04.20.11.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 11:21:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 11:20:25 -0700
Message-Id: <20170420182028.31964-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420182028.31964-1-raj.khem@gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
Subject: [PATCH 2/5] valgrind: Fix arm build with gcc7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Apr 2017 18:21:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 108 +++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
new file mode 100644
index 00000000000..9f1da7bac68
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -0,0 +1,108 @@
+From 715cf122388f3527afa5649cebf9f1522c240693 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Apr 2017 10:11:16 -0700
+Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
+ architecture
+
+We can not assume that all arches armv7+ are cortex-a8 only
+it fails to build for rpi which is armv7ve based (cortex-a8) cpu
+implementation.
+Fixes
+| cc1: warning: switch -mcpu=cortex-a8 conflicts with -march=armv7ve switch
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.all.am            |  6 +++---
+ helgrind/tests/Makefile.am |  6 +++---
+ none/tests/arm/Makefile.am | 18 +++++++++---------
+ 3 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/Makefile.all.am b/Makefile.all.am
+index 02059a3..c7c4700 100644
+--- a/Makefile.all.am
++++ b/Makefile.all.am
+@@ -197,11 +197,11 @@ AM_CCASFLAGS_PPC64LE_LINUX  = @FLAG_M64@ -g
+ 
+ AM_FLAG_M3264_ARM_LINUX   = @FLAG_M32@
+ AM_CFLAGS_ARM_LINUX       = @FLAG_M32@ \
+-			 	$(AM_CFLAGS_BASE) -marm -mcpu=cortex-a8
++			 	$(AM_CFLAGS_BASE) -marm
+ AM_CFLAGS_PSO_ARM_LINUX   = @FLAG_M32@ $(AM_CFLAGS_BASE) \
+-				-marm -mcpu=cortex-a8 $(AM_CFLAGS_PSO_BASE)
++				-marm $(AM_CFLAGS_PSO_BASE)
+ AM_CCASFLAGS_ARM_LINUX    = @FLAG_M32@ \
+-				-marm -mcpu=cortex-a8 -g
++				-marm -g
+ 
+ AM_FLAG_M3264_ARM64_LINUX = @FLAG_M64@
+ AM_CFLAGS_ARM64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE)
+diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
+index df82169..07eb66a 100644
+--- a/helgrind/tests/Makefile.am
++++ b/helgrind/tests/Makefile.am
+@@ -189,9 +189,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+ endif
+ 
+ if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
+-annotate_hbefore_CFLAGS = $(AM_CFLAGS) -mcpu=cortex-a8
+-tc07_hbl1_CFLAGS        = $(AM_CFLAGS) -mcpu=cortex-a8
+-tc08_hbl2_CFLAGS        = $(AM_CFLAGS) -mcpu=cortex-a8
++annotate_hbefore_CFLAGS = $(AM_CFLAGS)
++tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
++tc08_hbl2_CFLAGS        = $(AM_CFLAGS)
+ else
+ annotate_hbefore_CFLAGS = $(AM_CFLAGS)
+ tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
+diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
+index 024eb6d..ccecb90 100644
+--- a/none/tests/arm/Makefile.am
++++ b/none/tests/arm/Makefile.am
+@@ -52,10 +52,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ # need special helping w.r.t -mfpu and -mfloat-abi, though.
+ # Also force -O0 since -O takes hundreds of MB of memory 
+ # for v6intThumb.c.
+-v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -marm
+-v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
++v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -marm
++v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mthumb
+ 
+-v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
++v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mthumb
+ 
+ v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm
+ v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb
+@@ -65,23 +65,23 @@ v8memory_a_CFLAGS = $(AM_CFLAGS) -g -O0 \
+ v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
+ 			-march=armv8-a -mfpu=crypto-neon-fp-armv8 -mthumb
+ 
+-vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
++vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 \
+ 			-mfpu=neon \
+ 			-mthumb
+ 
+ 
+-neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
++neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 \
+ 			-mfpu=neon \
+ 			-mthumb
+ 
+-neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
++neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 \
+ 			-mfpu=neon \
+ 			-mthumb
+ 
+ intdiv_CFLAGS	  = $(AM_CFLAGS) -g -march=armv7ve -mcpu=cortex-a15 -mthumb
+-ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
+-ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
++ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mthumb
++ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -marm
+ 
+-vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
++vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mfpu=vfpv3
+ 
+ vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
+-- 
+2.12.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 62a96354cd0..a07c8767ce3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -23,7 +23,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
            file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
-"
+           file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
+           "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
 "
-- 
2.12.2


