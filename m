Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179F5C46CD8
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:26 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.43012.1703124565391102987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MhCsHxwt;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35fd52f765cso673385ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124564; x=1703729364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jtw+2suuRNorOArMOTLPOmoHpbjSt18gIelirrLLQpw=;
        b=MhCsHxwtgWZRXB2K0qiN8Eh/tITGo8/s4OI7tToTmlba2xTRmgI819GRxEW02QBa+w
         yj9p/M5E9NW/Q8UOOYlYuRSJw5o3UBpY26lmQoq7Y3YKa0UENMFuJTwrESuzxEN796cd
         i50O412+ZjkpUvgolIAxJ+J6hfNuKX1AFnKRqJLUTfTdD4d1meaYnXBMJDeF+b/clfCd
         3CZSKIvR4hKkh/2PmBfU0hur7jACspzNDHIWRNGKiZxAJ8sUZj68R+TPKuyEzruBFAMn
         6gLEEcuCJhRPCYMlMVlDUEoC5Lotx8g9snRJyp927JqHTINrMDTX2wLyR8BBgwxkgZd/
         tyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124564; x=1703729364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jtw+2suuRNorOArMOTLPOmoHpbjSt18gIelirrLLQpw=;
        b=W1JfP8y4wXwmmenZPa6TVoI0t95cGI+L6u4sOjaPIFEC4yg6OW2aGbMozkSgaNlvCE
         auQV0AwYz6FqD0Mph03Ab7G3WNQXBc3aysCgUJXt8Y2atiepm17OqNBfL46YXNO08eir
         IIV0RxFtMyr01g0LtJ/EnrVGAI8NCkScR45kpbCRZouJ5En4KUmjcUaycxSC56veJhWB
         h/+4CNaPI/1uYxMsEFEtPKLBOHpqRHCOkbtMwmpDru91HFeezbMzaG0wU4BqIPm/eVvG
         q1e2UuZd6Mk8XYVITCagyRMZYWiIO+9TgBCgCC2jiDeHOqadspi0DG7QiJahHRn8KFp2
         aSIg==
X-Gm-Message-State: AOJu0YyN+pwruMZ4gzHmjLHa3rRfOe3VnvUpOkCx2BCp5H1g2YlOsHk5
	qkkUpwf+G+hWv1kMfpsTjGsrA5npKfLPQ3FDtu06Og==
X-Google-Smtp-Source: AGHT+IF7OwLxWHBMNhRAEPaersUUqf+7S4DE0w5UXpEbeje8VaGSp02VJJgyhY1O7UKIyYL11fMb3g==
X-Received: by 2002:a05:6e02:1ca7:b0:35d:59a2:2c1 with SMTP id x7-20020a056e021ca700b0035d59a202c1mr30828245ill.97.1703124563794;
        Wed, 20 Dec 2023 18:09:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/11] ffmpeg: fix for CVE-2022-3964
Date: Wed, 20 Dec 2023 16:09:04 -1000
Message-Id: <ce4ac3d167496d2f3a3029ef83dc418a0794c2fb.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192816

From: "mark.yang" <mark.yang@lge.com>

Without a CVE tag, It will be recognised as Unpatched by cve_check task.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
index 23573bb6b3..97fcfd993a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
@@ -4,7 +4,7 @@ Date: Sat, 12 Nov 2022 16:12:00 +0100
 Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
 
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]
-
+CVE: CVE-2022-3964
 Signed-off-by: <narpat.mali@windriver.com>
 
 ---
-- 
2.34.1


