Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 82D5E71B13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 12:22:02 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b189so21897802wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XXMZnYxB1dJ4Yq3MqOxGWs+sTjXyqO5tLsHIes3eAxo=;
	b=U92MWwwr7+kTJUbI7ikCdNrJ52cxZ2srwFxm4knFlrGwoIczLKj7GsS1452U1rKAv9
	RjjfnvvY4Lrj5WNF5EliRtwamLaAsPnxfOBYHUESzpcNqoKXht6x+aC3M9bG3eIyBexd
	tHjjpnA6xzW9c4EvVTSkzL3pdllanpBf64pcpMj9tvhX+O/vb3s3FaLAl3kA5eTeHqeo
	8PkBhODBiak9vvZdnt1o38QZrwPCjr5Xw30v//bkf8/6QO2/e75QzSfgkQG8I9OG9XBd
	K1Kr9XyOGY9+QGyujG1/r+twrgk4s7PyTro9S4YOjgZVy3o7MqU72FHO+HhFnF2p7wnW
	XFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XXMZnYxB1dJ4Yq3MqOxGWs+sTjXyqO5tLsHIes3eAxo=;
	b=hYXOpTv1dnuwoe3AcmF6nO5K1xQGVpCsm5m7N8vZ1ti5ZCJtCbLBJMvEqZnZoo8jUO
	Ed2YGCdI2Q2c1FS2eDtXd3EdJ5svOchMWBKVI65L4TKgbOoLsTj9ERXmwuTdtHHgbFj1
	DtdNZmVK5K8CmsTZx5bTCUc4FAzGc2A4VddMh67uZARAPhmgR3XI0uw5n19ZiyICRnfU
	KzrWAJM/cqEYUIhztaBrmx0wQaU7tZ/BnPG8PLXxDJD9Y8VmcN7sHTwrjPNKBk0kjYFU
	3szBsOVhn701v9Li/orD8VkY8roBESfHlO0W1mOo4Bwvl/DhfaYu4lozEz15RdtUpYUe
	tKEw==
X-Gm-Message-State: AMCzsaWu3jDZz70rzTnWXQxaAsHB543h7M1jllTqNVYmER1er+rHvu9W
	jLOKGn6M5au7C78xK/aE0HL9XFD8
X-Google-Smtp-Source: AOwi7QBwSLBqzNdUAGH9pr/Gc1OK2d7Q7zASHc+kk8v/GAmwgXSmMT/V8jWV8QLUzi8LzBwY5TGVfQ==
X-Received: by 10.28.151.74 with SMTP id z71mr9301975wmd.131.1507551722907;
	Mon, 09 Oct 2017 05:22:02 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	n14sm3206213wrg.38.2017.10.09.05.22.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Oct 2017 05:22:02 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Oct 2017 12:21:20 +0000
Message-Id: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libgcrypt: Fix building on armv6
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
X-List-Received-Date: Mon, 09 Oct 2017 12:22:02 -0000

This patch is backported from the upstream git repository to fix building
libgcrypt on armv6 platforms such as raspberrypi.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 ...g-AArch32-CE-implementations-when-target-.patch | 96 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb  |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch

