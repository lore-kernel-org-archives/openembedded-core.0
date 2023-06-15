Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC041EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 09:03:50 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13856.1686819820320024869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 02:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=WGGU29sP;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666a63f7907so187614b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 02:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686819819; x=1689411819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOYoFVKzsfwm0dnK9t1n7sGZrNR+WsmO2re/+jxogfg=;
        b=WGGU29sPNrKs5LlIfMICqDUpviTVqQsAoN7c1DvVUVv38ju+uaxkJ5UiDOCVe0lnBM
         j1ybeqwcX2S3m8bNttFbfD4d4ZkmRbzaRT/4AxB9vJPZFTbsgWfNzvi8cCWEnzAO/s9y
         i2Aqn+SzLaxyR0aRHQZoqk6nlxdlbxJOlpHcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686819819; x=1689411819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOYoFVKzsfwm0dnK9t1n7sGZrNR+WsmO2re/+jxogfg=;
        b=cp9ykgUq7IcCxknkBvLxrTPvtSYu9lYuvPZJ2mtyrSknHYWbEMPLSD3adUXTvuZnC6
         sGUxFw4MguWJMWvxOrEXWHrGXFCJhdKLiZ4J3YkqKbuM5NJ7qxIymh/4y2DsT7ZcFHJg
         jIJvcZupNeJ8W5JZc72jg2pVNHODlRH1KqU7RQc3Py14M9fS3pMsAgfGhw1SE+fIqwdd
         pXJLoY3YJg1A1r+C2vPFbOH4gE9Y+yWvmNFr9Sq1106eL66dtHfKSm6jB/B4ZunkqeGL
         VOafapr/Bk4EnVobtwK+s1geN/XmT/a93eeKBm69AaxFtOqs4+o/+9kHRkfLtygo5Ikl
         65Ig==
X-Gm-Message-State: AC+VfDycPd9PO5tghRFWFyiS3KJRfWk2jPbN/FfQCHrUYxwHu9CrJ6JI
	R7CQx4HeiS0x8MQkntDysy5pZYwN0t4rsUtTAzE=
X-Google-Smtp-Source: ACHHUZ42Lo7RJWK1EQRePu193fIXx+f+PIguVBlG3StGL/iw1BzLaPthG3QrQuF4XhYzPq3nk2yD1Q==
X-Received: by 2002:a05:6a20:840e:b0:119:beb0:9ac0 with SMTP id c14-20020a056a20840e00b00119beb09ac0mr5049961pzd.60.1686819819284;
        Thu, 15 Jun 2023 02:03:39 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.156])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090300d500b001acad024c8asm9918736plc.40.2023.06.15.02.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 02:03:38 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 15 Jun 2023 14:33:33 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] openssl: CVE-2023-2650 Possible DoS translating ASN.1 object identifiers
Date: Thu, 15 Jun 2023 14:33:31 +0530
Message-Id: <20230615090331.925282-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 09:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182841

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/9e209944b35cf82368071f160a744b6178f9b098

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


