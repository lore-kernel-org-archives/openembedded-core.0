Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC56FC7EE24
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:22 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.72574.1682871978202042337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IgP6WFGl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-24df161f84bso387193a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871977; x=1685463977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbnhlS06ZE3k7X8Hvlbj/90mJBFeTgk2SnhWKGmDuWU=;
        b=IgP6WFGlIoXS5eWZzr//L4Ndp5PzHG4gp/o8FH2opzAZHIpyHXBABS2dgYrN5A38Xn
         HMcRFADILmCHzCZzFzbUSGfp0F5yZ9BW8/LiCvAhXFCDM4Pg94WUB2QPMZ5HhRoGi0m5
         +pwOxoPx0WA29IfU96aMmPSIKNnGrW6NMl1fQRagVkAg5QjbtxfqH7Gy9tn6exDaoo+H
         QTVLRJlfegmK1zihT4DVKdO20FjWFmarRnbbsQw+3ElMBi8D53Oxi16DYvmQ+U9bZIce
         rwtaEWF8e9z+i4Ie0NBP1Yb8F1WgogxooqxFN/ud7DezKBSeGZbYgRbTs3ZfcG5I1uxW
         JUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871977; x=1685463977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbnhlS06ZE3k7X8Hvlbj/90mJBFeTgk2SnhWKGmDuWU=;
        b=Pc9Lc+mS2RxcckiOIjFuRbBUgIs/4No2zdmRxe058ZwecqCV0crJ6dbFjmsFQTEPKu
         zYLzKyvRmmCC26tTK0pDJ+D9FkOFjP3KIRdg3cJIKSGM6iR7By4u3uPEMqDeg1LHlncJ
         zrbvVkYCNsxApc9jaNG6PgBoHl1VvW4ykYEK04dFX817HXbWRh6P2aDK7U37MPVWkA5V
         nl8wH/dmbrGcQ99ub+KftxRFLPUagGm8m5onDSGS2TocO1r2/XMU0yuuzL/Q5O2JvV1K
         RWugHZRkleYFyVR+0+v59ms9ra2OvC1Vji9KNQ0T4Dk361cTiATS11LJD7EpGuMPFpnS
         dj7w==
X-Gm-Message-State: AC+VfDxmqNjefPXtqLEAtT2XZzDzx5ayntvZVMSUzC6NEsAD1UbJPq0v
	XuzU/MUYPPCUd5fC+YeCC+/kW5bf/H/6CBhMH8Q=
X-Google-Smtp-Source: ACHHUZ4drDWvTyhZwEcV/VfdhPiKrre6FiH1zV7YQPzktcCCXdK7qIqTzCaImcoFRQvKZzmnCXyxlw==
X-Received: by 2002:a17:90a:5513:b0:247:2680:2ad with SMTP id b19-20020a17090a551300b00247268002admr11908460pji.33.1682871977245;
        Sun, 30 Apr 2023 09:26:17 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] openssl: Fix CVE-2023-0465
Date: Sun, 30 Apr 2023 06:25:55 -1000
Message-Id: <cbca55301bb065a6506e65cf64cc90b598e39789.1682871868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682871868.git.steve@sakoman.com>
References: <cover.1682871868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180576

From: Omkar Patil <omkar.patil@kpit.com>

Add patch to fix CVE-2023-0465

Link: https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-0465.patch       | 60 +++++++++++++++++++
 .../openssl/openssl_1.1.1t.bb                 |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
new file mode 100644
index 0000000000..be5068074e
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
@@ -0,0 +1,60 @@
+From b013765abfa80036dc779dd0e50602c57bb3bf95 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 7 Mar 2023 16:52:55 +0000
+Subject: [PATCH] Ensure that EXFLAG_INVALID_POLICY is checked even in leaf
+ certs
+
+Even though we check the leaf cert to confirm it is valid, we
+later ignored the invalid flag and did not notice that the leaf
+cert was bad.
+
+Fixes: CVE-2023-0465
+
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/20588)
+
+CVE: CVE-2023-0465
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95]
+Comment: Refreshed first hunk
+Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
+
+---
+ crypto/x509/x509_vfy.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/x509/x509_vfy.c b/crypto/x509/x509_vfy.c
+index 925fbb5412..1dfe4f9f31 100644
+--- a/crypto/x509/x509_vfy.c
++++ b/crypto/x509/x509_vfy.c
+@@ -1649,18 +1649,25 @@
+     }
+     /* Invalid or inconsistent extensions */
+     if (ret == X509_PCY_TREE_INVALID) {
+-        int i;
++        int i, cbcalled = 0;
+ 
+         /* Locate certificates with bad extensions and notify callback. */
+-        for (i = 1; i < sk_X509_num(ctx->chain); i++) {
++        for (i = 0; i < sk_X509_num(ctx->chain); i++) {
+             X509 *x = sk_X509_value(ctx->chain, i);
+ 
+             if (!(x->ex_flags & EXFLAG_INVALID_POLICY))
+                 continue;
++            cbcalled = 1;
+             if (!verify_cb_cert(ctx, x, i,
+                                 X509_V_ERR_INVALID_POLICY_EXTENSION))
+                 return 0;
+         }
++        if (!cbcalled) {
++            /* Should not be able to get here */
++            X509err(X509_F_CHECK_POLICY, ERR_R_INTERNAL_ERROR);
++            return 0;
++        }
++        /* The callback ignored the error so we return success */
+         return 1;
+     }
+     if (ret == X509_PCY_TREE_FAILURE) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 94cb458508..254cc9bc8d 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://reproducible.patch \
            file://reproducibility.patch \
            file://CVE-2023-0464.patch \
+           file://CVE-2023-0465.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.34.1


