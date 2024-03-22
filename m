Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC08C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 05:35:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.6100.1711085745899522712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 22:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LX+926/f;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6c8823519so1592949b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 22:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711085744; x=1711690544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBkT1bPm31WEDdS06LUTytpkl4kRVr4AiwT7lqZ+Xi8=;
        b=LX+926/fADWHhPIbwUjmQaetC+rR4a4llJJpfMy4qUyBvU9QdJNF0vdE2UDbhLm/YU
         n1dpn+LIIu+zv8o4RUG+Tpce+6uWqx0NkGDNyqqLp7rtreI1LgJkioWwfbZJ0l3M2EjP
         UNPK8V+ExFoNaMAWr2kzgaWLt1gSM34STpaj1huObs5eGFs2qx9vfpdzz7FGK3p3EK0l
         WeuardO7wqJojPBcq39ld0JMsjUcHd40d/3l7hP3LVnSHJTu0Zy21Vwf7edaVJxjCf4p
         v6voEkE4AFZP9nGCKla2YGmtQwRoss6WVyekuNvpb//F+Z6vLfBk+inl8x1Dv5wULHkN
         ntSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711085744; x=1711690544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBkT1bPm31WEDdS06LUTytpkl4kRVr4AiwT7lqZ+Xi8=;
        b=JwBgP+zvlN+9o8NmSPhHEEhcVjqwvNrm/ZQCWHHrbkytjF2xIflPE2aC/koxiREMcr
         jIadbaOTiv+eanXzWq5y2ipqXolT3n2CIk6gk/APhdp1jwWXqAmTtaKE6zkq+IzCdIlz
         /yc7Fg2yPa5cqVEhApGgeKfO+0Nvm36PSQFZnUizidN95FWp1lumSwFCo+tIR0/qGZ+g
         K1wO87gOOPDkakbSXkRQrA0I3zMwe0igifji7EEQfz3lEks+mEEeSGgF6i9Mya/kUM13
         u6JSw8Uk6aYvJEULzI84p/EsENBkUVfyLxoEBM2FP2ZEZyO5iYHLK5KtmCUGup0WNHu7
         IVFA==
X-Gm-Message-State: AOJu0YyZJ7UeRoAf1aUc5dTOHV/7nBzklvEx9NflOleeSHuhWB2IuzZS
	z63/I8HqUiCZHzqjBo3xNFLjmYTWZzZzhU2oiVD2rSJ/5xiSSFWOOjf3/532
X-Google-Smtp-Source: AGHT+IHVD7E94LjC+47oj9nunDIWCSC6VB9W3tTteBoo51b7ufxTp0byvFsDhIUjyGH0pz9PbeNfWw==
X-Received: by 2002:a05:6a00:1789:b0:6ea:7e5f:3004 with SMTP id s9-20020a056a00178900b006ea7e5f3004mr1964067pfg.20.1711085744342;
        Thu, 21 Mar 2024 22:35:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c44:90a5:d736:e417:90fa:d7d])
        by smtp.gmail.com with ESMTPSA id ey5-20020a056a0038c500b006e6815aa30dsm791675pfb.162.2024.03.21.22.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 22:35:43 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [OE-core][dunfell][PATCH] openssl: Fix CVE-2024-0727
Date: Fri, 22 Mar 2024 11:05:24 +0530
Message-Id: <20240322053524.6008-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 05:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197434

PKCS12 structures contain PKCS7 ContentInfo fields. These fields are
optional and can be NULL even if the "type" is a valid value. OpenSSL
was not properly accounting for this and a NULL dereference can occur
causing a crash.

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../openssl/openssl/CVE-2024-0727.patch       | 122 ++++++++++++++++++
 .../openssl/openssl_1.1.1w.bb                 |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-0727.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-0727.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-0727.patch
