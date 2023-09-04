Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4FFC83F3F
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:49:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.44310.1693817358976249638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K4u+3d7g;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-401da71b83cso11691645e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693817357; x=1694422157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvHlRauKkYj6WKcM+MOz2aP6mFsxVDPYd757vovFVL4=;
        b=K4u+3d7giObGiE4Gf9bwrYd9UD9rHbcfGaDtph2ZGeNdTOH8S17YHIMXifCyrPJwah
         SAigGJ8R2/xWDYtWb9d4gQakcFsabqw8jujKfh+I+4ZI/hSUslyhYvFrbAi66EZ7mIyp
         uxao1e7+XDOczGgQoHvSfHjmRrsAQwQVz7Dy+DQpdLBHOEEzdM5eamDc8/1SU6raL8Qf
         CKbxp+emXs2UskkHZGX5aR7GzhdBgxj2DXqbuhHOjEo8Qo0KvZM3RoQZapRGJVYjSEHR
         XcMQHRuO3oP+9zbuLAyLoBFfZknV+/fQjCGPReKXKZuZxTul+gZBEDcLJYZpjBrI68LE
         zRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817357; x=1694422157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvHlRauKkYj6WKcM+MOz2aP6mFsxVDPYd757vovFVL4=;
        b=MO/bDDhQHvvXom43L9wsaAgRVwBKNRmX9NGq1UuU8ykExpeqti5D7IgsTAK35U4yBY
         J2G/HD+Wijc70fv2lr4MZNjsf0eFD+e58Id+uQCm+zFwXDCalHjwu8RWv+3N2tWSbXoA
         DkzxLdY2ro/11eIAjBWNFKuK+5Ja7oQMUdw40RGT8KCemOBZ8RHsIXvP9LxUkdm15T10
         FdLjW0zTDUBwv+YxfFZmrBO9UJmOUtRk+yesNAOlDH3zVvnayY3PygLI5i8vD39jKFjf
         UG2JI7pLyG3jc/+zkW9e8j3dvhmcjVSew6u8rDAkFWIPVvJuyGncJvpQwcg80xHQ1Cpp
         nSiw==
X-Gm-Message-State: AOJu0Yy/Pne74E9SdW1wu0Zv9rQ6GWuAM71T33fTOncZdUzdDi26FB2X
	/yyBwV2weJ8lpgi4RvhZHAwtBfYDblTyHw==
X-Google-Smtp-Source: AGHT+IF6/VJOqdzV1a4jO2DQzcTxNdOBkt/9Ufx8qxQHrCi2sA9SDWKZ+zg1wZhUNY+cCSTCiEqREQ==
X-Received: by 2002:a05:600c:202:b0:401:d947:c8a9 with SMTP id 2-20020a05600c020200b00401d947c8a9mr6506605wmi.19.1693817356746;
        Mon, 04 Sep 2023 01:49:16 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c21cc00b003fed78b03b4sm13155797wmj.20.2023.09.04.01.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:49:16 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] ffmpeg: avoid neon on unsupported machines
Date: Mon,  4 Sep 2023 10:49:06 +0200
Message-Id: <20230904084906.4135137-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187166

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index eb8dcad8a2..e65f80d64b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -136,6 +136,8 @@ EXTRA_OECONF:append:mips = " --extra-libs=-latomic --disable-mips32r5 --disable-
 EXTRA_OECONF:append:riscv32 = " --extra-libs=-latomic --disable-rvv --disable-asm"
 EXTRA_OECONF:append:armv5 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
+EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
+EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-- 
2.34.1


