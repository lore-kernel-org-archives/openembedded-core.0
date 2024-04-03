Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA91CD1284
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.2637.1712113927791351144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0GuqD1Ao;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so5563546b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113927; x=1712718727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNLdOP103RakbK13QbizlDENfAV05Dv7vHxjTVr7tRE=;
        b=0GuqD1AoCZNRKh8Qn5x9TgMwKB1RG98NItTZAugDegPvs8iey5isdYyYulaiQ3DXAm
         7dVuzz9qUQevPltcpvK/OCAKJ+oEtBDzaF0PXCA/gwWJwT3/tu2NTavjlC1W+eG/HjZf
         mUYITs1sk5CgeGuCzAivKj9+gUU3FtS5H/2fPsGtFfWMcWHAo68a+wg5dWoAPHQTps1R
         BYcItdhy/YjbODt0I2K1a6Hm/cnn7vHInKZQ3gMeyE70ESFgIEF9rsgBpxi+cOtojRSk
         OA8BVgvg0slHPOUxxFOfsJIUOlb7Ypz3JuaH/NdfPd485gAsjhCyHLfAyhPNbg9/Mn5a
         tGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113927; x=1712718727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNLdOP103RakbK13QbizlDENfAV05Dv7vHxjTVr7tRE=;
        b=aoRmVbM/3+G2e8pZk28AvNzpcY8Nyix4sw+CXetCVpn945mM2qh6+LW0Pr27Emtv1U
         o8B/mkgk4HBCo/TRqtn9HQrA+ovfaajuT8C97HTOJ13P1kIO0LLFHp/anq+enFag9fN4
         3BXE8mBoGAlEQ+AN0+qOgnUqSdpgIqHcnwa5qgnkFqH6/BIH3njYcf9L73lUvTDHxzlg
         K2aSABGylMcglFrGYQy++Y+vVvBGYrRYR1dRXWjZWXOqizrwoCaWKkdQYb5aUnhvrDQb
         h/BwhivJPOInNVtbNaJVzzuME+indMD24M1JOBmjNevnT0K31nIDJvuAjhVfO9tPlzga
         ReaQ==
X-Gm-Message-State: AOJu0Yz8z6MvXDNOXvZKGF1GOFXazObcRHOLyNmrCa0csSewKNT0sUDV
	pTj6e7Wgu80D3hOxegodWw+EZjmvRzAOy8i3oqrXWPFKv67KcG+M8DcB1Gda45cnHuGWry62T7L
	16AY=
X-Google-Smtp-Source: AGHT+IGQcowzRlBO3S/ndglPhhwCssZQknnAGKRi/Q0lNN9ZthgTQYerTRIeGNPGjV0YIJ+HaoHwYg==
X-Received: by 2002:a05:6a00:4f93:b0:6e6:f9b6:4b1a with SMTP id ld19-20020a056a004f9300b006e6f9b64b1amr16849479pfb.11.1712113927004;
        Tue, 02 Apr 2024 20:12:07 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:12:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] openssl: Fix CVE-2024-0727
Date: Tue,  2 Apr 2024 17:11:50 -1000
Message-Id: <18eb56925878a67ca1d7ce3eb9092f611023bc23.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712113689.git.steve@sakoman.com>
References: <cover.1712113689.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197890

From: virendra thakur <thakur.virendra1810@gmail.com>

PKCS12 structures contain PKCS7 ContentInfo fields. These fields are
optional and can be NULL even if the "type" is a valid value. OpenSSL
was not properly accounting for this and a NULL dereference can occur
causing a crash.

Signed-off-by: virendra thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


