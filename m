Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE44C25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:25:32 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.5898.1660587925588776257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DN9ZPBUC;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: drew.moseley@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id y11so5930592qvn.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CpMRgPigQOb6kadOBAV/+7QF55ztxxvAypnkQAvAXI8=;
        b=DN9ZPBUCRbT6/suQrD97iKqZhfb5kvs6ly8399hobCr3KN17s95JuJdvEFVqcF2oET
         /ZrqSZorRYI4wGKlJkEOmsezT5HMjo8glxiCk2NH33mtZnGEd+f6/svs6VyEcTRnuuya
         rY3gj/2oB8gv2O2Rn6n+t4eW1o2fhAPUoQ+8lSPWkwDjHtIMd8WqArJYiQnA5R9tL6eI
         EThZDIMquAPQCyVWkZdW0KZ0xmKv0lUkIFoSFp3RFJ5YRrTuQIYYPrFKUKrtjQR7AZQe
         p6QCp2uHd2H6WJv5UvGP+ZPQgyl3ra7wp/QpGNOtEQA88XjWsJbATbKoPVS+vUZziYSk
         nl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CpMRgPigQOb6kadOBAV/+7QF55ztxxvAypnkQAvAXI8=;
        b=uBTtLB/1kUckrgLivjuCklhM3UJqcjvWhIPCJhh/+zQ18o6AdlUBwTqGnnBf+XTPdS
         XIM9gHOEzN7rn9C/9ayj7CPHVocn6BMQUlvY5U9MnPzQ/i4Img+VydBdkFC7J8hDeAEc
         NvUAj7grTREIf3IgNPq2h2exaCrgzCrdrCC9LE2IFlh29MgaV62IGJ+FUzwXfEuUus6p
         KMCWTmLyPnqOb2SS2I2yJidXAtOeftSoY0+FljffSpNq1owm9n+hVed+eo+5vcpELhBU
         JKluuvYqYYvFy7o62xabGR5v1egz/PkLJJC7rTWrBBCP91f7+wxn32r4MmLG4O0B9a/O
         PYug==
X-Gm-Message-State: ACgBeo1N4RMEUk/muFyvNAe47Dxk35iLa4NFihsQYptzMbHDRuUZ5NhI
	VQ62Mnp95r9OLqbUBUYotcUeLVUhYJVVgg==
X-Google-Smtp-Source: 
 AA6agR4x2KcBeIcXuytBPe13qkVOswiaA1hSeuO1JyuSZfhy7ilOnJB0KWP0cvHDs3hj3/I74A2KPQ==
X-Received: by 2002:a0c:b39d:0:b0:473:9292:d4ec with SMTP id
 t29-20020a0cb39d000000b004739292d4ecmr14514957qve.66.1660587924168;
        Mon, 15 Aug 2022 11:25:24 -0700 (PDT)
Received: from aruba.home.moseleynet.com ([24.96.56.90])
        by smtp.googlemail.com with ESMTPSA id
 n18-20020a05622a11d200b0031ed3d79556sm9086258qtk.53.2022.08.15.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 11:25:23 -0700 (PDT)
From: drew.moseley@gmail.com
X-Google-Original-From: drew@moseleynet.net
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	ch@denx.de,
	dragos.panait@windriver.com
Subject: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
Date: Mon, 15 Aug 2022 14:25:03 -0400
Message-Id: <20220815182503.2007534-1-drew@moseleynet.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:25:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169358

From: Drew Moseley <drew@moseleynet.net>

The previous change to remove the dependency on systemd-udev-settle
caused boot delays at least on qemu. It seems that change required
a hwrng device but that's not necessarily available on all platforms.

This changes the "Requires" to a "WantedBy" as modeled after the
version of this file on Ubuntu 20.04.

Signed-off-by: Drew Moseley <drew@moseleynet.net>
---
 meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
index 0f50890dcb..b013d95932 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
@@ -3,8 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
 Before=sysinit.target shutdown.target
-Requires=dev-hwrng.device
-After=dev-hwrng.device
 Conflicts=shutdown.target
 
 [Service]
@@ -32,3 +30,4 @@ SystemCallFilter=@system-service
 
 [Install]
 WantedBy=sysinit.target
+WantedBy=dev-hwrng.device
-- 
2.37.2