new file mode 100644
index 0000000000..3da6879ccb
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-0727.patch
@@ -0,0 +1,122 @@
+Backport of:
+
+From 09df4395b5071217b76dc7d3d2e630eb8c5a79c2 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Fri, 19 Jan 2024 11:28:58 +0000
+Subject: [PATCH] Add NULL checks where ContentInfo data can be NULL
+
+PKCS12 structures contain PKCS7 ContentInfo fields. These fields are
+optional and can be NULL even if the "type" is a valid value. OpenSSL
+was not properly accounting for this and a NULL dereference can occur
+causing a crash.
+
+CVE-2024-0727
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/23362)
+
+(cherry picked from commit d135eeab8a5dbf72b3da5240bab9ddb7678dbd2c)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/d135eeab8a5dbf72b3da5240bab9ddb7678dbd2c]
+
+CVE: CVE-2024-0727
+
+Signed-off-by: virendra thakur <virendrak@kpit.com>
+---
+ crypto/pkcs12/p12_add.c  | 18 ++++++++++++++++++
+ crypto/pkcs12/p12_mutl.c |  5 +++++
+ crypto/pkcs12/p12_npas.c |  5 +++--
+ crypto/pkcs7/pk7_mime.c  |  7 +++++--
+ 4 files changed, 31 insertions(+), 4 deletions(-)
+
+--- a/crypto/pkcs12/p12_add.c
++++ b/crypto/pkcs12/p12_add.c
+@@ -76,6 +76,13 @@ STACK_OF(PKCS12_SAFEBAG) *PKCS12_unpack_
+                   PKCS12_R_CONTENT_TYPE_NOT_DATA);
+         return NULL;
+     }
++
++    if (p7->d.data == NULL) {
++        PKCS12err(PKCS12_F_PKCS12_UNPACK_P7DATA,
++                  PKCS12_R_DECODE_ERROR);
++        return NULL;
++    }
++
+     return ASN1_item_unpack(p7->d.data, ASN1_ITEM_rptr(PKCS12_SAFEBAGS));
+ }
+ 
+@@ -132,6 +139,12 @@ STACK_OF(PKCS12_SAFEBAG) *PKCS12_unpack_
+ {
+     if (!PKCS7_type_is_encrypted(p7))
+         return NULL;
++
++    if (p7->d.encrypted == NULL) {
++        PKCS12err(PKCS12_F_PKCS12_UNPACK_P7DATA, PKCS12_R_DECODE_ERROR);
++        return NULL;
++    }
++
+     return PKCS12_item_decrypt_d2i(p7->d.encrypted->enc_data->algorithm,
+                                    ASN1_ITEM_rptr(PKCS12_SAFEBAGS),
+                                    pass, passlen,
+@@ -159,6 +172,13 @@ STACK_OF(PKCS7) *PKCS12_unpack_authsafes
+                   PKCS12_R_CONTENT_TYPE_NOT_DATA);
+         return NULL;
+     }
++
++    if (p12->authsafes->d.data == NULL) {
++        PKCS12err(PKCS12_F_PKCS12_UNPACK_AUTHSAFES,
++                  PKCS12_R_DECODE_ERROR);
++        return NULL;
++    }
++
+     return ASN1_item_unpack(p12->authsafes->d.data,
+                             ASN1_ITEM_rptr(PKCS12_AUTHSAFES));
+ }
+--- a/crypto/pkcs12/p12_mutl.c
++++ b/crypto/pkcs12/p12_mutl.c
+@@ -93,6 +93,11 @@ static int pkcs12_gen_mac(PKCS12 *p12, c
+         return 0;
+     }
+ 
++    if (p12->authsafes->d.data == NULL) {
++        PKCS12err(PKCS12_F_PKCS12_GEN_MAC, PKCS12_R_DECODE_ERROR);
++        return 0;
++    }
++
+     salt = p12->mac->salt->data;
+     saltlen = p12->mac->salt->length;
+     if (!p12->mac->iter)
+--- a/crypto/pkcs12/p12_npas.c
++++ b/crypto/pkcs12/p12_npas.c
+@@ -78,8 +78,9 @@ static int newpass_p12(PKCS12 *p12, cons
+             bags = PKCS12_unpack_p7data(p7);
+         } else if (bagnid == NID_pkcs7_encrypted) {
+             bags = PKCS12_unpack_p7encdata(p7, oldpass, -1);
+-            if (!alg_get(p7->d.encrypted->enc_data->algorithm,
+-                         &pbe_nid, &pbe_iter, &pbe_saltlen))
++            if (p7->d.encrypted == NULL
++                    || !alg_get(p7->d.encrypted->enc_data->algorithm,
++                                &pbe_nid, &pbe_iter, &pbe_saltlen))
+                 goto err;
+         } else {
+             continue;
+--- a/crypto/pkcs7/pk7_mime.c
++++ b/crypto/pkcs7/pk7_mime.c
+@@ -30,10 +30,13 @@ int SMIME_write_PKCS7(BIO *bio, PKCS7 *p
+ {
+     STACK_OF(X509_ALGOR) *mdalgs;
+     int ctype_nid = OBJ_obj2nid(p7->type);
+-    if (ctype_nid == NID_pkcs7_signed)
++    if (ctype_nid == NID_pkcs7_signed) {
++        if (p7->d.sign == NULL)
++            return 0;
+         mdalgs = p7->d.sign->md_algs;
+-    else
++    } else {
+         mdalgs = NULL;
++    }
+ 
+     flags ^= SMIME_OLDMIME;
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
index 8a53b06862..0e490eabc3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://reproducibility.patch \
            file://0001-Configure-add-2-missing-key-sorts.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2024-0727.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


