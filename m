Return-Path: <juro.bystricky@intel.com>
X-Greylist: delayed 563 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Jan 2018 22:48:53 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 273D47851A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:48:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 14:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,432,1511856000"; d="scan'208";a="170120212"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 29 Jan 2018 14:39:32 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:39:47 -0800
Message-Id: <1517265587-84623-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
References: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 3/3] libcrypt: remove unused patch file
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
X-List-Received-Date: Mon, 29 Jan 2018 22:48:53 -0000

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 ...g-AArch32-CE-implementations-when-target-.patch | 96 ----------------------
 1 file changed, 96 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch

diff --git a/meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch b/meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch
deleted file mode 100644
index 65b9fd4..0000000
--- a/meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 4a7aa30ae9f3ce798dd886c2f2d4164c43027748 Mon Sep 17 00:00:00 2001
-From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
-Date: Sat, 29 Jul 2017 14:34:23 +0300
-Subject: [PATCH] Fix building AArch32 CE implementations when target is ARMv6
- arch
-
-* cipher/cipher-gcm-armv8-aarch32-ce.S: Select ARMv8 architecure.
-* cipher/rijndael-armv8-aarch32-ce.S: Ditto.
-* cipher/sha1-armv8-aarch32-ce.S: Ditto.
-* cipher/sha256-armv8-aarch32-ce.S: Ditto.
-* configure.ac (gcry_cv_gcc_inline_asm_aarch32_crypto): Ditto.
---
-
-Raspbian distribution defaults to ARMv6 architecture thus 'rbit'
-instruction is not available with default compiler flags. Patch
-adds explicit architecture selection for ARMv8 to enable 'rbit'
-usage with ARMv8/AArch32-CE assembly implementations of SHA,
-GHASH and AES.
-
-Reported-by: Chris Horry <zerbey@gmail.com>
-Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
-
-Signed-off-by: Paul Barker <pbarker@toganlabs.com>
-Upstream-Status: Backport
-
----
- cipher/cipher-gcm-armv8-aarch32-ce.S | 1 +
- cipher/rijndael-armv8-aarch32-ce.S   | 1 +
- cipher/sha1-armv8-aarch32-ce.S       | 1 +
- cipher/sha256-armv8-aarch32-ce.S     | 1 +
- configure.ac                         | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/cipher/cipher-gcm-armv8-aarch32-ce.S b/cipher/cipher-gcm-armv8-aarch32-ce.S
-index b61a7871..1de66a16 100644
---- a/cipher/cipher-gcm-armv8-aarch32-ce.S
-+++ b/cipher/cipher-gcm-armv8-aarch32-ce.S
-@@ -24,6 +24,7 @@
-     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO)
- 
- .syntax unified
-+.arch armv8-a
- .fpu crypto-neon-fp-armv8
- .arm
- 
-diff --git a/cipher/rijndael-armv8-aarch32-ce.S b/cipher/rijndael-armv8-aarch32-ce.S
-index f375f673..5c8fa3c0 100644
---- a/cipher/rijndael-armv8-aarch32-ce.S
-+++ b/cipher/rijndael-armv8-aarch32-ce.S
-@@ -24,6 +24,7 @@
-     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO)
- 
- .syntax unified
-+.arch armv8-a
- .fpu crypto-neon-fp-armv8
- .arm
- 
-diff --git a/cipher/sha1-armv8-aarch32-ce.S b/cipher/sha1-armv8-aarch32-ce.S
-index b0bc5ffe..bf2b233b 100644
---- a/cipher/sha1-armv8-aarch32-ce.S
-+++ b/cipher/sha1-armv8-aarch32-ce.S
-@@ -24,6 +24,7 @@
-     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO) && defined(USE_SHA1)
- 
- .syntax unified
-+.arch armv8-a
- .fpu crypto-neon-fp-armv8
- .arm
- 
-diff --git a/cipher/sha256-armv8-aarch32-ce.S b/cipher/sha256-armv8-aarch32-ce.S
-index 2041a237..2b17ab1b 100644
---- a/cipher/sha256-armv8-aarch32-ce.S
-+++ b/cipher/sha256-armv8-aarch32-ce.S
-@@ -24,6 +24,7 @@
-     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO) && defined(USE_SHA256)
- 
- .syntax unified
-+.arch armv8-a
- .fpu crypto-neon-fp-armv8
- .arm
- 
-diff --git a/configure.ac b/configure.ac
-index 27faa7f4..66e7cd67 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1619,6 +1619,7 @@ AC_CACHE_CHECK([whether GCC inline assembler supports AArch32 Crypto Extension i
-           AC_COMPILE_IFELSE([AC_LANG_SOURCE(
-           [[__asm__(
-                 ".syntax unified\n\t"
-+                ".arch armv8-a\n\t"
-                 ".arm\n\t"
-                 ".fpu crypto-neon-fp-armv8\n\t"
- 
--- 
-2.11.0
-
-- 
2.7.4


