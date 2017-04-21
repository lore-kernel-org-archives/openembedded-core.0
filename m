Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC26D77BEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 19:23:22 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id y11so20826970oie.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cVpYgQs0/diugtlhdHblA0oexhKcqowoKUqirYt3Jvo=;
	b=NN+ATTlJ0ywrl5LChwxUuUs0jELKQmB7V90NxYcl8Ns6Fu+i9jQqfCL5LgRyH7ihPu
	ag3LkHeIF/q36HXHuo33iy+PK9L3K+YG/dGVUhYyp+SYSKxqK7rinCikfHGqzu77P9uz
	0Y8qwkkYYR+y0WYNfShcPPFcBq6oaYC9OMXxI1Bcl0OZX2ChF9/WhsiDPKKoQHJ8YoQM
	74Lim8LE+o8zDEfMAEj4FWUjJrQa8a/E4GwMN6Tu7CzOHJTEJaga762HZnnKakvE3i5X
	EIiXOxENIsgPQPb4VOYdXk61yKpwFQgw3dSjARlh2n/Wi20q0Q44Xn0HRuYrW37h9Qh9
	ctrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cVpYgQs0/diugtlhdHblA0oexhKcqowoKUqirYt3Jvo=;
	b=qul5FTL1OgydU4F9POyHrwyGIsCIunOXSlILDP/s1kBAHVokEcMwCCdInbamg5hVFa
	KvUAnSYUlLRrjscUqyrjmcnMeCUHXmXInG0VxrBIrPVNzgBaRXEWK9jhB7c1/Kyj+Thd
	um+43LVhbxYgLxrSsM9sKShlSxOUH9LbF9OKvjdIXdj4BH4bsdZMChz1vPgTOyBB6fyt
	YYyufjBIRr0KzIldk76QkcESifQLBPgmZctky25+2foQXb6GdLbPTM8rlL11JB9QXxZv
	ThoFxXy4WCMNVOAY1MYM8h8opEjBvZYovL7S/Fw812uhyUVwNrhgIn4b7Imwi+oE6IX5
	YjkQ==
X-Gm-Message-State: AN3rC/4cYlcp8cUPxFT4oRxCSKaUHVV5VzFBBm0Ym45zOJ+OuIJBwwRt
	MOCkzjUuqMaYMA==
X-Received: by 10.84.205.70 with SMTP id o6mr17673669plh.63.1492802603544;
	Fri, 21 Apr 2017 12:23:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 29sm17499654pfo.9.2017.04.21.12.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 12:23:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 12:23:08 -0700
Message-Id: <20170421192308.22132-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170421192308.22132-1-raj.khem@gmail.com>
References: <20170421192308.22132-1-raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 19:23:23 -0000

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


