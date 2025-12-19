Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1F5D7494F
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:26 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9485.1766114601511784102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eAktdYxH;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0a95200e8so12413345ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114601; x=1766719401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JFwvZNNyHPrpumIdtp9u98NIrVzT9H+VaHkEyA1U5I=;
        b=eAktdYxHA/iMyyPBNiEuwbnkXxVTOA70fnj6kEzMrKSnqxooJNJxAtnczkw3YqJ9Gj
         Dxu+H1BT47W2Zd3m/l0eyBdzAbUVIwuwMbLjKzD4P/6sp8NGmFikzxzOaH5q7Q/9DzOh
         2uOGsnlhWOY992nyAVh71PXBWjZLgLnUs16cEMgHITkPQNg6fJgE9IRspY2I/NRf7T1m
         k+YtHoPsxD/j+GMhp4t8fG75dhQo1ujxVhHHp43+XiESWYA/9+l2uUgGEmAo6IkaM6eP
         GCHUjTzIhDE/zhYBHM7RH/3UOF3KaNUo1NDcxT0YPHfiDFd1B47/z0Nx5wqAGy76Ktp4
         RPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114601; x=1766719401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JFwvZNNyHPrpumIdtp9u98NIrVzT9H+VaHkEyA1U5I=;
        b=low/gWpLsQE8siQaoJzEmGfnoaGyt/5gyUroU25vMue4cOtmX5sHIYqjKAiNmKnmGx
         phwEb7OxQVxd8gFXFmHOi9Qj23IAaeEY2lwuuiicuMaIwRPydbUjq43fAHNfTceaWOrx
         oKm1GleVeN4FTKS08TZVB93seEVvNGj9Y8zPsTxYFW+xIjU7gG7+kpk2WkqADf3bnxxp
         rn/p82/dcW5FaaPVpXPLLz3fcnaJlqw5yFfeuvxb5e8q2P5uT/KSzCAZyR4kJc5Irvcy
         HgMbb7KIWw6UPFwcfHH2x2jYRY6mTWCHSPvWyjtpPxl0z1w8rmlKlSM2gxQO7b7dYDL/
         nEGA==
X-Gm-Message-State: AOJu0YxyXHHNmzs04qr9j/Pf+UbZFep0FReFpbSotY5lGOBMxyVJjjpk
	aEO76lp8m6BskuPTScxoQyUwXo0amMaMxTBwamym70ivX/EcO05/J/sdVZqJfQ==
X-Gm-Gg: AY/fxX4cM9vQ0VGk/9CXdxHKYndpciRHNv48kORPGwI8uhWTpl5uGEpUuJ5B3ZfzZv0
	6fiRfmaW0EwGhgR20EwiNI/dULQaqFeJiRIRnU8VNf2v9GwtvKI4ElhZw3Egzp4HQFMJ6t7wtnj
	7cdAnGU6QTFgu7RkUE2Lz+a9YnD2sMXJy+e1jl6zzYk4uQ2TG7TSrThrIQNggPNh3YlI9i1Ie9s
	JUFcKm0hTGyK93H/FPCLwTcr8+O+5KoI2jXz6PPOpuQMzhhCCc5lgcapqZDkxb4qI7i8fA7p36t
	lXUvq5TPvCTMXw9Wx1qAgrQDCkLQuMzxTXvBLYX04zxHG/nc9Z2EZyiD3x3+zP/VJj5ZLLNFrAc
	yx9xnpJR9MqLuCC0y3U/8RZ+gpiLDOGCZv1tGi9rDfde2bMzswyq/ziWDIxDaQMRBZ0gAr+70G8
	xpfewS0H3LKNK4NidAl2ELQali
X-Google-Smtp-Source: AGHT+IFCUX5eB77KQOVRWKFrSGdiHwxSO0SfcwWqsqQ05979POqp/oGsxKRtK+iSJ/dOo1D6yKb5cQ==
X-Received: by 2002:a17:902:cecb:b0:2a0:8859:3722 with SMTP id d9443c01a7336-2a2f232baa8mr13736905ad.25.1766114600712;
        Thu, 18 Dec 2025 19:23:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 24/29] ccache: upgrade 4.12 -> 4.12.1
Date: Fri, 19 Dec 2025 08:52:03 +0530
Message-ID: <20251219032209.960840-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228192

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e47f62e44f44d0e45a02ad13826d3a7fb722079c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 

