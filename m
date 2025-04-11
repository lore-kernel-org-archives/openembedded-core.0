Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E38C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:04:01 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.24696.1744374578688175768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 05:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adriaan.schmidt@siemens.com header.s=fm2 header.b=FY2/7ZDf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-526363-20250411122936e9267a10f6431f7c35-j6pnr0@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250411122936e9267a10f6431f7c35
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Apr 2025 14:29:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adriaan.schmidt@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/GV7pZe0zDEvqC+jnLfPzZJCuN7cPF6uv6g85e+bbsg=;
 b=FY2/7ZDfYs4YK7laXNBn06i6bKmnUj5fI+2N9wPVqWgnoQnYV8wTtcGy++lc5k7zt0Gumb
 dRliuZFNA3jOOkogXK8l4lD4LQbEiTQu6fODuYzzrK/nTHZTwEZhOAe7TYn80sRdoYL2zGqV
 rAQxrdXEPAom3Ct5SsF7MWGA9elWoLUyHXzLdYlFofUdNUBRuXcJSekIHde9kD2FLOtAY8F+
 aMh+QA4Y9r/fww9Fe65I6Wvzq8dCzCsDI7GbhH0RE/oFNLB4eY4hz4m2XIFWwmyRa605aQAz
 2usMxRguD6ZAZ7kE2XlAoI6Ft0//KpaCcAP+0t3a+VVJMBiFyPq/LD2Q==;
From: "Adriaan Schmidt" <adriaan.schmidt@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adriaan.schmidt@siemens.com,
	ross.burton@arm.com,
	richard.purdie@linuxfoundation.org,
	raj.khem@gmail.com
Subject: [PATCH v3 1/1] libunwind: 1.8.1
Date: Fri, 11 Apr 2025 14:29:26 +0200
Message-Id: <20250411122926.706371-2-adriaan.schmidt@siemens.com>
In-Reply-To: <20250411122926.706371-1-adriaan.schmidt@siemens.com>
References: <20250411122926.706371-1-adriaan.schmidt@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-526363:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214740

From: Ross Burton <ross.burton@arm.com>

* change download location to GitHub
* refresh patches
* on ppc32/musl we need to link with -latomic
* make the -Wno-error more specific (only ppc32/musl)

Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
---
 ...-Gtrace-remove-unguarded-print-calls.patch |  52 ----
 ...t-sve-signal-check-that-SVE-is-prese.patch |  73 ++++++
 ...c-or-musl-register-names-as-appropr.patch} |  23 +-
 ...compilation-of-unw_getcontext-on-ARM.patch |  27 ++
 ...ork-inline-aarch64-as-for-setcontext.patch | 163 ++++++++++++
 .../libunwind/0005-Handle-musl-on-PPC32.patch |  88 +++++++
 ...context-mismatches-between-glibc-and.patch | 247 ------------------
 .../libunwind/libunwind/mips-byte-order.patch |   2 +-
 ...{libunwind_1.6.2.bb => libunwind_1.8.1.bb} |  25 +-
 9 files changed, 377 insertions(+), 323 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-unguarded-print-calls.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
 rename meta/recipes-support/libunwind/libunwind/{mips-coredump-register.patch => 0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch} (86%)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
 rename meta/recipes-support/libunwind/{libunwind_1.6.2.bb => libunwind_1.8.1.bb} (45%)

