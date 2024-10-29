Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C93D2AB23
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 11:40:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.17140.1730201991662857645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 04:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V3WkQbGm;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so3760696f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730201990; x=1730806790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fwKiGtu0XxDnzz4C9UZTfv7tcIEZQW62+Z9hnlEcI0=;
        b=V3WkQbGmrllE2BBpoVbZmp/WGKdtq9RRV0sowAUsWE3gPaKNkZuLLv6PmIrMR3eJJu
         m5DgEcH+JjYg8SLOEbGvbsm+vzHtGTdIzbAMVPbW+TjRHmjEMi24EGZv7GYaW1l/hYvZ
         ssh23bht7gX9HAa0HrofEkAjeM0dFA0tQwGlIBnbOCtiWZv9Uyw90ea76trPyfJWJkfQ
         /G/TWT2QGMcy3wUNGL7ZaOvTOJzN6fH8GGOApwxRZDSmJbX1ds+A1ogDda713Mq0oa3b
         WxtxSVeUPp13CfjfrjDKPYWddhevnM++3tzahqWiPKq7gW2GHM1ZPmR1pYU10IkgjCTL
         XPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730201990; x=1730806790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fwKiGtu0XxDnzz4C9UZTfv7tcIEZQW62+Z9hnlEcI0=;
        b=Y0vFkyAFf9PBUwLKH1dLRPrsSJmLRzME7LW3oaQXCuaZIuHyEGu9Z37rYVy/EnsTHX
         QFs3pXvUmk0erNYiQfxQPCiIucROH63gxHoMZ3Wm/US0A2YcdKFDczS3XeFCBDbmj0/1
         s3+DFfCIyv9gvDWdk5yYuCuiVV4TgGXp09j1z68ac+w1ukViIN058UXWPdTK+gnkqLRx
         Y9lu9wP2gf7iuTE3/g/4ti20+WIdnwam1baTdjMbPtNsbsf+1R/RRsMRdBkPXO8uE4R6
         MlXWq3yINDDR3KBz+wMg3Rpmj/ZY+y8TgUVP4gWWwymqozMozFp+M157iM5KHvHBvn2T
         jyIA==
X-Gm-Message-State: AOJu0Yxf8HNF/UKXl1IezXWSyM5Yn6W5fxz9VGBzbQOWYyKcABeAS9tZ
	7Ddj9qsliJt0WQae8BEqBLIe9dtJuJpptsGxLIwh1zgJpNQFSc2RbkxKNw==
X-Google-Smtp-Source: AGHT+IGf5XEUOuDZEM/qj2Wm3V1eevgBvk9SjITbqcQMz/4kNTfYLjx0MiPmvurzgChsV/LoJyASfg==
X-Received: by 2002:adf:ea8d:0:b0:37c:ddab:a626 with SMTP id ffacd0b85a97d-380610e69f9mr8554799f8f.7.1730201989709;
        Tue, 29 Oct 2024 04:39:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm12343457f8f.5.2024.10.29.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 04:39:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] python3-mako: fix upstream version check
Date: Tue, 29 Oct 2024 12:39:45 +0100
Message-Id: <20241029113946.748003-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 11:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206492

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-mako_1.3.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.6.bb b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
index 27e2082dc01..6d334991ff5 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.6.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
 PYPI_PACKAGE = "mako"
+UPSTREAM_CHECK_PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.5


