Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91ABECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 19:33:23 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.981.1666985599405622490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 12:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DFT9gdCV;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id f27so15320621eje.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 12:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui38L1I9EB8ANeH3eKJ5H9vwqm/Ij9pFcU9CsdFbRKY=;
        b=DFT9gdCVlA+fmGhGCs7zY3GsN9b3++2dwU8bViyQrSPp362oeBleHb/15Yzz1LE52k
         mSSS8BkMv/CxyT23eCPEAS/rc7ALozpfW03uIePPYFVf8ojiMi3H5Ce6kKgDY2aNwlux
         AhpvcH6dz4DTMTHFxY1BAolDv3+pISyukEUWxtm8b7yuwE5vu0Bxw2P8YbuMj99H+xvt
         +2B5uVkCiWc5lsk7PlVCbfO7xDA1Bl9P2rZeAfd6YYO7hZxojVHvtY4VCnC7mGTfGChm
         O1PnbIYCPcWyTW9FfU6XA+l+TcF2+c/J52TUusch/7O/dKXAuYCZmkVvo9QZOkzUKCf/
         N5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui38L1I9EB8ANeH3eKJ5H9vwqm/Ij9pFcU9CsdFbRKY=;
        b=rUqR1ZmyMgr4aM3BmRudQStGkqJO953Npzl6JD76p6dtR98Dx3YEOHEau40qDbavtB
         DjfWptMmQShcW3wWC5NdQ00NHYHRnZlqVSKPpLJBnSnMnePg7iW/BPEeYoC0DZkYdFRC
         GPsbqtbPahXbG/6LyoKtUF6dnuIGPqscUPbuQfWwEmkq3dLkCPewMAoDCebFfpRYtB03
         /5TK3VSmMdeVJcliTmO2fdz7Q2p0iJax8gOn74KudzU0yM5/qRZ7UEDyEb4V1MP8BbEH
         RHJz6O5d6Rq10YU9G2lq23z+dhWgrV9FqSs4aseDdUYIDrGHKrAZL5rebIWVy00xw09u
         W0Kg==
X-Gm-Message-State: ACrzQf0JFWMRXDhTRVRXgC8S6oHcEQ+k3FGoJA30IV7tcFbS4iK7Bw6c
	R7nHfPFikx2Bx3Hdy+uKCH+O5qy8F5o=
X-Google-Smtp-Source: AMsMyM637zRQEwD/WRAg9gJMV2NUE+wRE5k2mg/U94JvNVpOJgMWQDJwlDhEPph/ERMt+5RQ30wZGA==
X-Received: by 2002:a17:907:628a:b0:781:bbff:1d42 with SMTP id nd10-20020a170907628a00b00781bbff1d42mr783702ejc.375.1666985597016;
        Fri, 28 Oct 2022 12:33:17 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aea4e.dynamic.kabel-deutschland.de. [95.90.234.78])
        by smtp.gmail.com with ESMTPSA id ky9-20020a170907778900b00781dbdb292asm2565641ejc.155.2022.10.28.12.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:33:16 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] ethtool: upgrade 5.19 -> 6.0
Date: Fri, 28 Oct 2022 19:32:56 +0000
Message-Id: <20221028193256.96431-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 19:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172272

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.19.bb => ethtool_6.0.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.19.bb => ethtool_6.0.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index f8703d8145..c3cefbb5e6 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 2ceea729810475ca8988e2955dc33b5843520e6b Mon Sep 17 00:00:00 2001
+From dea90ab711acad251b5d8536c534409979ea8be4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index cc3525c..873af9b 100644
+index 89d0e70..ab2be9c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.19, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 6.0, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.19.bb b/meta/recipes-extended/ethtool/ethtool_6.0.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.19.bb
rename to meta/recipes-extended/ethtool/ethtool_6.0.bb
index 8c995b21e1..8f36520b00 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.19.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "24412dcd4ac886177abd68282efa98914a4dd2497218e298e7049e9cb72b2336"
+SRC_URI[sha256sum] = "f2168e2b45d7e58ed5b76e5533fd607ca0720c9e631f4271bfe997bf72330796"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.17.1


