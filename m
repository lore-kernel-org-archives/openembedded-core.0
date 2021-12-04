Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12411C433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.22667.1638602016229893024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f2D6A806;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id a9so10512993wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3sVX++cp2b+v7GEAX9bPBOzh3ddeRI633Bc1hh0c1o=;
        b=f2D6A806S/9VW8R2g1L0vY58fCQIeTv7rkQ8IpXVswtZWqp8+LTt+CEV087Vj7NiT0
         6Pp+yUkBF4aP9Jk3rqptnFhFZoP/EKE2U0IVlG25zYMAWn463XUKP02xyhoXPdwjGIhR
         QGRGVDudjivP9OA55YsolmJRx1LbNAr0TL4EDMXbhmoc7P2AqPj4ulCLxT8KyhL9oKlp
         wWg8C/jTt2U82I5HK5xBSA7UUGj+rOhOgRq72yRYB3RhoJDiuFcqzQrFyfBiLghzUHoL
         LmGFbOrIyi+z1gZifAUIyAxJFX2GIwFl2zvSLT8YWSiH1wGEYrIgjSrYNJnO2D+L9JNo
         Zvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3sVX++cp2b+v7GEAX9bPBOzh3ddeRI633Bc1hh0c1o=;
        b=XPpnTJs0M+3HIEB+rGBtMiQYuoSQpP3gY/wQAMx+tg+H88TY/+bFDojcng6tiLZYdI
         zcoFYhvx1faer32Sa8GpcKRuNfvfu57KtMY8FdTYvXbSg8lJomJ5gIim2BkGsq+2irEz
         EAfJQ2EP0GTeSddHkOCqIVMSXn5Liop/fU4jL5cVzb69hWYs66u7gYe7BD1KrFZCMH5R
         vDF5dklalPU+7FibM7+55gb1dwSI1OWBKwqjJsdrxGE/c94sW2XdNYuMd9V+gq1t4WOx
         oZVbU+Oqg21N5znbgaFrVmY+WxdrKm5dUhCP6RzeImqOS9Ueg+wS4CvF652GpROQZsqD
         2Q0A==
X-Gm-Message-State: AOAM530WvGn4ZJg6SR7fa4RyMbU2h1hcN0GyDAwropiN69H0UrCXMtc7
	zdyBDWDfYe4f9YyOQFj7QDqEFiUW3Urfyw==
X-Google-Smtp-Source: 
 ABdhPJzoZ2pLw5VSRk7LLCARJwXUXjjtQ8xbSartyMYRFb2az3aWrP1svZlB5pxsHvFkAUkzB/wKCg==
X-Received: by 2002:a5d:4bc9:: with SMTP id l9mr27298888wrt.503.1638602014839;
        Fri, 03 Dec 2021 23:13:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/26] zstd: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:08 +0100
Message-Id: <20211204071323.2480163-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159158

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Makefile-sort-all-wildcard-file-list-expansions.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
index 37c5ff0cc0..3d23648f5b 100644
--- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Makefile: sort all wildcard file list expansions
 Otherwise the order is non-deterministic and breaks
 reproducible builds.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/facebook/zstd/pull/2895]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


