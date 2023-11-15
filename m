Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A696C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5030.1700018270604432656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DRTLR6js;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc37fb1310so48975245ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018270; x=1700623070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4Xwa6amq7gvdpVEjohCCw5Gbba03O0wSQwv9U8y4JM=;
        b=DRTLR6jsgRfnjSDWrtCyaaNNgSw9AhKti6tCQx3qtP7V02eRyQ8h1NMhIr6ibQnM87
         vlEHnd62lPrlZ0CUDnEHLu/odwhf+v/Y2TGcDSz2GI6S1326Kh8lVors13lh2F/z3KrB
         naZAStMXYI7W3WM1hzixIwE7/QtPYEilMx7cuJdJQ74fElGENptFNInbFLKQrJ5GruPx
         zoeKC3Kk5jj7smdGDecMpPtZ42cLlEFeNdd5YvaWznoijrKe4YVKW0rgVOv4TLstB2F/
         /nT7UY1KSMYIVDqlRT07rTdrZ9+szD3IbTG5shBZyeOm8tU02TzZfOMDnWMQW5sl4KlE
         aI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018270; x=1700623070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4Xwa6amq7gvdpVEjohCCw5Gbba03O0wSQwv9U8y4JM=;
        b=wcVHHxLEG4MWZznvNFN3majGaWKDLyQZ+Ta5aLXk04+40LRhzmVtz3qaSMpeI7rqAb
         4ejmiDkbhmb2z4sCIrYKqiGMlm4ZpeXtc+vTiuhSksQsOtRxFsP+ERkHosLeLQhNr+Yu
         d/7xx4ZcpLKCPx9Nc9esrbJmtFDftS4XAYa5rglU2LdvmGbhbuF3qgDcQeWqKQCo4Fv9
         7/A5GDIY7KXI6aO1HaGEOJ8JXbergC9/vb2ct3DqnQB+pCDk15QLDvHmEvDHFlcq9M26
         v0yiCyjCkzICYbpoX0zHA9dT9X1obZsNeWE00l/7RoARsMUy23UiLk+HTTpHl5gk8y1E
         fM/Q==
X-Gm-Message-State: AOJu0Yx8xsd0zw5WKsuQjkUL87SppS3Zl70DcXsoKCWVOAs2fG6asZjp
	hB2Ge67mZKY/N2jCHgMqYZWNlutUQfEaHVm39HxHSA==
X-Google-Smtp-Source: AGHT+IHISW335uIGR70P0Q6YLOeTbTzFXrfFxHFyTJQEBYxDI6afh8/KSV21ASDr75sAFIQn0lUb4A==
X-Received: by 2002:a17:902:f60d:b0:1cc:ef72:8600 with SMTP id n13-20020a170902f60d00b001ccef728600mr5498223plg.62.1700018269786;
        Tue, 14 Nov 2023 19:17:49 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/17] glibc: ignore CVE-2023-4527
Date: Tue, 14 Nov 2023 17:17:22 -1000
Message-Id: <3471922461627c0f0487feb09cfdc4cfeeb3f3ca.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190535

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in 2.36, so 2.31 is not vulnerable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 1862586749..8298088323 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -29,6 +29,13 @@ CVE_CHECK_WHITELIST += "CVE-2019-1010025"
 # https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=dunfell&id=e1e89ff7d75c3d2223f9e3bd875b9b0c5e15836b
 CVE_CHECK_WHITELIST += "CVE-2021-35942"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527
+# This vulnerability was introduced in 2.36 by commit
+# f282cdbe7f436c75864e5640a409a10485e9abb2 resolv: Implement no-aaaa stub resolver option
+# so our version is not yet vulnerable
+# See https://sourceware.org/bugzilla/show_bug.cgi?id=30842
+CVE_CHECK_WHITELIST += "CVE-2023-4527"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.34.1


