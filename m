Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C093EC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 20:49:38 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17173.1786913376530972255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 13:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ADj8ZE5b;
 spf=pass (domain: konsulko.com, ip: 209.85.210.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2018227b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786913376; x=1787518176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAbFd7u/+oNi0zrqFI/wqtMrg6GJaVThbPs8OzZim1w=;
        b=ADj8ZE5bTsKhWIISOIhueVzoa7JcqTWHgoCVlEIuVy17yudM5P3qZmk2fYOZ6rO4BG
         pXl21qNv/iMy3z0OoCOIkWX+GJu+QQEKH1JqxQRhQYl7uW5dHOIOyNI2ZGnaxBVaqqzM
         NiwzUT9T2SYJxQX5p6I1exhDnoaRNo0VK7xlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786913376; x=1787518176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAbFd7u/+oNi0zrqFI/wqtMrg6GJaVThbPs8OzZim1w=;
        b=qC/3ItOSki9rS1l4SWoQbBravr3aWrud1gUDM4oislSNQt0PLB5jVA4o62eCCAc8eQ
         otvjBtwOucl42Xby7k6cUh8be1++5aPVtz65rvtgJj7TF7HeVxKoA1XAbSttqK9bgOe5
         ooll0uo/99pinDjQjYRXVLe098z/ueZxJ9zuOOSevkv6KlpptiCsUlqC69y3sb83bKWz
         SQVs5jE21vlTq3VLPm1Mb3EQu1l1GifwYIgfrk60hGqhAyHud0dP3NWqXeHFMXB3FiH4
         pTghbftvVx4e5XNa08nozHiPB2+DzGOZq6Ezg4cSCCOi9Y1ymXRB6ahlpW+DmPMgiVpL
         EJjA==
X-Gm-Message-State: AOJu0Yx0cn8fW8IAqas3SV0DRE33k+K7Q+z+7LpZ1aFiKgFcosdlbnHv
	93IfISdlHNmLJDGnZuiCfyTJO/YCh3xeMlL6a0FazqhdN8Cj9C82EWs/izIOYx60HBqZ3BQL+av
	+U1gf
X-Gm-Gg: AR+sD12EYC+8ngwSO8goE+bmeV/GCfyZtThxxZAl+VatvoQRjRxn/PDiMRgsf/zHHlq
	yt9sLVaXGE39C6jYs70Wi/1YaJwKAMI2DNYbxU0VxzxF2inBYP0KB8c/burlLncP98FXrkv135M
	JM38CC1TvvoB1GFyoIgQwM8ON6liNMpW3BsUGOW59M2XhSJ4cFgd4kk/WcDU9VXpunNh97PJ4+Y
	e1tGnrgJh639GhBIzit/1NQ6Xxg99KycFXQ/4mY7RyL3m/ZDy71uKbak4pj3TqEtFjIlYL7G71F
	wKkni96u7gEtNtrj78PCNvMoutq5Y7ClY9U1Ap0OUwzHGQTbA6AOXrmr6Q/6TGCKcR+LYn3j8Ai
	pke+mplPybWygq+RP2jwJT3m/OMNx/d/XCUu7R+q0HarKf+XfLCqwRUZzMb2/alDeO1kiAMNj3R
	tbJNDyVGmydsw4d1FD7luT7bLQVco4yuCilwIBJ2yux3wvrKpsfvo1Dc/tHCmE2LBd2HIu6jm4s
	Q4X+YUUgEtxu1KPFA==
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr19916528b3a.33.1786913375908;
        Sun, 16 Aug 2026 13:49:35 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:9a1e:93e3:2a6f:adab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517ce562cfsm2048223b3a.0.2026.08.16.13.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 13:49:35 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-pycryptodomex: fix CVE_PRODUCT
Date: Sun, 16 Aug 2026 13:49:07 -0700
Message-ID: <20260816204904.1869248-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816204904.1869248-3-tim.orling@konsulko.com>
References: <20260816204904.1869248-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 20:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243565

From: Tim Orling <tim.orling@konsulko.com>

With this change, 1 Patched CVE is properly reported:
* CVE-2023-52323

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
index 43dba3faa3..148409c8d9 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
@@ -3,6 +3,8 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
 
+CVE_PRODUCT = "pycryptodome:pycryptodomex"
+
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-- 
2.47.3