diff --git a/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-unguarded-print-calls.patch b/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-unguarded-print-calls.patch
deleted file mode 100644
index 5840c2b4f62..00000000000
--- a/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-unguarded-print-calls.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 9b27fa9bcd5cadd4c841c42710f41a090377e531 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 24 Mar 2023 16:18:44 +0000
-Subject: [PATCH] src/Gtrace: remove unguarded print() calls
-
-There is a use of printf() without #include stdio.h in src/arm/Gtrace.c,
-which results in a compiler error if clang 16 is used:
-
-src/arm/Gtrace.c:529:7: error: call to undeclared library function
-'printf' with type 'int (const char *, ...)'; ISO C99 and later do not
-support implicit function declarations [-Wimplicit-function-declaration]
-
-Replace the printf("XXX") with a Dprintf, so it doesn't pull stdio in
-unless in a debug build, and reword the message to be clearer.
-
-Also there is another printf("XXX") inside a FreeBSD-specific block in
-the UNW_ARM_FRAME_SIGRETURN case, replace this with a #error as the code
-needs to be implemented.
-
-Fixes #482.
-
-Upstream-Status: Backport [9b27fa9bcd5cadd4c841c42710f41a090377e531]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/arm/Gtrace.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/arm/Gtrace.c b/src/arm/Gtrace.c
-index 51fc281d..9e0f25af 100644
---- a/src/arm/Gtrace.c
-+++ b/src/arm/Gtrace.c
-@@ -514,7 +514,7 @@ tdep_trace (unw_cursor_t *cursor, void **buffer, int *size)
-       if (likely(ret >= 0))
-         ACCESS_MEM_FAST(ret, c->validate, d, cfa + LINUX_SC_LR_OFF, lr);
- #elif defined(__FreeBSD__)
--      printf("XXX\n");
-+      #error implement UNW_ARM_FRAME_SIGRETURN on FreeBSD
- #endif
- 
-       /* Resume stack at signal restoration point. The stack is not
-@@ -526,7 +526,7 @@ tdep_trace (unw_cursor_t *cursor, void **buffer, int *size)
-       break;
- 
-     case UNW_ARM_FRAME_SYSCALL:
--      printf("XXX1\n");
-+      Dprintf ("%s: implement me\n", __FUNCTION__);
-       break;
- 
-     default:
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch b/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
new file mode 100644
index 00000000000..f7af9a3fce0
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
@@ -0,0 +1,73 @@
+From 2f03399911abdd549237fa2db64a4a8311fe67dc Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 15 Jan 2024 16:59:14 +0000
+Subject: [PATCH 1/4] tests/Garm64-test-sve-signal: check that SVE is present
+ before running tests
+
+If the compiler supports -march=armv8-a+sve then those options are used
+to build this test, but all that needs is a sufficiently new compiler.
+
+This then results in the __ARM_FEATURE_SVE check always passing, because
+SVE is explicitly enabled.
+
+However it's perfectly possible for the compiler to support +sve but the
+machine running the code to not, which results with the test crashing
+with "Illegal instruction".
+
+Handle this case by checking HWCAP for SVE support, and skipping the
+test unless we know it is available.  This check is Linux-specific at
+present, but the logic is easily extended.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/Garm64-test-sve-signal.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/tests/Garm64-test-sve-signal.c b/tests/Garm64-test-sve-signal.c
+index 52cb9ac6..cf66b3f1 100644
+--- a/tests/Garm64-test-sve-signal.c
++++ b/tests/Garm64-test-sve-signal.c
+@@ -9,11 +9,16 @@
+ #include <libunwind.h>
+ #include <signal.h>
+ #include <stdio.h>
++#include <stdbool.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <time.h>
+ #include <unistd.h>
+ 
++#if defined(__linux__)
++#include <sys/auxv.h>
++#endif
++
+ int64_t z[100];
+ 
+ void signal_handler(int signum)
+@@ -96,8 +101,22 @@ int64_t square(svint64_t z0)
+   return res;
+ }
+ 
++bool has_sve(void) {
++#if defined(__linux__)
++  return (getauxval(AT_HWCAP) & HWCAP_SVE) ? true : false;
++#else
++  printf("Cannot determine if SVE is present, assuming it is not\n");
++  return false;
++#endif
++}
++
+ int main()
+ {
++  if (!has_sve()) {
++    printf("SVE not available, skipping\n");
++    return 77;
++  }
++
+   signal(SIGUSR1, signal_handler);
+   for (unsigned int i = 0; i < sizeof(z) / sizeof(z[0]); ++i)
+     z[i] = rand();
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/mips-coredump-register.patch b/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch
similarity index 86%
rename from meta/recipes-support/libunwind/libunwind/mips-coredump-register.patch
rename to meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch
index 68adcd1d712..f458bc3c6f9 100644
--- a/meta/recipes-support/libunwind/libunwind/mips-coredump-register.patch
+++ b/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch
@@ -1,24 +1,27 @@
-From 7750e2a29b084ee033acc82abab410035e220d3f Mon Sep 17 00:00:00 2001
+From 2a5473a31c6b02e9c49d688691e848d6281ffd2e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 16 Jan 2024 18:21:26 +0000
-Subject: [PATCH 1/2] coredump-mips-register
+Subject: [PATCH 2/4] coredump: use glibc or musl register names as appropriate
+ on MIPS
 
-glibc and musl have different names for the registers, add a
-macro that generates the names appropriately.
+glibc has register macros of the form EF_REGx, but musl uses EF_Rx.
 
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
+Handle this by using a macro to use the correct names.
+
+Closes #708.
 
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  src/coredump/_UCD_access_reg_linux.c | 69 ++++++++++++++++------------
  1 file changed, 39 insertions(+), 30 deletions(-)
 
 diff --git a/src/coredump/_UCD_access_reg_linux.c b/src/coredump/_UCD_access_reg_linux.c
-index 27eef123..beefdb47 100644
+index 302f7bdf..05100ed6 100644
 --- a/src/coredump/_UCD_access_reg_linux.c
 +++ b/src/coredump/_UCD_access_reg_linux.c
-@@ -67,38 +67,47 @@ _UCD_access_reg (unw_addr_space_t as,
-     goto badreg;
+@@ -100,38 +100,47 @@ _UCD_access_reg (unw_addr_space_t  as UNUSED,
+     };
  #else
  #if defined(UNW_TARGET_MIPS)
 +
@@ -94,7 +97,7 @@ index 27eef123..beefdb47 100644
 +      [UNW_MIPS_R31] = EF_REG(31),
        [UNW_MIPS_PC]  = EF_CP0_EPC,
      };
- #elif defined(UNW_TARGET_X86)
+ #elif defined(UNW_TARGET_S390X)
 -- 
 2.34.1
 
diff --git a/meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch b/meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
new file mode 100644
index 00000000000..19bdd858f70
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
@@ -0,0 +1,27 @@
+From e5216c3fb1fa8d60a18c68e4749a3ff902f6678b Mon Sep 17 00:00:00 2001
+From: Ian Zborovsky <ian@veego.io>
+Date: Mon, 6 May 2024 02:01:19 +0300
+Subject: [PATCH 3/4] Fixed miscompilation of unw_getcontext() on ARM
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ include/libunwind-arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libunwind-arm.h b/include/libunwind-arm.h
+index 6cfa577d..6643a185 100644
+--- a/include/libunwind-arm.h
++++ b/include/libunwind-arm.h
+@@ -288,7 +288,7 @@ unw_tdep_context_t;
+     "mov r0, #0\n\t"                                                                            \
+     "stmia %[base]!, {r0-r15}\n\t"                                                              \
+     VSTMIA                                                                                      \
+-    : [r0] "=r" (r0) : [base] "r" (unw_base) : "memory");                                       \
++    : [r0] "=r" (r0), [base] "+r" (unw_base) : : "memory");                                     \
+   (int)r0; })
+ #else /* __thumb__ */
+ #define unw_tdep_getcontext(uc) ({                                        \
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch b/meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
new file mode 100644
index 00000000000..005a0770285
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
@@ -0,0 +1,163 @@
+From a832070f3665d29a8a06652c15f94d144c24ac69 Mon Sep 17 00:00:00 2001
+From: Stephen Webb <swebb@blackberry.com>
+Date: Mon, 22 Apr 2024 15:56:54 -0400
+Subject: [PATCH 4/5] Rework inline aarch64 as for setcontext
+
+Modern GC and clang were barfing on the inline asm constraints for the
+aarch64-linux setcontext() replacement. Reformulated the asm code to
+reduce the required constraints.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/aarch64/Gos-linux.c | 115 +++++++++++++++++++++-------------------
+ 1 file changed, 61 insertions(+), 54 deletions(-)
+
+diff --git a/src/aarch64/Gos-linux.c b/src/aarch64/Gos-linux.c
+index 7cd8c879..1e494962 100644
+--- a/src/aarch64/Gos-linux.c
++++ b/src/aarch64/Gos-linux.c
+@@ -2,6 +2,7 @@
+    Copyright (C) 2008 CodeSourcery
+    Copyright (C) 2011-2013 Linaro Limited
+    Copyright (C) 2012 Tommi Rantala <tt.rantala@gmail.com>
++   Copyright 2024 Stephen M. Webb  <swebb@blackberry.com>
+ 
+ This file is part of libunwind.
+ 
+@@ -28,6 +29,28 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ 
+ #ifndef UNW_REMOTE_ONLY
+ 
++/* Magic constants generated from gen-offsets.c */
++#define SC_R0_OFF   "8"
++#define SC_R2_OFF   "24"
++#define SC_R18_OFF  "152"
++#define SC_R20_OFF  "168"
++#define SC_R22_OFF  "184"
++#define SC_R24_OFF  "200"
++#define SC_R26_OFF  "216"
++#define SC_R28_OFF  "232"
++#define SC_R30_OFF  "248"
++
++#define FP_R08_OFF "80"
++#define FP_R09_OFF "88"
++#define FP_R10_OFF "96"
++#define FP_R11_OFF "104"
++#define FP_R12_OFF "112"
++#define FP_R13_OFF "120"
++#define FP_R14_OFF "128"
++#define FP_R15_OFF "136"
++
++#define SC_SP_OFF   "0x100"
++
+ HIDDEN int
+ aarch64_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
+ {
+@@ -36,65 +59,49 @@ aarch64_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
+ 
+   if (c->sigcontext_format == AARCH64_SCF_NONE)
+     {
++
++      /*
++       * This is effectively the old POSIX setcontext().
++       *
++       * This inline asm is broken up to use local scratch registers for the
++       * uc_mcontext.regs and FPCTX base addresses because newer versions of GCC
++       * and clang barf on too many constraints (gh-702) when the C array
++       * elements are used directly.
++       *
++       * Clobbers aren't required for the inline asm because they just convince
++       * the compiler to save those registers and they never get restored
++       * becauise the asm ends with a plain ol' ret.
++       */
++      register void* uc_mcontext __asm__ ("x5") = (void*) &uc->uc_mcontext;
++      register void* fpctx __asm__ ("x4") = (void*) GET_FPCTX(uc);
++
+       /* Since there are no signals involved here we restore EH and non scratch
+          registers only.  */
+       __asm__ __volatile__ (
+-        "ldr x0,  %[x0]\n\t"
+-        "ldr x1,  %[x1]\n\t"
+-        "ldr x2,  %[x2]\n\t"
+-        "ldr x3,  %[x3]\n\t"
+-        "ldr x19, %[x19]\n\t"
+-        "ldr x20, %[x20]\n\t"
+-        "ldr x21, %[x21]\n\t"
+-        "ldr x22, %[x22]\n\t"
+-        "ldr x23, %[x23]\n\t"
+-        "ldr x24, %[x24]\n\t"
+-        "ldr x25, %[x25]\n\t"
+-        "ldr x26, %[x26]\n\t"
+-        "ldr x27, %[x27]\n\t"
+-        "ldr x28, %[x28]\n\t"
+-        "ldr x29, %[x29]\n\t"
+-        "ldr x30, %[x30]\n\t"
+-        "ldr d8,  %[d8]\n\t"
+-        "ldr d9,  %[d9]\n\t"
+-        "ldr d10, %[d10]\n\t"
+-        "ldr d11, %[d11]\n\t"
+-        "ldr d12, %[d12]\n\t"
+-        "ldr d13, %[d13]\n\t"
+-        "ldr d14, %[d14]\n\t"
+-        "ldr d15, %[d15]\n\t"
+-        "ldr x5,  %[sp]\n\t"
++        "ldp x0,  x1,  [x5, " SC_R0_OFF  "]\n\t"
++        "ldp x2,  x3,  [x5, " SC_R2_OFF  "]\n\t"
++        "ldp x18, x19, [x5, " SC_R18_OFF "]\n\t"
++        "ldp x20, x21, [x5, " SC_R20_OFF "]\n\t"
++        "ldp x22, x23, [x5, " SC_R22_OFF "]\n\t"
++        "ldp x24, x25, [x5, " SC_R24_OFF "]\n\t"
++        "ldp x26, x27, [x5, " SC_R26_OFF "]\n\t"
++        "ldp x28, x29, [x5, " SC_R28_OFF "]\n\t"
++        "ldr x30, [x5, " SC_R30_OFF "]\n\t"
++        "ldr d8,  [x4, " FP_R08_OFF "]\n\t"
++        "ldr d9,  [x4, " FP_R09_OFF "]\n\t"
++        "ldr d10, [x4, " FP_R10_OFF "]\n\t"
++        "ldr d11, [x4, " FP_R11_OFF "]\n\t"
++        "ldr d12, [x4, " FP_R12_OFF "]\n\t"
++        "ldr d13, [x4, " FP_R13_OFF "]\n\t"
++        "ldr d14, [x4, " FP_R14_OFF "]\n\t"
++        "ldr d15, [x4, " FP_R15_OFF "]\n\t"
++        "ldr x5,  [x5, " SC_SP_OFF "]\n\t"
+         "mov sp, x5\n\t"
+         "ret\n"
+-        :
+-        : [x0]  "m"(uc->uc_mcontext.regs[0]),
+-		  [x1]  "m"(uc->uc_mcontext.regs[1]),
+-		  [x2]  "m"(uc->uc_mcontext.regs[2]),
+-		  [x3]  "m"(uc->uc_mcontext.regs[3]),
+-		  [x19] "m"(uc->uc_mcontext.regs[19]),
+-		  [x20] "m"(uc->uc_mcontext.regs[20]),
+-		  [x21] "m"(uc->uc_mcontext.regs[21]),
+-		  [x22] "m"(uc->uc_mcontext.regs[22]),
+-		  [x23] "m"(uc->uc_mcontext.regs[23]),
+-		  [x24] "m"(uc->uc_mcontext.regs[24]),
+-		  [x25] "m"(uc->uc_mcontext.regs[25]),
+-		  [x26] "m"(uc->uc_mcontext.regs[26]),
+-		  [x27] "m"(uc->uc_mcontext.regs[27]),
+-		  [x28] "m"(uc->uc_mcontext.regs[28]),
+-		  [x29] "m"(uc->uc_mcontext.regs[29]), /* FP */
+-		  [x30] "m"(uc->uc_mcontext.regs[30]), /* LR */
+-		  [d8]  "m"(GET_FPCTX(uc)->vregs[8]),
+-		  [d9]  "m"(GET_FPCTX(uc)->vregs[9]),
+-		  [d10] "m"(GET_FPCTX(uc)->vregs[10]),
+-		  [d11] "m"(GET_FPCTX(uc)->vregs[11]),
+-		  [d12] "m"(GET_FPCTX(uc)->vregs[12]),
+-		  [d13] "m"(GET_FPCTX(uc)->vregs[13]),
+-		  [d14] "m"(GET_FPCTX(uc)->vregs[14]),
+-		  [d15] "m"(GET_FPCTX(uc)->vregs[15]),
+-          [sp]  "m"(uc->uc_mcontext.sp)
+-		: "x0",   "x1",  "x2",  "x3", "x19", "x20", "x21", "x22", "x23", "x24",
+-		  "x25", "x26", "x27", "x28", "x29", "x30"
+-	  );
++        : 
++        : [uc_mcontext] "r"(uc_mcontext),
++          [fpctx] "r"(fpctx)
++      );
+     }
+   else
+     {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
new file mode 100644
index 00000000000..7cad7a5b756
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
@@ -0,0 +1,88 @@
+From 7bd4fbdea43310e52feb57fb5afab6bec798cc99 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 17 Jan 2024 16:28:39 +0000
+Subject: [PATCH 5/5] Handle musl on PPC32
+
+On Linux, glibc and musl disagree over the layout of the ucontext_t
+structure.  For more details, see the musl mailing list:
+
+https://www.openwall.com/lists/musl/2018/02/22/1
+
+Add conditionals to handle both the glibc and musl layout of the
+structures.
+
+Closes #709.
+
+Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/710]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/ppc32/Ginit.c      | 13 ++++++++++---
+ src/ppc32/ucontext_i.h |  5 +++++
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
+index 9444cbb8..5e94ed8a 100644
+--- a/src/ppc32/Ginit.c
++++ b/src/ppc32/Ginit.c
+@@ -42,6 +42,13 @@ static struct unw_addr_space local_addr_space;
+ 
+ unw_addr_space_t unw_local_addr_space = &local_addr_space;
+ 
++/* glibc and musl disagree over the layout of this struct */
++#ifdef __GLIBC__
++#define _UC_MCONTEXT_REGS(x) x->uc_mcontext.uc_regs
++#else
++#define _UC_MCONTEXT_REGS(x) x->uc_regs
++#endif
++
+ static void *
+ uc_addr (ucontext_t *uc, int reg)
+ {
+@@ -49,7 +56,7 @@ uc_addr (ucontext_t *uc, int reg)
+ 
+   if ((unsigned) (reg - UNW_PPC32_R0) < 32)
+ #if defined(__linux__)
+-    addr = &uc->uc_mcontext.uc_regs->gregs[reg - UNW_PPC32_R0];
++    addr = _UC_MCONTEXT_REGS(&uc)->gregs[reg - UNW_PPC32_R0];
+ #elif defined(__FreeBSD__)
+     addr = &uc->uc_mcontext.mc_gpr[reg - UNW_PPC32_R0];
+ #endif
+@@ -58,7 +65,7 @@ uc_addr (ucontext_t *uc, int reg)
+   if ( ((unsigned) (reg - UNW_PPC32_F0) < 32) &&
+        ((unsigned) (reg - UNW_PPC32_F0) >= 0) )
+ #if defined(__linux__)
+-    addr = &uc->uc_mcontext.uc_regs->fpregs.fpregs[reg - UNW_PPC32_F0];
++    addr = _UC_MCONTEXT_REGS(&uc)->fpregs.fpregs[reg - UNW_PPC32_F0];
+  #elif defined(__FreeBSD__)
+     addr = &uc->uc_mcontext.mc_fpreg[reg - UNW_PPC32_F0];
+ #endif
+@@ -85,7 +92,7 @@ uc_addr (ucontext_t *uc, int reg)
+           return NULL;
+         }
+ #if defined(__linux__)
+-      addr = &uc->uc_mcontext.uc_regs->gregs[gregs_idx];
++      addr = _UC_MCONTEXT_REGS(&uc)->gregs[gregs_idx];
+ #elif defined(__FreeBSD__)
+       addr = &uc->uc_mcontext.mc_gpr[gregs_idx];
+ #endif
+diff --git a/src/ppc32/ucontext_i.h b/src/ppc32/ucontext_i.h
+index ee93c697..cfd8fe0e 100644
+--- a/src/ppc32/ucontext_i.h
++++ b/src/ppc32/ucontext_i.h
+@@ -44,8 +44,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ //#define MQ_IDX                36
+ #define LINK_IDX        36
+ 
++#ifdef __GLIBC__
+ #define _UC_MCONTEXT_GPR(x) ( ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[x] - (void *)&dmy_ctxt) )
+ #define _UC_MCONTEXT_FPR(x) ( ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[x] - (void *)&dmy_ctxt) )
++#else
++#define _UC_MCONTEXT_GPR(x) ( ((void *)&dmy_ctxt.uc_regs->gregs[x] - (void *)&dmy_ctxt) )
++#define _UC_MCONTEXT_FPR(x) ( ((void *)&dmy_ctxt.uc_regs->fpregs.fpregs[x] - (void *)&dmy_ctxt) )
++#endif
+ 
+ /* These are dummy structures used only for obtaining the offsets of the
+    various structure members. */
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch b/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
deleted file mode 100644
index e58a71b741b..00000000000
--- a/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
+++ /dev/null
@@ -1,247 +0,0 @@
-From 24c751f9d21e892a9833e1b70a696b07872b0f7f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Jul 2016 01:07:53 +0000
-Subject: [PATCH] ppc32: Consider ucontext mismatches between glibc and
-
- musl
-
-This helps in porting libunwind onto musl based systems
-ptrace.h change is required again an error that surfaces
-with musl
-
-/mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/asm/ptrace.h:31:8: error: redefinition of 'struct pt_regs'
- struct pt_regs {
-        ^~~~~~~
-In file included from /mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/sys/user.h:11:0,
-                 from /mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/sys/procfs.h:9,
-                 from ../../git/src/ptrace/_UPT_internal.h:40,
-                 from ../../git/src/ptrace/_UPT_reg_offset.c:27:
-/mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/bits/user.h:1:8: note: originally defined here
- struct pt_regs {
-        ^~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/ppc32/Ginit.c            |   6 +-
- src/ppc32/ucontext_i.h       | 158 ++++++++++++++++++-----------------
- src/ptrace/_UPT_reg_offset.c |   7 ++
- 3 files changed, 92 insertions(+), 79 deletions(-)
-
-diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
-index 7b45455..f8d6886 100644
---- a/src/ppc32/Ginit.c
-+++ b/src/ppc32/Ginit.c
-@@ -48,12 +48,12 @@ uc_addr (ucontext_t *uc, int reg)
-   void *addr;
- 
-   if ((unsigned) (reg - UNW_PPC32_R0) < 32)
--    addr = &uc->uc_mcontext.uc_regs->gregs[reg - UNW_PPC32_R0];
-+    addr = &uc->GET_UC_REGS->gregs[reg - UNW_PPC32_R0];
- 
-   else
-   if ( ((unsigned) (reg - UNW_PPC32_F0) < 32) &&
-        ((unsigned) (reg - UNW_PPC32_F0) >= 0) )
--    addr = &uc->uc_mcontext.uc_regs->fpregs.fpregs[reg - UNW_PPC32_F0];
-+    addr = &uc->GET_UC_REGS->fpregs.fpregs[reg - UNW_PPC32_F0];
- 
-   else
-     {
-@@ -76,7 +76,7 @@ uc_addr (ucontext_t *uc, int reg)
-         default:
-           return NULL;
-         }
--      addr = &uc->uc_mcontext.uc_regs->gregs[gregs_idx];
-+      addr = &uc->GET_UC_REGS->gregs[gregs_idx];
-     }
-   return addr;
- }
-diff --git a/src/ppc32/ucontext_i.h b/src/ppc32/ucontext_i.h
-index c6ba806..b79f15c 100644
---- a/src/ppc32/ucontext_i.h
-+++ b/src/ppc32/ucontext_i.h
-@@ -46,83 +46,89 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
-    various structure members. */
- static ucontext_t dmy_ctxt UNUSED;
- 
--#define UC_MCONTEXT_GREGS_R0 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[0] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R1 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[1] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R2 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[2] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R3 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[3] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R4 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[4] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R5 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[5] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R6 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[6] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R7 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[7] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R8 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[8] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R9 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[9] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R10 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[10] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R11 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[11] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R12 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[12] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R13 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[13] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R14 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[14] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R15 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[15] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R16 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[16] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R17 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[17] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R18 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[18] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R19 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[19] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R20 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[20] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R21 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[21] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R22 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[22] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R23 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[23] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R24 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[24] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R25 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[25] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R26 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[26] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R27 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[27] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R28 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[28] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R29 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[29] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R30 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[30] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_R31 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[31] - (void *)&dmy_ctxt)
-+#ifdef __GLIBC__
-+#define GET_UC_REGS uc_mcontext.uc_regs
-+#else
-+#define GET_UC_REGS uc_regs
-+#endif
-+
-+#define UC_MCONTEXT_GREGS_R0 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[0] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R1 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[1] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R2 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[2] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R3 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[3] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R4 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[4] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R5 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[5] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R6 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[6] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R7 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[7] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R8 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[8] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R9 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[9] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R10 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[10] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R11 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[11] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R12 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[12] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R13 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[13] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R14 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[14] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R15 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[15] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R16 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[16] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R17 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[17] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R18 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[18] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R19 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[19] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R20 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[20] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R21 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[21] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R22 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[22] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R23 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[23] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R24 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[24] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R25 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[25] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R26 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[26] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R27 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[27] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R28 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[28] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R29 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[29] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R30 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[30] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_R31 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[31] - (void *)&dmy_ctxt)
- 
--#define UC_MCONTEXT_GREGS_MSR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[MSR_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_ORIG_GPR3 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[ORIG_GPR3_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_CTR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[CTR_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_LINK ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[LINK_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_XER ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[XER_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_CCR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[CCR_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_SOFTE ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[SOFTE_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_TRAP ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[TRAP_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_DAR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[DAR_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_DSISR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[DSISR_IDX] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_GREGS_RESULT ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[RESULT_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_MSR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[MSR_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_ORIG_GPR3 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[ORIG_GPR3_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_CTR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[CTR_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_LINK ((void *)&dmy_ctxt.GET_UC_REGS->gregs[LINK_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_XER ((void *)&dmy_ctxt.GET_UC_REGS->gregs[XER_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_CCR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[CCR_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_SOFTE ((void *)&dmy_ctxt.GET_UC_REGS->gregs[SOFTE_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_TRAP ((void *)&dmy_ctxt.GET_UC_REGS->gregs[TRAP_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_DAR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[DAR_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_DSISR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[DSISR_IDX] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_GREGS_RESULT ((void *)&dmy_ctxt.GET_UC_REGS->gregs[RESULT_IDX] - (void *)&dmy_ctxt)
- 
--#define UC_MCONTEXT_FREGS_R0 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[0] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R1 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[1] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R2 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[2] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R3 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[3] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R4 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[4] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R5 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[5] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R6 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[6] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R7 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[7] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R8 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[8] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R9 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[9] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R10 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[10] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R11 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[11] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R12 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[12] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R13 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[13] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R14 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[14] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R15 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[15] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R16 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[16] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R17 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[17] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R18 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[18] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R19 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[19] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R20 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[20] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R21 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[21] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R22 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[22] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R23 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[23] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R24 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[24] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R25 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[25] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R26 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[26] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R27 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[27] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R28 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[28] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R29 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[29] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R30 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[30] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_R31 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[31] - (void *)&dmy_ctxt)
--#define UC_MCONTEXT_FREGS_FPSCR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[32] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R0 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[0] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R1 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[1] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R2 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[2] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R3 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[3] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R4 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[4] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R5 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[5] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R6 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[6] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R7 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[7] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R8 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[8] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R9 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[9] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R10 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[10] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R11 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[11] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R12 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[12] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R13 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[13] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R14 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[14] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R15 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[15] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R16 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[16] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R17 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[17] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R18 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[18] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R19 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[19] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R20 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[20] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R21 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[21] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R22 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[22] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R23 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[23] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R24 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[24] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R25 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[25] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R26 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[26] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R27 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[27] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R28 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[28] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R29 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[29] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R30 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[30] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_R31 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[31] - (void *)&dmy_ctxt)
-+#define UC_MCONTEXT_FREGS_FPSCR ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[32] - (void *)&dmy_ctxt)
- 
- #endif
-diff --git a/src/ptrace/_UPT_reg_offset.c b/src/ptrace/_UPT_reg_offset.c
-index b7dd3b7..bfaf756 100644
---- a/src/ptrace/_UPT_reg_offset.c
-+++ b/src/ptrace/_UPT_reg_offset.c
-@@ -27,6 +27,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
- #include "_UPT_internal.h"
- 
- #include <stddef.h>
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+#endif
-+#include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- 
- #ifdef HAVE_ASM_PTRACE_H
- # include <asm/ptrace.h>
diff --git a/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
index 8848780fd1b..3336b790553 100644
--- a/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
+++ b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 2/2] byte order
 endian.h on musl/mips can't be included in __ASSEMBLER__ mode,
 so use the __BYTE_ORDER__ symbol instead.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/816]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  src/mips/getcontext.S | 3 +--
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
similarity index 45%
rename from meta/recipes-support/libunwind/libunwind_1.6.2.bb
rename to meta/recipes-support/libunwind/libunwind_1.8.1.bb
index b2e7ec77190..1885da4d09f 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -3,17 +3,18 @@ DESCRIPTION = "a portable and efficient C programming interface (API) to determi
 HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d80c8ed4062b8339b715f90fa68cc9f"
