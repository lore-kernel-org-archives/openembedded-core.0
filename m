Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D6FC0502F
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:02:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.3685.1661806968945777909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BhCWJGeK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id j5so5281741plj.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=8LYU/kHldBxDebl4uz8FvZ/q/OtIopvzKfIyyECl2eQ=;
        b=BhCWJGeKdP+9H6PMzNkl0GotPxAL1BaoUGcu2yP4V4xoHktGQEKKPF0/A8Nqr1+K2Y
         0j18uWpbl/8JP0ZnIIj9Pr8k4EHuOMGu+08IcCvTYJDxL/aBsFStPgJxAsy8P4ZUC/jl
         d5iH7pxCiNbGbVs/ic3gDzknb9tAuA90RNhQPCOvk+JRajt7I/YcKX0smi0cPLqzJoxT
         R7NeYPflkJp3xzer4QhZe45b8tXh8CIKobRa1vS5ZPhUGmDlbgfw3H7ksYvYWTKapnph
         lQeVn7aPWub8blPIk+PLlfaQ1C3Up+40twBf24jzaxRYRSpeq7I1do/q4d4USeeOLRS5
         aZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=8LYU/kHldBxDebl4uz8FvZ/q/OtIopvzKfIyyECl2eQ=;
        b=YMxm87hOFuIhBcONeqEArE2NPKviX0MmmARSCsNOG6m/VO2fDl+ssyBekLMk/eMqJe
         zN6bkhd4qHNrBn2rfuLWGybBZIrrsBKKWX+Hl5h+halIS95hp25MRNoNrZKX+Oktlu5b
         BrU8d34B/dtFwWQdA9Hf1F71xvF6otADPYsGgDLbXePfzRJocDlMkMsbeMJ0q5qPr8yA
         nLi0QRgabzX7oSRj7IbKojWWbGOxpNVCaiH9SQsF0ejMCTMNuv5DlYpHat/dZb+0d07j
         nz/L44YOt4ghxMvtbSryvwcjFMChyVqaBxkje8+MfcLLimBpC4HBGlZOeF4Nh5MxeunM
         K0cQ==
X-Gm-Message-State: ACgBeo13+3hkK+H3TEzu4gi1b6cbXbz6vE2gES8DwNhBlALh8bJh1/D2
	KbXx2t9SsUYMFspy5D55CSbVf14/yVQJNu2r
X-Google-Smtp-Source: 
 AA6agR4kBSGIwUHRRjH2xOHsMjxWuD8mxE8mN3S73WGtZIjLrBPCpGnWQnJhdQm86wx3yRWls43zFQ==
X-Received: by 2002:a17:903:2284:b0:174:5588:13b1 with SMTP id
 b4-20020a170903228400b00174558813b1mr14300919plh.120.1661806967975;
        Mon, 29 Aug 2022 14:02:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.02.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:02:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] libtiff: CVE-2022-34526 A stack overflow was
 discovered
Date: Mon, 29 Aug 2022 11:02:20 -1000
Message-Id: 
 <462d4a55a460c60a7b8c36fe3899e66f13835761.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170026

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://gitlab.com/libtiff/libtiff
MR: 120545
Type: Security Fix
Disposition: Backport from https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990
ChangeID: 4c781586f7aba27420a7adc0adc597cc68495387
Description:
          CVE-2022-34526 libtiff: A stack overflow was discovered in the _TIFFVGetField function of Tiffsplit.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-34526.patch        | 29 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch
new file mode 100644
index 0000000000..cf440ce55f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch
@@ -0,0 +1,29 @@
+From 06386cc9dff5dc162006abe11fd4d1a6fad616cc Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 18 Aug 2022 09:40:50 +0530
+Subject: [PATCH] CVE-2022-34526
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990]
+CVE: CVE-2022-34526
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_dirinfo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 52d53d4..4a1ca00 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -983,6 +983,9 @@ _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
+ 	    default:
+ 		return 1;
+ 	}
++	if( !TIFFIsCODECConfigured(tif->tif_dir.td_compression) ) {
++		return 0;
++	}
+ 	/* Check if codec specific tags are allowed for the current
+ 	 * compression scheme (codec) */
+ 	switch (tif->tif_dir.td_compression) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 4383f7af8e..c061d2aaac 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-0891.patch \
            file://CVE-2022-0924.patch \
            file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
+           file://CVE-2022-34526.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


