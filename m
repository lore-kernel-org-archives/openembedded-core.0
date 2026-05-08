Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6338CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8241.1778224357006961761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y6At4KDs;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d102471a4so16434095e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224355; x=1778829155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSb676aSbW7X/2KY64q40TVZZ3gDHS+Kpji8g68kSdY=;
        b=Y6At4KDs13pl11M1wt1GUBstC/Q1gVIMy6BvssWIOi1hcvIXSF7TVdg8lZBFE8hNYH
         L74snPUnHeCgGBzgpR1J2dJI/iQvKat0BHISBM4IZz1KlPZQhiSlhVbzhNsTNlEdKWAu
         y2h4d5VmcxDpNCNuD/GUIEJcjKX+VX3zAf3zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224355; x=1778829155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSb676aSbW7X/2KY64q40TVZZ3gDHS+Kpji8g68kSdY=;
        b=c7NnQWlr/dD1QYawKYmQ+PDY57BgLhb849tdpo0fcRv8eqU19cs6IX8Dh+L6qglG2K
         zapNEebKOOMt8YfvGG4y6GIJBtG+TCphUEU1MsAx9d6Wx+p7P7Q5BdWjThKjdNY952uJ
         o7pYNR4Nr4fWIQnRu7C1qhT3wqDKv1bjQqIzT0y9FVUt+zvVLd7Ctr33YDv7KJsav+S7
         qYMHJUijF9fXaODWfeLMteOFIKRspCDd3zlXAo9VfN4cN9D5mzh6VxytEnSxtpKRsWXW
         7h992GE0CXnEBom+lewNPFGQQ9wFyXDudlUWd66ZISEHsqKHAib6AsRT1tvzkFmNsovf
         zPkw==
X-Gm-Message-State: AOJu0Yzy6XQrZdMbwOb6/UH+V9DfeZ5ocQnHWGBbJprKprXNShr2exnQ
	nL3qRQwNg8cJljfE0PdMa8vuc9WE+C3z3YGJ6Y8d+ocHi/j4SmX1crnTfNEyqpF6BzDMHJKZ1fh
	DDHoSaF8=
X-Gm-Gg: AeBDievYNF8wpZy6kAmGOWSQepUV7F8lAaKUqT48D1jzXnCHqGFCrnhHdDQfLOFfYnE
	osiklBx7oHeZpH1lTSCsj13OCYeShcyy67/lGwn/wUSs9dsLb+qEK2wH7pgQcrGoYEafVbgI8Tp
	vogDto1YDg6Hld4rXWRrL2p0qR2VcPi5QJMCRtoIg3ogQRIGffPZKC/p6jazoPNzju+YkcVhaki
	U0AYB4sphsoJjs1tkUWvxr9d+rbsBAJp0MBRzz94hYtV+GwXS3LAR2I6O+8K7X7kMeRIsrNPYas
	OsSBR4OfWv9Uu0M2ixgcY/r7iQfTgQCetyewsqtVHQcYy2DA7LfZroKBFkgVBMPdUaeBRLXv5p2
	iqBcs0kxBoyV31kXqvHeZEpG5fRZ49NRPv0E0LDskU+vMRYJl3MemtMFzvaEJQAaY7qYlBh3DWt
	eP3xdn8l2YF85eLxw8M1tbDBa9GbuOAkzTelw2FU7cylC9BCd704SA80pPox9bY2x6qF1FmR+o3
	+N3EwXQ6L4a0P2Ear+LKjN6C6uILsDA7LurrQ==
X-Received: by 2002:a05:600c:c10b:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-48e676ab390mr17013145e9.18.1778224355029;
        Fri, 08 May 2026 00:12:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/52] ffmpeg: set status for 4 CVEs
Date: Fri,  8 May 2026 09:11:27 +0200
Message-ID: <615bb2b4ff6cd8903b1dfabaa53aa37d04deaa67.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236676

From: Peter Marko <peter.marko@siemens.com>

These reappeared after update of sbom-cve-check tooling.
Fixed version found by links from Debian security tracker.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd3cf15cf7b065f5f74fafd3c1450353cdc301c4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 7bb7de3d25d..b6d3ceb6dc3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -176,6 +176,10 @@ CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
 CVE_STATUS_WRONG_CPE = "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
 CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used version"
 
+CVE_STATUS[CVE-2022-2566] = "fixed-version: these CVEs are fixed since v5.1.1"
+CVE_STATUS[CVE-2025-9951] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"
 CVE_STATUS[CVE-2025-12343] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
+CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"

