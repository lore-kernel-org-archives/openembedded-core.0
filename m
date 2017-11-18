Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7E26578874
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 08:54:02 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B95F85C38B6;
	Sat, 18 Nov 2017 09:48:38 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Nov 2017 09:53:55 +0100
Message-Id: <20171118085357.47305-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171118085357.47305-1-stefan@agner.ch>
References: <20171118085357.47305-1-stefan@agner.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510994918; bh=xg5Z4Rpbk6ZzcGjx9gWqx0TL+ccrYzWzmVr8bal33Ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=Zg0pgBVrebmmID4h7NB+yyg38d+bxWlNqmO8mGktVigt445siz1Wx4DyhoVHByz219xFkE0a9LXJN/xPljPF9tj7pwK0ogqp49Royg+htH1MO4JJeFDsThNJdlxzygPDMc52wMJThLZaxmk27RQfGQ/JVRcCvTyWcHzFsUhqXIQ=
Cc: Stefan Agner <stefan.agner@toradex.com>, otavio@ossystems.com.br
Subject: [PATCH v2 2/4] openssl10: fix runtime errors with Thumb2 when using binutils 2.29
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
X-List-Received-Date: Sat, 18 Nov 2017 08:54:03 -0000

From: Stefan Agner <stefan.agner@toradex.com>

When compiling OpenSSL with binutils 2.29 for ARM with Thumb2 enabled
crashes and unexpected behavior occurs. E.g. connecting to a OpenSSH
server using the affected binary fails with:
  ssh_dispatch_run_fatal: Connection to 192.168.10.171 port 22: incorrect signature

Backport upstream bugfix:
https://github.com/openssl/openssl/issues/4659

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...saes-armv7-sha256-armv4-.pl-make-it-work-.patch | 100 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2m.bb |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch
new file mode 100644
index 0000000000..2ce0320c49
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch
@@ -0,0 +1,100 @@
+From d1d6c69b6fd25e71dbae67fad17b2c7737f6b2dc Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Sun, 5 Nov 2017 17:08:16 +0100
+Subject: [PATCH] {aes-armv4|bsaes-armv7|sha256-armv4}.pl: make it work with
+ binutils-2.29
+
+It's not clear if it's a feature or bug, but binutils-2.29[.1]
+interprets 'adr' instruction with Thumb2 code reference differently,
+in a way that affects calculation of addresses of constants' tables.
+
+Upstream-Status: Backport
+
+Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
+Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+(Merged from https://github.com/openssl/openssl/pull/4673)
+---
+ crypto/aes/asm/aes-armv4.pl    | 6 +++---
+ crypto/aes/asm/bsaes-armv7.pl  | 6 +++---
+ crypto/sha/asm/sha256-armv4.pl | 2 +-
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/crypto/aes/asm/aes-armv4.pl b/crypto/aes/asm/aes-armv4.pl
+index 4f8917089f..c1b5e352d7 100644
+--- a/crypto/aes/asm/aes-armv4.pl
++++ b/crypto/aes/asm/aes-armv4.pl
+@@ -184,7 +184,7 @@ AES_encrypt:
+ #if __ARM_ARCH__<7
+ 	sub	r3,pc,#8		@ AES_encrypt
+ #else
+-	adr	r3,AES_encrypt
++	adr	r3,.
+ #endif
+ 	stmdb   sp!,{r1,r4-r12,lr}
+ 	mov	$rounds,r0		@ inp
+@@ -430,7 +430,7 @@ _armv4_AES_set_encrypt_key:
+ #if __ARM_ARCH__<7
+ 	sub	r3,pc,#8		@ AES_set_encrypt_key
+ #else
+-	adr	r3,private_AES_set_encrypt_key
++	adr	r3,.
+ #endif
+ 	teq	r0,#0
+ #if __ARM_ARCH__>=7
+@@ -952,7 +952,7 @@ AES_decrypt:
+ #if __ARM_ARCH__<7
+ 	sub	r3,pc,#8		@ AES_decrypt
+ #else
+-	adr	r3,AES_decrypt
++	adr	r3,.
+ #endif
+ 	stmdb   sp!,{r1,r4-r12,lr}
+ 	mov	$rounds,r0		@ inp
+diff --git a/crypto/aes/asm/bsaes-armv7.pl b/crypto/aes/asm/bsaes-armv7.pl
+index 70b3f9656f..ec66b0502a 100644
+--- a/crypto/aes/asm/bsaes-armv7.pl
++++ b/crypto/aes/asm/bsaes-armv7.pl
+@@ -724,7 +724,7 @@ $code.=<<___;
+ .type	_bsaes_decrypt8,%function
+ .align	4
+ _bsaes_decrypt8:
+-	adr	$const,_bsaes_decrypt8
++	adr	$const,.
+ 	vldmia	$key!, {@XMM[9]}		@ round 0 key
+ 	add	$const,$const,#.LM0ISR-_bsaes_decrypt8
+ 
+@@ -819,7 +819,7 @@ _bsaes_const:
+ .type	_bsaes_encrypt8,%function
+ .align	4
+ _bsaes_encrypt8:
+-	adr	$const,_bsaes_encrypt8
++	adr	$const,.
+ 	vldmia	$key!, {@XMM[9]}		@ round 0 key
+ 	sub	$const,$const,#_bsaes_encrypt8-.LM0SR
+ 
+@@ -923,7 +923,7 @@ $code.=<<___;
+ .type	_bsaes_key_convert,%function
+ .align	4
+ _bsaes_key_convert:
+-	adr	$const,_bsaes_key_convert
++	adr	$const,.
+ 	vld1.8	{@XMM[7]},  [$inp]!		@ load round 0 key
+ 	sub	$const,$const,#_bsaes_key_convert-.LM0
+ 	vld1.8	{@XMM[15]}, [$inp]!		@ load round 1 key
+diff --git a/crypto/sha/asm/sha256-armv4.pl b/crypto/sha/asm/sha256-armv4.pl
+index 4fee74d832..750216eb42 100644
+--- a/crypto/sha/asm/sha256-armv4.pl
++++ b/crypto/sha/asm/sha256-armv4.pl
+@@ -205,7 +205,7 @@ sha256_block_data_order:
+ #if __ARM_ARCH__<7
+ 	sub	r3,pc,#8		@ sha256_block_data_order
+ #else
+-	adr	r3,sha256_block_data_order
++	adr	r3,.
+ #endif
+ #if __ARM_MAX_ARCH__>=7 && !defined(__KERNEL__)
+ 	ldr	r12,.LOPENSSL_armcap
+-- 
+2.15.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
index 04763ac346..9270f52bc6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
@@ -42,6 +42,7 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
+            file://0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch \
             "
 SRC_URI[md5sum] = "10e9e37f492094b9ef296f68f24a7666"
 SRC_URI[sha256sum] = "8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
-- 
2.13.6


