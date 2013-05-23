Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 910746A378
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 23:10:34 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2013 16:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,730,1363158000"; d="scan'208";a="245899887"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2013 16:10:16 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:09:20 +0000
Message-Id: <f5d15445e6981c814b2726f916feb2ead0d3930c.1369324957.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369324957.git.nitin.a.kamble@intel.com>
References: <cover.1369324957.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] dropbear: a fix for hang in dropbearkey, built for x32
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
X-List-Received-Date: Thu, 23 May 2013 23:10:34 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit fixes runtime hang of 'dropbearkey' utility, built for a x32
target abi system. The hang was observed while generating ssh keys, with
this command:
  dropbearkey -t dss -f private

The issue is fixed by changing the code, where 'long' in x86_64 mode is
assumed as 64bit quantity. With the x32 abi, the processor is in x86_64
mode, but the 'long' is a 32bit quantity. Hence the fix uses 'long long'
instead of 'long' to define/access 64bit data variables.

Fixes bug:
[YOCTO #4496]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../0007-dropbear-fix-for-x32-abi.patch            | 140 +++++++++++++++++++++
 meta/recipes-core/dropbear/dropbear.inc            |   3 +-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch

diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch
new file mode 100644
index 0000000..b450121
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch
@@ -0,0 +1,140 @@
+Upstream-Status: Pending
+
+The dropbearkey utility built in x32 abi format, when generating ssh
+keys, was getting lost in the infinite loop.
+
+This patch fixes the issue by fixing types of variables and
+parameters of functions used in the code, which were getting
+undesired size, when compiled with the x32 abi toolchain.
+
+2013/05/23
+Received this fix from H J Lu.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344079 25200
+# Node ID a10a1c46b857cc8a3923c3bb6d1504aa25b6052f
+# Parent  e76614145aea67f66e4a4257685c771efba21aa1
+Typdef mp_digit to unsigned long long for MP_64BIT
+
+When GCC is used with MP_64BIT, we should typedef mp_digit to unsigned
+long long instead of unsigned long since for x32, unsigned long is
+32-bit and unsigned long long is 64-bit and it is safe to use unsigned
+long long for 64-bit integer with GCC.
+
+diff -r e76614145aea -r a10a1c46b857 libtommath/tommath.h
+--- a/libtommath/tommath.h	Thu Apr 18 22:57:47 2013 +0800
++++ b/libtommath/tommath.h	Thu May 23 14:21:19 2013 -0700
+@@ -73,7 +73,7 @@
+    typedef signed long long   long64;
+ #endif
+
+-   typedef unsigned long      mp_digit;
++   typedef unsigned long long mp_digit;
+    typedef unsigned long      mp_word __attribute__ ((mode(TI)));
+
+    #define DIGIT_BIT          60
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344241 25200
+# Node ID c7555a4cb7ded3a88409ba85f4027baa7af5f536
+# Parent  a10a1c46b857cc8a3923c3bb6d1504aa25b6052f
+Cast to mp_digit when updating *rho
+
+There is
+
+int
+mp_montgomery_setup (mp_int * n, mp_digit * rho)
+
+We should cast to mp_digit instead of unsigned long when updating
+*rho since mp_digit may be unsigned long long and unsigned long long
+may be different from unsigned long, like in x32.
+
+diff -r a10a1c46b857 -r c7555a4cb7de libtommath/bn_mp_montgomery_setup.c
+--- a/libtommath/bn_mp_montgomery_setup.c	Thu May 23 14:21:19 2013 -0700
++++ b/libtommath/bn_mp_montgomery_setup.c	Thu May 23 14:24:01 2013 -0700
+@@ -48,7 +48,7 @@
+ #endif
+
+   /* rho = -1/m mod b */
+-  *rho = (unsigned long)(((mp_word)1 << ((mp_word) DIGIT_BIT)) - x) & MP_MASK;
++  *rho = (mp_digit)(((mp_word)1 << ((mp_word) DIGIT_BIT)) - x) & MP_MASK;
+
+   return MP_OKAY;
+ }
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344541 25200
+# Node ID 7c656e7071a6412688b2f30a529a9afac6c7bf5a
+# Parent  c7555a4cb7ded3a88409ba85f4027baa7af5f536
+Define LTC_FAST_TYPE to unsigned long long for __x86_64__
+
+We should define LTC_FAST_TYPE to unsigned long long instead of unsigned
+long if __x86_64__ to support x32 where unsigned long long is 64-bit
+and unsigned long is 32-bit.
+
+diff -r c7555a4cb7de -r 7c656e7071a6 libtomcrypt/src/headers/tomcrypt_cfg.h
+--- a/libtomcrypt/src/headers/tomcrypt_cfg.h	Thu May 23 14:24:01 2013 -0700
++++ b/libtomcrypt/src/headers/tomcrypt_cfg.h	Thu May 23 14:29:01 2013 -0700
+@@ -74,7 +74,7 @@
+    #define ENDIAN_LITTLE
+    #define ENDIAN_64BITWORD
+    #define LTC_FAST
+-   #define LTC_FAST_TYPE    unsigned long
++   #define LTC_FAST_TYPE    unsigned long long
+ #endif
+
+ /* detect PPC32 */
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344730 25200
+# Node ID a7d4690158fae4ede2c4e5b56233e83730bf38ee
+# Parent  7c656e7071a6412688b2f30a529a9afac6c7bf5a
+Use unsigned long long aas unsigned 64-bit integer for x86-64 GCC
+
+We should use unsigned long long instead of unsigned long as unsigned
+64-bit integer for x86-64 GCC to support x32 where unsigned long is
+32-bit.
+
+diff -r 7c656e7071a6 -r a7d4690158fa libtomcrypt/src/headers/tomcrypt_macros.h
+--- a/libtomcrypt/src/headers/tomcrypt_macros.h	Thu May 23 14:29:01 2013 -0700
++++ b/libtomcrypt/src/headers/tomcrypt_macros.h	Thu May 23 14:32:10 2013 -0700
+@@ -343,7 +343,7 @@
+ /* 64-bit Rotates */
+ #if !defined(__STRICT_ANSI__) && defined(__GNUC__) && defined(__x86_64__) && !defined(LTC_NO_ASM)
+
+-static inline unsigned long ROL64(unsigned long word, int i)
++static inline unsigned long long ROL64(unsigned long long word, int i)
+ {
+    asm("rolq %%cl,%0"
+       :"=r" (word)
+@@ -351,7 +351,7 @@
+    return word;
+ }
+
+-static inline unsigned long ROR64(unsigned long word, int i)
++static inline unsigned long long ROR64(unsigned long long word, int i)
+ {
+    asm("rorq %%cl,%0"
+       :"=r" (word)
+@@ -361,7 +361,7 @@
+
+ #ifndef LTC_NO_ROLC
+
+-static inline unsigned long ROL64c(unsigned long word, const int i)
++static inline unsigned long long ROL64c(unsigned long long word, const int i)
+ {
+    asm("rolq %2,%0"
+       :"=r" (word)
+@@ -369,7 +369,7 @@
+    return word;
+ }
+
+-static inline unsigned long ROR64c(unsigned long word, const int i)
++static inline unsigned long long ROR64c(unsigned long long word, const int i)
+ {
+    asm("rorq %2,%0"
+       :"=r" (word)
+
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 9864ae8..be93d60 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
@@ -19,6 +19,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0002-static_build_fix.patch \
            file://0003-configure.patch \
            file://0004-fix-2kb-keys.patch \
+           file://0007-dropbear-fix-for-x32-abi.patch \
            file://init \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
-- 
1.8.1.4


