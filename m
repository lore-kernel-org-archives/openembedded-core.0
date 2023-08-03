Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B12DEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.15499.1691071482127011301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LAQYfml8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68706b39c4cso672342b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071481; x=1691676281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3DgI0JCdOiilUJTej6pxpsctXSEqGfNT1ReRsOTsl4=;
        b=LAQYfml8EylqEqghhw04S5YiIPLrZ8ioiUB04yKP/ocAbuQYSn9Nj/OjZuzVG1/mWp
         HGUD5nzCgjspjVmv9e2bhbPGufQlJxw7EFTEkMcLx9lgShpkC4jMz2wKNluIMdowHB+1
         Wbg9fRc77r7MxmJlAP6DrjOCLGTJFwxShUKMTYh8rja8CjFnUN+vyYgqmGbZOkOGIFMe
         TaPsvA9feWR4bIiKqSWw8wueTZIyBcOezlUNzzqSEbVA1r312DGLgCP9rmrflRXSGvFJ
         /eNgEIkdALlV0FoftdQkwV+a1m5xn3Fu2Fa6mcgzgXxJV9f7H48aNpwyYbhHRrfsXmBt
         DUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071481; x=1691676281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3DgI0JCdOiilUJTej6pxpsctXSEqGfNT1ReRsOTsl4=;
        b=Enj3MZuc/PrZnOGYPdxv8UbGVrB5Tw1RQsJT8xQg9X2Bhq8CBBDfxyYTgWf+c5r1Ya
         sUnuQWH1LL9zgnBLYLjQXVmknpfL8VUYD3hkx+fUNOABByXNw8cqhtHTDwGZxi8wwoGY
         +xcXv/bFrmM5wq5EYMibOvVw154xqiAaJ1w+EpWGKc7f0xa9Tz3mHosbd7MxPfcCHVh4
         wzdlfYqTXO11kQT0v8MPe6xV+R9Ca4jvwzm4MF4acQ7hQrxywLEULioYF8V5tjBoTLND
         8aboeiAEqIuLC4/2XW1/jXtJcHTt+TlBhejaLVwHNyZvulk4SqHfQXUevCGimdZpjLOq
         94Ew==
X-Gm-Message-State: ABy/qLYHuKXcOYGSL0wzbnUsJWXHOerfjvVS3KKWGeSEKiEvqqCBO4WJ
	2OTizyOWDJ16AyKCuUZXowl9fb2eEjixdDhxeS4=
X-Google-Smtp-Source: APBJJlG234VNZkx2RG0ebEP0+tuB3BUVk2Y+7OyGggOnRZqvulkdCJD9JKnI28bSqDCsW8PXYTFCZA==
X-Received: by 2002:a05:6a00:a0f:b0:686:2ad5:d11c with SMTP id p15-20020a056a000a0f00b006862ad5d11cmr21543432pfh.33.1691071480983;
        Thu, 03 Aug 2023 07:04:40 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] openssl: Upgrade 3.0.9 -> 3.0.10
Date: Thu,  3 Aug 2023 04:04:14 -1000
Message-Id: <94ce10791ce10aa30d3a3bdef53f9b2f3c1b331a.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185489

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-309-and-openssl-3010-1-aug-2023
Major changes between OpenSSL 3.0.9 and OpenSSL 3.0.10 [1 Aug 2023]
* Fix excessive time spent checking DH q parameter value (CVE-2023-3817)
* Fix DH_check() excessive time with over sized modulus (CVE-2023-3446)
* Do not ignore empty associated data entries with AES-SIV (CVE-2023-2975)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.9.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.10.bb
index 9738d36902..c770f1c712 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "eb1ab04781474360f77c318ab89d8c5a03abc38e63d65a603cabbf1b00a1dc90"
+SRC_URI[sha256sum] = "1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


