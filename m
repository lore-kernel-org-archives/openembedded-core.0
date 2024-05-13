Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC90DC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 17:49:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.67594.1715622552979388268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 10:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cjT63xQI;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso1556137b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715622552; x=1716227352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFbO8NCTRYGN8YPgxbHkIvvFdhAPsrNTWbj68hktL8E=;
        b=cjT63xQImGBXuf0LQkGPhZ1CVt0eEBdVIiQBELsGc3j5gYYNS0Jkrr4P/ov4HxEciF
         6K0qJhd1WIHbRo+fESAf8dgAL5mgSs9yQxuhBV+ApPKCIW76KAU+I6n+Yxe+BNGJZOHC
         pAjgPe5v0h0Py9+Un7w0K8NjAxvMbmNk4gu3RdbEOVsEHGQfxmToaY/d9TYtWS0vpLNG
         rm3W5ayRCAtyQSY17yFnO4BSE0YpT9tsxP9cGPUieEIu+0GkvZlEdx1HDjvYDPUyOGzU
         ncaBGKsAeu4g77KICk8m+lfwUfr/pkcCzkiEH5zACVkSTZ3nTOiFCIMWS5tQE6vcTxPs
         7FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622552; x=1716227352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFbO8NCTRYGN8YPgxbHkIvvFdhAPsrNTWbj68hktL8E=;
        b=ihmgyP/gj4msl6KxWF15UUYLSW7uVBPnu8+nhnwsC7jutag03tY+S7smb67JyjIr+K
         r0SyqskpdHPU6j8xHEJZBFMTc/T3Rzp167AkERLbf8kdNOYb10x5POQiqTzGUUVvTr9O
         Utzfiz+YmmQMExO53vWx9er9ZV5F/G8lW2nUWUvuUZV8v79hvAND19aTyb2Ci7hw/ZkC
         J9ZivVScNXMYLBv7bZu4DjToJ3cxIiR08+IDGaP3rHwZnJ2739CncyWz6zksukW+bo9K
         Jfqw58D5EeKkvnfnjK35dLMG/0qzB+mZ39I7CBKNIM4xZw78uCRRbE/FOsUoWwz2GIne
         De2g==
X-Gm-Message-State: AOJu0YxMjobjl5uk1QU3T6C0XT7P1tHGm0HcvxpkiQc2OA1vTiVPYaDK
	lVDjlolLFwnavHcq2NvtnlF/DOs0i/VK0ObCj/kkgK4Wa7Ic/97R0pMmOND7gLw=
X-Google-Smtp-Source: AGHT+IHKbO80BB8SuvKA2XBxHgRp9Ge2BWGXG4coWW3TOY3/MzbGdbjHTEsO0kHdiFzwhotvg7LN7A==
X-Received: by 2002:a05:6a20:a122:b0:1aa:965d:1332 with SMTP id adf61e73a8af0-1afde1c0455mr17789036637.26.1715622551079;
        Mon, 13 May 2024 10:49:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0d4fsm7617880b3a.138.2024.05.13.10.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:49:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] valgrind: Upgrade to 3.23.0
Date: Mon, 13 May 2024 10:49:08 -0700
Message-ID: <20240513174908.4124760-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 17:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199247

Drop backports already available in this release

This release supports X86/Linux, AMD64/Linux, ARM32/Linux, ARM64/Linux,
PPC32/Linux, PPC64BE/Linux, PPC64LE/Linux, S390X/Linux, MIPS32/Linux,
MIPS64/Linux, ARM/Android, ARM64/Android, MIPS32/Android, X86/Android,
X86/Solaris, AMD64/Solaris, AMD64/MacOSX 10.12, X86/FreeBSD, AMD64/FreeBSD
and ARM64/FreeBSD  There is also preliminary support for X86/macOS 10.13,
AMD64/macOS 10.13 and nanoMIPS/Linux.

* ==================== CORE CHANGES ===================

* --track-fds=yes will now also warn about double closing of file
  descriptors. Printing the context where the file descriptor was
  originally opened and where it was previously closed.

* --track-fds=yes also produces "real" errors now which can be
  suppressed and work with --error-exitcode. When combined with
  --xml the xml-output now also includes FdBadClose and FdNotClosed
  error kinds (see docs/internals/xml-output-protocol5.txt).

* The option --show-error-list=no|yes now accepts a new value all.
  This indicates to also print the suppressed errors.
  This is useful to analyse which errors are suppressed by which
  suppression entries.
  The valgrind monitor command 'v.info all_errors' similarly now
  accepts a new optional argument 'also_suppressed' to show
  all errors including the suppressed errors.

* ================== PLATFORM CHANGES =================

* Added ARM64 support for FreeBSD.

* ARM64 now supports dotprod instructions (sdot/udot).

* AMD64 better supports code build with -march=x86-64-v3.
  fused-multiple-add instructions (fma) are now emulated more
  accurately. And memcheck now handles __builtin_strcmp using 128/256
  bit vectors with sse4.1, avx/avx2.

* S390X added support for NNPA (neural network processing assist)
  facility vector instructions VCNF, VCLFNH, VCFN, VCLFNL, VCRNF and
  NNPA (z16/arch14).

* X86 recognizes new binutils-2.42 nop patterns.

* ==================== TOOL CHANGES ===================

* The none tool now also supports xml output.

* ==================== FIXED BUGS ====================

