Return-Path: <brendan.le.foll@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7600873C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:16:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 25 Mar 2015 06:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,465,1422950400"; d="scan'208";a="697561851"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by fmsmga002.fm.intel.com with ESMTP; 25 Mar 2015 06:16:34 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2015 13:15:43 +0000
Message-Id: <1427289343-9625-2-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.3.2
In-Reply-To: <1427289343-9625-1-git-send-email-brendan.le.foll@intel.com>
References: <1427289343-9625-1-git-send-email-brendan.le.foll@intel.com>
Subject: [PATCH][dizzy] openssl: Upgrade to 1.0.1m
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
X-List-Received-Date: Wed, 25 Mar 2015 13:16:38 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Security update, some patches modified to apply correctly mostly due to
upstream changing indentation/styling

* configure-targets.patch updated
* fix-cipher-des-ede3-cfb1.patch updated
* openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch updated
* openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch removed as no
merged with 3942e7d9ebc262fa5c5c42aba0167e06d981f004 in upstream

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 .../openssl/openssl/configure-targets.patch        | 28 +++----
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 17 +++--
 .../openssl/openssl/initial-aarch64-bits.patch     | 87 ++++++++++++++--------
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 19 +++--
 ...NULL-pointer-dereference-in-dh_pub_encode.patch | 39 ----------
 .../openssl/openssl/openssl_fix_for_x32.patch      | 83 ++++++++-------------
 .../recipes-connectivity/openssl/openssl_1.0.1j.bb | 57 --------------
 .../recipes-connectivity/openssl/openssl_1.0.1m.bb | 56 ++++++++++++++
 8 files changed, 175 insertions(+), 211 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.1m.bb

