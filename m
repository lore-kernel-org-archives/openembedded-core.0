Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0E978F04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j192-v6so1425439wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qKFo6FHP7Ybr6pb3gZe6yi9Be13OJ5FvUzxVVXHx598=;
	b=s7dhVWvASWRp2c3ElmYpgcuuEt5hnKHqK4JfFo/ei39sH0DMRf5FPHkVdMHy3C+L95
	tEIUr8edgIN23FyduUCxo7f6t8RKiLhkZ92FJoUCY9oZn7R+tYlPumlxQONGM+PcoMb7
	sznaDZyThUIL9QvfGUcLD5MK66LzcT4ufhWLlGouEctXvcKQvca7i52unfiTuFg6QSO9
	mlj8XhlJWnCC/tFQJABHJhdMbzwDZKQrBC0omGG6ybQ+ndvs5fKoudvPDkL3h2iqlJ3x
	OTY6j5tu845OrErwZyMKOLmCy22WWxjY7l32JrWdSq8Pkcc24zvBvS/uWMNGKL2Jatkp
	cM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qKFo6FHP7Ybr6pb3gZe6yi9Be13OJ5FvUzxVVXHx598=;
	b=O8KKjW9FVM+BWNfJ91vGHqi0cngSAFbzIjp8r/jNKQT5dEN9/BRw80O1BS1vIw51Cl
	VQ3OODbMpcAih7G7/YUk152ZYSEpCQFp/f1dtr2q32dRV9OU+F14a/bOWxoRGOXZ0xed
	sbbo64pyaYCdkO++BarrNGPTXFc2E0xa07/gfvVh00xyGT9rSi1BkaEV6aRE5NqKNpCj
	3icLFxOYZIBrSGdAYV0L9ND1jPvsd5ubFJ1AVoF314t3IwHLYBU4orf6B6dfNM96loNV
	5VUErCFn0iZu5aNIzDC6WJWhmuv9u3I0b5sS16TUwduYwDi9OwTgtL/IyJJj1w7AR22Q
	6UrQ==
X-Gm-Message-State: APzg51CQqHQG4LE3Oz4/zzc1ChccxtMWhoMRfOE0U9PMyVFiru1cXmcR
	8o9P52eA+xYSrVuK0QFXIOwSEPCv
X-Google-Smtp-Source: ANB0VdYl1/EulKfTn2jv1W0VqfNwRPrL3pYW0MnHJxYGca44IizHOeSOLV1fB0tdo4YWNwI3o3QotQ==
X-Received: by 2002:a1c:a593:: with SMTP id
	o141-v6mr975134wme.95.1535451804685; 
	Tue, 28 Aug 2018 03:23:24 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:13 +0200
Message-Id: <1f7ed298deed1f23ccd6e67b4701985660abe575.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
Subject: [RFC PATCH 2/6] cryptodev-tests: port to openssl 1.1
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:24 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

This leaves openssh as the only recipe that requires openssl 1.0 (or libressl).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
 .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
index 9afb3de..617db6c 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
@@ -2,10 +2,11 @@ require cryptodev.inc
 
 SUMMARY = "A test suite for /dev/crypto device driver"
 
-DEPENDS += "openssl10"
+DEPENDS += "openssl"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
+file://0001-Port-tests-to-openssl-1.1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
new file mode 100644
index 0000000..c969126
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
@@ -0,0 +1,103 @@
+From 2fe4bdeb8cdd0b0f46d9caed807812855d51ea56 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 28 Mar 2018 20:11:05 +0300
+Subject: [PATCH] Port tests to openssl 1.1
+
+Upstream-Status: Accepted [https://github.com/cryptodev-linux/cryptodev-linux/pull/36]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ tests/openssl_wrapper.c | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/tests/openssl_wrapper.c b/tests/openssl_wrapper.c
+index 038c58f..dea2496 100644
+--- a/tests/openssl_wrapper.c
++++ b/tests/openssl_wrapper.c
+@@ -4,6 +4,7 @@
+ #include <openssl/aes.h>
+ #include <openssl/evp.h>
+ #include <openssl/hmac.h>
++#include <openssl/opensslv.h>
+ 
+ //#define DEBUG
+ 
+@@ -23,10 +24,17 @@ enum ctx_type {
+ 	ctx_type_md,
+ };
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++union openssl_ctx {
++	HMAC_CTX *hmac;
++	EVP_MD_CTX *md;
++};
++#else
+ union openssl_ctx {
+ 	HMAC_CTX hmac;
+ 	EVP_MD_CTX md;
+ };
++#endif
+ 
+ struct ctx_mapping {
+ 	__u32 ses;
+@@ -63,6 +71,16 @@ static void remove_mapping(__u32 ses)
+ 	switch (mapping->type) {
+ 	case ctx_type_none:
+ 		break;
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++	case ctx_type_hmac:
++		dbgp("%s: calling HMAC_CTX_free\n", __func__);
++		HMAC_CTX_free(mapping->ctx.hmac);
++		break;
++	case ctx_type_md:
++		dbgp("%s: calling EVP_MD_CTX_free\n", __func__);
++		EVP_MD_CTX_free(mapping->ctx.md);
++		break;
++#else
+ 	case ctx_type_hmac:
+ 		dbgp("%s: calling HMAC_CTX_cleanup\n", __func__);
+ 		HMAC_CTX_cleanup(&mapping->ctx.hmac);
+@@ -71,6 +89,7 @@ static void remove_mapping(__u32 ses)
+ 		dbgp("%s: calling EVP_MD_CTX_cleanup\n", __func__);
+ 		EVP_MD_CTX_cleanup(&mapping->ctx.md);
+ 		break;
++#endif
+ 	}
+ 	memset(mapping, 0, sizeof(*mapping));
+ }
+@@ -127,10 +146,17 @@ static int openssl_hmac(struct session_op *sess, struct crypt_op *cop)
+ 
+ 		mapping->ses = sess->ses;
+ 		mapping->type = ctx_type_hmac;
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++		ctx = mapping->ctx.hmac;
++
++		dbgp("calling HMAC_CTX_new");
++		ctx = HMAC_CTX_new();
++#else
+ 		ctx = &mapping->ctx.hmac;
+ 
+ 		dbgp("calling HMAC_CTX_init");
+ 		HMAC_CTX_init(ctx);
++#endif
+ 		dbgp("calling HMAC_Init_ex");
+ 		if (!HMAC_Init_ex(ctx, sess->mackey, sess->mackeylen,
+ 				sess_to_evp_md(sess), NULL)) {
+@@ -172,10 +198,17 @@ static int openssl_md(struct session_op *sess, struct crypt_op *cop)
+ 
+ 		mapping->ses = sess->ses;
+ 		mapping->type = ctx_type_md;
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++		ctx = mapping->ctx.md;
++
++		dbgp("calling EVP_MD_CTX_new");
++		ctx = EVP_MD_CTX_new();
++#else
+ 		ctx = &mapping->ctx.md;
+ 
+ 		dbgp("calling EVP_MD_CTX_init");
+ 		EVP_MD_CTX_init(ctx);
++#endif
+ 		dbgp("calling EVP_DigestInit");
+ 		EVP_DigestInit(ctx, sess_to_evp_md(sess));
+ 	}
-- 
2.7.4


