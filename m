Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5853FD29DCB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 04:59:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52604.1768280372102952329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 20:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNNP3hPb;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0a33d0585so44464425ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 20:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768280371; x=1768885171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGbcRdiei82j2Z8jzYJJC9UHnE33rCzmtmfG2yoTFOs=;
        b=NNNP3hPbHohYk0wSiV5CiJgDcR2GHuajRUY5/l87Z8fgtcRbCo1SHUDereb/7jPR3D
         M9LeyuCS8bjVD0V7BKXmDiZogr/npBH0BzloeBofa6Raio7JIVZj716mTLWAhEBRe4Nw
         KPVUG9e5SUCRd69yCGFfP/0Q28aZVRGKpJWAyd1t6P9hivB14LOBfIOaOZpYzwdKJ+0f
         G92oZQQWKmXtfI+dnhG9/UP8pO1gg6v10oEFqXDtpTfyZ7gJ1tRsA2OmACC3xQdBuxY8
         DiELrkD1ayB+Igsca1JbU4DdJWqtgsWstgO0E5QyWWcNXLy7iUFL4+dkcJUJ5mNTVybY
         pIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768280371; x=1768885171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGbcRdiei82j2Z8jzYJJC9UHnE33rCzmtmfG2yoTFOs=;
        b=I2cGSIUD3Ciu6PoPbfeAcgwpNnJpeaENFOttnl3qUS2qCDFuOUbex69ky/Czn9ks8B
         LKJElV2zYryGHtay+mNQKzsJSS0dkzDBgpGV9vIxPnJDhUqhgJYq5fKc9+oNgQhzJX2D
         tvRJ04zTBfZk7WKCBXyLLSW6QymZN83EiGB2vLrL1DcsCqmF2oJXkyobE6pcrS+HqAdp
         fnVDqK9cHDIikJsSwYJ1toU6YK8F8iw2qX43uPo/6HhJEaJf/qPUmZkOG9bWEZbWFFN4
         TorOp3WtFWliy85/Ms25ccRkksLGbMTL4N8LqkKnTz5663Opym5KC5Ejj0oChzYbLj1f
         nv8w==
X-Gm-Message-State: AOJu0Yzvksc6G/OgU4eep8nSmBGJRV8Z023nXicT1JdoBR15JPlG1Gua
	75Mqiwc6rEYzaftYdYMDaQFf4Cz3KI77LbFX3cHuuO6BCOS2W3413NJSK4t/fg==
X-Gm-Gg: AY/fxX5Sh+y3a6w6yZrGgHlooZ0JUhMKacfnZo3pFJYPzoVSThMyNqbNm4r/Q8vhQs+
	8EjZ8EzElnL6WxYvy1OqdDv7qCv5FeAUKUNygWed8CSYAs58xDRQ17Ik4PQ1aByC1U/X1Q8DzwG
	l+gpsk5qh11DCZJgzhMfgiR2/LzngVw/bApPJg/e9ZhAdo4JPJE5V63jPJmDHWp7IBINUUY+n86
	Q0Y4HrnR5ImZoDzEQAsLkbW5YPiNHQ2p/eab6fztldDZimAEL8YUlvF5YrEpoGzVrdP4dSKiT9Q
	uO+EXiJxj3leUWhB7JDKb8jG6eAjjm0CxHAsxEuuAF7sVfRk2m+drfKvtGiQkAtxS3lC321OifL
	Co391cC6Bou1hT631RPfztul6f6TWi/MI/muy2egHtii3eKCH65eX6fob5JXfbsPQ/4ed2GieTd
	/tbpoPbpLkjL+C8/mFcNaCbRy8cdqjOniEow==
X-Google-Smtp-Source: AGHT+IGVnC6vwZWZ5AZYKZAE9PKTgKZVTgh7fViz6dujlvIaflnThQ3V8rpMUW2Yl3kkzx31pmSx1A==
X-Received: by 2002:a17:903:46c5:b0:2a3:e89c:593e with SMTP id d9443c01a7336-2a3ee41f181mr208217175ad.4.1768280371283;
        Mon, 12 Jan 2026 20:59:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2c0fsm188822975ad.66.2026.01.12.20.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 20:59:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH] mobile-broadband-provider-info: upgrade 20240407 -> 20251101
Date: Tue, 13 Jan 2026 17:59:23 +1300
Message-ID: <20260113045923.402096-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 04:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229223

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/20251101/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 06ded45934..9e7dd9da76 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
-PV = "20240407"
+SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
+PV = "20251101"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"

