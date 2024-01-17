Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B3DC47DA9
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:07:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4646.1705504044420354093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 094B011FB
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:08:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A5EF3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:07:23 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libunwind: refresh patches
Date: Wed, 17 Jan 2024 15:07:19 +0000
Message-Id: <20240117150720.3585669-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117150720.3585669-1-ross.burton@arm.com>
References: <20240117150720.3585669-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193921

From: Ross Burton <ross.burton@arm.com>

0001-src-Gtrace-remove-unguarded-print-calls.patch has been merged, so
update the Upstream-Status.

0003-x86-Stub-out-x86_local_resume.patch has been hopefully obsoleted by
the use of libucontext, remove.

Split 004-Fix-build-on-mips-musl.patch into two, as there's two
independent issues here.

0006-Fix-for-X32.patch appears to have been fixed with 31738a upstream,
in 1.6.0.

musl-header-conflict.patch was obsoleted by recipe-specific-sysroots,
remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-Gtrace-remove-unguarded-print-calls.patch |   4 +-
 .../0003-x86-Stub-out-x86_local_resume.patch  |  55 ----------
 .../0004-Fix-build-on-mips-musl.patch         |  84 ---------------
 .../libunwind/0006-Fix-for-X32.patch          |  29 -----
 .../libunwind/libunwind/mips-byte-order.patch |  35 ++++++
 .../libunwind/mips-coredump-register.patch    | 100 ++++++++++++++++++
 .../libunwind/musl-header-conflict.patch      |  44 --------
 .../libunwind/libunwind_1.6.2.bb              |   6 +-
 8 files changed, 139 insertions(+), 218 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0003-x86-Stu=
b-out-x86_local_resume.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0004-Fix-bui=
ld-on-mips-musl.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0006-Fix-for=
-X32.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/mips-byte-or=
der.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/mips-coredum=
p-register.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/musl-header-=
conflict.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-rem=
ove-unguarded-print-calls.patch b/meta/recipes-support/libunwind/libunwin=
d/0001-src-Gtrace-remove-unguarded-print-calls.patch
index fdadcd3b25a..5840c2b4f62 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-ung=
uarded-print-calls.patch
+++ b/meta/recipes-support/libunwind/libunwind/0001-src-Gtrace-remove-ung=
uarded-print-calls.patch
@@ -1,4 +1,4 @@
-From 87d24ee47fd0e0461fca32d17564f21d76cbcb92 Mon Sep 17 00:00:00 2001
+From 9b27fa9bcd5cadd4c841c42710f41a090377e531 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 24 Mar 2023 16:18:44 +0000
 Subject: [PATCH] src/Gtrace: remove unguarded print() calls
@@ -19,7 +19,7 @@ needs to be implemented.
=20
 Fixes #482.
=20
-Upstream-Status: Submitted [https://github.com/libunwind/libunwind/pull/=
483]
+Upstream-Status: Backport [9b27fa9bcd5cadd4c841c42710f41a090377e531]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  src/arm/Gtrace.c | 4 ++--
diff --git a/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x=
86_local_resume.patch b/meta/recipes-support/libunwind/libunwind/0003-x86=
-Stub-out-x86_local_resume.patch
deleted file mode 100644
index f02f13f79c1..00000000000
--- a/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_loca=
l_resume.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 0b2243f19d4ea12a2a68478a5aed503947a800af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Mar 2016 16:19:29 +0000
-Subject: [PATCH] x86: Stub out x86_local_resume()
-
-its purpose seems
-to be unwinding across signal handler boundaries, which cannot happen
-in correct programs anyway. Replacing the whole function with
-something like *(volatile char *)0=3D0; (i.e. crash), gets a working
-libunwind
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/x86/Gos-linux.c | 26 +-------------------------
- 1 file changed, 1 insertion(+), 25 deletions(-)
-
-diff --git a/src/x86/Gos-linux.c b/src/x86/Gos-linux.c
-index d448dce..c25ae0c 100644
---- a/src/x86/Gos-linux.c
-+++ b/src/x86/Gos-linux.c
-@@ -284,31 +284,7 @@ x86_r_uc_addr (ucontext_t *uc, int reg)
- HIDDEN int
- x86_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
- {
--  struct cursor *c =3D (struct cursor *) cursor;
--  ucontext_t *uc =3D c->uc;
--
--  /* Ensure c->pi is up-to-date.  On x86, it's relatively common to be
--     missing DWARF unwind info.  We don't want to fail in that case,
--     because the frame-chain still would let us do a backtrace at
--     least.  */
--  dwarf_make_proc_info (&c->dwarf);
--
--  if (unlikely (c->sigcontext_format !=3D X86_SCF_NONE))
--    {
--      struct sigcontext *sc =3D (struct sigcontext *) c->sigcontext_add=
r;
--
--      Debug (8, "resuming at ip=3D%x via sigreturn(%p)\n", c->dwarf.ip,=
 sc);
--#if !defined(__ANDROID__)
--      x86_sigreturn (sc);
--#endif
--    }
--  else
--    {
--      Debug (8, "resuming at ip=3D%x via setcontext()\n", c->dwarf.ip);
--#if !defined(__ANDROID__)
--      setcontext (uc);
--#endif
--    }
-+  *(volatile char *)0=3D0;
-   return -UNW_EINVAL;
- }
-=20
diff --git a/meta/recipes-support/libunwind/libunwind/0004-Fix-build-on-m=
ips-musl.patch b/meta/recipes-support/libunwind/libunwind/0004-Fix-build-=
on-mips-musl.patch
deleted file mode 100644
index 124d0e00b19..00000000000
--- a/meta/recipes-support/libunwind/libunwind/0004-Fix-build-on-mips-mus=
l.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 6bdab5cc8f1e2ec5f84fc9f59f1699a726980709 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 23 Mar 2016 06:08:59 +0000
-Subject: [PATCH 4/6] Fix build on mips/musl
-
-Do not include endian.h on musl it includes
-further headers which can not be compiled in __ASSEMBLER__
- mode
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/coredump/_UCD_internal.h | 35 +++++++++++++++++++++++++++++++++++
- src/mips/getcontext.S        |  3 +--
- 2 files changed, 36 insertions(+), 2 deletions(-)
-
-diff --git a/src/coredump/_UCD_internal.h b/src/coredump/_UCD_internal.h
-index 3c95a2a..21ed1c3 100644
---- a/src/coredump/_UCD_internal.h
-+++ b/src/coredump/_UCD_internal.h
-@@ -44,6 +44,41 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE=
 SOFTWARE.  */