The following bugs have been fixed or resolved.  Note that "n-i-bz"
stands for "not in bugzilla" -- that is, a bug that was reported to us
but never got a bugzilla entry.  We encourage you to file bugs in
bugzilla (https://bugs.kde.org/enter_bug.cgi?product=valgrind) rather
than mailing the developers (or mailing lists) directly -- bugs that
are not entered into bugzilla tend to get forgotten about or ignored.

283429  ARM leak checking needs CLEAR_CALLER_SAVED_REGS
281059  Cannot connect to Oracle using valgrind
328563  make track-fds support xml output
362680  --error-exitcode not honored when file descriptor leaks are found
369723  __builtin_longjmp not supported in clang/llvm on Android arm64 target
390269  unhandled amd64-darwin syscall: unix:464 (openat_nocancel)
401284  False positive "Source and destination overlap in strncat"
428364  Signals inside io_uring_enter not handled
437790  valgrind reports "Conditional jump or move depends on uninitialised
        value" in memchr of macOS 10.12-10.15
460616  disInstr(arm64): unhandled instruction 0x4E819402 (dotprod/ASIMDDP)
463458  memcheck/tests/vcpu_fnfns fails when glibc is built for x86-64-v3
463463  none/tests/amd64/fma fails when executed on a x86-64-v3 system
466762  Add redirs for C23 free_sized() and free_aligned_sized()
466884  Missing writev uninit padding suppression for _XSend
471036  disInstr_AMD64: disInstr miscalculated next %rip on RORX imm8, m32/64, r32/6
471222  support tracking of file descriptors being double closed
474160  If errors-for-leak-kinds is specified, exit-on-first-error should only exit
        on one of the listed errors.
475498  Add reallocarray wrapper
476025  Vbit expected test results for Iop_CmpGT64Ux2 are wrong
476320  Build failure with GCC
476331  clean up generated/distributed filter scripts
476535  Difference in allocation size for massif/tests/overloaded-new between
        clang++/libc++ and g++/libstdc++
476548  valgrind 3.22.0 fails on assertion when loading debuginfo file
        produced by mold
476708  valgrind-monitor.py regular expressions should use raw strings
476780  Extend strlcat and strlcpy wrappers to GNU libc
476787  Build of Valgrind 3.21.0 fails when SOLARIS_PT_SUNDWTRACE_THRP is
        defined
476887  WARNING: unhandled amd64-freebsd syscall: 578
477198  Add fchmodat2 syscall on linux
477628  Add mremap support for Solaris
477630  Include ucontext.h rather than sys/ucontext.h in Solaris sources
477719  vgdb incorrectly replies to qRcmd packet
478211  Redundant code for vgdb.c and Valgrind core tools
478624  Valgrind incompatibility with binutils-2.42 on x86 with new nop patterns
        (unhandled instruction bytes: 0x2E 0x8D 0xB4 0x26
478837  valgrind fails to read debug info for rust binaries
479041  Executables without RW sections do not trigger debuginfo reading
480052  WARNING: unhandled amd64-freebsd syscall: 580
480126  Build failure on Raspberry Pi 5 / OS 6.1.0-rpi7-rpi-v8
480405  valgrind 3.22.0 "m_debuginfo/image.c:586 (set_CEnt):
        Assertion '!sr_isError(sr)' failed."
480488  Add support for FreeBSD 13.3
480706  Unhandled syscall 325 (mlock2)
481127  amd64: Implement VFMADD213 for Iop_MAddF32
481131  [PATCH] x86 regtest: fix clobber lists in generated asm statements
481676  Build failure on Raspberry Pi 5 Ubuntu 23.10 with clang
481874  Add arm64 support for FreeBSD
483786  Incorrect parameter indexing in FreeBSD clock_nanosleep syscall wrapper
484002  Add suppression for invalid read in glibc's __wcpncpy_avx2() via wcsxfrm()
484426  aarch64: 0.5 gets rounded to 0
484480  False positives when using sem_trywait
484935  [patch] Valgrind reports false "Conditional jump or move depends on
        uninitialised value" errors for aarch64 signal handlers
485148  vfmadd213ss instruction is instrumented incorrectly (the remaining
        part of the register is cleared instead of kept unmodified)
485487  glibc built with -march=x86-64-v3 does not work due to ld.so strcmp
485778  Crash with --track-fds=all and --gen-suppressions=all
n-i-bz  Add redirect for memccpy

To see details of a given bug, visit
  https://bugs.kde.org/show_bug.cgi?id=XXXXXX
where XXXXXX is the bug number as listed above.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix gcc-14 errors compiling thumb2/-O0
v3: Update patch status pending -> submitted

 ...rn-a-valid-exit_code-from-vg_regtest.patch |   7 +-
 ...e-Drop-setting-mcpu-cortex-a8-on-arm.patch |  40 ++++
 .../0001-docs-Disable-manual-validation.patch |   7 +-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |  40 +---
 ...check-tests-Fix-timerfd-syscall-test.patch |  16 +-
 .../0001-tests-arm-Use-O-instead-of-O0.patch  |  34 +++
 ....py-regular-expressions-should-use-r.patch |  64 -----
 ...ind-3.22.0-fails-on-assertion-when-l.patch | 147 ------------
 .../0003-Add-fchmodat2-syscall-on-linux.patch | 221 ------------------
 ...ind-incompatibility-with-binutils-2..patch | 137 -----------
 ...t-for-PPC-instructions-mfatbu-mfatbl.patch |  14 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |   9 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |   7 +-
 ...-ld-XXX.so-strlen-intercept-optional.patch |   7 +-
 ...{valgrind_3.22.0.bb => valgrind_3.23.0.bb} |   8 +-
 15 files changed, 101 insertions(+), 657 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.22.0.bb => valgrind_3.23.0.bb} (96%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
index e7af5efeccd..832a1c3d6e1 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
@@ -10,11 +10,9 @@ Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
  tests/vg_regtest.in | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 909af3be8..f2799c4e3 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
-@@ -403,6 +403,7 @@ sub mysystem($)
+@@ -401,6 +401,7 @@ sub mysystem($)
              exit 1;
          }
      }
@@ -22,6 +20,3 @@ index 909af3be8..f2799c4e3 100755
  }
  # if $keepunfiltered, copies $1 to $1.unfiltered.out
  # renames $0 tp $1
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
new file mode 100644
index 00000000000..63a1a58c046
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -0,0 +1,40 @@
+From b17b6d7d3a65c14f91f090f3f4f9898d6fa3a9e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 May 2024 16:27:34 -0700
+Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
+
+The -march settings from environment expresses the flags
+appropriately, moreover, this conflicts when using armhf
+without neon [1]
+
+[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=928224
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 39d8b6d..d61b3a6 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -275,13 +275,13 @@ case "${host_cpu}" in
+ 
+      armv8*)
+         AC_MSG_RESULT([ok (${host_cpu})])
+-        VGCONF_PLATFORM_ARM_ARCH="-marm -mcpu=cortex-a8"
++        VGCONF_PLATFORM_ARM_ARCH="-marm"
+         ARCH_MAX="arm"
+         ;;
+ 
+      armv7*)
+         AC_MSG_RESULT([ok (${host_cpu})])
+-        VGCONF_PLATFORM_ARM_ARCH="-marm -mcpu=cortex-a8"
++        VGCONF_PLATFORM_ARM_ARCH="-marm"
+         ARCH_MAX="arm"
+         ;;
+ 
+-- 
+2.45.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index 256ddb0c343..eba569c884b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -18,11 +18,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  docs/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/docs/Makefile.am b/docs/Makefile.am
-index d4250e8..c500306 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -192,7 +192,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -194,7 +194,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  touch $@; \
  	fi
  
