Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ABFC43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.1981.1667356946855244179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C/NkT/DR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so675238pjl.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jihRIC1z4Hx0o28MW3oMtBHap3QCXmMEMlSiSSAtO2Y=;
        b=C/NkT/DR+MU2fZrk9SmbJQvecRSftIx6o1GKB6VqHhuhEaLkRIDteVzg3kbJxO+NZ7
         IMUNG6/NBfMcHV7xn9DqJupfQ4pXPJmd7dJ54w8fJmKvQt8uSLpJyQohKs7s6KglSyPV
         Ht5F7j4oCt6VdHyv21hPhqlxGpwtm3vXNZ/WJX2O2SNvGutp6EexyqB+2+ikDc29HjH1
         tgo6f3CTn2BcwKGxI33dkqVasFTRC7h01naFcZRpkZKGQjJ+LsiAPOkQxJxZcvbCXcIE
         RLwoKSWgrHmS5VidtGzIGR2y9CnOe/GLN452+dPAyCyh+wolZ13+4CXZZyMjuHmZVyeN
         pKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jihRIC1z4Hx0o28MW3oMtBHap3QCXmMEMlSiSSAtO2Y=;
        b=bOcVapBuceYOeqbNFoNKQx0JjguEz4/cJ+aoHnXKuEg9D6TaobdGBO1saFEgk7xKuR
         7PCeSDwN9Z4gJdel7WV422RFr0cI4QhE4hBLXm30reJ1/me0BpJThJZqG2P3TFCgah3u
         KMVRJK1zekY/437i1I1qPVbQ207PBnSLDTqK8TpYFL1E/L5SljgySWMe9YSmDPUpmosq
         Ggo50EcdqAgyXl11L2gc6gZE8Gtw5LE+4Vd12PUGnb00rgKDFPvwGsloJDaeHjaNX1Ib
         WVoDuAltyepqCjKarmE9QxrvyFn62G7QYh3EhDQngU1Aul0b2hibO5sTVg4BeGsOdHKZ
         bvSg==
X-Gm-Message-State: ACrzQf1m8KFWnMuwK+Ac4y3LUjWS4JwAmj5gxgZ1SvAoNNNh79LWRFQW
	Dzc2o67kPBbf97N5AcjjV8Bfp2qPgc3uDQQ7
X-Google-Smtp-Source: AMsMyM5FwKy2+g3w7NmBhgDJY1Zb6ZZQk86erMqe4pzow9pa4ixXnN7oP6TgIFhWFbzNhaUOKliAJQ==
X-Received: by 2002:a17:903:32d1:b0:187:143f:4c5b with SMTP id i17-20020a17090332d100b00187143f4c5bmr17568663plr.54.1667356945849;
        Tue, 01 Nov 2022 19:42:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/20] openssl: CVE-2022-3358 Using a Custom Cipher with NID_undef may lead to NULL encryption
Date: Tue,  1 Nov 2022 16:41:51 -1000
Message-Id: <c28dc71f17133f6e4470fc0c1a552c743869b3ad.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172541

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
Description:
	CVE-2022-3358 openssl: Using a Custom Cipher with NID_undef may lead to NULL encryption.
Affects "openssl < 3.0.6"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f98b2273c6f03f8f6029a7a409600ce290817e27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 04aff04fab..175692436d 100644
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


