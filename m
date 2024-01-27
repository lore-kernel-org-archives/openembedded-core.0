Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88AAC4828A
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:09 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.8495.1706323083579696032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nVnRYQOq;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bba50cd318so865120b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323082; x=1706927882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/iZw1TP4SDOIw4V+m+Eo8sI5YsPLT1A5VAqoopUYqc=;
        b=nVnRYQOqWcbJKMvk1dEbHrhELqcwZ407DXyO+TfXBaKNoCB5Of6wFdyX9hfRxWbWoJ
         DJuSwIvFFd0N0nDBq85zzCm0g12PnD7O309wwckbwW3/pnyoVM6EGYBhPKolbYi3QACs
         13+WEpKNoquah8xrkipSANCV2+ejjqnSceRbvBQy36xr7paZgbBqLbuNW03HOHP9zMAR
         av2/dxWM2B9oaBXVGI0f5Pqsm0/XkjoZVgzhZEPHTEQGcdSkFT3+FhTpDVL+q1CQ/U+B
         Q1sRXIyqUG85LTNpn2bGGSPlU1e4Xq958+q+4J4vGbhmR8M+doIHVe9S0FOLApIQoa8O
         35Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323082; x=1706927882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/iZw1TP4SDOIw4V+m+Eo8sI5YsPLT1A5VAqoopUYqc=;
        b=g8sVPNc46aXuic21OF13hPFiCGKO2Ga7NsdHNhuimwXQ0nTP1SwgbKraCfMY0AeOXY
         I/Db2+mbChCctOwXITYafo/yfCziW7SyQF9x6EeBM2bduNmOAk38cFu2XL64s4NIKd4r
         JLAvyVJqoBeNNfeE2hGMVWiHMnT3KH7Zx9l1lv0Pyd++gM9SJ3BvULGsGk0and0LluSn
         vOVpMc6qh101e1Rm8Gr2PygEqVknHdnppLfitRmplDsDPogX/LcLx5q+yKpi62NlvxKr
         iR1adxoI1btvrrz3cym3K4b5n3jX4Q+gj1Go/rS8y8/dpVrgncKhWmumsuq7Xg9lil0+
         SX4w==
X-Gm-Message-State: AOJu0YwsOpySyfdHFY3wmdPrHeDUovEis+78GveFUVNOlo0iBWuW7wSJ
	fnxNg0KkcNtW1iqxfSGvQCOTsrCiXVW2/EFwVzHt1vI6j2RjPeDJR2gbQgmccp//brujsgCS9mC
	4u9LRdw==
X-Google-Smtp-Source: AGHT+IFOyu/2xIP47MLntUfmQHTFn+pPRrHsfB1lHw3ap/6BRwfVYb9Rdc8HuwsMzHHwuP9KvcTxhg==
X-Received: by 2002:a05:6808:3a0d:b0:3bd:631e:a0f9 with SMTP id gr13-20020a0568083a0d00b003bd631ea0f9mr1733233oib.41.1706323082617;
        Fri, 26 Jan 2024 18:38:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/23] nfs-utils: Update Upstream-Status
Date: Fri, 26 Jan 2024 16:37:21 -1000
Message-Id: <2323086931f2abd9b85fc1ec94b6b0d3efd6364a.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194422

From: Robert Yang <liezhi.yang@windriver.com>

Update Upstream-Status for 0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7189d1ea5c066b9ffc52103160bb34945fd779d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
index 8607b64cb1..57d4660571 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
@@ -9,7 +9,7 @@ reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werror=impli
    62 |                 sleep(1);
 
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=170254661824522&w=2]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
-- 
2.34.1


