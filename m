Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9318DC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 04:18:53 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.5994.1666239531766196776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 21:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GPMBxk26;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id p6-20020a17090a748600b002103d1ef63aso1906838pjk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 21:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ERh/SDTkdcI4SV5FmCxaqD1fBcf6noZRFUxtdRK95g=;
        b=GPMBxk263W6+6TTSWorB0xePDZrFRProvnJ8ilJVoC+iqnUJpwd0tSHExWfI1+8v6s
         2rAoPeMKVXaILX9brbiO5MapjNgoBc+62sV+tGaLMrcWfycICzqb8+VNuwM5JOjxqUrs
         nIU9Np8+8Nyq97GgB7VHEXOqJXdO+Y6abFN/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ERh/SDTkdcI4SV5FmCxaqD1fBcf6noZRFUxtdRK95g=;
        b=bdVj0dhG+aYscz3j7imLhmBi406+Sp+LPzNc7+vJ8Es6TzhaIKgiE8zZ52OuQSk3vs
         7CSG7se9+EwsBlI57wzoli7xW/W5iEGajtZuSitXGOb0Fj2PGx9osBIOto9P4FLapIQg
         /LOxjwFn6/NPYLepVTUwF9ADyx2XPuq63SqMUUjHL933BJ/IxT6p+8l5p3Hal5L7f2oX
         5k9LS4NtFgpQCZXnWPFTovymZDnPOga8qbH7RZVXIGhkNdg/NnKvdBZ070n3Uo7qjuxA
         +cLz2q9mGSfMKiw56trbtdrKA+X6B9cYuCZd4VhyvW+jPAY/L19PxGRcrZh4v+6tW022
         0F5w==
X-Gm-Message-State: ACrzQf1VaxpHBIMVxsUGQfW+Oz5l/8onnwOegbMrYSGj/4NjvnYO1Ct6
	wpSADHVdu+HIVD42iD9tdVMw8GDz/HIXqg==
X-Google-Smtp-Source: AMsMyM6gZywjQXNSYek7Ovtc/nKiP1lhmJNjbi31AIjhX2bjDZmNuWSKtACyeEpi3yDEb2qUukPagA==
X-Received: by 2002:a17:903:11cf:b0:178:a8f4:d511 with SMTP id q15-20020a17090311cf00b00178a8f4d511mr12096467plh.72.1666239530716;
        Wed, 19 Oct 2022 21:18:50 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.215])
        by smtp.gmail.com with ESMTPSA id w206-20020a627bd7000000b0056109e15638sm12076938pfc.54.2022.10.19.21.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 21:18:26 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 20 Oct 2022 09:48:09 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [master][langdale][kirkstone][PATCH] openssl: CVE-2022-3358 Using a Custom Cipher with NID_undef may lead to NULL encryption
Date: Thu, 20 Oct 2022 09:48:08 +0530
Message-Id: <20221020041808.8356-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 04:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171988

Upstream-Status: Backport from https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
Description:
	CVE-2022-3358 openssl: Using a Custom Cipher with NID_undef may lead to NULL encryption.
Affects "openssl < 3.0.6"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2022-3358.patch       | 55 +++++++++++++++++++
 .../openssl/openssl_3.0.5.bb                  |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
new file mode 100644
index 0000000000..18b2a5a6b2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
@@ -0,0 +1,55 @@
+From 56e1d693f0ec5550a8e3dd52d30e57a02f0287af Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 19 Oct 2022 11:08:23 +0530
+Subject: [PATCH] CVE-2022-3358
+
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
+CVE : CVE-2022-3358
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/evp/digest.c  | 4 +++-
+ crypto/evp/evp_enc.c | 6 ++++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/crypto/evp/digest.c b/crypto/evp/digest.c
+index de9a1dc..e6e03ea 100644
+--- a/crypto/evp/digest.c
++++ b/crypto/evp/digest.c
+@@ -225,7 +225,9 @@ static int evp_md_init_internal(EVP_MD_CTX *ctx, const EVP_MD *type,
+             || tmpimpl != NULL
+ #endif
+             || (ctx->flags & EVP_MD_CTX_FLAG_NO_INIT) != 0
+-            || type->origin == EVP_ORIG_METH) {
++            || (type != NULL && type->origin == EVP_ORIG_METH)
++            || (type == NULL && ctx->digest != NULL
++                             && ctx->digest->origin == EVP_ORIG_METH)) {
+         if (ctx->digest == ctx->fetched_digest)
+             ctx->digest = NULL;
+         EVP_MD_free(ctx->fetched_digest);
+diff --git a/crypto/evp/evp_enc.c b/crypto/evp/evp_enc.c
+index 19a07de..5df08bd 100644
+--- a/crypto/evp/evp_enc.c
++++ b/crypto/evp/evp_enc.c
+@@ -131,7 +131,10 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ctx,
+ #if !defined(OPENSSL_NO_ENGINE) && !defined(FIPS_MODULE)
+             || tmpimpl != NULL
+ #endif
+-            || impl != NULL) {
++            || impl != NULL
++            || (cipher != NULL && cipher->origin == EVP_ORIG_METH)
++            || (cipher == NULL && ctx->cipher != NULL
++                               && ctx->cipher->origin == EVP_ORIG_METH)) {
+         if (ctx->cipher == ctx->fetched_cipher)
+             ctx->cipher = NULL;
+         EVP_CIPHER_free(ctx->fetched_cipher);
+@@ -147,7 +150,6 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ctx,
+         ctx->cipher_data = NULL;
+     }
+ 
+-
+     /* Start of non-legacy code below */
+ 
+     /* Ensure a context left lying around from last time is cleared */
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
index e50ff7f8c5..ee051ee7d4 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2022-3358.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


