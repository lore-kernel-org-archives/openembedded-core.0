Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2C5CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:37:02 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123215.1781501813245327356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=azs6MCZa;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85d8615b09so1755161a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781501813; x=1782106613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4muR/9+q0HbXZepChJoOjv7DURZWX0fVBFOzj/iN50=;
        b=azs6MCZaebnjWhE4bBhLNCa3pvIrz0xL+JIDg+2fZgmW7xsvCXMvHzMeuJjEeiqK58
         FF+3bfhj3iknmrXdhkkd1TxU4NwZIati2LdOEH4GfzbB1xKRq7gM0BuTWsi0tO5B2Iu+
         A/VKMjbjO8lOGyrJgRF9MZPeJ4g4bq/zlLeEGhtO8OBYHnbI98PWNB1JN1bWzQMAK//w
         8He7ys8Va9lhV0nM+OwjxYvIrAQeBgm4eiJ29bNB5zKpiKxz1iELEDF7NHP+RI4tebR6
         QRyKtASBD7+M1ftQu2u6A4LKoCaYKNUu47VxA9Cyf9AcmL6+IgFWoyxCtcXdsgeQ8oS2
         ONTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501813; x=1782106613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4muR/9+q0HbXZepChJoOjv7DURZWX0fVBFOzj/iN50=;
        b=kwXKSch54qVWNki6q99KS0JWrhbeO8QuKzEw7Xn0tP6y+kgBRlLgMEd+Om/h9rRiI7
         qH17xk2frX6oxQMss4DB9/89B4i/6R1BXAbrQE06RVkthyB3r0dCw1XqcdXPfU6vUP0T
         7VDdOVIiEpRUDKdbxJDpbEca8p07ixXM7fypJrpUT6gciR9nbv3Onm63Ty8CyG+Q6Y4t
         96VGvR1FJvfW2REv/FV1pRAeMs1IPf+knvDQMDTcfyMxVL/JcSEGJFPJ6Pv7kA5qdvoe
         uXmQtiksVzpE9jGieDYXSl3K2EmfKYBFmatzu53VgpPN7SthwiUoi7mEQcVXPJ+2Ebat
         S+bg==
X-Gm-Message-State: AOJu0YyIZGz8tYAw/uePpqcrmZWya6K37gDDL+xEFfH6AbstrTIuEzFt
	lLhdcrD5/RU7OX5Ee9sfHBNBCBTOGvbS99Bi4wjDf52+EN32cqsP8LaXKx3Biw==
X-Gm-Gg: Acq92OEyw1o5czAwub6qUwA3Va2i1H+qd2CKpK4CpoefvZuMCx3+oWQAqNcM2x3KdH9
	lcvM0vooz/EC0VU4TpPzwumjICa2FewDvB8CvYp26JTR0cbCuutSxTcBBwKVjAasm5OEhJSR/zk
	uDTq5eOpoSYtlzbGo+daZP/g0727uunhG/J1mheA7j+zxTHUNVULiJMRwS2INixHVMOaWxadZsJ
	Frhf5+TEQ54ZjQLRjn4nlPDHYiYS2Z2nXzkG3uIkvGczku7Zg22aaHQ4DlYE+ANXOPd6t6X9vTy
	DLROtmYgK8w8vN6krjii3FjXWDQNNcTCAwjte0U+Ds4k+J8yPQo4totS6/457FzNWoNbv/8Yrnx
	SsixKLOF6qvQBV1E92IyQAn07zty0ij7kNnoX5m1ZRk32E8YLBmbs8KWpjh32uhEptxnN/x8QEc
	Nx4+l2wC0wbOvAaRa/YKp97D8QrLuseusGy4/nVB9NVHuHnkuL/YVlep12LmRahKx+sBR+C2j8
X-Received: by 2002:a05:6a20:549f:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3b7840457f9mr14554610637.36.1781501812509;
        Sun, 14 Jun 2026 22:36:52 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5d505sm7438450a12.1.2026.06.14.22.36.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:36:52 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][meta][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Date: Mon, 15 Jun 2026 11:06:42 +0530
Message-Id: <20260615053642.1110908-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238811

From: Naman Jain <namanj1@kpit.com>

OpenSSL 3.5.7 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed heap use-after-free in PKCS7_verify(). (CVE-2026-45447)
* Fixed possible heap buffer overflow in ASN.1 multibyte string conversion. (CVE-2026-7383)
* Fixed out-of-bounds read in CMS password-based decryption. (CVE-2026-9076)
* Fixed heap buffer over-read in ASN.1 content parsing. (CVE-2026-34180)
* Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys. (CVE-2026-34181)
* Fixed CMS AuthEnvelopedData processing may accept forged messages. (CVE-2026-34182)
* Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler. (CVE-2026-34183)
* Fixed NULL pointer dereference in QUIC server initial packet handling. (CVE-2026-42764)
* Fixed AES-OCB IV ignored on EVP_Cipher() path. (CVE-2026-45445)

[1] https://openssl-library.org/news/secadv/20260609.txt

Reference: [https://github.com/openssl/openssl/releases/tag/openssl-3.5.7]

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 6685654472..6d864e0746 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
+SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


