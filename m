Return-Path: <denis@denix.org>
X-Greylist: delayed 464 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Feb 2019 22:57:05 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 4951F7C885
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90A9A40BB7;
	Mon, 18 Feb 2019 22:49:23 +0000 (UTC)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1dj0HZ6ZgdYF; Mon, 18 Feb 2019 22:49:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7460440B7B;
	Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3AEEF16B4D3;
	Mon, 18 Feb 2019 17:49:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 17:49:05 -0500
Message-Id: <9e1db68d51350fe8ff15d0363ec92246c835a2f8.1550529998.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 4/6] lzop: upgrade 1.03 -> 1.04
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
X-List-Received-Date: Mon, 18 Feb 2019 22:57:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

License checksum changed due to updated copyright year and cleanup.

3 patches for miniacc.h were incorporated upstream.

Build-tested on qemu targets, including x32.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...inlines-as-the-external-inline-definition.patch | 100 ---------------------
 .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch |  37 --------
 .../lzop/lzop/x32_abi_miniacc_h.patch              |  36 --------
 .../lzop/{lzop_1.03.bb => lzop_1.04.bb}            |  11 +--
 4 files changed, 4 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch
 delete mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
 delete mode 100644 meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
 rename meta/recipes-support/lzop/{lzop_1.03.bb => lzop_1.04.bb} (66%)