@@ -31,6 +29,3 @@ index d4250e8..c500306 100644
  
  # The text version of the FAQ.
  FAQ.txt:
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index 073713c1396..7996fa6e8f8 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -19,30 +19,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  none/tests/arm/Makefile.am | 18 +++++++++---------
  3 files changed, 15 insertions(+), 15 deletions(-)
 
-diff --git a/Makefile.all.am b/Makefile.all.am
-index 02059a3..c7c4700 100644
---- a/Makefile.all.am
-+++ b/Makefile.all.am
-@@ -197,11 +197,11 @@ AM_CCASFLAGS_PPC64LE_LINUX  = @FLAG_M64@ -g
- 
- AM_FLAG_M3264_ARM_LINUX   = @FLAG_M32@
- AM_CFLAGS_ARM_LINUX       = @FLAG_M32@ \
--			 	$(AM_CFLAGS_BASE) -marm -mcpu=cortex-a8
-+			 	$(AM_CFLAGS_BASE) -marm
- AM_CFLAGS_PSO_ARM_LINUX   = @FLAG_M32@ $(AM_CFLAGS_BASE) \
--				-marm -mcpu=cortex-a8 $(AM_CFLAGS_PSO_BASE)
-+				-marm $(AM_CFLAGS_PSO_BASE)
- AM_CCASFLAGS_ARM_LINUX    = @FLAG_M32@ \
--				-marm -mcpu=cortex-a8 -g
-+				-marm -g
- 
- AM_FLAG_M3264_ARM64_LINUX = @FLAG_M64@
- AM_CFLAGS_ARM64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE)
-diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index df82169..07eb66a 100644
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -189,9 +189,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+@@ -223,9 +223,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
  endif
  
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
@@ -55,11 +34,9 @@ index df82169..07eb66a 100644
  else
  annotate_hbefore_CFLAGS = $(AM_CFLAGS)
  tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
-diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 024eb6d..ccecb90 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -52,10 +52,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+@@ -56,10 +56,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_N
  # need special helping w.r.t -mfpu and -mfloat-abi, though.
  # Also force -O0 since -O takes hundreds of MB of memory 
  # for v6intThumb.c.
@@ -71,11 +48,11 @@ index 024eb6d..ccecb90 100644
 -v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
 +v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mthumb
  
- v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm
- v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb
-@@ -65,23 +65,23 @@ v8memory_a_CFLAGS = $(AM_CFLAGS) -g -O0 \
- v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
- 			-march=armv8-a -mfpu=crypto-neon-fp-armv8 -mthumb
+ v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm -march=armv8-a
+ v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb -march=armv8-a
+@@ -74,23 +74,23 @@ v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0
+ 
+ vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mfpu=neon
  
 -vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
 +vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 \
@@ -103,6 +80,3 @@ index 024eb6d..ccecb90 100644
 +vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mfpu=vfpv3
  
  vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
--- 
-2.12.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
index 15fbbe954f0..29a9e95a900 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/config.h.in
 +++ b/config.h.in
