Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D37A77BDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 18:08:54 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d203so33111083iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cVpYgQs0/diugtlhdHblA0oexhKcqowoKUqirYt3Jvo=;
	b=jSMksHz6whx1W4QgQZSI41SgYn4ET+cxA+ZI8ePglgwaMq0KEprXOlOC4JVwbNx9oN
	PHfiaBGLM3iUb7Ls3xoDLx5r3PxlbQJCTYgCc+uQk+d8uKy1sjaA8ZS5y8m1dHuHvjIo
	pS0phFg9petMxVFaLpNc1sPde+k7Fw1HMthjgFOK3NL9j5Fw9ASTlrLnmZ4h7g9esA2s
	rRnehsTm/eA4LQstEETAJmXQYrTvR91HBaelo0rz67yfqkdDszQNMvtY4swp3w4a5TEG
	PNggNiZGpJZSrGtGmB73nWO5w/GDxqBqNW2bFVLv3eXwlcGkly8sF4hkjAk80hQeiKz+
	n+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cVpYgQs0/diugtlhdHblA0oexhKcqowoKUqirYt3Jvo=;
	b=s0qtl9v0Jg8cskhab0uE3+Iv843gDzVBo9aHBp1FxE5elbx/A1TFXWqmYnr0sLwKQ/
	Ybdr1NtjcoaRooRRKJDhVQTu37guKFFqdYw2k3+jB4cu1QbTH/SQOK5foYq2mtcCaigC
	vMeq7Ph+yVK9jCprB6qxs+l/XHDNEzZRuBKg2Q+7G87jEjoRyeswB7K+DqvAmmJDE9iE
	7NkVHy77+8qhQSKEIP+JIPqi3TsT4K2UlkFZFNvOAQ1vILU6deMEb00QA+hbdoJs6zBE
	t/zSFn5Z/mY2mNE91QR6vCtzvpEGyDoZ4uIzblkhP/nvDIey8f6UQbc2oWRBz0YEmSj9
	KAug==
X-Gm-Message-State: AN3rC/7buyJyaZWHXB9EaaRQUgY7piufHCg+MDW8nQxrfQdU6iDA5agJ
	pbbu1iXtlpPsmg==
X-Received: by 10.99.64.69 with SMTP id n66mr13588445pga.197.1492798135381;
	Fri, 21 Apr 2017 11:08:55 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	g202sm432850pfb.66.2017.04.21.11.08.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 11:08:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 11:08:39 -0700
Message-Id: <20170421180839.4103-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH V2] valgrind: Fix arm build with gcc7
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
X-List-Received-Date: Fri, 21 Apr 2017 18:08:54 -0000

Add function to remove -mcpu compiler options on arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 108 +++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  14 ++-
 2 files changed, 121 insertions(+), 1 deletion(-)
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
index 62a96354cd0..d5a8dda4874 100644
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
@@ -53,6 +54,7 @@ EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEIN
 
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
+TARGET_CC_ARCH_remove_arm = "${@get_mcpu(d)}"
 
 EXTRA_OEMAKE = "-w"
 
@@ -66,10 +68,20 @@ SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
 
+def get_mcpu(d):
+    for arg in (d.getVar('TUNE_CCARGS') or '').split():
+        if arg.startswith('-mcpu='):
+            return arg
+        else:
+            continue
+    return ""
+
 do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
 }
 
+TUNE = "${@strip_mcpu(d)}"
+
 RDEPENDS_${PN} += "perl"
 
 # valgrind needs debug information for ld.so at runtime in order to
-- 
2.12.2