diff --git a/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch b/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch
deleted file mode 100644
index 867b88b..0000000
--- a/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From ecccbcf66da53779d88e38e2af7f82eff8dde7f8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Aug 2015 10:35:47 -0700
-Subject: [PATCH] use static inlines as the external inline definition has
- changed with gcc5
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/miniacc.h | 24 ++++++++----------------
- 1 file changed, 8 insertions(+), 16 deletions(-)
-
-diff --git a/src/miniacc.h b/src/miniacc.h
-index 09e6f0c..cae98d1 100644
---- a/src/miniacc.h
-+++ b/src/miniacc.h
-@@ -2880,8 +2880,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE16)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -2890,8 +2889,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
- #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
- #endif
- #if !defined(ACC_UA_SET_LE16)
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
-     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
-@@ -2916,8 +2914,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE32)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -2926,8 +2923,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
- #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
- #endif
- #if !defined(ACC_UA_SET_LE32)
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
-     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
-@@ -3307,8 +3303,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE16)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -3317,8 +3312,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
- #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
- #endif
- #if !defined(ACC_UA_SET_LE16)
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
-     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
-@@ -3343,8 +3337,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
- #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
- #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
- #if !defined(ACC_UA_GET_LE32)
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
--extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-+static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
-     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
-     unsigned long v;
-     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
-@@ -3353,8 +3346,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
- #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
- #endif
- #if !defined(ACC_UA_SET_LE32)
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
--extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-+static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
-     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
-     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
- }
--- 
-2.5.0
-
diff --git a/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch b/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
deleted file mode 100644
index 72b3397..0000000
--- a/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-gcc-6 has additional errors e.g.
-
-./test.c:1:12: error: variably modified '__acc_cta' at file scope
- extern int __acc_cta[1-2*!((1l << (8*8 -1)) < 0)];
-            ^~~~~~~~~
-
-This is rightly pointed out since that index is undefined
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
---- a/src/miniacc.h.orig	2016-02-10 16:09:23.247315866 +0100
-+++ a/src/miniacc.h	2016-02-10 16:12:14.973297054 +0100
-@@ -4469,12 +4469,12 @@
- #if defined(__MSDOS__) && defined(__TURBOC__) && (__TURBOC__ < 0x0150)
- #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
- #else
--    ACCCHK_ASSERT((1   << (8*SIZEOF_INT-1)) < 0)
-+    ACCCHK_ASSERT((int)(1u   << (8*SIZEOF_INT-1)) < 0)
- #endif
-     ACCCHK_ASSERT((1u  << (8*SIZEOF_INT-1)) > 0)
- #if 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
- #else
--    ACCCHK_ASSERT((1l  << (8*SIZEOF_LONG-1)) < 0)
-+    ACCCHK_ASSERT((long)(1ul  << (8*SIZEOF_LONG-1)) < 0)
- #endif
-     ACCCHK_ASSERT((1ul << (8*SIZEOF_LONG-1)) > 0)
- #if defined(acc_int16e_t)
-@@ -4703,7 +4703,7 @@
- #elif 1 && (ACC_CC_LCC || ACC_CC_LCCWIN32) && !defined(ACCCHK_CFG_PEDANTIC)
- #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
- #elif !(ACC_BROKEN_INTEGRAL_PROMOTION) && (SIZEOF_INT > 1)
--    ACCCHK_ASSERT( (((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
-+    ACCCHK_ASSERT( (int)((unsigned int)((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
- #endif
- #if (ACC_CC_BORLANDC && (__BORLANDC__ >= 0x0530) && (__BORLANDC__ < 0x0560))
- #  pragma option pop
diff --git a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch b/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
deleted file mode 100644
index 739be82..0000000
--- a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix get of FLAGS register in x32 ABI,
-
-x32 ABI requires to have 64-bit variable to store FLAGS register
-instead of size_t that is 32-bit variable, this fix operand
-type mismatch when try to pop previous pushf value.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
-Index: lzop-1.03/src/miniacc.h
-===================================================================
---- lzop-1.03.orig/src/miniacc.h
-+++ lzop-1.03/src/miniacc.h
-@@ -754,6 +754,9 @@
- #elif defined(__amd64__) || defined(__x86_64__) || defined(_M_AMD64)
- #  define ACC_ARCH_AMD64            1
- #  define ACC_INFO_ARCH             "amd64"
-+#  if defined(__ILP32__)
-+#    define ACC_ARCH_AMD64_X32      1
-+#  endif
- #elif defined(__thumb__) || (defined(_M_ARM) && defined(_M_THUMB))
- #  define ACC_ARCH_ARM              1
- #  define ACC_ARCH_ARM_THUMB        1
-@@ -6787,7 +6790,11 @@ ACCLIB_PUBLIC_NOINLINE(void, acc_debug_n
- ACCLIB_PUBLIC_NOINLINE(int, acc_debug_align_check_query) (void)
- {
- #if (ACC_ARCH_AMD64 || ACC_ARCH_I386) && (ACC_ASM_SYNTAX_GNUC)
-+#  if defined(ACC_ARCH_AMD64_X32)
-+    unsigned long long r;
-+#  else
-     size_t r;
-+#  endif
-     __asm__ __volatile__("pushf\n pop %0\n" : "=a" (r) : : __ACC_ASM_CLOBBER);
-     return (int)(r >> 18) & 1;
- #elif (ACC_ARCH_I386) && (ACC_ASM_SYNTAX_MSC)
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.04.bb
similarity index 66%
rename from meta/recipes-support/lzop/lzop_1.03.bb
rename to meta/recipes-support/lzop/lzop_1.04.bb
index 6f09002..b50c230 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -8,17 +8,14 @@ to gzip."
 DEPENDS += "lzo"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dfeaf3dc4beef4f5a7bdbc35b197f39e \
-                    file://src/lzop.c;beginline=5;endline=21;md5=6797bd3ed0a1a49327b7ebf9366ebd86"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/lzop.c;beginline=5;endline=21;md5=23d767de7754eb24b9e900b025cf7fc8"
 
 SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
-           file://x32_abi_miniacc_h.patch \
-           file://0001-use-static-inlines-as-the-external-inline-definition.patch \
-           file://lzop-1.03-gcc6.patch \
           "
-SRC_URI[md5sum] = "006c5e27fb78cdd14a628fdfa5aa1905"
-SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9"
+SRC_URI[md5sum] = "271eb10fde77a0a96b9cbf745e719ddf"
+SRC_URI[sha256sum] = "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41"
 
 inherit autotools
 
-- 
2.7.4


