Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id AF96D6CBAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 14:22:24 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id hp15so622007lab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9ImxBhOCEQ7gjQm0sStWNU+DSoUxITrvi/NoFhQqVIs=;
	b=MrxAojDggsvi2qQK2Kc5nYA125oQI+YiuZgUzIQMSS1AnK0uFSpkOi5LmKizhewJ9Z
	5cA+ll446VPcHNdUkg/BVeJDETTyR60G3N2WD8Egug++ClbVh9+wCVTs9B9ZpsfSjzCP
	TYCIibiPpCwHRKnAK+60Oai7YWmAF4Qw6V3y9ZorfulDHV2KeHAPMCdIp2JMFUvuHKGa
	clkPOgNPewaAnWNZLqIvo76KrdEbEXCJJZwr8nsY9mq83Hk0dLYoE2qAndmsY1zGn6lk
	zbCvD7YVYFdmb5mI96d/KVoytBWOXYjqNXK8sR+lqSJVwTjurppeUM+aUkrS6vz4cDPd
	kcJA==
X-Gm-Message-State: ALoCoQkR5WECO5Ggcg0elHaLHu8Jrt2tRM3ZFT8PKmq4rQU7uZWdiDhUd+yXUBsIbBeGn4oC/VYz
X-Received: by 10.152.8.51 with SMTP id o19mr1654818laa.42.1381933345915;
	Wed, 16 Oct 2013 07:22:25 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id u20sm51356764lbh.7.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 07:22:25 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 17:22:15 +0300
Message-Id: <1381933335-11489-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] openssl: use linux-generic64 target for Aarch64 (LE and BE)
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
X-List-Received-Date: Wed, 16 Oct 2013 14:22:26 -0000

Update configure-targets.patch:
 - drop linux-aarch64 configuration
Update do_configure():
 - add linux-aarch64 case and use linux-generic64 target
Backport initial-aarch64-bits.patch:
 - first order optimizations for Aarch64

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../openssl/openssl-1.0.1e/configure-targets.patch |  13 +--
 .../openssl-1.0.1e/initial-aarch64-bits.patch      | 111 +++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |   3 +
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +
 4 files changed, 120 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
index 8c638b4..c1f3d08 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
@@ -4,14 +4,12 @@ The number of colons are important :)
 
 
 ---
- Configure |   17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
+ Configure |   16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
 
