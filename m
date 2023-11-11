Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E44BC4167D
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.52975.1699715015993163495
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gUE1Cj2E;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c9b7c234a7so26914265ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715014; x=1700319814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maJummaCH/YIjMqoCIuVO+Gjw+QXYVkapUXhhycRuY4=;
        b=gUE1Cj2EM0mQDg2P8Od8p2LAMTzcs6CHwf0E+rDrA26qQ4VkjAP48pCvKt+c5QdaIb
         jBxDxxGKoczTnk3wejagGAYP9/Ai1RL4Kr2gfYo86YYVUjT569URkNh1L97rLl5e67Rr
         eYaZyEDsCekmLmjnHEKmcSs+WUPOYY4inM9N5bbZqxmXv9bWzz/CFNgbkvAYCmG2n+kW
         366ktDsl0hqkFEcS1c1ziN6xzs/ZBvQ6mdiV2vRUiBQo38Kxs83h1HjXxRSVVBm3tNlh
         akX5A5cCGAm6RDc5HQ9cbSy9SRwqNCHchrOH8JiS19yRKgpx5jUxDGnzdF3n+UKIeJ0t
         cL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715014; x=1700319814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maJummaCH/YIjMqoCIuVO+Gjw+QXYVkapUXhhycRuY4=;
        b=rQ41gRKFwzMKK3Ai+WVzIeX9gnRpl20AlusCbS4w4rKOgXLVdFH1ykefNk6K7U/Srt
         s/XEeywVrNs9YVojhz+DtVJu3Tfwd4TpU+iS8WMS+5UH9YOPNC1wJm2NTRAlhV+QNRZB
         qetN06FOSqQVeCPLuMnFvw3tKR5uYoxfdowfMKSihTjhuKMuTiZzAFhz8rj89jwxZxuG
         ot+dvB6Jsrn4Q2yxgy5pJ3w1zC1VIu3jLpaW28MAwH+fE5F8I9GaVpzBTBnyJqm7BhCk
         v0jWGwA2Ny99Cp00d2G6xZytLcgM6Pqf2ijF2NgCSgeCSnSZfXFpe9pmHqKYucF08hLQ
         JH3g==
X-Gm-Message-State: AOJu0YwhHAiPIRXaa8w1qLiyePQYmYJgGbddnk4cuCcFHdErnzC6BUMY
	2TQQ6QbHtoQEmtD4ULOxjuy4ntfvRaD0OGmb6Mwi3Q==
X-Google-Smtp-Source: AGHT+IH6qnS1QaMlA/VwhwUrRkYnXHtcIpe1dl0W99W7RW+GX6s9iec7x0+jY/t61QNHhxBkfty4pg==
X-Received: by 2002:a17:902:e9cd:b0:1c9:c6f4:e0c3 with SMTP id 13-20020a170902e9cd00b001c9c6f4e0c3mr2494664plk.62.1699715014628;
        Sat, 11 Nov 2023 07:03:34 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/15] assimp: Explicitly use nobranch=1 in SRC_URI
Date: Sat, 11 Nov 2023 05:03:01 -1000
Message-Id: <ffdaaab9f5a5d4172593b80ded2248b48c22d3a3.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190427

From: Naveen Saini <naveen.kumar.saini@intel.com>

Branch 'assimp_5.0_release' is not present in repo.

Error:
assimp-5.0.1-r0 do_fetch: Fetcher failure: Unable to find revision 8f0c6b04b2257a520aaab38421b2e090204b69df in branch assimp_5.0_release even from upstream

Set nobranch=1, to fetch from v5.0.1 tag.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index 295ac12fc5..0774f37e31 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release;protocol=https \
+SRC_URI = "git://github.com/assimp/assimp.git;nobranch=1;protocol=https \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
-- 
2.34.1