diff --git a/meta/recipes-connectivity/openssl/openssl/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
index c1f3d08..dbc10f9 100644
--- a/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
@@ -10,25 +10,25 @@ The number of colons are important :)
 --- a/Configure
 +++ b/Configure
 @@ -403,6 +403,22 @@ my %table=(
- "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
- "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
+ "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
+ "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
 + # Linux on ARM
-+"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
-+"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
++"linux-avr32","$ENV{'CC'}: -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
 +#### Linux on MIPS/MIPS64
-+"linux-mips","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mips64","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mips","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mips64","$ENV{'CC'}:-DB_ENDIAN -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
- # Android: linux-* but without -DTERMIO and pointers to headers and libs.
+ # Android: linux-* but without pointers to headers and libs.
  "android","gcc:-mandroid -I\$(ANDROID_DEV)/include -B\$(ANDROID_DEV)/lib -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "android-x86","gcc:-mandroid -I\$(ANDROID_DEV)/include -B\$(ANDROID_DEV)/lib -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:".eval{my $asm=${x86_elf_asm};$asm=~s/:elf/:android/;$asm}.":dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
index f0e1778..2412a3b 100644
--- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
+++ b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
@@ -6,17 +6,20 @@ http://rt.openssl.org/Ticket/Display.html?id=2867
 
 Signed-Off-By: Muhammad Shakeel <muhammad_shakeel@mentor.com>
 
+ported the patch to the 1.0.0m version
+Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com> 2015/03/24
+
 diff --git a/crypto/evp/e_des3.c b/crypto/evp/e_des3.c
 index 3232cfe..df84922 100644
 ===================================================================
 --- a/crypto/evp/e_des3.c
 +++ b/crypto/evp/e_des3.c
-@@ -173,7 +173,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
+@@ -181,7 +181,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
      size_t n;
-     unsigned char c[1],d[1];
+     unsigned char c[1], d[1];
  
--    for(n=0 ; n < inl ; ++n)
-+    for(n=0 ; n < inl*8 ; ++n)
- 	{
- 	c[0]=(in[n/8]&(1 << (7-n%8))) ? 0x80 : 0;
-	DES_ede3_cfb_encrypt(c,d,1,1,
+-    for (n = 0; n < inl; ++n) {
++    for (n = 0; n < inl * 8; ++n) {
+         c[0] = (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
+         DES_ede3_cfb_encrypt(c, d, 1, 1,
+                              &data(ctx)->ks1, &data(ctx)->ks2,
diff --git a/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
index 770097d..972b367 100644
--- a/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
+++ b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
@@ -5,6 +5,9 @@ X-Git-Url: http://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff_plain;h=039
 
 Initial aarch64 bits.
 Upstream-Status: backport (will be included in 1.0.2)
+
+ported the patch to the 1.0.0m version
+Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com> 2015/03/24
 ---
  crypto/bn/bn_lcl.h       |    9 +++++++++
  crypto/md32_common.h     |   18 ++++++++++++++++++
@@ -16,10 +19,10 @@ Index: openssl-1.0.1f/crypto/bn/bn_lcl.h
 ===================================================================
 --- openssl-1.0.1f.orig/crypto/bn/bn_lcl.h	2014-01-06 15:47:42.000000000 +0200
 +++ openssl-1.0.1f/crypto/bn/bn_lcl.h	2014-02-28 10:37:55.495979037 +0200
-@@ -300,6 +300,15 @@
- 	     : "r"(a), "r"(b));
+@@ -295,6 +295,15 @@ unsigned __int64 _umul128(unsigned __int64 a, unsigned __int64 b,
+              : "r"(a), "r"(b));
  #    endif
- #  endif
+ #   endif
 +# elif defined(__aarch64__) && defined(SIXTY_FOUR_BIT_LONG)
 +#  if defined(__GNUC__) && __GNUC__>=2
 +#   define BN_UMULT_HIGH(a,b)  ({  \
@@ -29,17 +32,17 @@ Index: openssl-1.0.1f/crypto/bn/bn_lcl.h
 +        : "r"(a), "r"(b));     \
 +   ret;            })
 +#  endif
- # endif		/* cpu */
- #endif		/* OPENSSL_NO_ASM */
+ #  endif                        /* cpu */
+ # endif                         /* OPENSSL_NO_ASM */
  
 Index: openssl-1.0.1f/crypto/md32_common.h
 ===================================================================
 --- openssl-1.0.1f.orig/crypto/md32_common.h	2014-01-06 15:47:42.000000000 +0200
 +++ openssl-1.0.1f/crypto/md32_common.h	2014-02-28 10:39:21.751979107 +0200
-@@ -213,6 +213,24 @@
- 				   asm ("bswapl %0":"=r"(r):"0"(r));	\
- 				   *((unsigned int *)(c))=r; (c)+=4; r;	})
- #   endif
+@@ -213,6 +213,42 @@
+                                    asm ("bswapl %0":"=r"(r):"0"(r));    \
+                                    *((unsigned int *)(c))=r; (c)+=4; r; })
+ #    endif
 +#  elif defined(__aarch64__)
 +#   if defined(__BYTE_ORDER__)
 +#    if defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
@@ -58,25 +61,43 @@ Index: openssl-1.0.1f/crypto/md32_common.h
 +#     define HOST_l2c(l,c) (*((unsigned int *)(c))=(l), (c)+=4, (l))
 +#    endif
 +#   endif
++#   endif
++#  elif defined(__aarch64__)
++#   if defined(__BYTE_ORDER__)
++#    if defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
++#     define HOST_c2l(c,l) ({ unsigned int r;      \
++                  asm ("rev    %w0,%w1"    \
++                   :"=r"(r)        \
++                   :"r"(*((const unsigned int *)(c))));\
++                  (c)+=4; (l)=r;       })
++#     define HOST_l2c(l,c) ({ unsigned int r;      \
++                  asm ("rev    %w0,%w1"    \
++                   :"=r"(r)        \
++                   :"r"((unsigned int)(l)));\
++                  *((unsigned int *)(c))=r; (c)+=4; r; })
++#    elif defined(__ORDER_BIG_ENDIAN__) && __BYTE_ORDER__==__ORDER_BIG_ENDIAN__
++#     define HOST_c2l(c,l) ((l)=*((const unsigned int *)(c)), (c)+=4, (l))
++#     define HOST_l2c(l,c) (*((unsigned int *)(c))=(l), (c)+=4, (l))
++#    endif
+ #   endif
  #  endif
  # endif
