Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA97C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 22:14:22 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.58627.1638828861746336542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 14:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ot8dyk1Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id m24so7990462pls.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 14:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRuRodE2RmcYPUsiqo4CL/LRzqqJvdAdG3Yff/9vpOQ=;
        b=ot8dyk1Q/J7Qg0CjzTOWSTLeGNg6D4zQcCpv45A9e6RhFBqEf8nIfIdx5n0F3rxdMM
         +iPBy0JkVe1jvyArMUi9xl1Zx50AhNZc2wVYoU8gQsdUOWdRI3UbAA0aIGC5kdAwGMhf
         4BnwiTy9efUuTt7ZINkz8WhQ/u5dLopxKnoUYeGExqI7DvLtMTn3mi66DMsp7Tv3LC1r
         gHLmoom6DbaeuedlzTf9GssAId/7vFWz82T34KZai9zzgwGn6KBwzH9g/vDl3TRasnG+
         uauu6s4S0jyrUW5UMEVQy1EYA8atp+Iltzv3NSHVZv3mYXMF/ZnjLl01gss+fMoOXPZb
         DGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRuRodE2RmcYPUsiqo4CL/LRzqqJvdAdG3Yff/9vpOQ=;
        b=V53l6AQJQUPlKFJ1hTzCoR0kDsolVjq8h7LJg/lny45meHhRr7S8vAbjYqUQWuYBaF
         HbkOKEEFG99aS/mogXMiuYwuk8NqSHM4Zs2Zm6jOUPi+ZuI1xBvWFY/t0oni4mReZc7C
         gbHx7pgBlQfTJKRizjubbZKOhtv7/7jNJhZJcpv1kP1airut7nD1AnrnF68iDJNhjR8m
         jmxekaL2ybrdUAHmr/UE7i7LKFLfdH0B0oJVyLlOnQhllIx5s55GKnSJrpk7aq3ETM3+
         bzhkLW6bZjeAJgjnzAH3fe1gLAVKA9tmMwLGqOMO0PjDET95YqXjXS91TbJAZcKKPgCd
         4ScA==
X-Gm-Message-State: AOAM531EMAkZOt5vzFYq3eJpTRlEajk21sZ21zG3yPKBFI0fqDKGV2bv
	tETkKN8ifwFFkaXF/fzIcYUOjSebqlY/Qw==
X-Google-Smtp-Source: 
 ABdhPJw3FboGawLEu9h6OP602GCpGS6+2A04eNHzzLxiI8biexgMSSboPCWspgyN+ahdT/HIBK2ffQ==
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr46989576pll.33.1638828861004;
        Mon, 06 Dec 2021 14:14:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 il7sm318687pjb.54.2021.12.06.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:14:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ffmpeg: Fix build on ppc32
Date: Mon,  6 Dec 2021 14:14:18 -0800
Message-Id: <20211206221418.2281162-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206221418.2281162-1-raj.khem@gmail.com>
References: <20211206221418.2281162-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 22:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159270

Fixes
| powerpc-yoe-linux/11.2.0/ld: libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
index 685214a751b..3ba07c31d6b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
@@ -131,6 +131,7 @@ EXTRA_OECONF:append:mips = " --extra-libs=-latomic --disable-mips32r5 --disable-
                              --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
 EXTRA_OECONF:append:riscv32 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:armv5 = " --extra-libs=-latomic"
+EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
 
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-- 
2.34.1


