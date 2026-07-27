Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE80C54F52
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43809.1785192991811246845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MEEg4gzk;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so16560965e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192990; x=1785797790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SHTGtIJLCqN0gSY3gHKrNDBnlpRFCn4s8osEzxeE+Aw=;
        b=MEEg4gzkTN5pNjXvbucwIn+NQq0FDUjZyhJxZgeqGSr3AOSWgpff80BUT9rD1rP0Za
         mwnjRMbQzvzBQnDyG4xSglWmlK48MxkszTI9Z6hsRfBXxQqVlu6ULeYVQratG2fh5YJP
         INGGR3fHqd25zzuunxRg91fEjUNAsHfa3tpTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192990; x=1785797790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SHTGtIJLCqN0gSY3gHKrNDBnlpRFCn4s8osEzxeE+Aw=;
        b=ps4OGhThxA/J4QF7ZB0ICWjZu7If0hs/ssxBDwCHclW5BCD9b1MQcc5TIWdA+Yd0nF
         NdTLIHv8ZBJ7q8WxzmCHdSMWnOTblkkL7dztV0Ik7AlaSugXqQZwkj6fWUuKoZ0lLCW2
         UCOf2IyQkomDuwu5tzaUUbWJzIsYd/D8FP2hrqYqMNKsNioo21K14AZFZveI2cyFpOg/
         79li4ow4qwqOJqgZH2dUQLtfS+rXbpWpBT/fO+j2HYGQmwCgoPWuPoOmklR1Df3cevXP
         Nxuq0oVt3VL2nXgvaaG4fxUGDN0AQRZyp2b++0RTGAnA9W0SQhv/0+rI+p0CIqx7I4E3
         QwKQ==
X-Gm-Message-State: AOJu0YzgArHyH/+wOk7ipa9WuvthhfDI5WO3JrS8RSq5pvuexjExXaEq
	EyzPdSDwGXZnVir8fuHaGomGNqQypj614zE989huP1t9jkNbbSJssDB4kjAJd3NoN8mCNX905L8
	KcsNRqQk=
X-Gm-Gg: AR+sD10eAxY5QdgykcIipbCFdq6N/IcZ+6azbZBcNHqatQGnIg73ZvdwThlhjW4vvg9
	3XGsfYRX3qsjF8xPUWV0MjlgBErJNoUkY6Kev121JUalsRipUEyNnPj+pLP9yuN4A6wvW1FtcwX
	IrMpPSHO0H4Ym+9ZHGTh8hD1K2KoNc8Srj0yCuLcZCYwWMPOhbrqB7v8YVQOUat5rTVLsbNPdFl
	Wf1sxygvS5UV68+sJCnAPfcfP1M3lcvvZuqAerrB3JRVVnIwpK4XIZNVHhunZeB1k1GVU8SVk9G
	OCWfQQ6QQOoD2r7RbuHIaNkMY6Db1uZBU+3B9jgmDGms94L6bbkJTkMzjbCxRDUReuycZHnub2v
	O2+yNVTW43W22b76CKd8txhyN1pSFC4NDanZwtF9iNPLWoBp5cOmsAkBgWy1xsRh8UFMaJ5FXNp
	+6OsaqhHMcnoP1j9ap12aegRVdbih1vzJP2UkPOp0ye7Nkt+geatXZQmio1uwJzwudfjweaDCOI
	+irOA==
X-Received: by 2002:a7b:c305:0:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-496c4fd7a03mr6128145e9.36.1785192989944;
        Mon, 27 Jul 2026 15:56:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/36] libgcrypt: fix CVE-2026-41990
Date: Tue, 28 Jul 2026 00:55:34 +0200
Message-ID: <b00d325c8fb849c0c5da13bb45abd8dd6d0b7cfe.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242137

From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>

Backport patch to fix CVE-2026-41990.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-41990
  https://osv.dev/list?q=CVE-2026-41990

Upstream fix:
  https://github.com/gpg/libgcrypt/commit/905e00f046a71e5670517779afaf85a354952832

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 ++++++++++++++++++
 .../libgcrypt/libgcrypt_1.12.1.bb             |   1 +
 2 files changed, 317 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch b/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
new file mode 100644
index 00000000000..a4f18092274
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
@@ -0,0 +1,316 @@
+From 024391fc505ebf9c47e51953d7d85995ba179576 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 13 Apr 2026 11:51:46 +0900
+Subject: [PATCH] cipher:dilithium: Check the label length by caller.
+
+* cipher/dilithium.h (dilithium_keypair, dilithium_sign)
+(dilithium_verify): Return gpg_err_code_t.
+* cipher/dilithium.c (dilithium_keypair): Return gpg_err_code_t.
+(dilithium_sign, dilithium_verify): Ditto.  Check CTXLEN.
+* cipher/pubkey-dilithium.c (mldsa_generate): Follow the change.
+(mldsa_sign, mldsa_verify): Likewise.
+
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+GnuPG-bug-id: 8208
+Co-authored-by: Thai Duong <thai@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+CVE: CVE-2026-41990
+Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/905e00f046a71e5670517779afaf85a354952832]
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ cipher/dilithium.c        | 101 ++++++++++++++++++++++++++++----------
+ cipher/dilithium.h        |  20 ++++----
+ cipher/pubkey-dilithium.c |  34 +++++--------
+ 3 files changed, 99 insertions(+), 56 deletions(-)
+
+diff --git a/cipher/dilithium.c b/cipher/dilithium.c
+index 955feb2a..212c4afe 100644
+--- a/cipher/dilithium.c
++++ b/cipher/dilithium.c
+@@ -82,6 +82,7 @@
+ #include "gcrypt-int.h"
+ #include "const-time.h"
+ 
++/* With glue code, we only use the "_internal" API of Dilithium.  */
+ #define DILITHIUM_INTERNAL_API_ONLY 1
+ 
+ #include "dilithium.h"
+@@ -120,23 +121,33 @@ static int crypto_sign_verify_internal_5 (const uint8_t *sig, size_t siglen,
+                                           const uint8_t *pre, size_t prelen,
+                                           const uint8_t *pk);
+ 
+-int
++gpg_err_code_t
+ dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
+                    const uint8_t seed[SEEDBYTES])
+ {
++  int r;
++
+   switch (algo)
+     {
+     case GCRY_MLDSA44:
+-      return crypto_sign_keypair_internal_2 (pk, sk, seed);
++      r = crypto_sign_keypair_internal_2 (pk, sk, seed);
++      break;
+     case GCRY_MLDSA65:
+     default:
+-      return crypto_sign_keypair_internal_3 (pk, sk, seed);
++      r = crypto_sign_keypair_internal_3 (pk, sk, seed);
++      break;
+     case GCRY_MLDSA87:
+-      return crypto_sign_keypair_internal_5 (pk, sk, seed);
++      r = crypto_sign_keypair_internal_5 (pk, sk, seed);
++      break;
+     }
++
++  if (r < 0)
++    return GPG_ERR_INTERNAL;
++
++  return 0;
+ }
+ 
+-int
++gpg_err_code_t
+ dilithium_sign (int algo, uint8_t *sig, size_t siglen,
+                 const uint8_t *m, size_t mlen,
+                 const uint8_t *ctx, size_t ctxlen,
+@@ -145,9 +156,17 @@ dilithium_sign (int algo, uint8_t *sig, size_t siglen,
+   size_t i;
+   uint8_t pre[257];
+   size_t prelen;
++  int r;
+ 
+-  if (ctx == NULL && ctxlen == -1)
+-    prelen = 0;
++  if (ctx == NULL)
++    {
++      if (ctxlen == -1)
++        prelen = 0;
++      else
++        return GPG_ERR_INV_DATA;
++    }
++  else if (ctxlen > 255)
++    return GPG_ERR_INV_DATA;
+   else
+     {
+       /* Prepare pre = (0, ctxlen, ctx) */
+@@ -158,28 +177,44 @@ dilithium_sign (int algo, uint8_t *sig, size_t siglen,
+       prelen = 2 + ctxlen;
+     }
+ 
++  /*
++   * Note that the second argument of the upstream routine is the
++   * pointer to output length of signature.  It assumes the first
++   * argument (pointer to output signature) should have correct (or
++   * more) length, beforehand.
++   *
++   * Before calling the routine, we should check the length.
++   */
+   switch (algo)
+     {
+     case GCRY_MLDSA44:
+       if (siglen != CRYPTO_BYTES_2)
+-        return -1;
+-      return crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
+-                                               pre, prelen, rnd, sk);
++        return GPG_ERR_INV_DATA;
++      r = crypto_sign_signature_internal_2 (sig, &siglen, m, mlen,
++                                            pre, prelen, rnd, sk);
++      break;
+     case GCRY_MLDSA65:
+     default:
+       if (siglen != CRYPTO_BYTES_3)
+-        return -1;
+-      return crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
+-                                               pre, prelen, rnd, sk);
++        return GPG_ERR_INV_DATA;
++      r = crypto_sign_signature_internal_3 (sig, &siglen, m, mlen,
++                                            pre, prelen, rnd, sk);
++      break;
+     case GCRY_MLDSA87:
+       if (siglen != CRYPTO_BYTES_5)
+-        return -1;
+-      return crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
+-                                               pre, prelen, rnd, sk);
++        return GPG_ERR_INV_DATA;
++      r = crypto_sign_signature_internal_5 (sig, &siglen, m, mlen,
++                                            pre, prelen, rnd, sk);
++      break;
+     }
++
++  if (r < 0)
++    return GPG_ERR_INTERNAL;
++
++  return 0;
+ }
+ 
+-int
++gpg_err_code_t
+ dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
+                   const uint8_t *m, size_t mlen,
+                   const uint8_t *ctx, size_t ctxlen,
+@@ -188,9 +223,17 @@ dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
+   size_t i;
+   uint8_t pre[257];
+   size_t prelen;
++  int r;
+ 
+-  if (ctx == NULL && ctxlen == -1)
+-    prelen = 0;
++  if (ctx == NULL)
++    {
++      if (ctxlen == -1)
++        prelen = 0;
++      else
++        return GPG_ERR_INV_DATA;
++    }
++  else if (ctxlen > 255)
++    return GPG_ERR_INV_DATA;
+   else
+     {
+       /* Prepare pre = (0, ctxlen, ctx) */
+@@ -204,16 +247,24 @@ dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
+   switch (algo)
+     {
+     case GCRY_MLDSA44:
+-      return crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
+-                                            pre, prelen, pk);
++      r = crypto_sign_verify_internal_2 (sig, siglen, m, mlen,
++                                         pre, prelen, pk);
++      break;
+     case GCRY_MLDSA65:
+     default:
+-      return crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
+-                                            pre, prelen, pk);
++      r = crypto_sign_verify_internal_3 (sig, siglen, m, mlen,
++                                         pre, prelen, pk);
++      break;
+     case GCRY_MLDSA87:
+-      return crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
+-                                            pre, prelen, pk);
++      r = crypto_sign_verify_internal_5 (sig, siglen, m, mlen,
++                                         pre, prelen, pk);
++      break;
+     }
++
++  if (r < 0)
++    return GPG_ERR_BAD_SIGNATURE;
++
++  return 0;
+ }
+ 
+ typedef struct {
+diff --git a/cipher/dilithium.h b/cipher/dilithium.h
+index 88a48094..dc18f158 100644
+--- a/cipher/dilithium.h
++++ b/cipher/dilithium.h
+@@ -64,16 +64,16 @@
+ #define DILITHIUM_SIGN_STACK_BURN (161 * 1024)
+ #define DILITHIUM_VERIFY_STACK_BURN (122 * 1024)
+ 
+-int dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
+-                       const uint8_t seed[SEEDBYTES]);
+-int dilithium_sign (int algo, uint8_t *sig, size_t siglen,
+-                    const uint8_t *m, size_t mlen,
+-                    const uint8_t *ctx, size_t ctxlen,
+-                    const uint8_t *sk, const uint8_t rnd[RNDBYTES]);
+-int dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
+-                      const uint8_t *m, size_t mlen,
+-                      const uint8_t *ctx, size_t ctxlen,
+-                      const uint8_t *pk);
++gpg_err_code_t dilithium_keypair (int algo, uint8_t *pk, uint8_t *sk,
++                                  const uint8_t seed[SEEDBYTES]);
++gpg_err_code_t dilithium_sign (int algo, uint8_t *sig, size_t siglen,
++                               const uint8_t *m, size_t mlen,
++                               const uint8_t *ctx, size_t ctxlen,
++                               const uint8_t *sk, const uint8_t rnd[RNDBYTES]);
++gpg_err_code_t dilithium_verify (int algo, const uint8_t *sig, size_t siglen,
++                                 const uint8_t *m, size_t mlen,
++                                 const uint8_t *ctx, size_t ctxlen,
++                                 const uint8_t *pk);
+ #endif
+ 
+ #if defined(DILITHIUM_MODE)
+diff --git a/cipher/pubkey-dilithium.c b/cipher/pubkey-dilithium.c
+index 03958bb0..8c3f650e 100644
+--- a/cipher/pubkey-dilithium.c
++++ b/cipher/pubkey-dilithium.c
+@@ -170,7 +170,7 @@ mldsa_generate (const gcry_sexp_t genparms, gcry_sexp_t *r_skey)
+       memcpy (seed, seed_supplied, SEEDBYTES);
+     }
+ 
+-  dilithium_keypair (info->algo, pk, sk, seed);
++  rc = dilithium_keypair (info->algo, pk, sk, seed);
+   _gcry_burn_stack (DILITHIUM_KEYPAIR_STACK_BURN);
+ 
+   if (!rc)
+@@ -206,7 +206,6 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
+   size_t data_len;
+   const unsigned char *sk;
+   const struct mldsa_info *info = mldsa_get_info (keyparms);
+-  int r;
+ 
+   if (!info)
+     return GPG_ERR_PUBKEY_ALGO;
+@@ -258,17 +257,14 @@ mldsa_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
+   else
+     randombytes (rnd, RNDBYTES);
+   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
+-    r = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
+-                        NULL, -1, sk, rnd);
++    rc = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
++                         NULL, -1, sk, rnd);
+   else
+-    r = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
+-                        ctx.label, ctx.labellen, sk, rnd);
++    rc = dilithium_sign (info->algo, sig, info->sig_len, data, data_len,
++                         ctx.label, ctx.labellen, sk, rnd);
+   _gcry_burn_stack (DILITHIUM_SIGN_STACK_BURN);
+-  if (r < 0)
+-    {
+-      rc = GPG_ERR_INTERNAL;
+-      goto leave;
+-    }
++  if (rc)
++    goto leave;
+ 
+   rc = sexp_build (r_sig, NULL, "(sig-val(%s(s%b)))", info->name,
+                    info->sig_len, sig);
+@@ -300,7 +296,6 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
+   size_t data_len;
+   const unsigned char *pk;
+   const struct mldsa_info *info = mldsa_get_info (keyparms);
+-  int r;
+ 
+   if (!info)
+     return GPG_ERR_PUBKEY_ALGO;
+@@ -350,17 +345,14 @@ mldsa_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
+     }
+ 
+   if (ctx.flags & PUBKEY_FLAG_NO_PREFIX)
+-    r = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
+-                          NULL, -1, pk);
++    rc = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
++                           NULL, -1, pk);
+   else
+-    r = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
+-                          ctx.label, ctx.labellen, pk);
++    rc = dilithium_verify (info->algo, sig, info->sig_len, data, data_len,
++                           ctx.label, ctx.labellen, pk);
+   _gcry_burn_stack (DILITHIUM_VERIFY_STACK_BURN);
+-  if (r < 0)
+-    {
+-      rc = GPG_ERR_BAD_SIGNATURE;
+-      goto leave;
+-    }
++  if (rc)
++    goto leave;
+ 
+ leave:
+   _gcry_pk_util_free_encoding_ctx (&ctx);
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
index 55872a5c237..d7f8563ae6e 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            file://CVE-2026-41989.patch \
+           file://CVE-2026-41990.patch \
            "
 SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
 