diff --git a/meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch b/meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch
new file mode 100644
index 0000000..0887588
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch
@@ -0,0 +1,96 @@
+From 4a7aa30ae9f3ce798dd886c2f2d4164c43027748 Mon Sep 17 00:00:00 2001
+From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+Date: Sat, 29 Jul 2017 14:34:23 +0300
+Subject: [PATCH] Fix building AArch32 CE implementations when target is ARMv6
+ arch
+
+* cipher/cipher-gcm-armv8-aarch32-ce.S: Select ARMv8 architecure.
+* cipher/rijndael-armv8-aarch32-ce.S: Ditto.
+* cipher/sha1-armv8-aarch32-ce.S: Ditto.
+* cipher/sha256-armv8-aarch32-ce.S: Ditto.
+* configure.ac (gcry_cv_gcc_inline_asm_aarch32_crypto): Ditto.
+--
+
+Raspbian distribution defaults to ARMv6 architecture thus 'rbit'
+instruction is not available with default compiler flags. Patch
+adds explicit architecture selection for ARMv8 to enable 'rbit'
+usage with ARMv8/AArch32-CE assembly implementations of SHA,
+GHASH and AES.
+
+Reported-by: Chris Horry <zerbey@gmail.com>
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Backport
+
+---
+ cipher/cipher-gcm-armv8-aarch32-ce.S | 1 +
+ cipher/rijndael-armv8-aarch32-ce.S   | 1 +
+ cipher/sha1-armv8-aarch32-ce.S       | 1 +
+ cipher/sha256-armv8-aarch32-ce.S     | 1 +
+ configure.ac                         | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/cipher/cipher-gcm-armv8-aarch32-ce.S b/cipher/cipher-gcm-armv8-aarch32-ce.S
+index b61a7871..1de66a16 100644
+--- a/cipher/cipher-gcm-armv8-aarch32-ce.S
++++ b/cipher/cipher-gcm-armv8-aarch32-ce.S
+@@ -24,6 +24,7 @@
+     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO)
+ 
+ .syntax unified
++.arch armv8-a
+ .fpu crypto-neon-fp-armv8
+ .arm
+ 
+diff --git a/cipher/rijndael-armv8-aarch32-ce.S b/cipher/rijndael-armv8-aarch32-ce.S
+index f375f673..5c8fa3c0 100644
+--- a/cipher/rijndael-armv8-aarch32-ce.S
++++ b/cipher/rijndael-armv8-aarch32-ce.S
+@@ -24,6 +24,7 @@
+     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO)
+ 
+ .syntax unified
++.arch armv8-a
+ .fpu crypto-neon-fp-armv8
+ .arm
+ 
+diff --git a/cipher/sha1-armv8-aarch32-ce.S b/cipher/sha1-armv8-aarch32-ce.S
+index b0bc5ffe..bf2b233b 100644
+--- a/cipher/sha1-armv8-aarch32-ce.S
++++ b/cipher/sha1-armv8-aarch32-ce.S
+@@ -24,6 +24,7 @@
+     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO) && defined(USE_SHA1)
+ 
+ .syntax unified
++.arch armv8-a
+ .fpu crypto-neon-fp-armv8
+ .arm
+ 
+diff --git a/cipher/sha256-armv8-aarch32-ce.S b/cipher/sha256-armv8-aarch32-ce.S
+index 2041a237..2b17ab1b 100644
+--- a/cipher/sha256-armv8-aarch32-ce.S
++++ b/cipher/sha256-armv8-aarch32-ce.S
+@@ -24,6 +24,7 @@
+     defined(HAVE_GCC_INLINE_ASM_AARCH32_CRYPTO) && defined(USE_SHA256)
+ 
+ .syntax unified
++.arch armv8-a
+ .fpu crypto-neon-fp-armv8
+ .arm
+ 
+diff --git a/configure.ac b/configure.ac
+index 27faa7f4..66e7cd67 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1619,6 +1619,7 @@ AC_CACHE_CHECK([whether GCC inline assembler supports AArch32 Crypto Extension i
+           AC_COMPILE_IFELSE([AC_LANG_SOURCE(
+           [[__asm__(
+                 ".syntax unified\n\t"
++                ".arch armv8-a\n\t"
+                 ".arm\n\t"
+                 ".fpu crypto-neon-fp-armv8\n\t"
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
index fb004d9..02982f0 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0005-ecc-Add-input-validation-for-X25519.patch \
+           file://0006-Fix-building-AArch32-CE-implementations-when-target-.patch \
 "
 SRC_URI[md5sum] = "110ce4352f9ea6f560bdc6c5644ae93c"
 SRC_URI[sha256sum] = "f6e470b7f2d3a703e8747f05a8c19d9e10e26ebf2d5f3d71ff75a40f504e12ee"
-- 
2.7.4


