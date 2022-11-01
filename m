Return-Path: <edtanous@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5152C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:03:21 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
 by mx.groups.io with SMTP id smtpd.web08.9062.1667322196451714885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=bLpENkqQ;
 spf=pass (domain: flex--edtanous.bounces.google.com, ip: 209.85.128.201, mailfrom: 3u1fhywgkajwa9p6jkqockkcha.8ki@flex--edtanous.bounces.google.com)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3691846091fso132252977b3.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wz5+yD5+FQXqs2szxjubcYB0V+lVEPLm4/bDU2Td8m0=;
        b=bLpENkqQmMYhYV6dTgNV0mbtQSsCvK3BOk0J0HFe/3l3PSVfK7PxYZvJ8MuIPY23cI
         miU/xXV+Ij+nXl19f3bu6b8hVncVmFTFTx3+Bhr0jde5sujw2xkkRxWJgiIvyfYnKtqa
         /2rCIpi82KPP2WtL+cMRdU2+69gedPgZtRw0L1T37muwWdbUHZkdRS/AcKLLdlrvcdFH
         ihK/UDJubCreVwM/0J+RswI7wbt9K0jiEjPb/X7heXli8iujt21FbXQMd8lUoYFwOUxI
         DM2GYSp4XM69nxSnWixuWb8oOSIXvN3AxqZmd+6FyG31ttn0ICHHxj4TsEWtlJqRndag
         qaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wz5+yD5+FQXqs2szxjubcYB0V+lVEPLm4/bDU2Td8m0=;
        b=pdzvpQ3EL6pt6RuLrNN+ozFfZV4JTn2s9vds/1ifykfU8TZXwd6KnImPME5pJHYwbw
         +X0vePF5o+wuR/pjSOaJpfZkwcW9OmAjBiCViQuIThm45ScKvbM/HFWuIAfMP8kj+NFB
         TzN2A+E4iWlguuFMQtLBJ4fgs7I/tLrY5o4Sa5Ok9URL8xbG7KRR84cwBtIvQXAqiM+3
         6tlpH67ly6PSY6gReK8VUhKNIZ7PRjHN9OE1y1jvBG4F07eOCNdcWEYxb5MFjxJlb7uM
         ZODpxGJvuHbK2nJq9b+dH/VAdVivSPvkVSbpBqtCiSCSt/hpkYaECZLH0MlaqSroZofx
         uN5A==
X-Gm-Message-State: ACrzQf1HMiN+odhMZjtsxgk0lZoYvStM/gquGLq0IRdK/aksNaxNRtpf
	6v19IoQ7fz44TTKWBsRd6zTUoVP+W9SIG1H4kHjbGqCbI1dkEe4kUkG+eb/62eFdKWQ0EMIykO4
	BMcYRrl11Syk0mjI8uBivo8C6aeQZWUW5sXBSWDuCkIYXHu/iseYx4O7b7TIvc5pslEGSOh5yvy
	x7+RMWsUCaqzN++Us=
X-Google-Smtp-Source: AMsMyM66eAYnrNKfNqUoN919W9O1GKCzUpRndN1rSiX/22Um8kCBcQ/OsFPMy0R8iQKfKXbmfqWfNln+GT8mAQ==
X-Received: from edtanous.svl.corp.google.com ([2620:15c:2c5:13:5ade:9af1:65cd:78e2])
 (user=edtanous job=sendgmr) by 2002:a81:86c2:0:b0:332:a104:f7e4 with SMTP id
 w185-20020a8186c2000000b00332a104f7e4mr19469164ywf.505.1667322195653; Tue, 01
 Nov 2022 10:03:15 -0700 (PDT)
Date: Tue,  1 Nov 2022 10:03:10 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Message-ID: <20221101170310.2740317-1-edtanous@google.com>
Subject: [PATCH] Upgrade OpenSSL 3.0.5 -> 3.0.7
From: edtanous@google.com
To: openembedded-core@lists.openembedded.org
Cc: Ed Tanous <edtanous@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172369

From: Ed Tanous <edtanous@google.com>

OpenSSL 3.0.5 includes a HIGH level security vulnerability [1].

Upgrade the recipe to point to 3.0.7.

CVE-2022-3358 is reported fixed in 3.0.6, so drop the patch for that as
well.

[1] https://www.openssl.org/news/vulnerabilities.html

Signed-off-by: Ed Tanous <edtanous@google.com>
---
 .../openssl/openssl/CVE-2022-3358.patch       | 55 -------------------
 .../{openssl_3.0.5.bb => openssl_3.0.7.bb}    |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.5.bb => openssl_3.0.7.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
deleted file mode 100644
index 18b2a5a6b2..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 56e1d693f0ec5550a8e3dd52d30e57a02f0287af Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Wed, 19 Oct 2022 11:08:23 +0530
-Subject: [PATCH] CVE-2022-3358
-
-Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
-CVE : CVE-2022-3358
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- crypto/evp/digest.c  | 4 +++-
- crypto/evp/evp_enc.c | 6 ++++--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/crypto/evp/digest.c b/crypto/evp/digest.c
-index de9a1dc..e6e03ea 100644
---- a/crypto/evp/digest.c
-+++ b/crypto/evp/digest.c
-@@ -225,7 +225,9 @@ static int evp_md_init_internal(EVP_MD_CTX *ctx, const EVP_MD *type,
-             || tmpimpl != NULL
- #endif
-             || (ctx->flags & EVP_MD_CTX_FLAG_NO_INIT) != 0
--            || type->origin == EVP_ORIG_METH) {
-+            || (type != NULL && type->origin == EVP_ORIG_METH)
-+            || (type == NULL && ctx->digest != NULL
-+                             && ctx->digest->origin == EVP_ORIG_METH)) {
-         if (ctx->digest == ctx->fetched_digest)
-             ctx->digest = NULL;
-         EVP_MD_free(ctx->fetched_digest);
-diff --git a/crypto/evp/evp_enc.c b/crypto/evp/evp_enc.c
-index 19a07de..5df08bd 100644
---- a/crypto/evp/evp_enc.c
-+++ b/crypto/evp/evp_enc.c
-@@ -131,7 +131,10 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ctx,
- #if !defined(OPENSSL_NO_ENGINE) && !defined(FIPS_MODULE)
-             || tmpimpl != NULL
- #endif
--            || impl != NULL) {
-+            || impl != NULL
-+            || (cipher != NULL && cipher->origin == EVP_ORIG_METH)
-+            || (cipher == NULL && ctx->cipher != NULL
-+                               && ctx->cipher->origin == EVP_ORIG_METH)) {
-         if (ctx->cipher == ctx->fetched_cipher)
-             ctx->cipher = NULL;
-         EVP_CIPHER_free(ctx->fetched_cipher);
-@@ -147,7 +150,6 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ctx,
-         ctx->cipher_data = NULL;
-     }
- 
--
-     /* Start of non-legacy code below */
- 
-     /* Ensure a context left lying around from last time is cleared */
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.7.bb
index 175692436d..45fd1de2fd 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
@@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2022-3358.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c9349dcea6d3e4f0b024a7a"
+SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.38.1.273.g43a17bfeac-goog


