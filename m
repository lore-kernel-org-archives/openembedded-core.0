Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 23C4B7568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:52:01 +0000 (UTC)
Received: by igbjd9 with SMTP id jd9so15470726igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Vtx40e7G2ICVowRmUZj1V5cCtEOB/+rJnbzAOQ+uZHM=;
	b=D6MY8qBwLvUX3cmFwcekbB1kOl0Y8fxRWeZZ2OVTzH79oCHpf1ny1wbM7x7GIy4K7L
	9mb9T7WcTxZyUsqJ6Gdb5YqvjdxqbD5qETurO+ZKdG/U7x1qXk0A8oX+1a0ABugdFQYk
	ZuhaHs55RoPjEGEM3gR73zwiwb96Oss0+/3uA//66npFaoDKYDSn0NiJi9vMu6xKUDI5
	8OGLbHo3XN0Buv//RuPo3M4UMk2lSR1IhuGE3LAtjFBYpt00glIn2/MFmpFQZsMdQVge
	Q42+l5jnV0mtls0I63FWWtyZUaRV7CMOpRrkRayipUZue86xFe7v6TQh+90CBLbvfSYQ
	XTWg==
X-Received: by 10.107.129.78 with SMTP id c75mr1106897iod.4.1432788722841;
	Wed, 27 May 2015 21:52:02 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id j3sm1257488igx.21.2015.05.27.21.52.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 21:52:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 21:51:55 -0700
Message-Id: <1432788715-22140-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: Backport upstreamed version of patch to fix build on mips64
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
X-List-Received-Date: Thu, 28 May 2015 04:52:02 -0000

Previous patch had a concern as well and this is a direct backport of
the patch fixing the problem.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-GCC_VERSION-macro-to-cover-upto-gcc-5.patch | 53 ----------------------
 ...lcl.h-fix-MIPS-specific-gcc-version-check.patch | 30 ++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  2 +-
 3 files changed, 31 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
deleted file mode 100644
index 46d1adf..0000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0aa68f7681a74f6ff80a80c5843bc35e5effffb9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 22 May 2015 12:43:39 -0700
-Subject: [PATCH] Define GCC_VERSION macro to cover upto gcc-5
-
-Current check is limited to gcc 4 with minor versions
-but when we use gcc 5.1, then minor version check fails
-with current setup and we end up with build errors like
-
-| In file included from bn_div.c:62:0:
-| bn_div.c: In function 'BN_div':
-| bn_lcl.h:311:9: error: impossible constraint in 'asm'
-|          asm ("dmultu    %2,%3"          \
-|          ^
-| bn_div.c:402:13: note: in expansion of macro 'BN_UMULT_LOHI'
-|              BN_UMULT_LOHI(t2l, t2h, d1, q);
-|              ^
-| <builtin>: recipe for target 'bn_div.o' failed
-| make[2]: *** [bn_div.o] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: [Submitted]
- crypto/bn/bn_lcl.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/crypto/bn/bn_lcl.h b/crypto/bn/bn_lcl.h
-index 196df7e..e801ba7 100644
---- a/crypto/bn/bn_lcl.h
-+++ b/crypto/bn/bn_lcl.h
-@@ -118,6 +118,9 @@
- extern "C" {
- #endif
- 
-+#define GCC_VERSION (__GNUC__ * 10000 \
-+                     + __GNUC_MINOR__ * 100 \
-+                     + __GNUC_PATCHLEVEL__)
- /*-
-  * Bignum consistency macros
-  * There is one "API" macro, bn_fix_top(), for stripping leading zeroes from
-@@ -443,7 +446,7 @@ unsigned __int64 _umul128(unsigned __int64 a, unsigned __int64 b,
- #   endif
- #  elif defined(__mips) && (defined(SIXTY_FOUR_BIT) || defined(SIXTY_FOUR_BIT_LONG))
- #   if defined(__GNUC__) && __GNUC__>=2
--#    if __GNUC__>=4 && __GNUC_MINOR__>=4
-+#    if GCC_VERSION > 40400
-                                      /* "h" constraint is no more since 4.4 */
- #     define BN_UMULT_HIGH(a,b)          (((__uint128_t)(a)*(b))>>64)
- #     define BN_UMULT_LOHI(low,high,a,b) ({     \
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch b/meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
new file mode 100644
index 0000000..7308f8f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
@@ -0,0 +1,30 @@
+From 60c268b21ac81cc6b1af5c5470282a613b96f6fd Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Mon, 25 May 2015 10:17:14 +0200
+Subject: [PATCH] bn/bn_lcl.h: fix MIPS-specific gcc version check.
+
+RT#3859
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+---
+Upstream-Status: Backport
+
+ crypto/bn/bn_lcl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/bn/bn_lcl.h b/crypto/bn/bn_lcl.h
+index 196df7e..b9d124a 100644
+--- a/crypto/bn/bn_lcl.h
++++ b/crypto/bn/bn_lcl.h
+@@ -443,7 +443,7 @@ unsigned __int64 _umul128(unsigned __int64 a, unsigned __int64 b,
+ #   endif
+ #  elif defined(__mips) && (defined(SIXTY_FOUR_BIT) || defined(SIXTY_FOUR_BIT_LONG))
+ #   if defined(__GNUC__) && __GNUC__>=2
+-#    if __GNUC__>=4 && __GNUC_MINOR__>=4
++#    if __GNUC__>4 || (__GNUC__>=4 && __GNUC_MINOR__>=4)
+                                      /* "h" constraint is no more since 4.4 */
+ #     define BN_UMULT_HIGH(a,b)          (((__uint128_t)(a)*(b))>>64)
+ #     define BN_UMULT_LOHI(low,high,a,b) ({     \
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
index 5e767c3..f4006f6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
@@ -36,7 +36,7 @@ SRC_URI += "file://configure-targets.patch \
             file://ptest-deps.patch \
             file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
-            file://0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch \
+            file://0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch \
            "
 
 SRC_URI[md5sum] = "a06c547dac9044161a477211049f60ef"
-- 
2.1.4


