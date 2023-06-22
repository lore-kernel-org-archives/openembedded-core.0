Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD57EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.14620.1687447918361253188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NUfQzfk+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6686c74183cso4682886b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447917; x=1690039917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1h1CIURTmlNiYZ0eutmJzlOWuaQRwPKhdJdS96c12g=;
        b=NUfQzfk+jnj1NFYh4TE1wng29wnOv9qiSLvRWk/WraX4HmX6KmYX0tYsqtdNyRwD98
         ZOeqAPbdotdLlZoO3sx4s+pYobP3nNLzQgErDlrwIqRYyaUOz4UOqi6z8JnI2GrS5eb4
         4yCS8t4agdC3o9/yGerfg/zKjrI5l1ERVPqisyFixorTsD7NQZ5h+78xFnNbxke1+hVB
         gbAHbCPh/wuHHkhQN/HgaJAIXd/VpzLEBllHW2wPzfqGPJRbB8jF4QVbwrQenP7/O9QG
         jcij8+UMdd9Gjd6yMIinN0EBSYuy9CYn9csz74sJf1TvkNgSqgIZZMMMKu9gvfB6sqZ1
         1LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447917; x=1690039917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1h1CIURTmlNiYZ0eutmJzlOWuaQRwPKhdJdS96c12g=;
        b=k5VnpitDYLdLWRTb/UMHHSl27qCf3IL1Qn60FSqIIHgoeWbZDkzqQcEdY5eyM73Efd
         7jKlwfZIDPH0t0YdCC/ZkSdB610aecEVAv9wStVUt/IVdAHdHUn2YeNvvyDlydAbBIl4
         cXp+Zk/foPNB6ADPgCjVox54lKOYpDHsuZNBUhX6ryHGQzmwxnZ0m28y63LJgMu+ZE+x
         tszjPijLki51tvACfi0Y8w3jS6UJNPi7TNxtTMy8OEbrjI/Bqhniy5sRU0L8dZITZRpn
         unWQPD5cBD+uSRDTm5pf3Eom9fhTfM7JUeEpizWm6o39r4S7JFWbmmMi2xBjeAWMIpPD
         R8sA==
X-Gm-Message-State: AC+VfDwUYrBA04GAvwwhRJ7NXHkBxghpQL13NPaRXwMULxbjn2DOswPT
	HlaRRG2i3XOLLtfaXMRCAFVf6vFl9Cfrpg82Rxc=
X-Google-Smtp-Source: ACHHUZ4iXSuhohLT6ZKK7omN9Fe4JICRKp6SncmL+ToyQz8s9f1VtMkam8p9/1K6f6Q06dB5m0lmow==
X-Received: by 2002:a05:6a00:22c4:b0:667:525c:de3b with SMTP id f4-20020a056a0022c400b00667525cde3bmr21409761pfj.31.1687447917285;
        Thu, 22 Jun 2023 08:31:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.31.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:31:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] openssl: CVE-2023-2650 Possible DoS translating ASN.1 object identifiers
Date: Thu, 22 Jun 2023 05:31:31 -1000
Message-Id: <8a9d188b4d838bbbf8aab14fad1ee5aaadb86621.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183249

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/9e209944b35cf82368071f160a744b6178f9b098

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-2650.patch       | 122 ++++++++++++++++++
 .../openssl/openssl_1.1.1t.bb                 |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