-=20
- #include "libunwind_i.h"
-=20
-+#ifndef __GLIBC__
-+#include <sys/reg.h>
-+
-+#define EF_REG0			6
-+#define EF_REG1			7
-+#define EF_REG2			8
-+#define EF_REG3			9
-+#define EF_REG4			10
-+#define EF_REG5			11
-+#define EF_REG6			12
-+#define EF_REG7			13
-+#define EF_REG8			14
-+#define EF_REG9			15
-+#define EF_REG10		16
-+#define EF_REG11		17
-+#define EF_REG12		18
-+#define EF_REG13		19
-+#define EF_REG14		20
-+#define EF_REG15		21
-+#define EF_REG16		22
-+#define EF_REG17		23
-+#define EF_REG18		24
-+#define EF_REG19		25
-+#define EF_REG20		26
-+#define EF_REG21		27
-+#define EF_REG22		28
-+#define EF_REG23		29
-+#define EF_REG24		30
-+#define EF_REG25		31
-+#define EF_REG28		34
-+#define EF_REG29		35
-+#define EF_REG30		36
-+#define EF_REG31		37
-+#endif
-+
-=20
- #if SIZEOF_OFF_T =3D=3D 4
- typedef uint32_t uoff_t;
-diff --git a/src/mips/getcontext.S b/src/mips/getcontext.S
-index d1dbd57..de9b681 100644
---- a/src/mips/getcontext.S
-+++ b/src/mips/getcontext.S
-@@ -24,12 +24,11 @@ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF=
 OR IN CONNECTION
- WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
-=20
- #include "offsets.h"
--#include <endian.h>
-=20
- 	.text
-=20
- #if _MIPS_SIM =3D=3D _ABIO32
--# if __BYTE_ORDER =3D=3D __BIG_ENDIAN
-+# if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
- #  define OFFSET 4
- # else
- #  define OFFSET 0
---=20
-2.20.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.pa=
tch b/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
deleted file mode 100644
index 9941612387f..00000000000
--- a/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f2eae0af620925b3686410470fc6fbc66ec1dc52 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 09:50:34 -0700
-Subject: [PATCH] Fix for X32
-
-Apply patch to fix the X32 build from https://github.com/sjnewbury/x32.
-
-Upstream-Status: Pending
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
----
- src/x86_64/Gos-linux.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/x86_64/Gos-linux.c b/src/x86_64/Gos-linux.c
-index b489329..0550005 100644
---- a/src/x86_64/Gos-linux.c
-+++ b/src/x86_64/Gos-linux.c
-@@ -146,8 +146,8 @@ x86_64_sigreturn (unw_cursor_t *cursor)
-=20
-   Debug (8, "resuming at ip=3D%llx via sigreturn(%p)\n",
-              (unsigned long long) c->dwarf.ip, sc);
--  __asm__ __volatile__ ("mov %0, %%rsp;"
--                        "mov %1, %%rax;"
-+  __asm__ __volatile__ ("mov %q0, %%rsp;"
-+                        "mov %q1, %%rax;"
-                         "syscall"
-                         :: "r"((uint64_t)sc), "i"(SYS_rt_sigreturn)
-                         : "memory");
diff --git a/meta/recipes-support/libunwind/libunwind/mips-byte-order.pat=
ch b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
new file mode 100644
index 00000000000..8848780fd1b
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
@@ -0,0 +1,35 @@
+From dbbf8110ed3fd2cbac20a8ec2ac769e13c67bab1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 16 Jan 2024 18:22:38 +0000
+Subject: [PATCH 2/2] byte order
+
+endian.h on musl/mips can't be included in __ASSEMBLER__ mode,
+so use the __BYTE_ORDER__ symbol instead.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/mips/getcontext.S | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/mips/getcontext.S b/src/mips/getcontext.S
+index d1dbd579..de9b6818 100644
+--- a/src/mips/getcontext.S
++++ b/src/mips/getcontext.S
+@@ -24,12 +24,11 @@ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF=
 OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+=20
+ #include "offsets.h"
+-#include <endian.h>
+=20
+ 	.text
+=20
+ #if _MIPS_SIM =3D=3D _ABIO32
+-# if __BYTE_ORDER =3D=3D __BIG_ENDIAN
++# if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
+ #  define OFFSET 4
+ # else
+ #  define OFFSET 0
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/mips-coredump-regis=
ter.patch b/meta/recipes-support/libunwind/libunwind/mips-coredump-regist=
er.patch
new file mode 100644
index 00000000000..68adcd1d712
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/mips-coredump-register.pat=
ch
@@ -0,0 +1,100 @@
+From 7750e2a29b084ee033acc82abab410035e220d3f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 16 Jan 2024 18:21:26 +0000
+Subject: [PATCH 1/2] coredump-mips-register
+
+glibc and musl have different names for the registers, add a
+macro that generates the names appropriately.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ src/coredump/_UCD_access_reg_linux.c | 69 ++++++++++++++++------------
+ 1 file changed, 39 insertions(+), 30 deletions(-)
+
+diff --git a/src/coredump/_UCD_access_reg_linux.c b/src/coredump/_UCD_ac=
cess_reg_linux.c
+index 27eef123..beefdb47 100644
+--- a/src/coredump/_UCD_access_reg_linux.c
++++ b/src/coredump/_UCD_access_reg_linux.c
+@@ -67,38 +67,47 @@ _UCD_access_reg (unw_addr_space_t as,
+     goto badreg;
+ #else
+ #if defined(UNW_TARGET_MIPS)
++
++/* glibc and musl use different names */
++#ifdef __GLIBC__
++#define EF_REG(x) EF_REG ## x
++#else
++#include <sys/reg.h>
++#define EF_REG(x) EF_R ## x
++#endif
++
+   static const uint8_t remap_regs[] =3D
+     {
+-      [UNW_MIPS_R0]  =3D EF_REG0,
+-      [UNW_MIPS_R1]  =3D EF_REG1,
+-      [UNW_MIPS_R2]  =3D EF_REG2,
+-      [UNW_MIPS_R3]  =3D EF_REG3,
+-      [UNW_MIPS_R4]  =3D EF_REG4,
+-      [UNW_MIPS_R5]  =3D EF_REG5,
+-      [UNW_MIPS_R6]  =3D EF_REG6,
+-      [UNW_MIPS_R7]  =3D EF_REG7,
+-      [UNW_MIPS_R8]  =3D EF_REG8,
+-      [UNW_MIPS_R9]  =3D EF_REG9,
+-      [UNW_MIPS_R10] =3D EF_REG10,
+-      [UNW_MIPS_R11] =3D EF_REG11,
+-      [UNW_MIPS_R12] =3D EF_REG12,
+-      [UNW_MIPS_R13] =3D EF_REG13,
+-      [UNW_MIPS_R14] =3D EF_REG14,
+-      [UNW_MIPS_R15] =3D EF_REG15,
+-      [UNW_MIPS_R16] =3D EF_REG16,
+-      [UNW_MIPS_R17] =3D EF_REG17,
+-      [UNW_MIPS_R18] =3D EF_REG18,
+-      [UNW_MIPS_R19] =3D EF_REG19,
+-      [UNW_MIPS_R20] =3D EF_REG20,
+-      [UNW_MIPS_R21] =3D EF_REG21,
+-      [UNW_MIPS_R22] =3D EF_REG22,
+-      [UNW_MIPS_R23] =3D EF_REG23,
+-      [UNW_MIPS_R24] =3D EF_REG24,
+-      [UNW_MIPS_R25] =3D EF_REG25,
+-      [UNW_MIPS_R28] =3D EF_REG28,
+-      [UNW_MIPS_R29] =3D EF_REG29,
+-      [UNW_MIPS_R30] =3D EF_REG30,
+-      [UNW_MIPS_R31] =3D EF_REG31,
++      [UNW_MIPS_R0]  =3D EF_REG(0),
++      [UNW_MIPS_R1]  =3D EF_REG(1),
++      [UNW_MIPS_R2]  =3D EF_REG(2),
++      [UNW_MIPS_R3]  =3D EF_REG(3),
++      [UNW_MIPS_R4]  =3D EF_REG(4),
++      [UNW_MIPS_R5]  =3D EF_REG(5),
++      [UNW_MIPS_R6]  =3D EF_REG(6),
++      [UNW_MIPS_R7]  =3D EF_REG(7),
++      [UNW_MIPS_R8]  =3D EF_REG(8),
++      [UNW_MIPS_R9]  =3D EF_REG(9),
++      [UNW_MIPS_R10] =3D EF_REG(10),
++      [UNW_MIPS_R11] =3D EF_REG(11),
++      [UNW_MIPS_R12] =3D EF_REG(12),
++      [UNW_MIPS_R13] =3D EF_REG(13),
++      [UNW_MIPS_R14] =3D EF_REG(14),
++      [UNW_MIPS_R15] =3D EF_REG(15),
++      [UNW_MIPS_R16] =3D EF_REG(16),
++      [UNW_MIPS_R17] =3D EF_REG(17),
++      [UNW_MIPS_R18] =3D EF_REG(18),
++      [UNW_MIPS_R19] =3D EF_REG(19),
++      [UNW_MIPS_R20] =3D EF_REG(20),
++      [UNW_MIPS_R21] =3D EF_REG(21),
++      [UNW_MIPS_R22] =3D EF_REG(22),
++      [UNW_MIPS_R23] =3D EF_REG(23),
++      [UNW_MIPS_R24] =3D EF_REG(24),
++      [UNW_MIPS_R25] =3D EF_REG(25),
++      [UNW_MIPS_R28] =3D EF_REG(28),
++      [UNW_MIPS_R29] =3D EF_REG(29),
++      [UNW_MIPS_R30] =3D EF_REG(30),
++      [UNW_MIPS_R31] =3D EF_REG(31),
+       [UNW_MIPS_PC]  =3D EF_CP0_EPC,
+     };
+ #elif defined(UNW_TARGET_X86)
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/musl-header-conflic=
t.patch b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.p=
atch
deleted file mode 100644
index 49985b5b3c7..00000000000
--- a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e1de5a5b42062dc02769f320c7785928b2ee0c57 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 18 Aug 2016 14:46:32 +0100
-Subject: [PATCH] If you:
-
-TCLIBC=3Dmusl bitbake unwind
-TCLIBC=3Dmusl bitbake gcc-runtime -c cleansstate
-TCLIBC=3Dmusl bitbake gcc-runtime
-
-you will see libstdc++ fail to build due to finding libunwind's header f=
ile.
-
-Khem: "When we build any of gcc components they expect to use internal v=
ersion
-and that works with glibc based gcc since the search headers first look =
into gcc
-headers, however with musl the gcc headers are searched after the standa=
rd
-headers ( which is by design the right thing )."
-
-This patch hacks around the issue by looking for a define used during gc=
c-runtime's
-build and skipping to the internal header in that case.
-
-[YOCTO #10129]
-
-RP 2016/8/18
-
-Upstream-Status: Inappropriate [really need to fix gcc]
-
----
- include/unwind.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/unwind.h b/include/unwind.h
-index 93780fa..c812414 100644
---- a/include/unwind.h
-+++ b/include/unwind.h
-@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHE=
THER IN AN ACTION
- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
- WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
-=20
-+#ifdef _GLIBCXX_SHARED
-+#include_next <unwind.h>
-+#endif
-+
- #ifndef _UNWIND_H
- #define _UNWIND_H
-=20
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.6.2.bb
index 650e2c9ec40..d40a2af26d3 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -7,13 +7,11 @@ DEPENDS +=3D "libatomic-ops"
 DEPENDS:append:libc-musl =3D " libucontext"
=20
 SRC_URI =3D "http://download.savannah.nongnu.org/releases/libunwind/libu=
nwind-${PV}.tar.gz \
-           file://0003-x86-Stub-out-x86_local_resume.patch \
-           file://0004-Fix-build-on-mips-musl.patch \
+           file://mips-byte-order.patch \
+           file://mips-coredump-register.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-=
and.patch \
-           file://0006-Fix-for-X32.patch \
            file://0001-src-Gtrace-remove-unguarded-print-calls.patch \
            "
-SRC_URI:append:libc-musl =3D " file://musl-header-conflict.patch"
=20
 SRC_URI[sha256sum] =3D "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcd=
ff671f9c94794976"
=20
--=20
2.34.1


