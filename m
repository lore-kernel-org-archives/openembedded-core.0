Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FBAC53209
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 04:45:49 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32038.1771562734361026017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 20:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E5H+zrsp;
 spf=pass (domain: mvista.com, ip: 74.125.82.51, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a635476fso1676820c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 20:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771562733; x=1772167533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC3EX28bcKPWFPq1fq0121ems1ZWc1ch8MaKp2uS78s=;
        b=E5H+zrspF61lM9DbqjFKbnajrWKe/iyJ6TK4vSfXwz3WM6ONzM6asFBxQUkQkC2ITW
         k0L5x3F7x5cThP9Zxp56U70yGqqV5Ko8ZNL/2H/vXgnDijyWRz+rkvR74lTwPO5QE2u3
         n1tKcJT1ZU4a78k+JUfLbulvwvv4QAU99OnW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771562733; x=1772167533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC3EX28bcKPWFPq1fq0121ems1ZWc1ch8MaKp2uS78s=;
        b=rRaHVy88osaSPnaEw9f0QWZQSBvKAY8CfX8qNisjX+WEMuHxQ7zqJESAt+9PeSgbT5
         PJoJy9vALEIF+m+az692XR8vbFMeP9F4GJ/YDnMEPeAPv+coR49gZ+9YeXw4Ao3z6xSW
         ca4A9h7Vgwivrw4//AjzgYmqbN5kUno3i3J622xkHna47SL4mXoRVXdLSugb0SwdnBUd
         NF9jlpxGPcVuomU0KeaCiElJ74QXtRixDTURk/aojWf+b8LOJ7+TGUyG+gzpnPmdMKup
         0dDMcNoL0y9cmjTa/pjuhd34nJbioB9GOrZpM9/gKKW8VTcEXB4ZVO+XvsE3yL9LwaWg
         U/GQ==
X-Gm-Message-State: AOJu0YzlkcAzniCTYZtbY84KDrbboGq8VdQbR1IdEjdBqWtDq3awcecF
	01kxlgMJtfXdU4WiTEy0jlYE3/wM/WNPDXvczEn1Tw5jZNsrl+k7qFlc5YxIzSw8wKqutGNdTLw
	IyTo+
X-Gm-Gg: AZuq6aJzVqpSZFfJDWYYhQrMXp0f0/tdVZL1PbYh2ur8KlQuERRuWF/RLLui1yDBOI1
	0IZlY3e+p82S266AgIMqGGadL21OkRColQNa0YVcqh7l7qn+PZexVXOAOuiUAEZ24E6LGFoNZh/
	90aaCoYHtXMEMh+1RpvHAKO5F2mKnOsfjyspnNZvRjdKmZss97DEpVndkvIM1+CUaxyiK5icibN
	fcCLJf0wCDWajaVMPJDZ1UCQXIfTPYX0XUt51goYrt2aNyYV/c5pKzh+xDMNWMRS0/ker0Kyx3S
	HtZew8EMTN6lE6z9F0jx63ryFmPEoPrWkdZNCFESeW/CRShWWirtYpargazh9iELca9yrXwgofO
	Z2/0m3Wy3QuwCF3DfIUXBg23prn2BfK+ZSJpqRhs5jPMndIGnUbbBzhHSWd1arHVn+mqLO9B5Lp
	N9r/GVibIcprM/wqgQauDvsKj9JHwWB/Enfg==
X-Received: by 2002:a05:7022:b85:b0:11b:9386:a387 with SMTP id a92af1059eb24-12759a8164cmr3709689c88.42.1771562733302;
        Thu, 19 Feb 2026 20:45:33 -0800 (PST)
Received: from MVIN00013.mvista.com ([152.59.0.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm31352033c88.5.2026.02.19.20.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 20:45:32 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] openssl: fix CVE-2025-69419
Date: Fri, 20 Feb 2026 10:13:22 +0530
Message-ID: <20260220044322.8015-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 04:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231449

Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2025-69419

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2025-69419.patch      | 61 +++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
new file mode 100644
index 0000000000..dcfdba82ac
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
index 4fd13d52fe..88fa0285cd 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://CVE-2025-15467-02.patch \
            file://CVE-2025-15467-03.patch \
            file://CVE-2025-15468.patch \
+           file://CVE-2025-69419.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.50.1


