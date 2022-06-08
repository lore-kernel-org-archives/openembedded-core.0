Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF03CCA47E
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:09 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.7343.1654699624110948426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qgwGArur;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so24035355pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BseSV7871XtV/Y5Abb6qF+PpSk75OVCq0QULBq+KGHo=;
        b=qgwGArurmm+LK3iIeAFkedq7bmZaSsqZBIjPvZe1zQjaKdYxvWMMxKJjC7AuZOcEpT
         IyAcNPF41283GhyD2pZO+O0A5eu4h3RXgTRJxu2wniq1ROnnmJmhlOtaDaO/vJQzrB0c
         Dqluyok7D9TyLg3lga67lAvKVKujhmO9ZHeet55PnnLhgic6uuHvC6efOSKcn3MEXj+f
         CeKUCbBVkgcDsYv0sXKfJCVRhowZy8is+E0DW4sf5GlRvlkMw+96w+fJCGHGJEljtpHx
         eUm0w+08IoyJA+EQCbMo5odd0sqn+apSl8aQkjgg6Fi/2n3cjLxybhnBh0GfzZvuXpYw
         PC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BseSV7871XtV/Y5Abb6qF+PpSk75OVCq0QULBq+KGHo=;
        b=BlnkwhykCwNenkoHOp+9MCWR2kPZMtlbnZS9KDAMPU9285cQYgyyuaiVdTUIS5dkCx
         odMPF2Wsqs179pPdi8kUUVIqsHhFYLRMo6zqozu/2kMTDkSvA+ivl+PLVypECR9KoEBm
         gnD/WsY4m/A+l6HluMrCY/wXQ3EJqaMndzjrPay1q0eSfF6mmp1tN3jqR7E8jVa4xufe
         3g2k1mE5y6qAvPmK8iFdKh5v3cJt72QAAzQ545PrainIz9oTbD5uoEuydtlt+f3/Urg3
         NJfXpNGdsWaOiS6oZz4E/6YxYbxTouhxKIk4yojXar40+UTRTXezP/AKKLOQcEaBEu2t
         6m1w==
X-Gm-Message-State: AOAM533EpEfFI/wkTeGReliQLEzTPiCHbYHZxoPck76OHU0g45WWP1MB
	5H41TCQz/jERaIIbQXj8KCaf+wdU0Zfzpzx9
X-Google-Smtp-Source: 
 ABdhPJw3CqsgRqal6CcKhKwegrPE8hAkDyqyyZH/AxOOKgMaX5TwKeqGcntvY2f6V8xAIvoS/tErQA==
X-Received: by 2002:a17:90b:4a12:b0:1e3:15ef:81e1 with SMTP id
 kk18-20020a17090b4a1200b001e315ef81e1mr52658274pjb.246.1654699623109;
        Wed, 08 Jun 2022 07:47:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] openssl: update the epoch time for ct_test
 ptest
Date: Wed,  8 Jun 2022 04:46:27 -1000
Message-Id: 
 <3af161acc13189cb68549f898f3964d83d00ce56.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166738

We are getting an additional ptest failure after fixing the expired certificates.

Backport a patch from upstream to fix this.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...611887cfac633aacc052b2e71a7f195418b8.patch | 29 +++++++++++++++++++
 .../openssl/openssl_1.1.1o.bb                 |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch b/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
new file mode 100644
index 0000000000..832f651660
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
@@ -0,0 +1,29 @@
+From b7ce611887cfac633aacc052b2e71a7f195418b8 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Wed, 1 Jun 2022 13:06:46 +0200
+Subject: [PATCH] ct_test.c: Update the epoch time
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/18446)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/b7ce611887cfac633aacc052b2e71a7f195418b8]
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ test/ct_test.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/ct_test.c b/test/ct_test.c
+index 78d11ca98cf7..535897d09a77 100644
+--- a/test/ct_test.c
++++ b/test/ct_test.c
+@@ -63,7 +63,7 @@ static CT_TEST_FIXTURE *set_up(const char *const test_case_name)
+     if (!TEST_ptr(fixture = OPENSSL_zalloc(sizeof(*fixture))))
+         goto end;
+     fixture->test_case_name = test_case_name;
+-    fixture->epoch_time_in_ms = 1473269626000ULL; /* Sep 7 17:33:46 2016 GMT */
++    fixture->epoch_time_in_ms = 1580335307000ULL; /* Wed 29 Jan 2020 10:01:47 PM UTC */
+     if (!TEST_ptr(fixture->ctlog_store = CTLOG_STORE_new())
+             || !TEST_int_eq(
+                     CTLOG_STORE_load_default_file(fixture->ctlog_store), 1))
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
index b306414776..e24467739f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://reproducible.patch \
            file://reproducibility.patch \
            file://73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch \
+           file://b7ce611887cfac633aacc052b2e71a7f195418b8.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


