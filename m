Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE9EC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:04:53 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.26056.1660719890870652976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mr/8o9rc;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 130so11319215pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9X1P6YRes7uhlL/72JQi3M9Xh40hAvfMR6WD4Ifd7Rg=;
        b=Mr/8o9rc/ci5omGE7Hn47Uo/mFYXCvK3a+Ki+YS9zGNqOb4/k/d8PBshA7sntM/QJ4
         teApPc5JRQPe80ILPe1tZgFnDHh8M/JXZ+FC6OaQz9qJwmDw32qtnVKlHdcBbtfdHOkg
         m5iGgBhxLXkPF8X85csZhH9IXX3fErgvdW+YMrc1Y3xs2TYeruBSnP/x9t3ApqwjTVxS
         u3OPDX+lSJFYju80ST9dmWg4GFkPgMvcusqp+weH/0rmLy/VjbmFWbBO8ir+TmZjo1am
         gweIAaABqEn7oXHhO/k2jsjXROq5kXKccpRK+8AUp0QWHQe+ZNJdQncOvwKRstWM5gZp
         oIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9X1P6YRes7uhlL/72JQi3M9Xh40hAvfMR6WD4Ifd7Rg=;
        b=DrPeve1irer6wopwVIxxtkAnV/lJMsHnxyYMNiJhHOg7UIMCYqDrNHJ019fkgveGUv
         9ie6vwdgCbQYPyPsi5oNb5Oqa9DOsNbd71Za4LR5KSsrwWl3U0QFS+v6XP+PSE0kZb7W
         DuHAFPbYkq6AjQ5NP4S5b/fY1++6s7eqiZvqVxAVZfIbDwaOLq9To00Ke6mb6iIX7SqT
         joDLwH6G5wBosT29yewFh8sNYTTiyqWQoS/vW/O4EvnLOajYIyk0l03cnwdsgB7Xne6B
         tyrD/yYNNhwRlUr5YNUEak9VEZ9qfNGS9xwWMebtbo7tGq10t3WEdjO2hwo6/bvcv6DZ
         Tvgg==
X-Gm-Message-State: ACgBeo0VykXIs5T+NnfKY/OLgR7308VPp/aItKJxa1USYHYfBmSUOEZS
	EpRF7ZW6muSVHz9d6gv2onWolU+JPyZ9Kg==
X-Google-Smtp-Source: 
 AA6agR40iiYR688INXXQzxqN+bDoiWx+/C4baf4A5iZD92+/2rBo/R6OA0l8p9Ww64wOpnqyBzG7+A==
X-Received: by 2002:aa7:81c6:0:b0:535:2aea:e29f with SMTP id
 c6-20020aa781c6000000b005352aeae29fmr7216927pfn.78.1660719890000;
        Wed, 17 Aug 2022 00:04:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052b94e757ecsm9638546pfy.213.2022.08.17.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:04:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 3/7] binutils: Package up gprofng
Date: Wed, 17 Aug 2022 00:04:36 -0700
Message-Id: <20220817070440.537761-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 07:04:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169469

(From OE-Core rev: 62fad02c368aa912ae97e8dd048bd81e305a5444)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 12a6fb5577..8eab78c330 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -56,14 +56,14 @@ PARALLEL_MAKEINST:class-nativesdk = ""
 
 # Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
 # extra stuff
-PACKAGE_BEFORE_PN += "libbfd libopcodes"
+PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
-
+FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
+FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.37.2


