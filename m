Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFD6C83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 21:10:14 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.474.1693170609883642233
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 14:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pQBkJ55G;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1ccb58b0099so1794094fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 14:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693170609; x=1693775409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j35lKv/u8CJIDZFzs87zlYAYsKYC1oqtmi3nDzS6qTo=;
        b=pQBkJ55GU4W3TTDd7lQGZsMUT2tCKGbCFfJ8RI3WWT8WeO6HOSvhQKZ1duro/W660v
         NHUjxdX5zAGdlR7x0tKK/tciquKP7mprKKzdu9lPNIXCEatAEPfUXAVtXhhQQLMRDHFA
         SJ6rJRVYF5u4m4wOJOTaN73DvDsXRCvAeh7rDOUXzdH30NGGwdcEBR/Q0UiUw64sOLfZ
         2s38lv2Ol3c+T9wknbqmZVsntXYlv9aYCbCqj8HdV77lRhBO1hg5hdapifk4h5JCCAXz
         pLTrjMtc2WR16zoXMEF4wu5Es1sll9RvJYp4DJGx8g/UYOhoItDFwlTt9Wcjxs0nQuZz
         PcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693170609; x=1693775409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j35lKv/u8CJIDZFzs87zlYAYsKYC1oqtmi3nDzS6qTo=;
        b=bQOT3M6hffgFXb51CiNQ/lVO6CArfEN6Qf3QiPr9h3lD16x/RvNefmGxruP9+WKTy7
         ZQl41sqLAwSUdP3Z2d2tJ3RwfEbA0hRFJkRvJZJsMv9jjvLo01s8Mli847evljM5czF2
         WOsQcUEUTceL2cQu1XxFvge+3EsEOKZKJz4AP9Y9M4CTEp9KPXYj1Y5wE0ORNHl5Gzmd
         q+pyxcxFu9FxOAXC4BbpWNuAdzJr7US8fCN9TGBkGjiCfyfNpHtEs9qWkGkTdDfbObe1
         rA0sbWk/19O5xhLC7WaRSo7uFZg7FkGrIB9Xr54i9ik+5oIUuE/viHPB5IpJrFRHnITP
         RhYw==
X-Gm-Message-State: AOJu0YyJuLlMOTwhWq8icWAPAKZbEh0Ze6n/2jNl/gJkHLt/knIHSr7n
	iGRHEw7wOOodNlEQl2aeUF1umR+qPTTlgA==
X-Google-Smtp-Source: AGHT+IFc7WipSrJpUNDKH14t7eulK5lOgynT/FdrpGZkk9KyDHutJiwmIxcpi8PJpMS4XhQWiYvspQ==
X-Received: by 2002:a05:6870:b523:b0:1c8:b870:4e55 with SMTP id v35-20020a056870b52300b001c8b8704e55mr10138266oap.49.1693170608922;
        Sun, 27 Aug 2023 14:10:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id gk22-20020a17090b119600b0026fa1931f66sm5462820pjb.9.2023.08.27.14.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 14:10:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] core-image-ptest: Define a fallback for SUMMARY field
Date: Sun, 27 Aug 2023 14:10:06 -0700
Message-ID: <20230827211006.840578-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 21:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186805

Fixes errors like below seen with bitbake core-image-ptest-fast

WARNING: core-image-ptest-apr-util-1.0-r0 do_recipe_qa: QA Issue: Recipe core-image-ptest-apr-util in /mnt/b/yoe/master/sources/poky/meta/recipes-core/images/core-image-ptest.bb does not contain a SUMMARY. Please a
dd an entry. [missing-metadata]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 12cb8c0fdf2..0fbfce24a5b 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -4,6 +4,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
+SUMMARY ?= "${MCNAME} ptest image."
 HOMEPAGE = "https://www.yoctoproject.org/"
 
 PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
-- 
2.42.0


