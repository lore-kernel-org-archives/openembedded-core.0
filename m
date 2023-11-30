Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AA3C46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:57:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.5257.1701377866499316970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KD8lq79S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5c239897895so1178107a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377865; x=1701982665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea1zRhOZMS2CfZl0IgF9WkPNoRyHRHXpx4iIv5aelmM=;
        b=KD8lq79SMXW1DdCdE8+FZdKRHVC+SYvyMwwv1njmoS5aj+i4gwtyUB+RrI9prRZQ7g
         PR9r2acTrHopZiezpb3+VFzRikueaNmKWzihiGjVf9CsAXABuIvf1XP/aE4OUe0kJDL8
         ql6/tXeObm8gWJSukgEiEkysCIdtSPztY5VsMKFlwOdvWW49UT9o2UG9wjJD6o9Rh2Gk
         R0nqFzpGspWgrcaE8POwEvl3/yMKNeePlvTxJma1lW43agKf2qhnMkpo/SUJ73v36P9J
         DIFmhBE7hxmyDBxy6vRX2xxxMQIup33xQrN1mPXkfDrmQcdgO0SIsc5zHL1nBpokIX31
         sqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377865; x=1701982665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea1zRhOZMS2CfZl0IgF9WkPNoRyHRHXpx4iIv5aelmM=;
        b=FZ0/q7FBp1bWoTc6GoswHXuo0TmbDrsSVplCWWiGBukgrtXs8Hp105iNxNDMnro5uZ
         SJFgEHwkjETxMgmo+cNcHvr/7q7son5odpYcFT7rJNkTUFPWfdRWl0Wc9DDR4zaiDTbS
         FjPC6ajOcFGAvgHVPIn4SGYm8TtCWhI1hZ5wX/NHwglDBFjPpsI9C2xdTLK1p521U95x
         a8AwlDElBgGflEpk7S0EVWeo14XZnyp7RfqgyKUrBf6jTKfa0YsCbbUF6ZBJX9sOgqFU
         iP/Ns/2nlMw9JPJarhOh1NYxh17T4J3b7InpXwHb9e4pRMZi+naP5DdfDAZ/thj6N12i
         wShQ==
X-Gm-Message-State: AOJu0YyOeOCDq1g7c0M6hMGWiEYSjJ9juahJHXqmd51jdXA0Fs/z+Yvj
	zo37DbV9CuJH0f4agv0iWB/tETZirHS3uu+eFttoYw==
X-Google-Smtp-Source: AGHT+IEY29LridnaoWgMfzBKpZDoL4sohMvkJabVLWEa3krsuY95Fu6ekqLxcOyet+ZCUTH7tuWyMQ==
X-Received: by 2002:a05:6a20:7d89:b0:189:b618:1736 with SMTP id v9-20020a056a207d8900b00189b6181736mr27885713pzj.57.1701377865628;
        Thu, 30 Nov 2023 12:57:45 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/25] enchant2: upgrade 2.6.1 -> 2.6.2
Date: Thu, 30 Nov 2023 10:57:11 -1000
Message-Id: <9da704f23bc9538c6fa6fb075fe2c28e7751c8a4.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191521

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Documents exclude files: each personal word list is paired with
an exclude file that contains words the user considers invalid.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0877cebd2c990d9d98fc348032742c2d9fb4254)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.1.bb b/meta/recipes-support/enchant/enchant2_2.6.2.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.6.1.bb
rename to meta/recipes-support/enchant/enchant2_2.6.2.bb
index a3510a8705..38d3245d20 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.1.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f24e12469137ae1d03140bb9032a47a5947c36f4d1e2f12b929061005eb15279"
+SRC_URI[sha256sum] = "6686a728e56e760f8dee09a22f0fb53b46ee9dbe7d64cf9e5bb35a658bff7e1d"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