new file mode 100644
index 0000000000..ef344dda7f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
@@ -0,0 +1,122 @@
+From 9e209944b35cf82368071f160a744b6178f9b098 Mon Sep 17 00:00:00 2001
+From: Richard Levitte <levitte@openssl.org>
+Date: Fri, 12 May 2023 10:00:13 +0200
+Subject: [PATCH] Restrict the size of OBJECT IDENTIFIERs that OBJ_obj2txt will
+ translate
+
+OBJ_obj2txt() would translate any size OBJECT IDENTIFIER to canonical
+numeric text form.  For gigantic sub-identifiers, this would take a very
+long time, the time complexity being O(n^2) where n is the size of that
+sub-identifier.
+
+To mitigate this, a restriction on the size that OBJ_obj2txt() will
+translate to canonical numeric text form is added, based on RFC 2578
+(STD 58), which says this:
+
+> 3.5. OBJECT IDENTIFIER values
+>
+> An OBJECT IDENTIFIER value is an ordered list of non-negative numbers.
+> For the SMIv2, each number in the list is referred to as a sub-identifier,
+> there are at most 128 sub-identifiers in a value, and each sub-identifier
+> has a maximum value of 2^32-1 (4294967295 decimal).
+
+Fixes otc/security#96
+Fixes CVE-2023-2650
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/9e209944b35cf82368071f160a744b6178f9b098]
+CVE: CVE-2023-2650
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ CHANGES                  | 28 +++++++++++++++++++++++++++-
+ NEWS                     |  2 ++
+ crypto/objects/obj_dat.c | 19 +++++++++++++++++++
+ 3 files changed, 48 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES b/CHANGES
+index 1eaaf4e..f2cf38f 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -7,7 +7,33 @@
+  https://github.com/openssl/openssl/commits/ and pick the appropriate
+  release branch.
+ 
+- Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
++ Changes between 1.1.1t and 1.1.1u [xx XXX xxxx]
++
++  *) Mitigate for the time it takes for `OBJ_obj2txt` to translate gigantic
++     OBJECT IDENTIFIER sub-identifiers to canonical numeric text form.
++
++     OBJ_obj2txt() would translate any size OBJECT IDENTIFIER to canonical
++     numeric text form.  For gigantic sub-identifiers, this would take a very
++     long time, the time complexity being O(n^2) where n is the size of that
++     sub-identifier.  (CVE-2023-2650)
++
++     To mitigitate this, `OBJ_obj2txt()` will only translate an OBJECT
++     IDENTIFIER to canonical numeric text form if the size of that OBJECT
++     IDENTIFIER is 586 bytes or less, and fail otherwise.
++
++     The basis for this restriction is RFC 2578 (STD 58), section 3.5. OBJECT
++     IDENTIFIER values, which stipulates that OBJECT IDENTIFIERS may have at
++     most 128 sub-identifiers, and that the maximum value that each sub-
++     identifier may have is 2^32-1 (4294967295 decimal).
++
++     For each byte of every sub-identifier, only the 7 lower bits are part of
++     the value, so the maximum amount of bytes that an OBJECT IDENTIFIER with
++     these restrictions may occupy is 32 * 128 / 7, which is approximately 586
++     bytes.
++
++     Ref: https://datatracker.ietf.org/doc/html/rfc2578#section-3.5
++
++Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
+ 
+   *) Corrected documentation of X509_VERIFY_PARAM_add0_policy() to mention
+      that it does not enable policy checking. Thanks to
+diff --git a/NEWS b/NEWS
+index a86220a..41922c4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -7,6 +7,8 @@
+ 
+   Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
+ 
++      o Mitigate for very slow `OBJ_obj2txt()` performance with gigantic
++        OBJECT IDENTIFIER sub-identities.  (CVE-2023-2650)
+       o Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-2023-0466)
+       o Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
+       o Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
+diff --git a/crypto/objects/obj_dat.c b/crypto/objects/obj_dat.c
+index 7e8de72..d699915 100644
+--- a/crypto/objects/obj_dat.c
++++ b/crypto/objects/obj_dat.c
+@@ -428,6 +428,25 @@ int OBJ_obj2txt(char *buf, int buf_len, const ASN1_OBJECT *a, int no_name)
+     first = 1;
+     bl = NULL;
+ 
++    /*
++     * RFC 2578 (STD 58) says this about OBJECT IDENTIFIERs:
++     *
++     * > 3.5. OBJECT IDENTIFIER values
++     * >
++     * > An OBJECT IDENTIFIER value is an ordered list of non-negative
++     * > numbers. For the SMIv2, each number in the list is referred to as a
++     * > sub-identifier, there are at most 128 sub-identifiers in a value,
++     * > and each sub-identifier has a maximum value of 2^32-1 (4294967295
++     * > decimal).
++     *
++     * So a legitimate OID according to this RFC is at most (32 * 128 / 7),
++     * i.e. 586 bytes long.
++     *
++     * Ref: https://datatracker.ietf.org/doc/html/rfc2578#section-3.5
++     */
++    if (len > 586)
++        goto err;
++
+     while (len > 0) {
+         l = 0;
+         use_bn = 0;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 46875b525c..75fc3c5c1a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://CVE-2023-0464.patch \
            file://CVE-2023-0465.patch \
            file://CVE-2023-0466.patch \
+           file://CVE-2023-2650.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.34.1


