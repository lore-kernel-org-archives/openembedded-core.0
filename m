Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E99C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 19:51:25 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.842.1647546684445084525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IGqCUOwS;
 spf=pass (domain: linaro.org, ip: 209.85.160.175,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f175.google.com with SMTP id i8so5279922qtx.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZN3iuWfNku3cF80POnVJqpAYZuwM6Vo4QDYTTJNBsPo=;
        b=IGqCUOwSZWk7+c3R8nCd/gYZFyBSzvht1ZpYUH22pu1rxkIXyiRgFi51Z19XbdR/Ft
         DdBT2JOaWZz7hvbuzm9EiE6oup13GBvctRih19mLG1e4sNxaDlZv/0oaQOwaIT4B0yWv
         J+HxwvHfO787A7A2Ix/qgMmb7dtGfLvr+4+Z8hvYe5XQPQGxnVfZeazeb/hGZAuYPNOO
         t4nXJqDElPUOm1fQA9hzXczf+eme7k30Kot4mskIIUvysPEPp9BMw4m+hzG1TDaphBft
         nsYcH989/PNDVvzw41YNjHmwGDYGAVLnCokwPhGvop6eaCkavRrSgsn9nJTlooqFWsm8
         j1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZN3iuWfNku3cF80POnVJqpAYZuwM6Vo4QDYTTJNBsPo=;
        b=Cl0rodXnarCoQTT0D2UdMypPEZVkKTuo47i+/BKM+LWs6qaUdVeThLZekF/ZYGWZcc
         q2IIirYtck7CPmR4qBsBlHpKAM1oxQ5SKoxoNPLuS7yr9iVLeilSRwRH32aL3JYNUJ6N
         AuseB/UNUSu0A1a6Szx/SXYOlxBa7KLZjRltSR8BgH25/k3CX/GtmclisnjIxQSg2zMb
         9iGtrw3C7OtH1XfpbZCicw7kTKAE0xZrEOiGzDKfOA21zvFf7o0KUVNfgEMwnaZRMWnz
         oF5YqyYyAh6vNDhnKPwH8X3+MSjgpMY1PJVz8WFkIsAM2OCLfJ5z2gI6gPBXRgSeZkn3
         I8ew==
X-Gm-Message-State: AOAM53142R64jJGqlXP/z5r50P44jp0pdksWzDUwmrenAVWH8Oe5zFeh
	N/E+vPra0Yf+5nD41YALrq3imJXBnIYO3g==
X-Google-Smtp-Source: 
 ABdhPJzQLc1UZWaCykEEtYyGqUKZ+BRzTeDpGLW4aSTHSdHS2+e0GGPMC58D6g02j88OyzS8Gksoiw==
X-Received: by 2002:a05:622a:11c7:b0:2e1:b594:cb1d with SMTP id
 n7-20020a05622a11c700b002e1b594cb1dmr5123880qtk.59.1647546683528;
        Thu, 17 Mar 2022 12:51:23 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05620a03cc00b0067d370e414esm2778611qkm.15.2022.03.17.12.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 12:51:23 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] openssl: fix CVE-2022-0778
Date: Thu, 17 Mar 2022 15:51:16 -0400
Message-Id: <20220317195116.3670179-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 19:51:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163434

* Fixed a bug in the BN_mod_sqrt() function that can cause it to loop
foreverfor non-prime moduli ([CVE-2022-0778])

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../openssl/openssl/CVE-2022-0778.patch       | 71 +++++++++++++++++++
 .../openssl/openssl_1.1.1l.bb                 |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-0778.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-0778.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-0778.patch
new file mode 100644
index 0000000000..86b90ccf8d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-0778.patch
@@ -0,0 +1,71 @@
+From 3118eb64934499d93db3230748a452351d1d9a65 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Mon, 28 Feb 2022 18:26:21 +0100
+Subject: [PATCH] Fix possible infinite loop in BN_mod_sqrt()
+
+The calculation in some cases does not finish for non-prime p.
+
+This fixes CVE-2022-0778.
+
+Based on patch by David Benjamin <davidben@google.com>.
+
+Reviewed-by: Paul Dale <pauli@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=3118eb64934499d93db3230748a452351d1d9a65]
+CVE: CVE-2022-0778
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+---
+ crypto/bn/bn_sqrt.c | 30 ++++++++++++++++++------------
+ 1 file changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/crypto/bn/bn_sqrt.c b/crypto/bn/bn_sqrt.c
+index 1723d5ded5a8..53b0f559855c 100644
+--- a/crypto/bn/bn_sqrt.c
++++ b/crypto/bn/bn_sqrt.c
+@@ -14,7 +14,8 @@ BIGNUM *BN_mod_sqrt(BIGNUM *in, const BIGNUM *a, const BIGNUM *p, BN_CTX *ctx)
+ /*
+  * Returns 'ret' such that ret^2 == a (mod p), using the Tonelli/Shanks
+  * algorithm (cf. Henri Cohen, "A Course in Algebraic Computational Number
+- * Theory", algorithm 1.5.1). 'p' must be prime!
++ * Theory", algorithm 1.5.1). 'p' must be prime, otherwise an error or
++ * an incorrect "result" will be returned.
+  */
+ {
+     BIGNUM *ret = in;
+@@ -301,18 +302,23 @@ BIGNUM *BN_mod_sqrt(BIGNUM *in, const BIGNUM *a, const BIGNUM *p, BN_CTX *ctx)
+             goto vrfy;
+         }
+ 
+-        /* find smallest  i  such that  b^(2^i) = 1 */
+-        i = 1;
+-        if (!BN_mod_sqr(t, b, p, ctx))
+-            goto end;
+-        while (!BN_is_one(t)) {
+-            i++;
+-            if (i == e) {
+-                BNerr(BN_F_BN_MOD_SQRT, BN_R_NOT_A_SQUARE);
+-                goto end;
++        /* Find the smallest i, 0 < i < e, such that b^(2^i) = 1. */
++        for (i = 1; i < e; i++) {
++            if (i == 1) {
++                if (!BN_mod_sqr(t, b, p, ctx))
++                    goto end;
++
++            } else {
++                if (!BN_mod_mul(t, t, t, p, ctx))
++                    goto end;
+             }
+-            if (!BN_mod_mul(t, t, t, p, ctx))
+-                goto end;
++            if (BN_is_one(t))
++                break;
++        }
++        /* If not found, a is not a square or p is not prime. */
++        if (i >= e) {
++            BNerr(BN_F_BN_MOD_SQRT, BN_R_NOT_A_SQUARE);
++            goto end;
+         }
+ 
+         /* t := y^2^(e - i - 1) */
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index 24466e11b1..669152ac5e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://reproducible.patch \
            file://reproducibility.patch \
            file://CVE-2021-4160.patch \
+           file://CVE-2022-0778.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


