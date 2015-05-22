Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C54B17322D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 19:56:57 +0000 (UTC)
Received: by iesa3 with SMTP id a3so38865830ies.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hTdO7g57l5wTjvBkwV9ZyaEZXfhdyiqdGg5IrLnIPTo=;
	b=Fu2Knz0+dyz9pTdtzD2zhB6BxhaVC7wAMU2FYfRM2FCPQ3HvHNN/SVLDBXTbUNlPWY
	biSBi540g4T5VC/t88Y7P5pWMNpSqzPA4GDfM56dFPxftvTvCWPsUNQJ1JTmSneJrYHK
	TRge97Z2B4iDXW+ATUNmgBxLHfhmIbxBX3dnTLTg8HlVhaeZaQIg/0DogxbSFyL3gPW0
	x69kpVA9ajdSPwBuNze0XY0iR5ctd8NvCoAA66QU6yaihRIOk3OSzrm2gYJCAU/PJJiV
	emDUQg/xvOHSZ1uK84PTT+Ay0aKGjf7QONtat/wV2am0V2MpsnQ0yuRefyCi1OgIgr1B
	6EPA==
X-Received: by 10.43.104.69 with SMTP id dl5mr11361710icc.94.1432324618713;
	Fri, 22 May 2015 12:56:58 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by mx.google.com with ESMTPSA id
	y124sm2508709iod.13.2015.05.22.12.56.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 12:56:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:56:51 -0700
Message-Id: <29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1432324432.git.raj.khem@gmail.com>
References: <cover.1432324432.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] openssl: Fix build with gcc5 on mips64
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
X-List-Received-Date: Fri, 22 May 2015 19:56:59 -0000

Patch is submitted upstream as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-GCC_VERSION-macro-to-cover-upto-gcc-5.patch | 53 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
new file mode 100644
index 0000000..46d1adf
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
@@ -0,0 +1,53 @@
+From 0aa68f7681a74f6ff80a80c5843bc35e5effffb9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 May 2015 12:43:39 -0700
+Subject: [PATCH] Define GCC_VERSION macro to cover upto gcc-5
+
+Current check is limited to gcc 4 with minor versions
+but when we use gcc 5.1, then minor version check fails
+with current setup and we end up with build errors like
+
+| In file included from bn_div.c:62:0:
+| bn_div.c: In function 'BN_div':
+| bn_lcl.h:311:9: error: impossible constraint in 'asm'
+|          asm ("dmultu    %2,%3"          \
+|          ^
+| bn_div.c:402:13: note: in expansion of macro 'BN_UMULT_LOHI'
+|              BN_UMULT_LOHI(t2l, t2h, d1, q);
+|              ^
+| <builtin>: recipe for target 'bn_div.o' failed
+| make[2]: *** [bn_div.o] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+Upstream-Status: [Submitted]
+ crypto/bn/bn_lcl.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/bn/bn_lcl.h b/crypto/bn/bn_lcl.h
+index 196df7e..e801ba7 100644
+--- a/crypto/bn/bn_lcl.h
++++ b/crypto/bn/bn_lcl.h
+@@ -118,6 +118,9 @@
+ extern "C" {
+ #endif
+ 
++#define GCC_VERSION (__GNUC__ * 10000 \
++                     + __GNUC_MINOR__ * 100 \
++                     + __GNUC_PATCHLEVEL__)
+ /*-
+  * Bignum consistency macros
+  * There is one "API" macro, bn_fix_top(), for stripping leading zeroes from
+@@ -443,7 +446,7 @@ unsigned __int64 _umul128(unsigned __int64 a, unsigned __int64 b,
+ #   endif
+ #  elif defined(__mips) && (defined(SIXTY_FOUR_BIT) || defined(SIXTY_FOUR_BIT_LONG))
+ #   if defined(__GNUC__) && __GNUC__>=2
+-#    if __GNUC__>=4 && __GNUC_MINOR__>=4
++#    if GCC_VERSION > 40400
+                                      /* "h" constraint is no more since 4.4 */
+ #     define BN_UMULT_HIGH(a,b)          (((__uint128_t)(a)*(b))>>64)
+ #     define BN_UMULT_LOHI(low,high,a,b) ({     \
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
index 9a218be..c05be1f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://ptest-deps.patch \
             file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
+            file://0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch \
            "
 
 SRC_URI[md5sum] = "a06c547dac9044161a477211049f60ef"
-- 
2.1.4