- #endif
 Index: openssl-1.0.1f/crypto/modes/modes_lcl.h
 ===================================================================
 --- openssl-1.0.1f.orig/crypto/modes/modes_lcl.h	2014-02-28 10:47:48.731979011 +0200
 +++ openssl-1.0.1f/crypto/modes/modes_lcl.h	2014-02-28 10:48:49.707978919 +0200
-@@ -29,6 +29,7 @@
- #if defined(__i386)	|| defined(__i386__)	|| \
-     defined(__x86_64)	|| defined(__x86_64__)	|| \
-     defined(_M_IX86)	|| defined(_M_AMD64)	|| defined(_M_X64) || \
+@@ -28,6 +28,7 @@ typedef unsigned char u8;
+ #if defined(__i386)     || defined(__i386__)    || \
+     defined(__x86_64)   || defined(__x86_64__)  || \
+     defined(_M_IX86)    || defined(_M_AMD64)    || defined(_M_X64) || \
 +    defined(__aarch64__)           || \
-     defined(__s390__)	|| defined(__s390x__)
+     defined(__s390__)   || defined(__s390x__)
  # undef STRICT_ALIGNMENT
  #endif
-@@ -50,6 +51,13 @@
- #  define BSWAP4(x) ({	u32 ret=(x);			\
- 			asm ("bswapl %0"		\
- 			: "+r"(ret));	ret;		})
+@@ -49,6 +50,13 @@ typedef unsigned char u8;
+ #   define BSWAP4(x) ({ u32 ret=(x);                    \
+                         asm ("bswapl %0"                \
+                         : "+r"(ret));   ret;            })
 +# elif defined(__aarch64__)
 +#  define BSWAP8(x) ({ u64 ret;            \
 +           asm ("rev %0,%1"        \
@@ -84,25 +105,25 @@ Index: openssl-1.0.1f/crypto/modes/modes_lcl.h
 +#  define BSWAP4(x) ({ u32 ret;            \
 +           asm ("rev %w0,%w1"      \
 +           : "=r"(ret) : "r"(x)); ret; })
- # elif (defined(__arm__) || defined(__arm)) && !defined(STRICT_ALIGNMENT)
- #  define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
- 			asm ("rev %0,%0; rev %1,%1"	\
+ #  elif (defined(__arm__) || defined(__arm)) && !defined(STRICT_ALIGNMENT)
+ #   define BSWAP8(x) ({  u32 lo=(u64)(x)>>32,hi=(x);     \
+                         asm ("rev %0,%0; rev %1,%1"     \
 Index: openssl-1.0.1f/crypto/sha/sha512.c
 ===================================================================
 --- openssl-1.0.1f.orig/crypto/sha/sha512.c	2014-01-06 15:47:42.000000000 +0200
 +++ openssl-1.0.1f/crypto/sha/sha512.c	2014-02-28 10:52:14.579978981 +0200
-@@ -55,6 +55,7 @@
- #if defined(__i386) || defined(__i386__) || defined(_M_IX86) || \
+@@ -55,6 +55,7 @@ const char SHA512_version[] = "SHA-512" OPENSSL_VERSION_PTEXT;
+ # if defined(__i386) || defined(__i386__) || defined(_M_IX86) || \
      defined(__x86_64) || defined(_M_AMD64) || defined(_M_X64) || \
      defined(__s390__) || defined(__s390x__) || \
 +    defined(__aarch64__) || \
      defined(SHA512_ASM)
- #define SHA512_BLOCK_CAN_MANAGE_UNALIGNED_DATA
- #endif
-@@ -347,6 +348,18 @@
- 				asm ("rotrdi %0,%1,%2"	\
- 				: "=r"(ret)		\
- 				: "r"(a),"K"(n)); ret;	})
+ #  define SHA512_BLOCK_CAN_MANAGE_UNALIGNED_DATA
+ # endif
+@@ -353,6 +354,18 @@ static const SHA_LONG64 K512[80] = {
+                                 asm ("rotrdi %0,%1,%2"  \
+                                 : "=r"(ret)             \
+                                 : "r"(a),"K"(n)); ret;  })
 +#  elif defined(__aarch64__)
 +#   define ROTR(a,n)   ({ SHA_LONG64 ret;      \
 +               asm ("ror %0,%1,%2" \
@@ -115,6 +136,6 @@ Index: openssl-1.0.1f/crypto/sha/sha512.c
 +               : "=r"(ret)         \
 +               : "r"(*((const SHA_LONG64 *)(&(x))))); ret;     })
 +#   endif
