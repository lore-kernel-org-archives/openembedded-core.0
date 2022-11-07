Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B40C46467
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4133.1667832925927497408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CKHPfnri;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so2299466wmc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDd4wuYgcvI/E1tNVQXAY/HNI4K3/gK/8PkPP97ilT0=;
        b=CKHPfnri0s3Nh3dTWy51Kj02mwj5TMXAAD5eKQNW4hVrVm09QjSphDSd6oXlX6juTz
         +42Cp6YkI8YdJ2QsFplz4naIQaFplD441Bg+mep/TsuKSXHcmuCFJFsgQ9pTloCCFNVn
         c4S7jRGA5QOnHq5Il4CV1IoDtd5cYMXmA9OY3acz9MiN+4LWiZ2Cfy90hTd9z4zJzmp0
         eob+c+w8kiGYiDPt8Z8w6o0gfu3Gd2F6ozyWT8VJr3dWW8/JDxdTOAwvT1+LD1C3hqZN
         J/jqU98BYsMT5p2U0CDtnnK5og/kvhwwlezvZUkmftGO5QiXMkHGmkralLwaPQ1zsqeQ
         GaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDd4wuYgcvI/E1tNVQXAY/HNI4K3/gK/8PkPP97ilT0=;
        b=DGDPwJJzBYc621si39YLNxW4pUPIr9M39Xoni37MEV1ipzNE1zvZrKF1Bqu76HEfjS
         352Yc5vb43snuYOHHpB5J9h5Ru/fGEBTYtX1e8DHKtoRpxYiaFuuCLh6xElhKO4E7M80
         Icn/frXRfI3wfAcD8pEdzknjjR2lGDU39LS/UtWWavIRpJwESLVUbuT2qkmrQAtToI1y
         irOdw0nxWocDLeahyZDg9MQ1e/BjS4Mb+NB75opkiASo742jVvF4WuJk8O1/8k7ot2lo
         6wqO0Jb+3TZz78f9VxrKD1Fmi3kbwJ6LM2M/r5Ajag4SZf9B7ZKPaJCkkgB79FzQajOO
         Df9Q==
X-Gm-Message-State: ACrzQf1LzA0mvMVgDraIc3jC73cnBtMbZTEVERSgAH0sZOQ17i0IM+HD
	wPLkRBsMVNwCvE2tOUxxqH6TAEDhAfM=
X-Google-Smtp-Source: AMsMyM54XHkJvDvdDKizloxd4meTrXNmRfifu6Q+5ejXOHzu5VAb+Qu6NMe8N5TnWvKS7FFY1qGyRQ==
X-Received: by 2002:a05:600c:5543:b0:3cf:81e8:20c7 with SMTP id iz3-20020a05600c554300b003cf81e820c7mr21833709wmb.140.1667832924400;
        Mon, 07 Nov 2022 06:55:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/48] puzzles: upgrade to latest revision
Date: Mon,  7 Nov 2022 15:54:32 +0100
Message-Id: <20221107145508.1051404-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172862

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 9e9bcd2eef..615eb1bb77 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8399cff6a3b9bf15c6d1d9e0c905d1411f25f9b8"
+SRCREV = "06f6e878a0b588c513024c3498b68a3c87594ab7"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


