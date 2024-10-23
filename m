Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E13CF536A
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:34:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7900.1729686887287389122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tX1lZsg+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cd76c513cso56557055ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686886; x=1730291686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL5gFssPXrOgr0AjQvB24yN/OSK4E3LdM5ox6NyhkkY=;
        b=tX1lZsg+3EitJiVEHvlBOOwAO20oCcpCtipRSrJvc0aw5DuiKx+11V5XwLr5pTGMMI
         CP2S3C81uGupHQnSodFUWak8dMy/fBO54wxMhyvuTj3B3rfOJPByXbRC9LV0r2JN5Jpd
         NnUKikIAonMRGTEAA3Hjh+5NDW1d3RQZEp7ot/E5vnOLMuvaNhiZEZLwCAfmfTSoRk2a
         9TgDo/otpeUN9PixdYBjEVb50uNW/U4/CztRj8DdlnHUgoPOEMQ0GGH0xyPSaLDj3Ic7
         ltWk5zJys2u+o4qWhXEtbFpcBR8xKKCbdZdYxzWuaKujjBtJz/MYqf4Wqwc+04Q8Kk5N
         B4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686886; x=1730291686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LL5gFssPXrOgr0AjQvB24yN/OSK4E3LdM5ox6NyhkkY=;
        b=V0KqCdi3E6MzOgDDRyATNeDs/JQRujR3QNb/X3fl8hcjij9d2dH48ZGw4IcpQhRLgF
         1yq3j8IyaNJZM90oo5QfXk9mGGi5jnUr301TzmF9zMkRqKzCsVEOBlbpaq3QzJWpQJM6
         FJWHW7X4548fv+dUzVWneqE0PS2qLjizWS5Um2f3BHhdVStHPdAf1Xs5YQGJrPyTRnav
         l4RLMOLShdP0uEc4LBwglaik6yyrT+kMz6gsCeYPQkF22yKeW2c/1fdjh8vxyU5jaUWD
         qwjztB0dIJL9n/8d6QYYWfRRXyi+kXT9FLXtgElGUf8yr0Ar9n7Ae3btGQ02zweiYZRY
         aNFw==
X-Gm-Message-State: AOJu0Yx+4BV3+JM+ipLZb3RjfAnTmKCYRZpWGCTieMpA4poy+MpjdXkJ
	K36FPDAQt9bmZXSb0ax51TYU0/XT3dTz0YY6S4s93m1hTB+5d6+g5h0zEDoIPG8Cg+VOe+EO7ZE
	w
X-Google-Smtp-Source: AGHT+IFzA2aLkFOzliZxm5uuSFxl5hur1QJ6xT23ChsaCzQKLPU9QNiT+wnEV9yXwZ8Yzfd0D8+Pag==
X-Received: by 2002:a17:902:ea08:b0:20b:968e:2583 with SMTP id d9443c01a7336-20fa9de0a42mr34331395ad.2.1729686886551;
        Wed, 23 Oct 2024 05:34:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/27] python3-setuptools: Add "python:setuptools" to CVE_PRODUCT
Date: Wed, 23 Oct 2024 05:34:10 -0700
Message-Id: <d06ce1ca98e5a192dd47af0fa243328aa6d87bff.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206213

From: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>

Since there are vulnerabilities that cannot be detected by the existing
CVE_PRODUCT, add "python:setuptools" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2013-1633
https://nvd.nist.gov/vuln/detail/CVE-2022-40897

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa1c8d97efc6640a1cffa2459d9b20ad1f7309b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-setuptools_72.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
index 945d443aff..5a01111934 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
 inherit pypi python_setuptools_build_meta
 
+CVE_PRODUCT = "python3-setuptools python:setuptools"
+
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += " \
-- 
2.34.1


