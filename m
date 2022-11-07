Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4545C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4221.1667832917636303752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G84Os1iD;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j15so16597821wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atXdsarFWPSYfuYrOJGQRPuRm319HubA28ezFhRD4yg=;
        b=G84Os1iDypt5Y3aCusgfutrNQ7S37heauS3U5R58scCqbrXZdFASqMS3zbtmAR/Brm
         D3TPvX3YHQwmm+ItdUOycJxDMaJfLGcOxIyaJNPFnYc8+etf8Aw0FZhY1I4IWAiE4rnM
         EgjZO9XEFULonGb7bvSFNl9rZFv8jxylYIr02lR2J4rd0qx+kJDafvU35IkiOjIo5jrR
         2MNfpq/CJwFCH+hw2BbpkcJizdgV6qzaA1Iq1KlmrGdOql+xkMStWVQu78jw0D11ztli
         X81XJKL2lxYO531Johwd3Lf2Auf/9z67zzFgT3lnm47YYbGTaGCgCDEEAA2ejV0YA9Vo
         vzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atXdsarFWPSYfuYrOJGQRPuRm319HubA28ezFhRD4yg=;
        b=qIXcMCWqTL+pBwh4LyL/of5Hu4+DvfINkHczfkst1wEduVWY8fwFCVjwZJvlvBE6gO
         MnWTIsU//nuegAdeURX/y1JLfMuzTVe+nz6yC1TDi0EnILYiCIJWX3Uc9uZu0e7YGqrn
         UBiXgOJTNIOprxq2fWSkITs24GacnexEfM61/Tnvp7+svVktqZMniqwWjmsxk64FFkjg
         wKtp7Bhtd7YS8qsswFUxHjVbiGofkE87ukffiWbqjXENfYMMAIlAVd2SqP517IiD/urg
         H5bwA+CWRSmHR7nF8vltSeMorY/2a5BKFM+sTJvxV5E6ol9ulfiBYIbRC+Ajr3+P1nwx
         WDdg==
X-Gm-Message-State: ACrzQf0CdS4o2UNGJeHA6X94DH6OHaU5d9Wbe2JGg8omkc11RWGzhsej
	8VlaDq2jpOhAdU/LxtTXXLzM4Vgp/yk=
X-Google-Smtp-Source: AMsMyM712fTB1Xx/uBb+ir3ncFF/A2sojLTfl5RsMGciw7PqZfy1dSAmjPWPQiKYAYclNGZ8zwntlA==
X-Received: by 2002:a5d:5401:0:b0:236:960f:15a5 with SMTP id g1-20020a5d5401000000b00236960f15a5mr32373902wrv.598.1667832918286;
        Mon, 07 Nov 2022 06:55:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/48] ffmpeg: upgrade 5.1.1 -> 5.1.2
Date: Mon,  7 Nov 2022 15:54:24 +0100
Message-Id: <20221107145508.1051404-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172853

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ffmpeg/{ffmpeg_5.1.1.bb => ffmpeg_5.1.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.1.bb => ffmpeg_5.1.2.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 2306fe4a42..a0c98d4ae0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "95bf3ff8c496511e71e958fb249e663c8c9c3de583c5bebc0f5a9745abbc0435"
+SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.30.2


