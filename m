Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8E9F3C986
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21691.1771943594221448611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TxuG0Jz2;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a302794so4199187f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943592; x=1772548392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOT1f3fzl6+Qu6cba1Ww2bYj2JqYRUiN29/qSLYTER8=;
        b=TxuG0Jz22MMghb2ismMLnSFLfFrJeFbdvcp5p21ZbUaSxvmfMzaq8p3u7lnWGm0sg1
         amUmJI3RYKa4nvDV9DmHKoQMmAqUtxGChVkRTL9MfABnSmcvbkn32aeFI42VdTUjxWU0
         SUra5lPlP67voKHBZwwpWBFoiKeB9Z6jfpVCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943592; x=1772548392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FOT1f3fzl6+Qu6cba1Ww2bYj2JqYRUiN29/qSLYTER8=;
        b=Z2O2mkaRZnlwBm8Npto8a6hZJW+HjNl/wKb0OMCUtfUALHMLX7iwWg81wCL2Ir1KxQ
         7tCXk+PtApmpenUBNfB3fY9Ebx33FqGlEuyYjMv0M5thrvjNX+RXNLk4fSgGAOmVssmN
         nL/IvPWDA4e3dXJDl2gffortaS8BpmygkbNMpyYZ8Z5nrhy4Hpp2HshjEztZHTbNO7AH
         Sp3Zpnsg4LqnUqSrm5ynAJ+Wsjz5nmuEshe2v7fyrp4IeEBzcanE3kzd445ncNbxZdyA
         f4yJk4FZGPdf93HmJPPtPGHTb2NiuAuI9L9uhD0Y1iR1u/vmY0uUJbsSg/sleGTWENZa
         VF5A==
X-Gm-Message-State: AOJu0Yw69ggSCAsiL8vVyU/n2xVYMSyN9XgZS0P/KyL1+XnHnEn5uhbP
	vPgibvPalZFVioiaTsNorPR9aDzDksrxr2ii7FJwVnbuG9X+2U0nB7V0OTNqWJ47C2m2kGHBCj8
	4yX/a
X-Gm-Gg: AZuq6aJuPi4LzYC9XH7RNd0RW7G9B9SeVNSwVHnwN6NjaijldLqrbEgxPEsLV6hpKmD
	KrIdwe4WzsfSGaOK4Onudo9KxWOkou8GqfDCdKDygRUJO/uMtbgERRzN50xTu5VrEh/VnQWdXza
	QGNJv2LB5H+nxe8CXqAZRiDSEspK/6fqDoANSQ5T3TwtngJp3WUbeQu0XWA6Na+BYheLKCjiTR9
	r//WW/9Zs/CAuPeW4GDvbKmocgbIWzpPQy4ux2hdFPVAVZ6N/PhGheuyke120uPpW7X7MOXXEze
	XBbSZs20Z4dmqcrtZjC7+lz23fGFnOIojT5Zs+v8AWrQVF+Z9NOOfAy1WzdkNqk1U2Wlx+K1QnK
	oF9FgjBtqlIoXTouEsY1o82vmXQJRD134RxSgKip5NJoQ1L3U4ckssJF1C2lwX1a4+CDGZKYPmg
	k7DWAY3u1U+yBcewbO/mdfS7RcRJNKXKfbciK8RR7cdRPJVXdxNP/kjxezipws1MZxD3Yn4xW3j
	MOwmZfSLDiuq/Z7L8v08Q61J6qR3YBsQg==
X-Received: by 2002:a05:600c:8b2a:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-483a96148a7mr187920455e9.34.1771943592372;
        Tue, 24 Feb 2026 06:33:12 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/44] openssl: fix CVE-2025-69419
Date: Tue, 24 Feb 2026 15:32:01 +0100
Message-ID: <24621a87d5856cc511eebdbe26cc19158d3b0d2e.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231840

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2025-69419

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/openssl/CVE-2025-69419.patch      | 61 +++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
new file mode 100644
index 00000000000..dcfdba82acb
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
@@ -0,0 +1,61 @@
+From 41be0f216404f14457bbf3b9cc488dba60b49296 Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertp@openssl.org>
+Date: Thu, 11 Dec 2025 12:49:00 +0100
+Subject: [PATCH] Check return code of UTF8_putc
+
+Signed-off-by: Norbert Pocs <norbertp@openssl.org>
+
+Reviewed-by: Nikola Pajkovsky <nikolap@openssl.org>
+Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/29376)
+
+CVE: CVE-2025-69419
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/41be0f216404f14457bbf3b9cc488dba60b49296]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/asn1/a_strex.c   |  6 ++++--
+ crypto/pkcs12/p12_utl.c | 11 +++++++++--
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/crypto/asn1/a_strex.c b/crypto/asn1/a_strex.c
+index f64e352..7d76700 100644
+--- a/crypto/asn1/a_strex.c
++++ b/crypto/asn1/a_strex.c
+@@ -204,8 +204,10 @@ static int do_buf(unsigned char *buf, int buflen,
+             orflags = CHARTYPE_LAST_ESC_2253;
+         if (type & BUF_TYPE_CONVUTF8) {
+             unsigned char utfbuf[6];
+-            int utflen;
+-            utflen = UTF8_putc(utfbuf, sizeof(utfbuf), c);
++            int utflen = UTF8_putc(utfbuf, sizeof(utfbuf), c);
++
++            if (utflen < 0)
++                return -1; /* error happened with UTF8 */
+             for (i = 0; i < utflen; i++) {
+                 /*
+                  * We don't need to worry about setting orflags correctly
+diff --git a/crypto/pkcs12/p12_utl.c b/crypto/pkcs12/p12_utl.c
+index a96623f..b109dab 100644
+--- a/crypto/pkcs12/p12_utl.c
++++ b/crypto/pkcs12/p12_utl.c
+@@ -206,8 +206,15 @@ char *OPENSSL_uni2utf8(const unsigned char *uni, int unilen)
+     /* re-run the loop emitting UTF-8 string */
+     for (asclen = 0, i = 0; i < unilen; ) {
+         j = bmp_to_utf8(asctmp+asclen, uni+i, unilen-i);
+-        if (j == 4) i += 4;
+-        else        i += 2;
++	/* when UTF8_putc fails */
++        if (j < 0) {
++            OPENSSL_free(asctmp);
++            return NULL;
++        }
++        if (j == 4)
++	    i += 4;
++        else
++	    i += 2;
+         asclen += j;
+     }
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
index 572a12aae8d..074ab121316 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://CVE-2024-41996.patch \
            file://CVE-2025-15468.patch \
+           file://CVE-2025-69419.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \

