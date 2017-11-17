Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 87CE378835
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 17:51:55 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 51BA55C3900;
	Fri, 17 Nov 2017 18:46:33 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 18:51:42 +0100
Message-Id: <20171117175142.2642-4-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171117175142.2642-1-stefan@agner.ch>
References: <20171117175142.2642-1-stefan@agner.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510940793; bh=2aD1cwPGzG1uAR7axlqcJEQyaQKLlkjcV5tW847QPcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=KUzIwmdr0Kqd7EmcGaBpsfm8sKEeHcwPTZt+4Ag2ADvZbLu8vX3qr8gk/NjiRAdOYVgtKS1bp6Oi2atRRHIx1Cz6gtA+AB7HNoqYWktM+H6Ql7DcWroxZp3vcOnQd4r3rUjSPU56haUBSQhqEu6YijuvxxoCLVfj972LKCj/UI8=
Cc: Stefan Agner <stefan.agner@toradex.com>, otavio@ossystems.com.br
Subject: [rocko][PATCH 4/4] openssl: fix runtime errors with Thumb2 when using binutils 2.29
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
X-List-Received-Date: Fri, 17 Nov 2017 17:51:56 -0000

From: Stefan Agner <stefan.agner@toradex.com>

When compiling OpenSSL with binutils 2.29 for ARM with Thumb2 enabled
crashes and unexpected behavior occurs. E.g. connecting to a OpenSSH
server using the affected binary fails with:
  ssh_dispatch_run_fatal: Connection to 192.168.10.171 port 22: incorrect signature

Backport upstream bugfix:
https://github.com/openssl/openssl/issues/4659

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 ...-armv4-bsaes-armv7-.pl-make-it-work-with-.patch | 85 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.0g.bb |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch b/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
new file mode 100644
index 0000000000..684f659715
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
@@ -0,0 +1,85 @@
+From bcc096a50811bf0f0c4fd34b2993fed7a7015972 Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Fri, 3 Nov 2017 23:30:01 +0100
+Subject: [PATCH] aes/asm/{aes-armv4|bsaes-armv7}.pl: make it work with
+ binutils-2.29.
+
+It's not clear if it's a feature or bug, but binutils-2.29[.1]
+interprets 'adr' instruction with Thumb2 code reference differently,
+in a way that affects calculation of addresses of constants' tables.
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
+(Merged from https://github.com/openssl/openssl/pull/4669)
+
+(cherry picked from commit b82acc3c1a7f304c9df31841753a0fa76b5b3cda)
+---
+ crypto/aes/asm/aes-armv4.pl   | 6 +++---
+ crypto/aes/asm/bsaes-armv7.pl | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/crypto/aes/asm/aes-armv4.pl b/crypto/aes/asm/aes-armv4.pl
+index 16d79aae53..c6474b8aad 100644
+--- a/crypto/aes/asm/aes-armv4.pl
++++ b/crypto/aes/asm/aes-armv4.pl
+@@ -200,7 +200,7 @@ AES_encrypt:
+ #ifndef	__thumb2__
+ 	sub	r3,pc,#8		@ AES_encrypt
+ #else
+-	adr	r3,AES_encrypt
++	adr	r3,.
+ #endif
+ 	stmdb   sp!,{r1,r4-r12,lr}
+ #ifdef	__APPLE__
+@@ -450,7 +450,7 @@ _armv4_AES_set_encrypt_key:
+ #ifndef	__thumb2__
+ 	sub	r3,pc,#8		@ AES_set_encrypt_key
+ #else
+-	adr	r3,AES_set_encrypt_key
++	adr	r3,.
+ #endif
+ 	teq	r0,#0
+ #ifdef	__thumb2__
+@@ -976,7 +976,7 @@ AES_decrypt:
+ #ifndef	__thumb2__
+ 	sub	r3,pc,#8		@ AES_decrypt
+ #else
+-	adr	r3,AES_decrypt
++	adr	r3,.
+ #endif
+ 	stmdb   sp!,{r1,r4-r12,lr}
+ #ifdef	__APPLE__
+diff --git a/crypto/aes/asm/bsaes-armv7.pl b/crypto/aes/asm/bsaes-armv7.pl
+index 9f288660ef..a27bb4a179 100644
+--- a/crypto/aes/asm/bsaes-armv7.pl
++++ b/crypto/aes/asm/bsaes-armv7.pl
+@@ -744,7 +744,7 @@ $code.=<<___;
+ .type	_bsaes_decrypt8,%function
+ .align	4
+ _bsaes_decrypt8:
+-	adr	$const,_bsaes_decrypt8
++	adr	$const,.
+ 	vldmia	$key!, {@XMM[9]}		@ round 0 key
+ #ifdef	__APPLE__
+ 	adr	$const,.LM0ISR
+@@ -843,7 +843,7 @@ _bsaes_const:
+ .type	_bsaes_encrypt8,%function
+ .align	4
+ _bsaes_encrypt8:
+-	adr	$const,_bsaes_encrypt8
++	adr	$const,.
+ 	vldmia	$key!, {@XMM[9]}		@ round 0 key
+ #ifdef	__APPLE__
+ 	adr	$const,.LM0SR
+@@ -951,7 +951,7 @@ $code.=<<___;
+ .type	_bsaes_key_convert,%function
+ .align	4
+ _bsaes_key_convert:
+-	adr	$const,_bsaes_key_convert
++	adr	$const,.
+ 	vld1.8	{@XMM[7]},  [$inp]!		@ load round 0 key
+ #ifdef	__APPLE__
+ 	adr	$const,.LM0
+-- 
+2.15.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
index 5f3e9a9dfa..1649bffaa1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
            file://0001-Remove-test-that-requires-running-as-non-root.patch \
+           file://0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch \
           "
 
 S = "${WORKDIR}/openssl-${PV}"
-- 
2.13.6


