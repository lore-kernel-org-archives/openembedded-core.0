Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DBBC77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 07:47:57 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2649.1682495272329777637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 00:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=S1COF9tI;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b5465fc13so5398115b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682495271; x=1685087271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no1JO+vKtH4vjstBkntgTJCzC40+uegIJjyjVFNAoVg=;
        b=S1COF9tIiQlsebUTKp1GxU/SGRjZCy1OzcXfIC6LhB44XcKaOPkJLq637q+5hP5S+F
         6NMPMLieOGUrR3oUM9Nr5ciXe0KFKcwtTV5Xeyq+EkNes6e8o/Fe8BRazONmxXwAPaKG
         ROH6K55t7B92xzNmHAj98hMeOLJ1cb2TV/X2MxOwol61idxnbIS5QwZaED7JWUL9xR6g
         xY6ruzpAvSLCl10IWkhq5yDpv9QhQLfOyK/LFPoE6Dwh4dC7CsnHaSyAeN9aCoV5tv8u
         6X1X9vyBh/DK1VTWKeP5K9xdDjydBbMJ7zt4kLGNLyzWoYcZZZQc1kr4eL7REB9uH1ci
         ABVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682495271; x=1685087271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no1JO+vKtH4vjstBkntgTJCzC40+uegIJjyjVFNAoVg=;
        b=fsw7Vd/2alwjmje9VQ72njxx90AP/Hh26q9oELABYIcWRcN8gD4t39QyBy7HOZEMBN
         uxDxqwgk1rAhIM1QZ7mV4khsG2KiLIza5Out4bkAgbdSylyzz+zFyaQuZQ2SvsI22wUX
         QyX33W67T/bnTAEfoENIPQbFmDJYOP+pTQk1jjPynEilA4ykFcJ7qzaApsotT5fGaa+f
         SAjNXRkBbvGpaz34r+BJKm7eXxXzs8mn4/+vd7bhrjPVnHu0+sKtY4mu7x4fsm6T2glV
         aEPK0qPtm7E3q+yK8iqb30ufw/SlMzBMB/UttLSvH0KBmY7ObcdRtXhOPKOcE2ce/J86
         5Oqw==
X-Gm-Message-State: AAQBX9eTWtsvqmQ80X8VR8rcgrU/O9FNHkyYaBR8POPid9QbwPk9kMUc
	yj/ZB5V/gwJXOh88wmnaIwhCDB78/ArGNw==
X-Google-Smtp-Source: AKy350aB0kLt/dK1J85YZYBC4TZuZIw1yG6KNDHotuUbRmaeggnPSeeyWeKOdbm+STTjcaGv+HkIig==
X-Received: by 2002:a05:6a00:2448:b0:63b:7a55:ae89 with SMTP id d8-20020a056a00244800b0063b7a55ae89mr25839748pfj.27.1682495271548;
        Wed, 26 Apr 2023 00:47:51 -0700 (PDT)
Received: from localhost.localdomain ([103.121.155.252])
        by smtp.gmail.com with ESMTPSA id fa23-20020a056a002d1700b006259e883ee9sm8845589pfb.189.2023.04.26.00.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 00:47:51 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [OE-core][dunfell][PATCH 3/3] openssl: Fix CVE-2023-0466
Date: Wed, 26 Apr 2023 13:17:23 +0530
Message-Id: <20230426074723.125714-3-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426074723.125714-1-omkarpatil10.93@gmail.com>
References: <20230426074723.125714-1-omkarpatil10.93@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 07:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180410

From: Omkar Patil <omkar.patil@kpit.com>

Add patch to fix CVE-2023-0466

Link: https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../openssl/openssl/CVE-2023-0466.patch       | 82 +++++++++++++++++++
 .../openssl/openssl_1.1.1t.bb                 |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
new file mode 100644
index 0000000000..f042aa5da1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
@@ -0,0 +1,82 @@
+From 0d16b7e99aafc0b4a6d729eec65a411a7e025f0a Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Tue, 21 Mar 2023 16:15:47 +0100
+Subject: [PATCH] Fix documentation of X509_VERIFY_PARAM_add0_policy()
+
+The function was incorrectly documented as enabling policy checking.
+
+Fixes: CVE-2023-0466
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/20564)
+
+CVE: CVE-2023-0466
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a]
+Comment: Refreshed first hunk from CHANGE and NEWS
+Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
+
+---
+ CHANGES                                  | 5 +++++
+ NEWS                                     | 1 +
+ doc/man3/X509_VERIFY_PARAM_set_flags.pod | 9 +++++++--
+ 3 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index efccf7838e..b19f1429bb 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -9,6 +9,11 @@
+ 
+  Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
+ 
++  *) Corrected documentation of X509_VERIFY_PARAM_add0_policy() to mention
++     that it does not enable policy checking. Thanks to
++     David Benjamin for discovering this issue. (CVE-2023-0466)
++     [Tomas Mraz]
++
+   *) Fixed X.400 address type confusion in X.509 GeneralName.
+ 
+      There is a type confusion vulnerability relating to X.400 address processing
+diff --git a/NEWS b/NEWS
+index 36a9bb6890..62615693fa 100644
+--- a/NEWS
++++ b/NEWS
+@@ -7,6 +7,7 @@
+ 
+   Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
+ 
++      o Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-2023-0466)
+       o Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
+       o Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
+       o Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
+diff --git a/doc/man3/X509_VERIFY_PARAM_set_flags.pod b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+index f6f304bf7b..aa292f9336 100644
+--- a/doc/man3/X509_VERIFY_PARAM_set_flags.pod
++++ b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+@@ -92,8 +92,9 @@ B<trust>.
+ X509_VERIFY_PARAM_set_time() sets the verification time in B<param> to
+ B<t>. Normally the current time is used.
+ 
+-X509_VERIFY_PARAM_add0_policy() enables policy checking (it is disabled
+-by default) and adds B<policy> to the acceptable policy set.
++X509_VERIFY_PARAM_add0_policy() adds B<policy> to the acceptable policy set.
++Contrary to preexisting documentation of this function it does not enable
++policy checking.
+ 
+ X509_VERIFY_PARAM_set1_policies() enables policy checking (it is disabled
+ by default) and sets the acceptable policy set to B<policies>. Any existing
+@@ -377,6 +378,10 @@ and has no effect.
+ 
+ The X509_VERIFY_PARAM_get_hostflags() function was added in OpenSSL 1.1.0i.
+ 
++The function X509_VERIFY_PARAM_add0_policy() was historically documented as
++enabling policy checking however the implementation has never done this.
++The documentation was changed to align with the implementation.
++
+ =head1 COPYRIGHT
+ 
+ Copyright 2009-2020 The OpenSSL Project Authors. All Rights Reserved.
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 254cc9bc8d..46875b525c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://reproducibility.patch \
            file://CVE-2023-0464.patch \
            file://CVE-2023-0465.patch \
+           file://CVE-2023-0466.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


