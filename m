Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E684FC64ED8
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3145.1675840917714604858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e0mLA3Nk;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id u10so9596858wmj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6Zu8TDFpAGFR+sXg8ABsWnGgJckfbqDk73/tuZpWiI=;
        b=e0mLA3NkbdCDFD0JkkoHh5aqsKtzflVuI82QXXfUCsAFlQDxsjUQ7v5uY7Jub/j7Ww
         2+DqNkOwsNMjE43lCBIFXM+plWMonM+fvVaqUpg1exBhurUl4NU1TdCnG74mqLvxq4qE
         gBCy6Db4mTslD8uP24Qd+jmSOAeKeIOemAOZneekMQclzZqnWowsI7i4NThnfnDkVXJS
         UWLP79tAEkx97WlHKaczhVkbpbchzGKsGw4cokdA8+j99czOG5Afkg2Cpqzh3ayuh9eg
         l/hS7TPmcigHVYp5NyXjBStqDSIVioS/XYJF/UR9pCRpXobdrqh18KCmIxJ9uvn5/Pfl
         0Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6Zu8TDFpAGFR+sXg8ABsWnGgJckfbqDk73/tuZpWiI=;
        b=tJK+0JcgNzz1wwAWrMKVml3zZV65JxRKhNAOxv0/bPPuZspSlZwLWeLiaebBZKod7K
         CRKq9GSgWFPFPcGZ9bVZCInejMmGZ6kAsrZMApcIpcTX3/SMccx1mxe9oknrA86FUQH+
         TwaZKxGlWMRAjD1xAftN0VAlnJ+lKgj8yHeaQ/p9AIk+fvm+46htYo3U8OfJbJ+1AIcX
         g3vgIWWAPN1P43n7hfBk61SQrsxpy1Y9Q89JFgtgYuEgHcnGrU5qNdDxjSb/2RwY9dQs
         uHEkXfPyY48uzzlDHTPEHHWq5uFIoHzVomYGm9GP4OHJ5CSDGESRem7yKkfJTYitw7Pw
         5f9A==
X-Gm-Message-State: AO0yUKUiK1eeFpj2CDky8M48cPm0C8BQv2oDX8j6+CpfCMe8G2RrVZCD
	4FcNotCx1pIg3wi73476/FUOX5KV2vE=
X-Google-Smtp-Source: AK7set8Tm/W0XCEfPGBpXGkz5TJtrm/zvtrm04+SobFJfHQTK81ThVBO2jo9gElefDmkPGF6vBmSow==
X-Received: by 2002:a05:600c:3298:b0:3dc:2b62:ee9f with SMTP id t24-20020a05600c329800b003dc2b62ee9fmr5715150wmp.3.1675840929616;
        Tue, 07 Feb 2023 23:22:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/52] puzzles: upgrade to latest revision
Date: Wed,  8 Feb 2023 08:21:29 +0100
Message-Id: <20230208072143.2930292-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176878

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index c94fef4931..1774d0fb20 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=6e7d24cf1c949887ee9447a1e2a4a24c"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=92d2b7a2fc96b5f7f17101df7db1fefa"
 
 # gtk support includes a bunch of x11 headers
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "14c025d192579961d1ade51f2a322bd765aef0e5"
+SRCREV = "37df1f2bbc689d224369d963dd8007d68fcd7c6a"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