-@@ -301,6 +301,9 @@
+@@ -424,6 +424,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4098,6 +4098,7 @@ AC_CHECK_HEADERS([       \
+@@ -4881,6 +4881,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
@@ -39,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
 --- a/memcheck/tests/linux/timerfd-syscall.c
 +++ b/memcheck/tests/linux/timerfd-syscall.c
-@@ -45,6 +45,9 @@
+@@ -42,6 +42,9 @@
  #if defined(HAVE_SYS_TIME_H)
  #include <sys/time.h>
  #endif
@@ -49,7 +49,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if defined(HAVE_SYS_TYPES_H)
  #include <sys/types.h>
  #endif
-@@ -54,7 +57,8 @@
+@@ -51,7 +54,8 @@
   * timerfd_* system call numbers introduced in 2.6.23. These constants are
   * not yet in the glibc 2.7 headers, that is why they are defined here.
   */
@@ -59,7 +59,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if defined(__x86_64__)
  #define __NR_timerfd_create  283
  #elif defined(__i386__)
-@@ -67,8 +71,10 @@
+@@ -64,8 +68,10 @@
  #error Cannot detect your architecture!
  #endif
  #endif
@@ -71,7 +71,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if defined(__x86_64__)
  #define __NR_timerfd_settime 286
  #define __NR_timerfd_gettime 287
-@@ -85,7 +91,7 @@
+@@ -82,7 +88,7 @@
  #error Cannot detect your architecture!
  #endif
  #endif
@@ -80,7 +80,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Definitions from include/linux/timerfd.h */
-@@ -127,6 +133,7 @@ void set_timespec(struct timespec *tmr,
+@@ -124,6 +130,7 @@ void set_timespec(struct timespec *tmr,
    tmr->tv_nsec = (long) (1000ULL * (ustime % 1000000ULL));
  }
  
@@ -88,7 +88,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int timerfd_create(int clockid, int flags)
  {
    return syscall(__NR_timerfd_create, clockid, flags);
-@@ -142,6 +149,7 @@ int timerfd_gettime(int ufc, struct itim
+@@ -139,6 +146,7 @@ int timerfd_gettime(int ufc, struct itim
  {
    return syscall(__NR_timerfd_gettime, ufc, otmr);
  }
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
new file mode 100644
index 00000000000..2d28bcb6c41
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -0,0 +1,34 @@
+From 8e907753625faba3284925983ef8e83f8491aa76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 May 2024 17:44:47 -0700
+Subject: [PATCH] tests/arm: Use -O instead of -O0
+
+GCC-14 fails to compile the testcase with -O2 [1]
+therefore workaround it by using -O1, which works
+and for OE/cross-compiling it is fine, -O0 is used
+to make these tests compile natively on an arm target
+and gcc would take less memory compiling with -O0
+-O would take a bit more memory but in cross compiling
+we have enough of it on build host.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115042
+Upstream-Status: Inappropriate [WORKAROUND]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ none/tests/arm/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/none/tests/arm/Makefile.am
++++ b/none/tests/arm/Makefile.am
+@@ -57,9 +57,9 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_N
+ # Also force -O0 since -O takes hundreds of MB of memory 
+ # for v6intThumb.c.
+ v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -marm
+-v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mthumb
++v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O -mthumb
+ 
+-v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mthumb
++v6media_CFLAGS    = $(AM_CFLAGS) -g -O -mthumb
+ 
+ v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm -march=armv8-a
+ v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb -march=armv8-a
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch
deleted file mode 100644
index 80a8e3a10b1..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-monitor.py-regular-expressions-should-use-r.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 027b649fdb831868e71be01cafdacc49a5f419ab Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Fri, 17 Nov 2023 14:01:21 +0100
-Subject: [PATCH 1/4] valgrind-monitor.py regular expressions should use raw
- strings
-
-With python 3.12 gdb will produce the following SyntaxWarning when
-loading valgrind-monitor-def.py:
-
-  /usr/share/gdb/auto-load/valgrind-monitor-def.py:214:
-  SyntaxWarning: invalid escape sequence '\['
-    if re.fullmatch("^0x[0123456789ABCDEFabcdef]+\[[^\[\]]+\]$", arg_str):
-
-In a future python version this will become an SyntaxError.
-
-Use a raw strings for the regular expression.
-
-https://bugs.kde.org/show_bug.cgi?id=476708
-(cherry picked from commit 0fbfbe05028ad18efda786a256a2738d2c231ed4)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=027b649fdb831868e71be01cafdacc49a5f419ab]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- NEWS                                          | 13 +++++++++++++
- coregrind/m_gdbserver/valgrind-monitor-def.py |  2 +-
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index f11da4be8..ee5b4ff11 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,16 @@
-+Branch 3.22
-+~~~~~~~~~~~
-+
-+* ==================== FIXED BUGS ====================
-+
-+The following bugs have been fixed or resolved on this branch.
-+
-+476708  valgrind-monitor.py regular expressions should use raw strings
-+
-+To see details of a given bug, visit
-+  https://bugs.kde.org/show_bug.cgi?id=XXXXXX
-+where XXXXXX is the bug number as listed above.
-+
- Release 3.22.0 (31 Oct 2023)
- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- 
-diff --git a/coregrind/m_gdbserver/valgrind-monitor-def.py b/coregrind/m_gdbserver/valgrind-monitor-def.py
-index b4e7b992d..d74b1590c 100644
---- a/coregrind/m_gdbserver/valgrind-monitor-def.py
-+++ b/coregrind/m_gdbserver/valgrind-monitor-def.py
-@@ -211,7 +211,7 @@ class Valgrind_ADDR_LEN_opt(Valgrind_Command):
- For compatibility reason with the Valgrind gdbserver monitor command,
- we detect and accept usages such as 0x1234ABCD[10]."""
-     def invoke(self, arg_str : str, from_tty : bool) -> None:
--        if re.fullmatch("^0x[0123456789ABCDEFabcdef]+\[[^\[\]]+\]$", arg_str):
-+        if re.fullmatch(r"^0x[0123456789ABCDEFabcdef]+\[[^\[\]]+\]$", arg_str):
-             arg_str = arg_str.replace("[", " ")
-             arg_str = arg_str.replace("]", " ")
-         eval_execute_2(self, arg_str,
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch b/meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch
deleted file mode 100644
index 5759fa039a3..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 1d00e5ce0fb069911c4b525ec38289fb5d9021b0 Mon Sep 17 00:00:00 2001
-From: Paul Floyd <pjfloyd@wanadoo.fr>
-Date: Sat, 18 Nov 2023 08:49:34 +0100
-Subject: [PATCH 2/4] Bug 476548 - valgrind 3.22.0 fails on assertion when
- loading debuginfo file produced by mold
-
-(cherry picked from commit 9ea4ae66707a4dcc6f4328e11911652e4418c585)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=1d00e5ce0fb069911c4b525ec38289fb5d9021b0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- NEWS                               |  2 ++
- coregrind/m_debuginfo/image.c      | 14 +++++++++
- coregrind/m_debuginfo/priv_image.h |  4 +++
- coregrind/m_debuginfo/readelf.c    | 49 ++++++++++++++++++++++++++++--
- 4 files changed, 66 insertions(+), 3 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index ee5b4ff11..6cd13429a 100644
---- a/NEWS
-+++ b/NEWS
-@@ -5,6 +5,8 @@ Branch 3.22
- 
- The following bugs have been fixed or resolved on this branch.
- 
-+476548  valgrind 3.22.0 fails on assertion when loading debuginfo
-+        file produced by mold
- 476708  valgrind-monitor.py regular expressions should use raw strings
- 
- To see details of a given bug, visit
-diff --git a/coregrind/m_debuginfo/image.c b/coregrind/m_debuginfo/image.c
-index 02e509071..445f95555 100644
---- a/coregrind/m_debuginfo/image.c
-+++ b/coregrind/m_debuginfo/image.c
-@@ -1221,6 +1221,20 @@ Int ML_(img_strcmp_c)(DiImage* img, DiOffT off1, const HChar* str2)
-    }
- }
- 
-+Int ML_(img_strcmp_n)(DiImage* img, DiOffT off1, const HChar* str2, Word n)
-+{
-+   ensure_valid(img, off1, 1, "ML_(img_strcmp_c)");
-+   while (n) {
-+      UChar c1 = get(img, off1);
-+      UChar c2 = *(const UChar*)str2;
-+      if (c1 < c2) return -1;
-+      if (c1 > c2) return 1;
-+      if (c1 == 0) return 0;
-+      off1++; str2++; --n;
-+   }
-+   return 0;
-+}
-+
- UChar ML_(img_get_UChar)(DiImage* img, DiOffT offset)
- {
-    ensure_valid(img, offset, 1, "ML_(img_get_UChar)");
-diff --git a/coregrind/m_debuginfo/priv_image.h b/coregrind/m_debuginfo/priv_image.h
-index a49846f14..c91e49f01 100644
---- a/coregrind/m_debuginfo/priv_image.h
-+++ b/coregrind/m_debuginfo/priv_image.h
-@@ -115,6 +115,10 @@ Int ML_(img_strcmp)(DiImage* img, DiOffT off1, DiOffT off2);
-    cast to HChar before comparison. */
- Int ML_(img_strcmp_c)(DiImage* img, DiOffT off1, const HChar* str2);
- 
-+/* Do strncmp of a C string in the image vs a normal one.  Chars are
-+   cast to HChar before comparison. */
-+Int ML_(img_strcmp_n)(DiImage* img, DiOffT off1, const HChar* str2, Word n);
-+
- /* Do strlen of a C string in the image. */
- SizeT ML_(img_strlen)(DiImage* img, DiOffT off);
- 
-diff --git a/coregrind/m_debuginfo/readelf.c b/coregrind/m_debuginfo/readelf.c
-index fb64ed976..46f8c8343 100644
---- a/coregrind/m_debuginfo/readelf.c
-+++ b/coregrind/m_debuginfo/readelf.c
-@@ -2501,8 +2501,7 @@ Bool ML_(read_elf_object) ( struct _DebugInfo* di )
-             di->rodata_avma += inrw1->bias;
-             di->rodata_bias = inrw1->bias;
-             di->rodata_debug_bias = inrw1->bias;
--         }
--         else {
-+         } else {
-             BAD(".rodata");  /* should not happen? */
-          }
-          di->rodata_present = True;
-@@ -2977,6 +2976,46 @@ Bool ML_(read_elf_object) ( struct _DebugInfo* di )
-    return retval;
- }
- 
-+static void find_rodata(Word i, Word shnum, DiImage* dimg, struct _DebugInfo* di, DiOffT shdr_dioff,
-+                        UWord shdr_dent_szB, DiOffT shdr_strtab_dioff, PtrdiffT rw_dbias)
-+{
-+   ElfXX_Shdr a_shdr;
-+   ElfXX_Shdr a_extra_shdr;
-+   ML_(img_get)(&a_shdr, dimg,
-+                INDEX_BIS(shdr_dioff, i, shdr_dent_szB),
-+                sizeof(a_shdr));
-+   if (di->rodata_present &&
-+       0 == ML_(img_strcmp_c)(dimg, shdr_strtab_dioff
-+                                    + a_shdr.sh_name, ".rodata")) {
-+      Word sh_size = a_shdr.sh_size;
-+      Word j;
-+      Word next_addr = a_shdr.sh_addr + a_shdr.sh_size;
-+      for (j = i  + 1; j < shnum; ++j) {
-+         ML_(img_get)(&a_extra_shdr, dimg,
-+                      INDEX_BIS(shdr_dioff, j, shdr_dent_szB),
-+                      sizeof(a_shdr));
-+         if (0 == ML_(img_strcmp_n)(dimg, shdr_strtab_dioff
-+                                             + a_extra_shdr.sh_name, ".rodata", 7)) {
-+            if (a_extra_shdr.sh_addr ==
-+                VG_ROUNDUP(next_addr, a_extra_shdr.sh_addralign)) {
-+               sh_size = VG_ROUNDUP(sh_size, a_extra_shdr.sh_addralign) + a_extra_shdr.sh_size;
-+            }
-+            next_addr = a_extra_shdr.sh_addr + a_extra_shdr.sh_size;
-+         } else {
-+            break;
-+         }
-+      }
-+      vg_assert(di->rodata_size == sh_size);
-+      vg_assert(di->rodata_avma +  a_shdr.sh_addr + rw_dbias);
-+      di->rodata_debug_svma = a_shdr.sh_addr;
-+      di->rodata_debug_bias = di->rodata_bias +
-+                             di->rodata_svma - di->rodata_debug_svma;
-+      TRACE_SYMTAB("acquiring .rodata  debug svma = %#lx .. %#lx\n",
-+                   di->rodata_debug_svma,
-+                   di->rodata_debug_svma + di->rodata_size - 1);
-+      TRACE_SYMTAB("acquiring .rodata debug bias = %#lx\n", (UWord)di->rodata_debug_bias);
-+   }
-+}
- Bool ML_(read_elf_debug) ( struct _DebugInfo* di )
- {
-    Word     i, j;
-@@ -3391,7 +3430,11 @@ Bool ML_(read_elf_debug) ( struct _DebugInfo* di )
-             FIND(text,   rx)
-             FIND(data,   rw)
-             FIND(sdata,  rw)
--            FIND(rodata, rw)
-+            // https://bugs.kde.org/show_bug.cgi?id=476548
-+            // special handling for rodata as adjacent
-+            // rodata sections may have been merged in ML_(read_elf_object)
-+            //FIND(rodata, rw)
-+            find_rodata(i, ehdr_dimg.e_shnum, dimg, di, shdr_dioff, shdr_dent_szB, shdr_strtab_dioff, rw_dbias);
-             FIND(bss,    rw)
-             FIND(sbss,   rw)
- 
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch
deleted file mode 100644
index 2a09ca52b77..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0003-Add-fchmodat2-syscall-on-linux.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From a43e62dddcf51ec6578a90c5988a41e856b44b05 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Sat, 18 Nov 2023 21:17:02 +0100
-Subject: [PATCH 3/4] Add fchmodat2 syscall on linux
-
-fchmodat2 is a new syscall on linux 6.6. It is a variant of fchmodat
-that takes an extra flags argument.
-
-https://bugs.kde.org/show_bug.cgi?id=477198
-
-(cherry picked from commit 372d09fd9a8d76847c81092ebff71c80fd6c145d)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=a43e62dddcf51ec6578a90c5988a41e856b44b05]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- NEWS                                         |  1 +
- coregrind/m_syswrap/priv_syswrap-linux.h     |  3 +++
- coregrind/m_syswrap/syswrap-amd64-linux.c    |  2 ++
- coregrind/m_syswrap/syswrap-arm-linux.c      |  2 ++
- coregrind/m_syswrap/syswrap-arm64-linux.c    |  2 ++
- coregrind/m_syswrap/syswrap-linux.c          | 11 +++++++++++
- coregrind/m_syswrap/syswrap-mips32-linux.c   |  2 ++
- coregrind/m_syswrap/syswrap-mips64-linux.c   |  1 +
- coregrind/m_syswrap/syswrap-nanomips-linux.c |  1 +
- coregrind/m_syswrap/syswrap-ppc32-linux.c    |  2 ++
- coregrind/m_syswrap/syswrap-ppc64-linux.c    |  2 ++
- coregrind/m_syswrap/syswrap-s390x-linux.c    |  2 ++
- coregrind/m_syswrap/syswrap-x86-linux.c      |  2 ++
- include/vki/vki-scnums-shared-linux.h        |  2 ++
- 14 files changed, 35 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 6cd13429a..da0f8c1aa 100644
---- a/NEWS
-+++ b/NEWS
-@@ -8,6 +8,7 @@ The following bugs have been fixed or resolved on this branch.
- 476548  valgrind 3.22.0 fails on assertion when loading debuginfo
-         file produced by mold
- 476708  valgrind-monitor.py regular expressions should use raw strings
-+477198  Add fchmodat2 syscall on linux
- 
- To see details of a given bug, visit
-   https://bugs.kde.org/show_bug.cgi?id=XXXXXX
-diff --git a/coregrind/m_syswrap/priv_syswrap-linux.h b/coregrind/m_syswrap/priv_syswrap-linux.h
-index 7c9decf5a..798c456c9 100644
---- a/coregrind/m_syswrap/priv_syswrap-linux.h
-+++ b/coregrind/m_syswrap/priv_syswrap-linux.h
-@@ -331,6 +331,9 @@ DECL_TEMPLATE(linux, sys_openat2);
- // Linux-specific (new in Linux 5.14)
- DECL_TEMPLATE(linux, sys_memfd_secret);
- 
-+// Since Linux 6.6
-+DECL_TEMPLATE(linux, sys_fchmodat2);
-+
- /* ---------------------------------------------------------------------
-    Wrappers for sockets and ipc-ery.  These are split into standalone
-    procedures because x86-linux hides them inside multiplexors
-diff --git a/coregrind/m_syswrap/syswrap-amd64-linux.c b/coregrind/m_syswrap/syswrap-amd64-linux.c
-index 008600798..fe17d118b 100644
---- a/coregrind/m_syswrap/syswrap-amd64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-amd64-linux.c
-@@ -886,6 +886,8 @@ static SyscallTableEntry syscall_table[] = {
-    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
- 
-    LINXY(__NR_memfd_secret,      sys_memfd_secret),      // 447
-+
-+   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
-diff --git a/coregrind/m_syswrap/syswrap-arm-linux.c b/coregrind/m_syswrap/syswrap-arm-linux.c
-index 9a7a1e0d2..811931d3b 100644
---- a/coregrind/m_syswrap/syswrap-arm-linux.c
-+++ b/coregrind/m_syswrap/syswrap-arm-linux.c
-@@ -1059,6 +1059,8 @@ static SyscallTableEntry syscall_main_table[] = {
-    LINX_(__NR_faccessat2,    sys_faccessat2),           // 439
- 
-    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
-+
-+   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
- };
- 
- 
-diff --git a/coregrind/m_syswrap/syswrap-arm64-linux.c b/coregrind/m_syswrap/syswrap-arm64-linux.c
-index 6af7bab83..3307bc2ca 100644
---- a/coregrind/m_syswrap/syswrap-arm64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-arm64-linux.c
-@@ -840,6 +840,8 @@ static SyscallTableEntry syscall_main_table[] = {
-    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
- 
-    LINXY(__NR_memfd_secret,      sys_memfd_secret),      // 447
-+
-+   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
- };
- 
- 
-diff --git a/coregrind/m_syswrap/syswrap-linux.c b/coregrind/m_syswrap/syswrap-linux.c
-index d571fc327..efa47f2e6 100644
---- a/coregrind/m_syswrap/syswrap-linux.c
-+++ b/coregrind/m_syswrap/syswrap-linux.c
-@@ -6059,6 +6059,17 @@ PRE(sys_fchmodat)
-    PRE_MEM_RASCIIZ( "fchmodat(path)", ARG2 );
- }
- 
-+PRE(sys_fchmodat2)
-+{
-+   PRINT("sys_fchmodat2 ( %ld, %#" FMT_REGWORD "x(%s), %" FMT_REGWORD "u, %"
-+	  FMT_REGWORD "u )",
-+         SARG1, ARG2, (HChar*)(Addr)ARG2, ARG3, ARG4);
-+   PRE_REG_READ4(long, "fchmodat2",
-+                 int, dfd, const char *, path, vki_mode_t, mode,
-+                 unsigned int, flags);
-+   PRE_MEM_RASCIIZ( "fchmodat2(pathname)", ARG2 );
-+}
-+
- PRE(sys_faccessat)
- {
-    PRINT("sys_faccessat ( %ld, %#" FMT_REGWORD "x(%s), %ld )",
-diff --git a/coregrind/m_syswrap/syswrap-mips32-linux.c b/coregrind/m_syswrap/syswrap-mips32-linux.c
-index 6268a00dd..74a1f6eac 100644
---- a/coregrind/m_syswrap/syswrap-mips32-linux.c
-+++ b/coregrind/m_syswrap/syswrap-mips32-linux.c
-@@ -1143,6 +1143,8 @@ static SyscallTableEntry syscall_main_table[] = {
-    LINX_ (__NR_faccessat2,             sys_faccessat2),              // 439
- 
-    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),      // 441
-+
-+   LINX_(__NR_fchmodat2,               sys_fchmodat2),               // 452
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) (UInt sysno)
-diff --git a/coregrind/m_syswrap/syswrap-mips64-linux.c b/coregrind/m_syswrap/syswrap-mips64-linux.c
-index 6cdf25893..4e8508b7a 100644
---- a/coregrind/m_syswrap/syswrap-mips64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-mips64-linux.c
-@@ -820,6 +820,7 @@ static SyscallTableEntry syscall_main_table[] = {
-    LINXY (__NR_close_range, sys_close_range),
-    LINX_ (__NR_faccessat2, sys_faccessat2),
-    LINXY(__NR_epoll_pwait2, sys_epoll_pwait2),
-+   LINX_ (__NR_fchmodat2, sys_fchmodat2),
- };
- 
- SyscallTableEntry * ML_(get_linux_syscall_entry) ( UInt sysno )
-diff --git a/coregrind/m_syswrap/syswrap-nanomips-linux.c b/coregrind/m_syswrap/syswrap-nanomips-linux.c
-index d724cde74..7859900c1 100644
---- a/coregrind/m_syswrap/syswrap-nanomips-linux.c
-+++ b/coregrind/m_syswrap/syswrap-nanomips-linux.c
-@@ -829,6 +829,7 @@ static SyscallTableEntry syscall_main_table[] = {
-    LINXY (__NR_close_range,            sys_close_range),
-    LINX_ (__NR_faccessat2,             sys_faccessat2),
-    LINXY (__NR_epoll_pwait2,           sys_epoll_pwait2),
-+   LINX_ (__NR_fchmodat2,              sys_fchmodat2),
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) (UInt sysno)
-diff --git a/coregrind/m_syswrap/syswrap-ppc32-linux.c b/coregrind/m_syswrap/syswrap-ppc32-linux.c
-index c0cfef235..1e19116ee 100644
---- a/coregrind/m_syswrap/syswrap-ppc32-linux.c
-+++ b/coregrind/m_syswrap/syswrap-ppc32-linux.c
-@@ -1063,6 +1063,8 @@ static SyscallTableEntry syscall_table[] = {
-    LINX_(__NR_faccessat2,        sys_faccessat2),       // 439
- 
-    LINXY (__NR_epoll_pwait2,     sys_epoll_pwait2),      // 441
-+
-+   LINX_ (__NR_fchmodat2,        sys_fchmodat2),         // 452
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
-diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
-index f5976f30c..1097212a4 100644
---- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
-@@ -1032,6 +1032,8 @@ static SyscallTableEntry syscall_table[] = {
-    LINX_(__NR_faccessat2,        sys_faccessat2),       // 439
- 
-    LINXY (__NR_epoll_pwait2,     sys_epoll_pwait2),      // 441
-+
-+   LINX_ (__NR_fchmodat2,        sys_fchmodat2),         // 452
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
-diff --git a/coregrind/m_syswrap/syswrap-s390x-linux.c b/coregrind/m_syswrap/syswrap-s390x-linux.c
-index afba154e7..3588672c7 100644
---- a/coregrind/m_syswrap/syswrap-s390x-linux.c
-+++ b/coregrind/m_syswrap/syswrap-s390x-linux.c
-@@ -873,6 +873,8 @@ static SyscallTableEntry syscall_table[] = {
-    LINX_(__NR_faccessat2,  sys_faccessat2),                           // 439
- 
-    LINXY(__NR_epoll_pwait2, sys_epoll_pwait2),                        // 441
-+
-+   LINX_ (__NR_fchmodat2, sys_fchmodat2),                             // 452
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
-diff --git a/coregrind/m_syswrap/syswrap-x86-linux.c b/coregrind/m_syswrap/syswrap-x86-linux.c
-index da4fd8fa2..58badc6b0 100644
---- a/coregrind/m_syswrap/syswrap-x86-linux.c
-+++ b/coregrind/m_syswrap/syswrap-x86-linux.c
-@@ -1658,6 +1658,8 @@ static SyscallTableEntry syscall_table[] = {
-    LINXY(__NR_epoll_pwait2,      sys_epoll_pwait2),     // 441
- 
-    LINXY(__NR_memfd_secret,      sys_memfd_secret),      // 447
-+
-+   LINX_(__NR_fchmodat2,         sys_fchmodat2),         // 452
- };
- 
- SyscallTableEntry* ML_(get_linux_syscall_entry) ( UInt sysno )
-diff --git a/include/vki/vki-scnums-shared-linux.h b/include/vki/vki-scnums-shared-linux.h
-index 542382b53..a4cd87149 100644
---- a/include/vki/vki-scnums-shared-linux.h
-+++ b/include/vki/vki-scnums-shared-linux.h
-@@ -50,4 +50,6 @@
- 
- #define __NR_memfd_secret		447
- 
-+#define __NR_fchmodat2		452
-+
- #endif
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch b/meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch
deleted file mode 100644
index 4e9185508a5..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 41ff9aa49f6c54c66d0e6b37f265fd9cb0176057 Mon Sep 17 00:00:00 2001
-From: Paul Floyd <pjfloyd@wanadoo.fr>
-Date: Sun, 17 Dec 2023 14:18:51 +0100
-Subject: [PATCH 4/4] Bug 478624 - Valgrind incompatibility with binutils-2.42
- on x86 with new nop patterns (unhandled instruction bytes: 0x2E 0x8D 0xB4
- 0x26)
-
-It was a bit of a struggle to get the testcase to build
-with both clang and gcc (oddly enough gcc was more difficult) so
-I just resorted to using .byte arrays.
-
-(cherry picked from commit d35005cef8ad8207542738812705ceabf137d7e0)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=41ff9aa49f6c54c66d0e6b37f265fd9cb0176057]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .gitignore                                 |  1 +
- NEWS                                       |  2 ++
- VEX/priv/guest_x86_toIR.c                  | 22 +++++++++++++-
- none/tests/x86/Makefile.am                 |  2 ++
- none/tests/x86/gnu_binutils_nop.c          | 34 ++++++++++++++++++++++
- none/tests/x86/gnu_binutils_nop.stderr.exp |  0
- none/tests/x86/gnu_binutils_nop.vgtest     |  2 ++
- 7 files changed, 62 insertions(+), 1 deletion(-)
- create mode 100644 none/tests/x86/gnu_binutils_nop.c
- create mode 100644 none/tests/x86/gnu_binutils_nop.stderr.exp
- create mode 100644 none/tests/x86/gnu_binutils_nop.vgtest
-
---- a/NEWS
-+++ b/NEWS
-@@ -9,6 +9,8 @@ The following bugs have been fixed or re
-         file produced by mold
- 476708  valgrind-monitor.py regular expressions should use raw strings
- 477198  Add fchmodat2 syscall on linux
-+478624  Valgrind incompatibility with binutils-2.42 on x86 with new nop patterns
-+        (unhandled instruction bytes: 0x2E 0x8D 0xB4 0x26)
- 
- To see details of a given bug, visit
-   https://bugs.kde.org/show_bug.cgi?id=XXXXXX
---- a/VEX/priv/guest_x86_toIR.c
-+++ b/VEX/priv/guest_x86_toIR.c
-@@ -8198,7 +8198,7 @@ DisResult disInstr_X86_WRK (
-          delta += 5;
-          goto decode_success;
-       }
--      /* Don't barf on recent binutils padding,
-+      /* Don't barf on recent (2010) binutils padding,
-          all variants of which are: nopw %cs:0x0(%eax,%eax,1)
-          66 2e 0f 1f 84 00 00 00 00 00
-          66 66 2e 0f 1f 84 00 00 00 00 00
-@@ -8222,6 +8222,26 @@ DisResult disInstr_X86_WRK (
-             goto decode_success;
-          }
-       }
-+
-+      /* bug478624 GNU binutils uses a leal of esi into itself with
-+         a zero offset and CS prefix as an 8 byte no-op (Dec 2023).
-+         Since the CS prefix is hardly ever used we don't do much
-+         to decode it, just a few cases for conditional branches.
-+         So add handling here with other pseudo-no-ops.
-+       */
-+      if (code[0] == 0x2E && code[1] == 0x8D) {
-+         if (code[2] == 0x74 && code[3] == 0x26 && code[4] == 0x00) {
-+            DIP("leal %%cs:0(%%esi,%%eiz,1),%%esi\n");
-+            delta += 5;
-+            goto decode_success;
-+         }
-+         if (code[2] == 0xB4 && code[3] == 0x26 && code[4] == 0x00
-+             && code[5] == 0x00 && code[6] == 0x00 && code[7] == 0x00) {
-+            DIP("leal %%cs:0(%%esi,%%eiz,1),%%esi\n");
-+            delta += 8;
-+            goto decode_success;
-+         }
-+      }
- 
-       // Intel CET requires the following opcodes to be treated as NOPs
-       // with any prefix and ModRM, SIB and disp combination:
---- a/none/tests/x86/Makefile.am
-+++ b/none/tests/x86/Makefile.am
-@@ -52,6 +52,7 @@ EXTRA_DIST = \
- 	fxtract.stdout.exp fxtract.stderr.exp fxtract.vgtest \
- 	fxtract.stdout.exp-older-glibc \
- 	getseg.stdout.exp getseg.stderr.exp getseg.vgtest \
-+	gnu_binutils_nop.stderr.exp gnu_binutils_nop.vgtest \
- 	incdec_alt.stdout.exp incdec_alt.stderr.exp incdec_alt.vgtest \
- 	int.stderr.exp int.stdout.exp int.disabled \
- 	$(addsuffix .stderr.exp,$(INSN_TESTS)) \
-@@ -100,6 +101,7 @@ check_PROGRAMS = \
- 	fpu_lazy_eflags \
- 	fxtract \
- 	getseg \
-+	gnu_binutils_nop \
- 	incdec_alt \
- 	$(INSN_TESTS) \
- 	int \
---- /dev/null
-+++ b/none/tests/x86/gnu_binutils_nop.c
-@@ -0,0 +1,34 @@
-+int main(void)
-+{
-+    // GNU binutils uses various opcodes as alternatives for nop
-+    // the idea is that it is faster to execute one large opcode
-+    // with no side-effects than multiple repetitions of the
-+    // single byte 'nop'. This gives more choice when code
-+    // needs to be padded.
-+   
-+   // the following is based on
-+   // https://sourceware.org/cgit/binutils-gdb/tree/gas/config/tc-i386.c#n1256
-+
-+    // one byte
-+    __asm__ __volatile__("nop");
-+    // two bytes
-+    __asm__ __volatile__("xchg %ax,%ax");
-+    // three bytes
-+    //__asm__ __volatile__("leal 0(%esi),%esi");
-+    __asm__ __volatile__(".byte 0x8d,0x76,0x00");
-+    // four bytes
-+    //__asm__ __volatile__("leal 0(%esi,%eiz),%esi");
-+    __asm__ __volatile__(".byte 0x8d,0x74,0x26,0x00");
-+    // five bytes
-+    //__asm__ __volatile__("leal %cs:0(%esi,%eiz),%esi");
-+    __asm__ __volatile__(".byte 0x2e,0x8d,0x74,0x26,0x00");
-+    // six bytes
-+    //__asm__ __volatile__("leal 0L(%esi),%esi");
-+    __asm__ __volatile__(".byte 0x8d,0xb6,0x00,0x00,0x00,0x00");
-+    // seven bytes
-+    //__asm__ __volatile__("leal 0L(%esi,%eiz),%esi");
-+    __asm__ __volatile__(".byte 0x8d,0xb4,0x26,0x00,0x00,0x00,0x00");
-+    // eight bytes
-+    //__asm__ __volatile__("leal %cs:0L(%esi,%eiz),%esi");
-+    __asm__ __volatile__(".byte 0x2e,0x8d,0xb4,0x26,0x00,0x00,0x00,0x00");
-+}
---- /dev/null
-+++ b/none/tests/x86/gnu_binutils_nop.vgtest
-@@ -0,0 +1,2 @@
-+prog: gnu_binutils_nop
-+vgopts: -q
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 51cd3532d3a..65de427d365 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -17,11 +17,9 @@ Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
  VEX/priv/guest_ppc_toIR.c    |   22 ++++++++++++++++++++++
  3 files changed, 42 insertions(+), 0 deletions(-)
 
-diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
-index dd3c62e..11a34aa 100644
 --- a/VEX/priv/guest_ppc_defs.h
 +++ b/VEX/priv/guest_ppc_defs.h
-@@ -146,6 +146,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
+@@ -233,6 +233,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268
  
  extern UInt ppc32g_dirtyhelper_MFSPR_287 ( void );
  
@@ -30,11 +28,9 @@ index dd3c62e..11a34aa 100644
  extern void ppc32g_dirtyhelper_LVS ( VexGuestPPC32State* gst,
                                       UInt vD_idx, UInt sh,
                                       UInt shift_right );
-diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
-index 11aa428..b49ea3f 100644
 --- a/VEX/priv/guest_ppc_helpers.c
 +++ b/VEX/priv/guest_ppc_helpers.c
-@@ -119,6 +119,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
+@@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void
  #  endif
  }
  
@@ -59,11 +55,9 @@ index 11aa428..b49ea3f 100644
  
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
-diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
-index f8d220d..37c8974 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
-@@ -5657,6 +5657,28 @@ static Bool dis_proc_ctl ( VexAbiInfo* vbi, UInt theInstr )
+@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiI
           break;
        }
  
@@ -92,5 +86,3 @@ index f8d220d..37c8974 100644
        default:
           vex_printf("dis_proc_ctl(ppc)(mfspr,SPR)(0x%x)\n", SPR);
           return False;
--- 
-1.7.0.4
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index bde1241dc7c..3ab339d215d 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -17,19 +17,14 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  VEX/priv/guest_s390_defs.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index 9054290..dab8002 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
 @@ -284,7 +284,7 @@ typedef enum {
-    S390_VEC_OP_VBPERM,
-    S390_VEC_OP_VMSL,
+    S390_VEC_OP_VCLFNL,
+    S390_VEC_OP_VCRNF,
     S390_VEC_OP_LAST             // supposed to be the last element in enum
 -} s390x_vec_op_t;
 +};
  
  /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
     ULong variable.
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index f15d04b1735..afca874d022 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -22,11 +22,9 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  none/tests/arm/Makefile.am | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 4507a20..825290f 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -62,8 +62,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
+@@ -87,8 +87,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0
  			-mfpu=neon \
  			-mthumb
  
@@ -39,6 +37,3 @@ index 4507a20..825290f 100644
 +vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
 +
 +vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index d04297dca8b..0895473fc01 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -16,11 +16,9 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  coregrind/m_redir.c | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
-diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index ff35009..d7d6816 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
-@@ -1275,7 +1275,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
+@@ -1307,7 +1307,18 @@ static void add_hardwired_spec (const  H
     spec->to_addr     = to_addr;
     spec->isWrap      = False;
     spec->isGlobal    = False;
@@ -40,6 +38,3 @@ index ff35009..d7d6816 100644
     /* VARIABLE PARTS */
     spec->mark        = False; /* not significant */
     spec->done        = False; /* not significant */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
similarity index 96%
rename from meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
index cfd0ea20abd..ad9e26cb6ba 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
+           file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch \
            file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
@@ -33,12 +34,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-valgrind-monitor.py-regular-expressions-should-use-r.patch \
-           file://0002-Bug-476548-valgrind-3.22.0-fails-on-assertion-when-l.patch \
-           file://0003-Add-fchmodat2-syscall-on-linux.patch \
-           file://0004-Bug-478624-Valgrind-incompatibility-with-binutils-2..patch \
+           file://0001-tests-arm-Use-O-instead-of-O0.patch \
            "
-SRC_URI[sha256sum] = "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c"
+SRC_URI[sha256sum] = "c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.45.0


