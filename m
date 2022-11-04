Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC9BC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.7177.1667530885706557936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tqm8jKUR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id j12so3718788plj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLa2GHEWRItJ9WN63WYVy4qyN5YYFTQq2aok7q7RSO0=;
        b=tqm8jKUR0UMYE6trU4qc6s1WwwuwDo8qF/kNO+QHmXPnvgO1U8rb9ozMrDRdHZWFRK
         AZgeNRMhcw5RNjQmpjQT2KiRZhBbZ8v2XgXbJgDSDrUXes3+zQ+4jrMvg1ivisp4psXI
         XxPj6NLNMjZZ1I3ptoUKeEL6CYOF3LFkkyWiRI9DLbkKxSy5YLSAKZgvGhDM5sxx6SOj
         tMLkEtWcp0994OCkRW7luNQfeBEu1UjAKmTbLEYzHd4AzGnmNFV0jKCUSUt9FRUyFreO
         WgzrwaWnotIOmxihMDACalFeeCWUM6Wz9KuxL01307WojpAn+uDSHxZiihU9zBhSByXJ
         s/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLa2GHEWRItJ9WN63WYVy4qyN5YYFTQq2aok7q7RSO0=;
        b=dlzgh/Skbe7h0SBhI4DfppkSYQSAxPN429SqWhXKbABypulaxl+rhP9cCkDieNouyd
         X3bnI/5P5aBrTh3jcH2WwAj8ywXwYX9VUTeCAKMf9FpohBveQH+zc+mEQWiEMAtvm0Ex
         06hSa9gDCpLnyfgpxlQfn+JSM3jOlxASjkk9oP/CXTkOE/q+aw8eteP9sX/9KRny5vi0
         2nGzm2Jf44iRWAIQ7PMI6O0sEG2vNYrWeGhCKgAMewZ4pcbHltYXdT7AuBqtbpdlx792
         u4bE/AOZnCCP3P4wHI6TbFTIbH5vC74N6adqoCkV9hU3zjC/dpcltwdZbAxe9DSythS+
         N/8w==
X-Gm-Message-State: ACrzQf1scWuL98HdVMvaDSH+mnZAymwBNMV8Qd9ANRb/QwXFv81O/YSN
	4gfYL90Y2VUuC5qy0WLFh8zob3WIa5dxRmUA
X-Google-Smtp-Source: AMsMyM705ss91gYdvZU5tCjAroP/W2LggzDzdNTNFNLj98NltRYT/K3okNymMpaHphIgUVvLsMWYCQ==
X-Received: by 2002:a17:902:e952:b0:17c:7aaa:c679 with SMTP id b18-20020a170902e95200b0017c7aaac679mr33608353pll.74.1667530884790;
        Thu, 03 Nov 2022 20:01:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/31] openssl: CVE-2022-3358 Using a Custom Cipher with NID_undef may lead to NULL encryption
Date: Thu,  3 Nov 2022 17:00:38 -1000
Message-Id: <0575f1d03e640a989b4e75b3ef18944de383187f.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172664

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
Description:
	CVE-2022-3358 openssl: Using a Custom Cipher with NID_undef may lead to NULL encryption.
Affects "openssl < 3.0.6"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f98b2273c6f03f8f6029a7a409600ce290817e27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 08b32d2b35c2ba63774d098af467d1c723b1b6e6)
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


