Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA67BC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 13:07:43 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.5129.1668172062939547911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 05:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WdjGkw3b;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id f27so12519239eje.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 05:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pVLAB/Pd5QXofVCwvis0owWr4Z20Z3Cx+HbWeAhG3c=;
        b=WdjGkw3bU1o6JPnW8GLLHpyOQsqynZpFguL+1BOUaePHaz3ol7vyXoMswf6nUKK0aE
         t3Khaq7JseSbbMidpQs7D8Rg/NW7GHD73S0UNg6rJ/5SVJlYM3BpGKCPtzJVtr6TgsNd
         ftPkpHF+TuF7N0dnplY3tT0MWscL1RZRIZhW5qWauaTZeabKX3XZY9hpkIyomNF0cTok
         rLRYUJhhlTIEYgU9HexklxddZu0SsSRXdDHYgBF8PG3ngLlZi/nPvjmWG34CxWGYrAJS
         PpeiIBRKlOphJN0eVgoOmV5uJFcsMATVUj78MblZsgxad68aqLIlb7Ck8TrPinTMWv99
         gu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pVLAB/Pd5QXofVCwvis0owWr4Z20Z3Cx+HbWeAhG3c=;
        b=UAVmM1/KGod2ZBlqhgQw64PnuxLey2DgC8You13L+NMRq3IZXUrprdAUgijUdEvgc8
         RKLmCZS6JBjwTEddsu8kdbnZDBNrVqhw9tQGxBSqsPQPtHGPud2b9sXfeLaGfLoxfepv
         DMizivOeYsrn7ru7Fws5nKIq1Gn6pn+sBgcgK9qSJYrqyjru1vlIbC46m5xt7NKWk8HF
         YhQc0dalNDuwhaxO0ysT9AdLDrw3Mwilp2oloB7K8a7WDzFc8SIWbvm7TkWJTqzoLuGp
         N5lwVm6CTqqmystHXvApsUECYLg1K8M4bl8m5dICE9Ry0GkXzvViEnRtm3bf8StDvD3D
         GOsA==
X-Gm-Message-State: ANoB5pk5vHJ7txd/MjnPowp29Mzi57rLcC+kArT0UFYdstrTBtXz/U3K
	v8gtvgY0rWvECCJaiNRbIw8ql/FJsn4=
X-Google-Smtp-Source: AA0mqf6QJaU2lC8vLSJdg8g8sQkGS2jDYdkx8CRMsVzp4rCDlRjknz80tQbHMbnUGJXVHtrCJuTQfQ==
X-Received: by 2002:a17:906:4dc2:b0:7ae:50c6:fd0a with SMTP id f2-20020a1709064dc200b007ae50c6fd0amr1759268ejw.184.1668172060961;
        Fri, 11 Nov 2022 05:07:40 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id et19-20020a170907295300b007ad2da5668csm858676ejc.112.2022.11.11.05.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 05:07:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][dunfell][PATCH v2] openssl: upgrade 1.1.1q to 1.1.1s
Date: Fri, 11 Nov 2022 13:06:32 +0000
Message-Id: <20221111130631.26829-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 13:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173127

Major changes between OpenSSL 1.1.1r and OpenSSL 1.1.1s [1 Nov 2022]
* Fixed a regression introduced in OpenSSL 1.1.1r not refreshing the
  certificate data to be signed before signing the certificate.

Major changes between OpenSSL 1.1.1q and OpenSSL 1.1.1r [11 Oct 2022]
* Added a missing header for memcmp that caused compilation failure on
  some platforms

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Add missing Signed-off-by.

 .../openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
index 139b7fe9353a..6c8f28599610 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca"
+SRC_URI[sha256sum] = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.35.1