-Index: openssl-1.0.1e/Configure
-===================================================================
---- openssl-1.0.1e.orig/Configure
-+++ openssl-1.0.1e/Configure
-@@ -403,6 +403,23 @@ my %table=(
+--- a/Configure
++++ b/Configure
+@@ -403,6 +403,22 @@ my %table=(
  "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
@@ -22,7 +20,6 @@ Index: openssl-1.0.1e/Configure
 +"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-aarch64","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch
new file mode 100644
index 0000000..703b8c1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch
@@ -0,0 +1,111 @@
+From: Andy Polyakov <appro@openssl.org>
+Date: Sun, 13 Oct 2013 17:15:15 +0000 (+0200)
+Subject: Initial aarch64 bits.
+X-Git-Url: http://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff_plain;h=039081b80977e2a5de84e1f88f8b4d025b559956
+
+Initial aarch64 bits.
+---
+ crypto/bn/bn_lcl.h       |    9 +++++++++
+ crypto/md32_common.h     |   18 ++++++++++++++++++
+ crypto/modes/modes_lcl.h |    8 ++++++++
+ crypto/sha/sha512.c      |   13 +++++++++++++
+ 4 files changed, 48 insertions(+)
+
+--- a/crypto/bn/bn_lcl.h
++++ b/crypto/bn/bn_lcl.h
+@@ -300,6 +300,15 @@ extern "C" {
+ 	     : "r"(a), "r"(b));
+ #    endif
+ #  endif
++# elif defined(__aarch64__) && defined(SIXTY_FOUR_BIT_LONG)
++#  if defined(__GNUC__) && __GNUC__>=2
++#   define BN_UMULT_HIGH(a,b)	({	\
++	register BN_ULONG ret;		\
++	asm ("umulh	%0,%1,%2"	\
++	     : "=r"(ret)		\
++	     : "r"(a), "r"(b));		\
++	ret;			})
++#  endif
+ # endif		/* cpu */
+ #endif		/* OPENSSL_NO_ASM */
+ 
+--- a/crypto/md32_common.h
++++ b/crypto/md32_common.h
+@@ -213,6 +213,24 @@
+ 				   asm ("bswapl %0":"=r"(r):"0"(r));	\
+ 				   *((unsigned int *)(c))=r; (c)+=4; r;	})
+ #   endif
++#  elif defined(__aarch64__)
++#   if defined(__BYTE_ORDER__)
++#    if defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
++#     define HOST_c2l(c,l)	({ unsigned int r;		\
++				   asm ("rev	%w0,%w1"	\
++					:"=r"(r)		\
++					:"r"(*((const unsigned int *)(c))));\
++				   (c)+=4; (l)=r;		})
++#     define HOST_l2c(l,c)	({ unsigned int r;		\
++				   asm ("rev	%w0,%w1"	\
++					:"=r"(r)		\
++					:"r"((unsigned int)(l)));\
++				   *((unsigned int *)(c))=r; (c)+=4; r;	})
++#    elif defined(__ORDER_BIG_ENDIAN__) && __BYTE_ORDER__==__ORDER_BIG_ENDIAN__
++#     define HOST_c2l(c,l)	((l)=*((const unsigned int *)(c)), (c)+=4, (l))
++#     define HOST_l2c(l,c)	(*((unsigned int *)(c))=(l), (c)+=4, (l))
++#    endif
++#   endif
+ #  endif
+ # endif
+ #endif
+--- a/crypto/modes/modes_lcl.h
++++ b/crypto/modes/modes_lcl.h
+@@ -29,6 +29,7 @@ typedef unsigned char u8;
+ #if defined(__i386)	|| defined(__i386__)	|| \
+     defined(__x86_64)	|| defined(__x86_64__)	|| \
+     defined(_M_IX86)	|| defined(_M_AMD64)	|| defined(_M_X64) || \
++    defined(__aarch64__)			|| \    
+     defined(__s390__)	|| defined(__s390x__)	|| \
+     ( (defined(__arm__)	|| defined(__arm)) && \
+       (defined(__ARM_ARCH_7__)	|| defined(__ARM_ARCH_7A__) || \
+@@ -53,6 +54,13 @@ typedef unsigned char u8;
+ #  define BSWAP4(x) ({	u32 ret=(x);			\
+ 			asm ("bswapl %0"		\
+ 			: "+r"(ret));	ret;		})
++# elif defined(__aarch64__)
++#  define BSWAP8(x) ({	u64 ret;			\
++			asm ("rev %0,%1"		\
++			: "=r"(ret) : "r"(x)); ret;	})
++#  define BSWAP4(x) ({	u32 ret;			\
++			asm ("rev %w0,%w1"		\
++			: "=r"(ret) : "r"(x)); ret;	})
+ # elif (defined(__arm__) || defined(__arm)) && !defined(STRICT_ALIGNMENT)
+ #  define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
+ 			asm ("rev %0,%0; rev %1,%1"	\
+--- a/crypto/sha/sha512.c
++++ b/crypto/sha/sha512.c
+@@ -55,6 +55,7 @@ const char SHA512_version[]="SHA-512" OP
+ #if defined(__i386) || defined(__i386__) || defined(_M_IX86) || \
+     defined(__x86_64) || defined(_M_AMD64) || defined(_M_X64) || \
+     defined(__s390__) || defined(__s390x__) || \
++    defined(__aarch64__) || \
+     defined(SHA512_ASM)
+ #define SHA512_BLOCK_CAN_MANAGE_UNALIGNED_DATA
+ #endif
+@@ -340,6 +341,18 @@ static const SHA_LONG64 K512[80] = {
+ 				asm ("rotrdi %0,%1,%2"	\
+ 				: "=r"(ret)		\
+ 				: "r"(a),"K"(n)); ret;	})
++#  elif defined(__aarch64__)
++#   define ROTR(a,n)	({ SHA_LONG64 ret;		\
++				asm ("ror %0,%1,%2"	\
++				: "=r"(ret)		\
++				: "r"(a),"I"(n)); ret;	})
++#   if  defined(__BYTE_ORDER__) && defined(__ORDER_LITTLE_ENDIAN__) && \
++	__BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
++#    define PULL64(x)	({ SHA_LONG64 ret;			\
++				asm ("rev	%0,%1"		\
++				: "=r"(ret)			\
++				: "r"(*((const SHA_LONG64 *)(&(x))))); ret;		})
++#   endif
+ #  endif
+ # elif defined(_MSC_VER)
+ #  if defined(_WIN64)	/* applies to both IA-64 and AMD64 */
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 78ff7ae..73a890c 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -66,6 +66,9 @@ do_configure () {
 	linux-armeb)
 		target=linux-elf-armeb
 		;;
+	linux-aarch64)
+		target=linux-generic64
+		;;
 	linux-sh3)
 		target=debian-sh3
 		;;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index ac27dba..a574e81 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://configure-targets.patch \
             file://fix-cipher-des-ede3-cfb1.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
+            file://initial-aarch64-bits.patch \
             file://find.pl \
            "
 
-- 
1.8.1.2


