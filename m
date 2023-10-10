Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041A8CD8C89
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:15:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.92780.1696947290751190338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CPVf4EKK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso4394039b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947290; x=1697552090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv7H8PA0jQifegX9fbOzkj1W7Cx5S6QlfqZJ9OfUDks=;
        b=CPVf4EKKnSZixIGftSUmh6AGEY3Gp7t6ZVgshsVnIa4ZyIwqNIA/PT8ppYN1NcyYSe
         sFPKSWwyAsaLv7k36lDrK3LgRrYAWPhSKLZQEUOooE3JCRUbauYaMg9n/qKJFUfR5m4d
         J+lv+QtaoAfxQxu2SbR4DiiMRRbyvX8V/Z9OiNfL9JipQ0YgDJ2eBjWLcm2wznUykYhV
         jbhRjRsM6ByBQd3AEO7V7LZuWTIgSUAlxxy/rOdsZ6nJC/2ZunecwAEkAZiOMLB0Sy6p
         7j46/GHrGDq2JGPt2ceDljpv+eeWltycDVXrZRcF/oewi6DqbebyoUH1fYNiUr90biM2
         1FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947290; x=1697552090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv7H8PA0jQifegX9fbOzkj1W7Cx5S6QlfqZJ9OfUDks=;
        b=LIiQoxYqGPVWuANX3IkL7nsriEazAJJ+K5z0jGXWyZ4IFl+/INq+5f2l/G3rvbZhEd
         MBfOBDQEZW01g2WP0xveStXLzOtSFeBPaFMz6cUr1NQX8FlWVmidg3fOAB4G/1YB22C6
         lRrXHCtWTXf5eXXGshNTaAlZMt8K/+hCz7lQhnbQLSF7ct7G/QpxOzj/gHEdQHbT1MeQ
         3WAyrXOgmnclqRCCM/07etwPKi3AF8RUn2oNWEW2bscMebLUtQPpVla2JolBX9Q0sk9o
         niz8fzpn1hQwcVTVWaGZFggVplTMOcFUAsYzw1sb4VrSib1kVCYe82Bk7TnEHp3c5hNm
         91YQ==
X-Gm-Message-State: AOJu0YxV+XoBs2eZqzkTSpzKvmNFaS1azSBUuW2+HNn/eDwG2l8Gs84Y
	tRxlqqGXIUnuFCkxoaMquP8MAD4O7AV78cKXILE=
X-Google-Smtp-Source: AGHT+IHQi3upMIZAl/5fiZwuXmMxfFvEucBWatRNyqnhu60pBRvIMHErYDRXywYbymJ6cdLDr8v4Cg==
X-Received: by 2002:a05:6a21:62a:b0:164:e94b:d3ae with SMTP id ll42-20020a056a21062a00b00164e94bd3aemr15376045pzb.54.1696947289825;
        Tue, 10 Oct 2023 07:14:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] openssl: Upgrade 1.1.1v -> 1.1.1w
Date: Tue, 10 Oct 2023 04:14:27 -1000
Message-Id: <79b29a5f77efab978f6a2918d02ee611638aef85.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188908

From: Sourav Pramanik <sourav.pramanik@kpit.com>

https://www.openssl.org/news/openssl-1.1.1-notes.html

Major changes between OpenSSL 1.1.1v and OpenSSL 1.1.1w [11 Sep 2023]

* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
index d1222dc470..8a53b06862 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1w.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "d6697e2871e77238460402e9362d47d18382b15ef9f246aba6c7bd780d38a6b0"
+SRC_URI[sha256sum] = "cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


