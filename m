Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C425DC71153
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 14:35:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.19014.1693319708285171205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 07:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rPXPE/yz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401d24f1f27so11906835e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693319706; x=1693924506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VHhWOi7DhSD6XDfFNGJSiPN8YeIeo2rmyXFQ4umC8I=;
        b=rPXPE/yzpvf1WwNEwzQcOJuIvNU4mYyTJ7YPN7NdNAt0J1gQODOqFEO/P8Kv0/aX38
         8NQoQMmXWeabBBonGTNExhPjwfYCgILsavJZ36SrsGqVyiVjQRw2oPtkd0HlBzkmWNX1
         fvhwaXfrV04DznqrjhrBQtxhdpdlop071QU02dNQoWYWjrPzyXhCuQ4+uyw1+1PgIofI
         jJF1n8FOrtNcakCRwhQkeLsC5iFt5ezIm7oRZPlQ8u95N8IVJU2jxG618AKREJEPzCN8
         zF3nP6w6Z6B5um00m1D2QCyL5obIHjqo9xWNn375T8mk1KkY5jE4cnPcC3Y+ewjJU/Hr
         S5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693319706; x=1693924506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VHhWOi7DhSD6XDfFNGJSiPN8YeIeo2rmyXFQ4umC8I=;
        b=C8V0bcxI5pneTK8JvHv5P89gfa3N8CWGpRtWz/kD6bT4laSlZybshi/Ayw68FoeBGa
         FHCEoIsAElWlfNJAjnBuS2LdaeVsFUqlCfLoCRIv3fQ0UTzxMImEfqhwDSFBRAmKBl3y
         l8EkjSGX9qFePCN6FrlIVpQr6FDeE7CobvK2aXeYOvwjGdD9pE7wEXqAns4y/HMisHRt
         VNSAv40jH3K6eD0ZhfFkWe4Ot28ZQAk6xPJm4rQqQcpKA0/WGtAkFdr8l5iBZwyeVyKL
         xYvNNKVGIdWVQVSPw6VGIirNpBO23EFN4sxdMq+xrO2rGewA9tdzySZKUKnCXsTnduLQ
         JS+g==
X-Gm-Message-State: AOJu0YzKpDtx+88Z0SViYrquQEX6q9mF9g/wVH6syOf4wOSTmOikUZIZ
	cl6UY5Gy4aodrHAj4Y/pSt8Fyo9RS1678guR
X-Google-Smtp-Source: AGHT+IEKze7WsHQLBYi/GXF6HQK98B4av1ohUIub8hXiS4idgfTshKcSfuQzwJghtzUEqfSFUy+uyg==
X-Received: by 2002:a05:600c:219a:b0:401:bdd7:49ae with SMTP id e26-20020a05600c219a00b00401bdd749aemr8086853wme.18.1693319706072;
        Tue, 29 Aug 2023 07:35:06 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d5552000000b003197869bcd7sm14158561wrw.13.2023.08.29.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 07:35:05 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] systemd-boot: remove old gummiboot TUNE_CCARGS
Date: Tue, 29 Aug 2023 14:34:58 +0000
Message-Id: <20230829143458.3837895-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 14:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186861

Looks like this only is required when build with clang toolchain
and the fix is alredy merged [1] on meta-clang.

[1] https://github.com/kraj/meta-clang/commit/83c94b8690f0a2922d28d0db9907c722382263c2

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd-boot_254.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
index 642a5fafe7..4ee25ee72f 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.bb
@@ -47,9 +47,6 @@ FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
 RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
-# Imported from the old gummiboot recipe
-TUNE_CCARGS:remove = "-mfpmath=sse"
-
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
-- 
2.34.1


