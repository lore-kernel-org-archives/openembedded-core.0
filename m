Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949ADC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 16:19:04 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.111841.1692029939723363025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 09:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VWdsgNyM;
 spf=pass (domain: mvista.com, ip: 209.85.160.50, mailfrom: asharma@mvista.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1c0fa9dd74fso3024216fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692029939; x=1692634739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30QoRmEcckEHl3JrSRP9chCvrb/2ESqBl7P8iUXEIis=;
        b=VWdsgNyMpINf/WbeOuPXyrOYhiIBYxDo/p94bpjEjbEta+9pfRwLBHR87mqZuXXUIG
         GJl4asltf12xdnNb7y2ZYmh0dh52HB1lBYJ93sJC7HRlXRR2B/KKmS8cLZANSf9zrI5V
         Y0sq2+MuN6WliEFm+bxcbP8zd2gdymtX0v2fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692029939; x=1692634739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30QoRmEcckEHl3JrSRP9chCvrb/2ESqBl7P8iUXEIis=;
        b=Flii1ssjVT4mMwhrIxkZBs+RDvBd1sUARKDcGJlPqHjY22ZWuu2vUkhWnJRCfGCC7G
         9SLx/iJ07YbfxGhrd2M7bhg0opcZc4fYKIJxzXALqb69D6bWfIwxFyRpbkPHctTpJkCE
         WYQ2deXNChiu63n9Fhr61ECEk5IfwpdmSOhuWQlPVewmjPzKC0dDK/MTRUd3VCQDlxll
         QeRQbjgPT9AEKZfTS80YPwCLanuvruDy7N1PsK971Jp5Ih1EijEzr/nfSEI6CGo2+TRy
         8ZNasgEFPadEFhXdmVRtyaAshBe+WHIb2ADEBbQv92ZxCPv/eaxjvGXIFiBG2s0pcPle
         SPjw==
X-Gm-Message-State: AOJu0Yz9UrVqzxOrjodN3yaNCxyqf2p/mQIXaWBxpBnK+uGEmk7XN4+h
	/OUe3M+E4kc6hDYmWEDSlT07jFfdNzKhF5zTU34=
X-Google-Smtp-Source: AGHT+IGOu7ODJTHTkgKMAQL+RrFfzUyozxlUlX4NiKkt3CoI5udK51K5KFJJJTy6imJ1/DHHnFx95w==
X-Received: by 2002:a05:6870:c222:b0:1b7:3432:9ec4 with SMTP id z34-20020a056870c22200b001b734329ec4mr11466767oae.10.1692029938788;
        Mon, 14 Aug 2023 09:18:58 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.203])
        by smtp.gmail.com with ESMTPSA id m22-20020a17090a159600b002684b837d88sm8916549pja.14.2023.08.14.09.18.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Aug 2023 09:18:58 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 14 Aug 2023 21:46:41 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Backport fix CVE-2023-2975
Date: Mon, 14 Aug 2023 21:46:37 +0530
Message-Id: <20230814161637.4700-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 16:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185938

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../openssl/openssl/CVE-2023-2975.patch       | 61 +++++++++++++++++++
 .../openssl/openssl_3.0.9.bb                  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
new file mode 100644
index 00000000000..fe78e87a831
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
@@ -0,0 +1,61 @@
+From 00e2f5eea29994d19293ec4e8c8775ba73678598 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Tue, 4 Jul 2023 17:30:35 +0200
+Subject: [PATCH] Do not ignore empty associated data with AES-SIV mode
+
+The AES-SIV mode allows for multiple associated data items
+authenticated separately with any of these being 0 length.
+
+The provided implementation ignores such empty associated data
+which is incorrect in regards to the RFC 5297 and is also
+a security issue because such empty associated data then become
+unauthenticated if an application expects to authenticate them.
+
+Fixes CVE-2023-2975
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/21384)
+
+(cherry picked from commit c426c281cfc23ab182f7d7d7a35229e7db1494d9)
+
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=00e2f5eea29994d19293ec4e8c8775ba73678598]
+CVE: CVE-2023-2975
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ .../implementations/ciphers/cipher_aes_siv.c   | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_siv.c b/providers/implementations/ciphers/cipher_aes_siv.c
+index 45010b90db..b396c8651a 100644
+--- a/providers/implementations/ciphers/cipher_aes_siv.c
++++ b/providers/implementations/ciphers/cipher_aes_siv.c
+@@ -120,14 +120,18 @@ static int siv_cipher(void *vctx, unsigned char *out, size_t *outl,
+     if (!ossl_prov_is_running())
+         return 0;
+ 
+-    if (inl == 0) {
+-        *outl = 0;
+-        return 1;
+-    }
++    /* Ignore just empty encryption/decryption call and not AAD. */
++    if (out != NULL) {
++        if (inl == 0) {
++            if (outl != NULL)
++                *outl = 0;
++            return 1;
++        }
+ 
+-    if (outsize < inl) {
+-        ERR_raise(ERR_LIB_PROV, PROV_R_OUTPUT_BUFFER_TOO_SMALL);
+-        return 0;
++        if (outsize < inl) {
++            ERR_raise(ERR_LIB_PROV, PROV_R_OUTPUT_BUFFER_TOO_SMALL);
++            return 0;
++        }
+     }
+ 
+     if (ctx->hw->cipher(ctx, out, in, inl) <= 0)
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
index 849bd7e5a69..61e81cfa09d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2023-2975.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.7


