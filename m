Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41159C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:51:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.61944.1674172307184776524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cpqDfuRM;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id k18so3861273pll.5
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBQZbQCxLF40BNMM9yKsMjokgEn3yaE67W7VqKTyix8=;
        b=cpqDfuRMtGqrIHhDKQ9Z6IR/4zU58L2DwVAevAS6ZtGBXS+82vRLCZh2uPogyuhB2Z
         4DE7L54ey1DMbBjh8PWxGKX8VudKNv339CJueRK2vk2Lh44vWIaBjz6d23q1SLx3JrUz
         M9iE2RRahhP9PvJZdNejWSqyQ22X0DVXfcnB0UzWnJzmaClaVTZ91Cg4uhpJt30KyehJ
         5HNKfo0LkWMYkzCbp8p99qG9yvHmy3qe7hy+y+fU1Gi6uxmyEaxKaojvUHnac5yMtanD
         1FZAkkiIem4jrcuJ+/pHEY5hJ8OGlWyGjxbAv7404r+58CoFvvMwSO4/IuPzmZern7ox
         NRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBQZbQCxLF40BNMM9yKsMjokgEn3yaE67W7VqKTyix8=;
        b=V/5hddc1oYLACpYFCqtx92HbilsCat1N4eyJLFM0teGaaBB5kxantv6B4g8I4lsRrg
         69dyUaDpFmeoGjNahVd/Tw6DbkIdED0yxQ+UdFUpKNYWoleBiTVhuniH0Os+w0/oY+6W
         beR+xkS3drIA3E+Qm//38LaX2ZpjtkdvR6+Wy8/FLWMScCZ/WB1vD36IBhnbbP5IUR1z
         zwIBF16KoE2L0xNWrAiJyLJhErEpFqqxDpspXtbXlWsdTtrZHTAwntaKN7fu8W3xhz+r
         G4KDuvr97ZIMG4aOlvsu6f6aCGYVktMz97kB//OLnhaZ0Cc60tNO1IKI2F4ba1eT8ygu
         XH4Q==
X-Gm-Message-State: AFqh2kpyeU4CY1A/4GljYnYLg5NIR6HQ6CXx7YgqX/KYZwGd+YYCgfLy
	CR4drKkbsW/tra/5HojPN6L/ES857vTZ4Q==
X-Google-Smtp-Source: AMrXdXsRcD64eCdgLkXjxaEs3NsMTBxoZHmw9D4Wxy6ZAyECILZNxmA9Wz2RWpgcze109Mqi89XvPA==
X-Received: by 2002:a17:902:b18d:b0:194:4196:7db0 with SMTP id s13-20020a170902b18d00b0019441967db0mr12438577plr.64.1674172306393;
        Thu, 19 Jan 2023 15:51:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001948d2ef5b4sm9236555plk.75.2023.01.19.15.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:51:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/3] binutils: Package libsframe
Date: Thu, 19 Jan 2023 15:51:40 -0800
Message-Id: <20230119235141.1603399-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119235141.1603399-1-raj.khem@gmail.com>
References: <20230119235141.1603399-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176173

libsframe is newly added in binutils 2.40

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Rebase

v2 -> v3:
- Rebase

 meta/recipes-devtools/binutils/binutils_2.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 67240383f7..9087af87c5 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -66,7 +66,7 @@ PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
-FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so"
+FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so ${libdir}/libsframe.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.39.1


