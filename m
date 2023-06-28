Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB9CEB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:44 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.7400.1687919443047769980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KpE868Bv;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a337ddff16so775882b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919442; x=1690511442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SXAiwoq4RXV2II68fEBLqYqcUl5XIePTVzVffkDeRo=;
        b=KpE868BvsRs1DukQwdbwvTWeiVHdpmlgHQFKyghwRWhqRr/Q1QMsMldJyH6/dGBZ5L
         pt76PcTpibh0OgGH9vpGr1CSSieY7voUiGanIxZIyX9h+t9ZWFnH0bcATckTVOpDpoqa
         jULIBWMxtEeZvrxoTIKMsKyNMpiYEmYNfIgFzWTXfiPrSMlLe4i7Y0jl3cSPQd8PgbMj
         LOeypTEkguHCcy6LXkX1qcRIk8DYSj3JYQRv4yfq/nPWyvYETfflFTbZfj0FHlxH4ISc
         MW9Ww//WAYEuXCLhgqzFb5ZvGYPN27YDYXGlBJbe1dkx6xnl+sONyNJK4dzYSKU44VCr
         nzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919442; x=1690511442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SXAiwoq4RXV2II68fEBLqYqcUl5XIePTVzVffkDeRo=;
        b=B4l9+4dVGRAjsk2bqhNvpW93OltiFn3l4Om/YMiED3+O3vun642pAsBvX1gfLJR15h
         mdRuik+GeX0bffmGO5AEPWSG96ARNv4IpbsrNVhHex4ICRlx2M6bhrVQXr6pJakIXLOK
         +jrNjNkP7KUOAxtXV/cAfi+ADns18x9TINH+nQVwal60SRJrvniSV9LEmLcYGwRcVxdN
         35yU3/lqFm/2Qc8NTHCyJEHORdFO8E+YCoSIit/CwJmZuKROr75xdZp1Z/PQFupeTx98
         5NXRGSrY4CvqVNg8ng8U+XtlKpNt0l6T5o/7Y9Zt10e8VGaBkFCn1ZlhVDIMH/GvWfGU
         1oaQ==
X-Gm-Message-State: AC+VfDxW9IuFJYpsqPY/fONNCi3WitCpQJUf97VJFwUnEo5cfDloSfcC
	J+kfJxhkb0TviXVo+gnI6RtKu4/GMn1cOxskYNBPmg==
X-Google-Smtp-Source: ACHHUZ4A9tILAv0uwNeHGjxoIFpDQotIp3VSYcDrXtILXSv6iRLzuVFrH3b1r5ZCkRc9U+l1qERivA==
X-Received: by 2002:a05:6808:f8f:b0:39a:bf0:4fe0 with SMTP id o15-20020a0568080f8f00b0039a0bf04fe0mr42425780oiw.15.1687919441910;
        Tue, 27 Jun 2023 19:30:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 28/30] binutils: move packaging of gprofng static lib into common .inc
Date: Tue, 27 Jun 2023 16:29:44 -1000
Message-Id: <a4c3f22c93a944aef11bb8f2637f45c1d72d380c.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183537

From: Denys Dmytriyenko <denis@denix.org>

Commit f72fd51e0d (binutils: package static libs from gprofng) added
corresponding FILES:${PN}-staticdev entry to the main .bb recipe.
But binutils-cross-canadian fails with exactly the same QA issue,
hence move FILES:${PN}-staticdev to the common shared .inc file.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 75beddd33e132333c36ad067e2cf90edffeb5bf5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils.inc     | 2 ++
 meta/recipes-devtools/binutils/binutils_2.40.bb | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index c69d29448f..e176b5cff1 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -33,6 +33,8 @@ FILES:${PN}-dev = " \
 	${libdir}/libctf-nobfd.so \
 	${libdir}/libopcodes.so"
 
+FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"
+
 # Rather than duplicating multiple entries for these, make one
 # list and reuse it.
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 9fe4bf5ae3..4ce1b4bec2 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -67,7 +67,6 @@ FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
 FILES:${PN}-dev += "${libdir}/libgprofng.so ${libdir}/libsframe.so"
-FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.34.1


