Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 377A37D3BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 07:05:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Wy1S3TPkz65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 09:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568617516;
	bh=dbGzfZS9iEF70JGXvUxftv1ADWfmNYmwxeumRJ4h9Js=;
	h=From:To:Subject:Date:From;
	b=J6GX/CakUkK3GaLJNGtnvcbcoujGpcdywe7OppZr4DshSnrRXIhb8b+zCNxt2bO6z
	SEELQcziGdRYnin70P/fKnFKfpiWt2WBLqNFDSZlNlJROcnXWb3sYN/x2yUEkZpUWA
	pJgCQz/9snDq71Jlo1wmFEMU9fu9O4LCIrqeVs6O5sUaBxImnIZ5MlnGDZ/OtV0nSb
	F/7nFbntQba+H3qx3sIXJPWHwrjA+j0B31ircOscILMCt7yjTpN4z6UvN+wbnxcztT
	qO8XxzT89YA0zJlxm8Y9sjYR4ERb+/yHnJhRaFbW3HwvgkMPzVzx+Xl2UH8TZsIuZ8
	tK67tRRn+FytyO9g0euaZJprs4Rpq3tFADUxoZ4M9ZDSgAdAAW5euPwF+sPhX+HGJG
	w9ASNmDmiGPONzO75QjYQ/9GusVdNIvwDypHfIN674NzAsSwx6u9EKCeN80lHjVZ5H
	rO8kBnd+4Dqj1+JBHumyz+MFSIE7eIuZKGGOF9HhwOHKbWiq2kZexi2JaLeuCgfV8Y
	HRlQMEPQgjTyn/8ZaJI+OaMd//xVd6cdjtySiAc+oYya4bYbE9c/7vIPQifUhf84jp
	CQ+oFxzgbrvaYaoywNIW54LJDql7pk3SZCHAj7KH6Eco03+xAtaKZe4Vbxp/BT7V9c
	+Q8/9RlqsMnWUo6L/2xLvDrw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 10:05:15 +0300
Message-Id: <20190916070515.31531-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssl: Upgrade 1.1.1c -> 1.1.1d
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
X-List-Received-Date: Mon, 16 Sep 2019 07:05:16 -0000

Backported patches removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-Fix-broken-change-from-b3d113e.patch | 35 ---------------
 ...x-build-error-for-aarch64-big-endian.patch | 43 -------------------
 .../{openssl_1.1.1c.bb => openssl_1.1.1d.bb}  |  6 +--
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1c.bb => openssl_1.1.1d.bb} (96%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch
deleted file mode 100644
index 6b4789fc70..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 711a161f03ef9ed7cd149a22bf1203700c103e96 Mon Sep 17 00:00:00 2001
-From: Pauli <paul.dale@oracle.com>
-Date: Fri, 29 Mar 2019 09:24:07 +1000
-Subject: [PATCH] Fix broken change from b3d113e.
-
-Reviewed-by: Tim Hudson <tjh@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8606)
-
-Running valgrind against code using Openssl v1.1.1c reports a large number of
-uninitialized memory errors. This fix from upstream solves this problem.
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/711a161f03ef9ed7cd149a22bf1203700c103e96]
-Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
----
- crypto/rand/rand_lib.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/crypto/rand/rand_lib.c b/crypto/rand/rand_lib.c
-index 23abbde156..a298b7515b 100644
---- a/crypto/rand/rand_lib.c
-+++ b/crypto/rand/rand_lib.c
-@@ -235,8 +235,9 @@ size_t rand_drbg_get_nonce(RAND_DRBG *drbg,
-     struct {
-         void * instance;
-         int count;
--    } data = { NULL, 0 };
-+    } data;
- 
-+    memset(&data, 0, sizeof(data));
-     pool = rand_pool_new(0, min_len, max_len);
-     if (pool == NULL)
-         return 0;
--- 
-2.20.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
deleted file mode 100644
index 9a90a68cfd..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Thu, 13 Jun 2019 12:17:30 +0900
-Subject: [PATCH] Fix build error for aarch64 big endian.
-
-Modified rev to rev64, because rev only takes integer registers.
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90827
-Otherwise, the following error will occur.
-
-Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
-
-Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9151]
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- crypto/sha/asm/keccak1600-armv8.pl | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/crypto/sha/asm/keccak1600-armv8.pl b/crypto/sha/asm/keccak1600-armv8.pl
-index dc72f18..6620690 100755
---- a/crypto/sha/asm/keccak1600-armv8.pl
-+++ b/crypto/sha/asm/keccak1600-armv8.pl
-@@ -731,7 +731,7 @@ $code.=<<___;
- 	blo	.Lprocess_block_ce
- 	ldr	d31,[$inp],#8		// *inp++
- #ifdef	__AARCH64EB__
--	rev	v31.16b,v31.16b
-+	rev64	v31.16b,v31.16b
- #endif
- 	eor	$A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
- 	beq	.Lprocess_block_ce
-@@ -740,7 +740,7 @@ ___
- $code.=<<___;
- 	ldr	d31,[$inp],#8		// *inp++
- #ifdef	__AARCH64EB__
--	rev	v31.16b,v31.16b
-+	rev64	v31.16b,v31.16b
- #endif
- 	eor	$A[4][4],$A[4][4],v31.16b
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 75159ac725..080d1a8bb7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -16,16 +16,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
-           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
-           file://0001-Fix-broken-change-from-b3d113e.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "15e21da6efe8aa0e0768ffd8cd37a5f6"
-SRC_URI[sha256sum] = "f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90"
+SRC_URI[md5sum] = "3be209000dbc7e1b95bcdf47980a3baa"
+SRC_URI[sha256sum] = "1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.17.1


