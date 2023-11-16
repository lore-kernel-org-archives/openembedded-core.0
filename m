Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0C6C5B562
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.20275.1700174929508159509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZhDRUj3;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so1978111a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174928; x=1700779728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In7YTCxwVOmU+PC6OzKKhL6sigZnUpVN+XYJbBt1/f4=;
        b=jZhDRUj3Og7q6l8bcwqRTuWq+Qwkd/ATRI73Jsurx5IGRs3B/lsWZqLu/+YlM3QpEZ
         P+u1w6sbKp+Si/sCmxHGZGXTHf1WseKvOFHOQnPjIWGOkSFLtR9CzDtOh4SDEhYLg/52
         7fXUjGWZ5M9fTFOrJ0R2PShynpvNO7WooMf89zUlxMYfa2sOlglMYYI/hPbGfrf1B7hT
         gcozZGPM7vKh2Lg6LaqeYtInim3fAgIVNKILS7d0hhO2qbQCPRKV6BaXpZSLFVy99Tkw
         XBN6H5XV4L/CxQY6CGB33B7QTkfpffhCR/gtkgpeJbLQRWurcS2/uy+9unPgRs3yGP6y
         QaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174928; x=1700779728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=In7YTCxwVOmU+PC6OzKKhL6sigZnUpVN+XYJbBt1/f4=;
        b=rcCNJrQU9qfQyIJvTT3pK464l8ojfbTne3i6/vKs871PblnvFE5RXcpCGn0H7xJR3D
         Sh/ezl/3+GjiP7oLJaqm61OXuvp2Yi7WUX9AjeTipIWKuLruHpM79+KxJYUkDpeeCTb8
         9LsUj8B064W8Sg6cInij0aH7wfnU8OCD2wrBFq878uf4ePFRpcRDJvr4jQSl34Wts8qa
         d0kzqZuvfFUJL5nryz98w2qem5s/p6sQ0493Umq/Ufps0NUWPJ8Q7s7/LRT6fgp0plWu
         I+e/kvADnvU+vN3xWk6L0jgjazb90aCm0ECHeIcmoLAdSZQbBl/lZEzM7ATjWDuKz5P0
         ao+g==
X-Gm-Message-State: AOJu0YxzsWbYWMxXdVZNFwH9wD0XhtZfdaHyK4uG3oFNGmWcmMo2X48U
	jjNPJ+rheqJ+f9WtoFWEMzHtXTvgnjg=
X-Google-Smtp-Source: AGHT+IHNvZk9IlSufU7STrumImNF3QG+U7Dksc9wzU4fj0iaN+8JfoaLsYF+T/MYsJRr4D06zD7PcA==
X-Received: by 2002:a05:6402:10cf:b0:53f:2671:e0f4 with SMTP id p15-20020a05640210cf00b0053f2671e0f4mr12593242edu.38.1700174927978;
        Thu, 16 Nov 2023 14:48:47 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u21-20020aa7d0d5000000b005434e3d8e7bsm126272edo.1.2023.11.16.14.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 09/12] vulkan-samples: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:33 +0100
Message-ID: <20231116224836.2696913-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190823

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-vulkan-samples-Fix-reproducibility-issue.patch         | 2 +-
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
index 7609011421..c16e05112f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
@@ -9,7 +9,7 @@ in the debug source remapping from CFLAGS
 
 We export the right path to use in the recipe with:
 
-EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=${TARGET_DBGSRC_DIR}/"
 
 and we then patch this into the code instead of the broken use
 of CMAKE_SOURCE_DIR since __FILENAME__ will match our path prefix
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 66f1ef5e9d..d60c0f3190 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -29,7 +29,7 @@ FILES:${PN} += "${datadir}"
 # used for logging with LOGE in the code. We need to make this match the value we use
 # in the debug source remapping from CFLAGS
 #
-EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=${TARGET_DBGSRC_DIR}/"
 # Binaries built with PCH enabled don't appear reproducible, differing results were seen
 # from some builds depending on the point the PCH was compiled. Disable it to be
 # deterministic
-- 
2.42.1


