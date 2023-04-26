Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39994C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 07:47:57 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2621.1682495267814037999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 00:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QPwMZL+f;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b35789313so4918158b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682495267; x=1685087267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CT2lqoPrp/M6J2RCqBzfBh0SuAfeMYuTV86Up/ghjwY=;
        b=QPwMZL+fi3TacR5lNO2+wvtL0dRAl8rtdo2TJaxP7kwpwYLpAdpeSLFIL6qz/7egKY
         Bm+IQ6BTrmk5MPKmNDmtHWn6iMinoYfz9yvWF/et4wpLyvF4UH3UcezEttm6W5qhWdiV
         9MmhqUcOxBGzicKU+zlnDlikeKusSB/FJ5KzNpKzReVI3vRA1IgMYkqAw++7WQblxGEJ
         rgMnXbYmw3+HzHiX5k1I1+8meGeGzdcyOwKwMwLe4cvieiI1R3s96xtcpXD+xtN0E1eo
         0A3Bky/fcHbnMS0T+0DIXMparelJf0xYE/6me9QzKElz+/gad3s7HqhwZnkCIoYfXv1G
         65eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682495267; x=1685087267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CT2lqoPrp/M6J2RCqBzfBh0SuAfeMYuTV86Up/ghjwY=;
        b=L5+5M76wRN6v4rwNPtW0qG7G52jGMtMUMk4A35lEtB8fX23kFvtOOPew+ZztbOv3XS
         9xavqlSI47GsXRRKa1JvQTGsAn0vwzusyoxvm6W4w1Psw/5lfVxxRMg+1XZ28c4RR4SD
         iD9HRO4E5ghTXDTrAUYJbrlJpqxtx6Yl/rltsfpqxhk1AK0xSnUJwDGSGSF6dPthYr+C
         Ub9mI/IlKE52PJA+4H57ApJkZU+9Rw2+pCtp2q6lYt9ZlrsjxfMYLfd+8KjnirEflJCn
         iUZgmmdtW48Dj0vPzmabrpC6iqAJY5Pcm+bUsz0v5oAZKoTcgpHIX18plxAOgM5kArtk
         sOSA==
X-Gm-Message-State: AAQBX9dQv6GiUhT/0GvpMSYauEITUtjeDDOOztrZEjyCtxk5VljKZpfh
	NLDVJwaN53QX05BrmqK5AMEleefVZ+Jn6g==
X-Google-Smtp-Source: AKy350Z8dKlxaPCyE1s+Y6nBjLAFZRusHsh4Q9R/91Ehifm05bfdAE75ZKBoyP2Efjkqd6JgGs1OOg==
X-Received: by 2002:a05:6a00:1a04:b0:63b:5c82:e21a with SMTP id g4-20020a056a001a0400b0063b5c82e21amr26921049pfv.1.1682495267094;
        Wed, 26 Apr 2023 00:47:47 -0700 (PDT)
Received: from localhost.localdomain ([103.121.155.252])
        by smtp.gmail.com with ESMTPSA id fa23-20020a056a002d1700b006259e883ee9sm8845589pfb.189.2023.04.26.00.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 00:47:46 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [OE-core][dunfell][PATCH 2/3] openssl: Fix CVE-2023-0465
Date: Wed, 26 Apr 2023 13:17:22 +0530
Message-Id: <20230426074723.125714-2-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426074723.125714-1-omkarpatil10.93@gmail.com>
References: <20230426074723.125714-1-omkarpatil10.93@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 07:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180409

From: Omkar Patil <omkar.patil@kpit.com>

Add patch to fix CVE-2023-0465

Link: https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
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
2.25.1