-DEPENDS += "libatomic-ops"
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
+SRC_URI = "https://github.com/libunwind/libunwind/releases/download/v${PV}/${BP}.tar.gz \
            file://mips-byte-order.patch \
-           file://mips-coredump-register.patch \
-           file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
-           file://0001-src-Gtrace-remove-unguarded-print-calls.patch \
+           file://0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch \
+           file://0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch \
+           file://0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch \
+           file://0004-Rework-inline-aarch64-as-for-setcontext.patch \
+           file://0005-Handle-musl-on-PPC32.patch \
            "
 
-SRC_URI[sha256sum] = "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976"
+SRC_URI[sha256sum] = "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157"
 
 inherit autotools multilib_header
 
@@ -31,6 +32,7 @@ ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
 LDFLAGS += "-Wl,-z,relro,-z,now"
+LDFLAGS:append:powerpc:libc-musl = " -latomic"
 
 SECURITY_LDFLAGS:append:libc-musl = " -lssp_nonshared"
 CACHED_CONFIGUREVARS:append:libc-musl = " LDFLAGS='${LDFLAGS} -lucontext'"
@@ -41,10 +43,7 @@ do_install:append () {
 
 BBCLASSEXTEND = "native"
 
-# http://errors.yoctoproject.org/Errors/Build/183144/
-# libunwind-1.6.2/include/tdep-aarch64/libunwind_i.h:123:47: error: passing argument 1 of '_ULaarch64_uc_addr' from incompatible pointer type [-Wincompatible-pointer-types]
-# libunwind-1.6.2/src/aarch64/Ginit.c:348:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
-# libunwind-1.6.2/src/aarch64/Ginit.c:377:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
-# libunwind-1.6.2/src/aarch64/Ginit_local.c:51:9: error: assignment to 'ucontext_t *' from incompatible pointer type 'unw_context_t *' {aka 'unw_tdep_context_t *'} [-Wincompatible-pointer-types]
-# libunwind-1.6.2/src/aarch64/Gresume.c:37:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
+# libunwind-1.8.1/src/elfxx.c:205:44: error: passing argument 3 of '_Uppc32_get_func_addr' from incompatible pointer type [-Wincompatible-pointer-types]
+# libunwind-1.8.1/src/elfxx.c:279:52: error: passing argument 3 of '_Uppc32_get_func_addr' from incompatible pointer type [-Wincompatible-pointer-types]
+# and others
+CFLAGS:append:powerpc:libc-musl = " -Wno-error=incompatible-pointer-types"
-- 
2.39.2


