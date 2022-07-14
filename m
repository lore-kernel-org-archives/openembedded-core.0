Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E37DC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:09 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.4009.1657773366960693552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ypVm2C5A;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id s206so502800pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uZPfnavhIt1DC/jXSqtw2W/kdavO6h8d1ugd2PguoMc=;
        b=ypVm2C5AlAbTFa7UhFUzxIcDUUc7EOtJ51e26kVZ0Fc7r9nfRUheGp/FmbkI3t+cW+
         UTaAOqM/GymGtonjUFMSMtd1UDnXGCiE3TAQ8boc5o8Z8v1KI03UyVkdDim1sfDYdXTz
         yfmSFYIUsxyKNh0J3UDRR751A7uGcLuxnowf6WIgIgadqb5V5tCg1XOGSZfVqwNSIFCP
         dJzzW6EKIBCScrF0Tc1kkNjedi0jHwEKNCyzCi+KDokfqcBIRjUcGnrbDivu9vtkbXvB
         /tMJVQQ6mDyd27/aM3habkWe+12SREMrcH87x46b8R3vUwsyH3bsIUni62TSTfemXjtS
         8E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uZPfnavhIt1DC/jXSqtw2W/kdavO6h8d1ugd2PguoMc=;
        b=KYw6mvJEHpjR4v/J4+KRVSsIQTUkun3vmmuruXaH36kJw5efuInBp5q5z+2F04V7ex
         1ENEczG6wC6oFj1GJyQODBZgUq5BkEy5kmO/T+xthkGvphvkpPhLBGwIPvZIuUvzBok6
         Y9mGC5guUshBXpEGJ5fr27uOTgd20ceDtPb5ft4eRshxESlO541dDD4mRRY1mUQDCAw6
         KREEvsbQJleKTCKgHMfBIMxYhxBh8vWj4PSp3kyGd9j000IsCyiCPmXYKbo6jHXRLNJD
         bIMc7PiTxwxOJXMe46JpKxtLNM019ln2nyXzfEWGMhiZpZ5HtRKFLWLJkMOwkFN2LHYd
         vH3Q==
X-Gm-Message-State: AJIora9XbvztyRhZmfXIFjDFoNN/qbzDOuBC3jTJZRIKk+0cADu5sFZA
	YWOiqp5P9G1hBQoP58T2stfukFeGDkt9e1Ev
X-Google-Smtp-Source: 
 AGRyM1ueSptYpPMIpvqCJVaVwuOs/CU+UtSwfkO7+TEvYOhlzONL0Ji9k8ho+M1+KCEGYAAQ5Z7Lmg==
X-Received: by 2002:a63:d614:0:b0:411:acdb:5c55 with SMTP id
 q20-20020a63d614000000b00411acdb5c55mr5787971pgg.245.1657773365945;
        Wed, 13 Jul 2022 21:36:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/27] ruby: add PACKAGECONFIG for capstone
Date: Wed, 13 Jul 2022 18:35:21 -1000
Message-Id: 
 <6db1eb67e7abb5c1c655ab5d2b4eeb73ae4af576.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167998

Autobuilder workers were non-deterministically enabling capstone
depending on whether the worker had libcapstone installed.

Add PACKAGECONFIG for capstone with default off, since ruby does not
require capstone support.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/ruby_3.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
index 38ba46731b..6fc1f53b18 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 # rdoc is off by default due to non-reproducibility reported in
 # https://bugs.ruby-lang.org/issues/18456
 PACKAGECONFIG[rdoc] = "--enable-install-rdoc,--disable-install-rdoc,"
+PACKAGECONFIG[capstone] = "--with-capstone=yes, --with-capstone=no"
 
 EXTRA_OECONF = "\
     --disable-versioned-paths \
-- 
2.25.1


