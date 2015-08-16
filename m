Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5F02F606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 18:20:57 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so47685761pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lM/e7cPllmYfYSBOmuGxfEUV+n3cjajI0nNct92yEVk=;
	b=jb+GWJIXoSR96rLvw9wbBVN+Wgc3WCMclXHnsRFTCH+7Mz1ap7o0fS/MlripVXYgDA
	nLr0bYqahyAh1LwTubL5uQLAA15Xi7BsVmYA9CZqL7DfFG1PKrbUZUcypBfFh7mhZg23
	maRVmBFvgoMaPsZGtubxSjEkRQw/IZloLblw0569koF+3AO/a0Zki5HAJz4tE26AnaUz
	g1zJ1rmD7rc0PFlSspcdGnXSv6ufL2y4ctRVZz2h5yHK0xWFziaioCxw3tCLSkdT/lRZ
	Z+l69Kt7RpAuA7hRn+SdWzSEt/0fo0juGb/DyPvlpMoKvyWkUJ4SEW1iJz6oGHfyO+IU
	SVVw==
X-Received: by 10.70.90.15 with SMTP id bs15mr48367721pdb.142.1439749258320;
	Sun, 16 Aug 2015 11:20:58 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	s13sm12053365pdi.70.2015.08.16.11.20.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 11:20:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2015 11:30:03 -0700
Message-Id: <1439749803-26868-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439749803-26868-1-git-send-email-raj.khem@gmail.com>
References: <1439749803-26868-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] lzop: Fix build with gcc5 on ppc
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
X-List-Received-Date: Sun, 16 Aug 2015 18:21:00 -0000

It seems all other architectures provide their own definitions for these
functions like __ACC_UA_GET_LE16 and this code is exposed only on ppc
this is the typical extern inline ( gnu definition ) version c99
semantics, lets use static inline which works both ways

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...inlines-as-the-external-inline-definition.patch | 100 +++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |   4 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch

diff --git a/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch b/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch
new file mode 100644
index 0000000..867b88b
--- /dev/null
+++ b/meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch
@@ -0,0 +1,100 @@
+From ecccbcf66da53779d88e38e2af7f82eff8dde7f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Aug 2015 10:35:47 -0700
+Subject: [PATCH] use static inlines as the external inline definition has
+ changed with gcc5
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/miniacc.h | 24 ++++++++----------------
+ 1 file changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/src/miniacc.h b/src/miniacc.h
+index 09e6f0c..cae98d1 100644
+--- a/src/miniacc.h
++++ b/src/miniacc.h
+@@ -2880,8 +2880,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE16)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -2890,8 +2889,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
+ #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE16)
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
+     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+@@ -2916,8 +2914,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE32)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -2926,8 +2923,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
+ #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE32)
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
+     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+@@ -3307,8 +3303,7 @@ typedef void (__acc_cdecl_sighandler *acc_sighandler_t)(acc_signo_t);
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE16)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint16e_t* p = (__acc_ua_volatile const acc_uint16e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lhbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -3317,8 +3312,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE16(__acc_ua_volatile const
+ #define ACC_UA_GET_LE16(p)      __ACC_UA_GET_LE16(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE16)
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint16e_t* p = (__acc_ua_volatile acc_uint16e_t*) pp;
+     __asm__ __volatile__("sthbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+@@ -3343,8 +3337,7 @@ extern __acc_forceinline void __ACC_UA_SET_LE16(__acc_ua_volatile void* pp, unsi
+ #if !(ACC_CFG_NO_INLINE_ASM) && (__acc_HAVE_forceinline)
+ #if (ACC_ARCH_POWERPC && ACC_ABI_BIG_ENDIAN) && (ACC_CC_GNUC)
+ #if !defined(ACC_UA_GET_LE32)
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp);
+-extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
++static __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const void* pp) {
+     __acc_ua_volatile const acc_uint32e_t* p = (__acc_ua_volatile const acc_uint32e_t*) pp;
+     unsigned long v;
+     __asm__ __volatile__("lwbrx %0,0,%1" : "=r" (v) : "r" (p), "m" (*p));
+@@ -3353,8 +3346,7 @@ extern __acc_forceinline unsigned long __ACC_UA_GET_LE32(__acc_ua_volatile const
+ #define ACC_UA_GET_LE32(p)      __ACC_UA_GET_LE32(p)
+ #endif
+ #if !defined(ACC_UA_SET_LE32)
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v);
+-extern __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
++static __acc_forceinline void __ACC_UA_SET_LE32(__acc_ua_volatile void* pp, unsigned long v) {
+     __acc_ua_volatile acc_uint32e_t* p = (__acc_ua_volatile acc_uint32e_t*) pp;
+     __asm__ __volatile__("stwbrx %2,0,%1" : "=m" (*p) : "r" (p), "r" (v));
+ }
+-- 
+2.5.0
+
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index 1fcd81d..07d6289 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dfeaf3dc4beef4f5a7bdbc35b197f39e \
 
 SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
-           file://x32_abi_miniacc_h.patch "
+           file://x32_abi_miniacc_h.patch \
+           file://0001-use-static-inlines-as-the-external-inline-definition.patch \
+          "
 SRC_URI[md5sum] = "006c5e27fb78cdd14a628fdfa5aa1905"
 SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9"
 
-- 
2.5.0


