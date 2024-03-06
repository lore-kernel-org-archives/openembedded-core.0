Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ABBC54E63
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.14875.1709739739658298319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hStr8hkg;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so2808626a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739738; x=1710344538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN6ja/i9PjS+baIU1XlOYoPvATAA1cPrcHn7n7Z0EQg=;
        b=hStr8hkgnzf3NR//P9GRsS+IpWR12cX9v1qjfGh94OH4cDrnTYWmcdlfuqvDqB8OWL
         xnNHjxBPYRRMxulQuxNqNFR5BNsWY3p9F7fMnjHNJWiSwWSyK5aAnWJqBpRICbV0FXs7
         ZHIxyiYZxkGZn+ZpAhjb7qiH2JS0THfmGzOXw5yV680ShvLwjh+W+TnoK8QmIphJSSEj
         wCx0+dgCApm+FahOOXRWnNQUusiNr5iFP2O7Kg76o5WgVcxzBygpFJw+zgV/Q3e/HNId
         7cf6bzlaWolNM36GgETzgk7hGDis4bJGIgTcLGnxnj5Z0mk3QuBo+6hFvMgjRUpe6+l/
         XiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739738; x=1710344538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN6ja/i9PjS+baIU1XlOYoPvATAA1cPrcHn7n7Z0EQg=;
        b=gJe5UoIjVjlOEQ61zWrsa6onZvgsnGwuPHeVPGGbbguj0ldiDuZiSuAqb8dW6YBAm2
         RXBMY8SVtAbxsdbH4P9/UH3jwWWjZGVbC6NjqMtogy0MpE+TWjfGS+hODeE9zZmXYIGw
         LyZwDbnFxCz5l0rkkyoA1rnzfCHI8k+zjl9GuW+N7j1RfDiOLFuKEYpfk2l8Fk2AFQwk
         7E+KxfYMB4DI8Q0u28LPw5O+S07Otif3gwujDnrWz31kK9EJk0Ka46xRkiY3pS5Y9bTD
         f2aZZZ5syJJ+whXKMgpGB4yuKAdnCRPrK1XJSW6HziCttEircBB23oQD7b5twMN8/TsU
         Wbzg==
X-Gm-Message-State: AOJu0YzIaBPWEGDlbdeiuyP+e5fP4TNKYslPA9UdHBcW5r6Wh9XKaaHu
	VaW+woIzeeD5WDa8YyX0dcKNsNxAs7Sdf3odfhGNFxeQ4ZrHEMnoG0Sqhjgl
X-Google-Smtp-Source: AGHT+IGFjScELHe+dUr+Eqqhf4QRnTDzD1Q33Qp6x4LwY5xLq2n+wDo5EWfHaEatj9ri2I7cITmKkQ==
X-Received: by 2002:a17:906:a896:b0:a45:bcac:7794 with SMTP id ha22-20020a170906a89600b00a45bcac7794mr1359570ejb.28.1709739738059;
        Wed, 06 Mar 2024 07:42:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/47] puzzles: upgrade to latest revision
Date: Wed,  6 Mar 2024 16:41:36 +0100
Message-Id: <20240306154151.3741709-32-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196715

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index ab4b2394b8b..e9403ee130c 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=92d2b7a2fc96b5f7f17101df7db1fefa"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=191542b32377bde254e9799e0a46f18b"
 
 # gtk support includes a bunch of x11 headers
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "08365fb260ae6e32442dd9f196e65d13facb4b33"
+SRCREV = "80aac3104096aee4057b675c53ece8e60793aa90"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.39.2


