Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D65DC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:44:19 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1682.1683038651625105801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZuUbhyQj;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1aad5245571so24727225ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683038651; x=1685630651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDunR5LeEnPdKCi4DlI73n9APzPjxICFgr914vFaXkw=;
        b=ZuUbhyQjkzViFnYGLqW5ify9sqIX4h6/pu+j210f9UqnP8YGIjUKV7AovOnGW6sTY8
         5oRTlq1g8s2z3W6mhcAi2clwQabQF5a40g3e1EMfz937AiHiolKgma3lOrPyU/AVTsmn
         D4V4qdlC2KnIc6FY/+eu0KYxqRL0Hf86QcFpePlhV1EheVAp1AdlxcvpXs32eZ4O+gzR
         9lduhONeAzC/0V0gah4cuHSiNMcnnX4AS3+YUtave/1a0/iD1nAgZb3Mf5BW7nW+UCf9
         2kc04howiHNTKfXtszcTXpkBw6qdGD64+GIUqtHh+AmqNm30VIAke6yz8OPZtBxW8KIR
         rbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683038651; x=1685630651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDunR5LeEnPdKCi4DlI73n9APzPjxICFgr914vFaXkw=;
        b=UwWFq1smsCLnLr+H+SkiInz90JQw3yCB/VFk0gLF9mYL6wCJG3W+sinLkMeQd3/pmU
         d6Wn3Ohfz76PeaF6howXtXFcabmRgbPuA6vCo+Mkdc3GRJyewQNy9ZxRKhsgwMycPEFI
         l93TX2m9YzDKU2hOz6t7/0yp1PgnnjBYgM8FUShlkrSqaUeLgroJq6ihiLTJd1wB0tWO
         hxDY4eqIY+O9tPdG2LgQ7O2cxbwa3cYd0vUHCFzYjWSnSP+VRn/rlKHP3g9wzBl7Ugig
         qaJ99+Mn6GnZ1wvX/qGfITI9bY6UAZeGkqbfLhdCWonGx+gX190Y1hKrDWBPKaoKMZUa
         /h1w==
X-Gm-Message-State: AC+VfDyZFDU9/6ZC7V72p95URiqGt8xjdgt3xzzbQQjB9IiXGQbzuG9O
	h6wWoeQo3vUB7DSehmtzxYhOYXztbQyInQ==
X-Google-Smtp-Source: ACHHUZ5V67FQx8ZNT4pG+8UkkBmNEP0kH1W3EN9wM471hzLlvB96ncdsa/MyBb1TLneXiDhRVvPz/g==
X-Received: by 2002:a17:902:9a8e:b0:1a9:8ba4:d0d3 with SMTP id w14-20020a1709029a8e00b001a98ba4d0d3mr16237812plp.8.1683038650665;
        Tue, 02 May 2023 07:44:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709027c0c00b001a52e3e3745sm19785364pll.296.2023.05.02.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 07:44:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] binutils: package static libs from gprofng
Date: Tue,  2 May 2023 07:44:06 -0700
Message-Id: <20230502144406.2849858-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502144406.2849858-1-raj.khem@gmail.com>
References: <20230502144406.2849858-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180739

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: binutils-2.40-r0 do_package: QA Issue: binutils: Files/directories were installed but not shipped in any package:
    /usr/lib/gprofng/libgp-collectorAPI.a
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  binutils: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.40.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 4ce1b4bec2..9fe4bf5ae3 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -67,6 +67,7 @@ FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
 FILES:${PN}-dev += "${libdir}/libgprofng.so ${libdir}/libsframe.so"
+FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.40.1