- #  endif
- # elif defined(_MSC_VER)
- #  if defined(_WIN64)	/* applies to both IA-64 and AMD64 */
+ #    endif
+ #   elif defined(_MSC_VER)
+ #    if defined(_WIN64)         /* applies to both IA-64 and AMD64 */
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
index c161e62..36aa442 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
@@ -7,15 +7,18 @@ Upstream-Status: Submitted
 http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
 
 Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+
+ported the patch to the 1.0.0m version
+Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com> 2015/03/24
 ---
 --- a/crypto/evp/digest.c
 +++ b/crypto/evp/digest.c
-@@ -199,7 +199,7 @@
- 		return 0;
- 		}
+@@ -199,7 +199,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, const EVP_MD *type, ENGINE *impl)
+         type = ctx->digest;
+     }
  #endif
--	if (ctx->digest != type)
-+	if (type && (ctx->digest != type))
- 		{
- 		if (ctx->digest && ctx->digest->ctx_size)
- 			OPENSSL_free(ctx->md_data);
+-    if (ctx->digest != type) {
++    if (type && (ctx->digest != type)) {
+         if (ctx->digest && ctx->digest->ctx_size)
+             OPENSSL_free(ctx->md_data);
+         ctx->digest = type;
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
deleted file mode 100644
index 3e93fe4..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-openssl: avoid NULL pointer dereference in dh_pub_encode()/dsa_pub_encode()
-
-We should avoid accessing the pointer if ASN1_STRING_new()
-allocates memory failed.
-
-Upstream-Status: Submitted
-http://www.mail-archive.com/openssl-dev@openssl.org/msg32859.html
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
---- a/crypto/dh/dh_ameth.c
-+++ b/crypto/dh/dh_ameth.c
-@@ -139,6 +139,12 @@
- 	dh=pkey->pkey.dh;
- 
- 	str = ASN1_STRING_new();
-+	if (!str)
-+		{
-+		DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
-+		goto err;
-+		}
-+
- 	str->length = i2d_DHparams(dh, &str->data);
- 	if (str->length <= 0)
- 		{
---- a/crypto/dsa/dsa_ameth.c
-+++ b/crypto/dsa/dsa_ameth.c
-@@ -148,6 +148,11 @@
- 		{
- 		ASN1_STRING *str;
- 		str = ASN1_STRING_new();
-+		if (!str)
-+			{
-+			DSAerr(DSA_F_DSA_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
-+			goto err;
-+			}
- 		str->length = i2d_DSAparams(dsa, &str->data);
- 		if (str->length <= 0)
- 			{
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
index 93ce034..0d3902f 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
@@ -6,16 +6,19 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
 
 ported the patch to the 1.0.0e version
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
+
+ported the patch to the 1.0.0m version
+Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com> 2015/03/24
 Index: openssl-1.0.1e/Configure
 ===================================================================
 --- openssl-1.0.1e.orig/Configure
 +++ openssl-1.0.1e/Configure
 @@ -402,6 +402,7 @@ my %table=(
- "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
-+"linux-x32", "gcc:-mx32 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::x32",
- "linux64-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
+ "linux-ia64-ecc","ecc:-DL_ENDIAN -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-ia64-icc","icc:-DL_ENDIAN -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
++"linux-x32", "gcc:-mx32 -DL_ENDIAN -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::x32",
+ "linux64-s390x",	"gcc:-m64 -DB_ENDIAN -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
  #### So called "highgprs" target for z/Architecture CPUs
  # "Highgprs" is kernel feature first implemented in Linux 2.6.32, see
 Index: openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
@@ -26,65 +29,39 @@ Index: openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
   *    machine.
   */
  
--#ifdef _WIN64
-+#if defined _WIN64 || !defined __LP64__
- #define BN_ULONG unsigned long long
- #else
- #define BN_ULONG unsigned long
-@@ -192,9 +192,9 @@ BN_ULONG bn_add_words (BN_ULONG *rp, con
- 	asm (
- 	"	subq	%2,%2		\n"
- 	".p2align 4			\n"
--	"1:	movq	(%4,%2,8),%0	\n"
--	"	adcq	(%5,%2,8),%0	\n"
--	"	movq	%0,(%3,%2,8)	\n"
-+	"1:	movq	(%q4,%2,8),%0	\n"
-+	"	adcq	(%q5,%2,8),%0	\n"
-+	"	movq	%0,(%q3,%2,8)	\n"
- 	"	leaq	1(%2),%2	\n"
- 	"	loop	1b		\n"
- 	"	sbbq	%0,%0		\n"
-@@ -215,9 +215,9 @@ BN_ULONG bn_sub_words (BN_ULONG *rp, con
- 	asm (
- 	"	subq	%2,%2		\n"
- 	".p2align 4			\n"
--	"1:	movq	(%4,%2,8),%0	\n"
--	"	sbbq	(%5,%2,8),%0	\n"
--	"	movq	%0,(%3,%2,8)	\n"
-+	"1:	movq	(%q4,%2,8),%0	\n"
-+	"	sbbq	(%q5,%2,8),%0	\n"
-+	"	movq	%0,(%q3,%2,8)	\n"
- 	"	leaq	1(%2),%2	\n"
- 	"	loop	1b		\n"
- 	"	sbbq	%0,%0		\n"
+-# ifdef _WIN64
++# if defined _WIN64 || !defined __LP64__
+ #  define BN_ULONG unsigned long long
+ # else
+ #  define BN_ULONG unsigned long
 Index: openssl-1.0.1e/crypto/bn/bn.h
 ===================================================================
 --- openssl-1.0.1e.orig/crypto/bn/bn.h
 +++ openssl-1.0.1e/crypto/bn/bn.h
-@@ -172,6 +172,13 @@ extern "C" {
+@@ -173,6 +173,13 @@ extern "C" {
+ #  endif
  # endif
- #endif
  
 +/* Address type.  */
-+#ifdef _WIN64
-+#define BN_ADDR unsigned long long
-+#else
-+#define BN_ADDR unsigned long
-+#endif
++# ifdef _WIN64
++#   define BN_ADDR unsigned long long
++# else
++#   define BN_ADDR unsigned long
++# endif
 +
- /* assuming long is 64bit - this is the DEC Alpha
-  * unsigned long long is only 64 bits :-(, don't define
-  * BN_LLONG for the DEC Alpha */
+ /*
+  * assuming long is 64bit - this is the DEC Alpha unsigned long long is only
+  * 64 bits :-(, don't define BN_LLONG for the DEC Alpha
 Index: openssl-1.0.1e/crypto/bn/bn_exp.c
 ===================================================================
 --- openssl-1.0.1e.orig/crypto/bn/bn_exp.c
 +++ openssl-1.0.1e/crypto/bn/bn_exp.c
-@@ -567,7 +567,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
- 
- /* Given a pointer value, compute the next address that is a cache line multiple. */
+@@ -572,7 +572,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBUF(BIGNUM *b, int top,
+  * multiple.
+  */
  #define MOD_EXP_CTIME_ALIGN(x_) \
--	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((size_t)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
-+	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ADDR)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
+-        ((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((size_t)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
++        ((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ADDR)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
  
- /* This variant of BN_mod_exp_mont() uses fixed windows and the special
-  * precomputation memory layout to limit data-dependency to a minimum
+ /*
+  * This variant of BN_mod_exp_mont() uses fixed windows and the special
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
deleted file mode 100644
index 2da18ae..0000000
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-require openssl.inc
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-DEPENDS += "cryptodev-linux"
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
-
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
-
-SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://oe-ldflags.patch \
-            file://engines-install-in-libdir-ssl.patch \
-            file://openssl-fix-link.patch \
-            file://debian/version-script.patch \
-            file://debian/pic.patch \
-            file://debian/c_rehash-compat.patch \
-            file://debian/ca.patch \
-            file://debian/make-targets.patch \
-            file://debian/no-rpath.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/debian-targets.patch \
-            file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
-            file://initial-aarch64-bits.patch \
-            file://find.pl \
-            file://openssl-fix-des.pod-error.patch \
-            file://Makefiles-ptest.patch \
-            file://ptest-deps.patch \
-            file://run-ptest \
-           "
-
-SRC_URI[md5sum] = "f7175c9cd3c39bb1907ac8bba9df8ed3"
-SRC_URI[sha256sum] = "1b60ca8789ba6f03e8ef20da2293b8dc131c39d83814e775069f02d26354edf3"
-
-PACKAGES =+ " \
-	${PN}-engines \
-	${PN}-engines-dbg \
-	"
-
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
-
-PARALLEL_MAKE = ""
-PARALLEL_MAKEINST = ""
-
-do_configure_prepend() {
-  cp ${WORKDIR}/find.pl ${S}/util/find.pl
-}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
new file mode 100644
index 0000000..cab6b3f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
@@ -0,0 +1,56 @@
+require openssl.inc
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+DEPENDS += "cryptodev-linux"
+
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
+
+export DIRS = "crypto ssl apps engines"
+export OE_LDFLAGS="${LDFLAGS}"
+
+SRC_URI += "file://configure-targets.patch \
+            file://shared-libs.patch \
+            file://oe-ldflags.patch \
+            file://engines-install-in-libdir-ssl.patch \
+            file://openssl-fix-link.patch \
+            file://debian/version-script.patch \
+            file://debian/pic.patch \
+            file://debian/c_rehash-compat.patch \
+            file://debian/ca.patch \
+            file://debian/make-targets.patch \
+            file://debian/no-rpath.patch \
+            file://debian/man-dir.patch \
+            file://debian/man-section.patch \
+            file://debian/no-symbolic.patch \
+            file://debian/debian-targets.patch \
+            file://openssl_fix_for_x32.patch \
+            file://fix-cipher-des-ede3-cfb1.patch \
+            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
+            file://initial-aarch64-bits.patch \
+            file://find.pl \
+            file://openssl-fix-des.pod-error.patch \
+            file://Makefiles-ptest.patch \
+            file://ptest-deps.patch \
+            file://run-ptest \
+           "
+
+SRC_URI[md5sum] = "d143d1555d842a069cb7cc34ba745a06"
+SRC_URI[sha256sum] = "095f0b7b09116c0c5526422088058dc7e6e000aa14d22acca6a4e2babcdfef74"
+
+PACKAGES =+ " \
+	${PN}-engines \
+	${PN}-engines-dbg \
+	"
+
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
+
+PARALLEL_MAKE = ""
+PARALLEL_MAKEINST = ""
+
+do_configure_prepend() {
+  cp ${WORKDIR}/find.pl ${S}/util/find.pl
+}
-- 
2.3.2


