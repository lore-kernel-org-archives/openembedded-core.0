Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02368C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.4644.1642588911569265242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RmmeivrP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id w26so4583260wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xvGpzZxevOujxj+30hRMa0axhxBkl9J0eGgVr7LgEmI=;
        b=RmmeivrPpobHupKUn561iJja/muHXcWm04sNnwWWMTxiUOIOeHUoDI/uiwmYaviqe3
         d9WhUrnTXuxpIpFja1IWaxLcrNRgtyS7vK6xDF4pzjHhXVW7uWU9eKKJQ8MUw8EFgzIz
         6ikq3ChsiVzBbX9YB6kjkZko9rJWmKodohE1CNLryWL1k/g0xNVnAA3YuqRvWJQc6mW7
         OzOx4vTRf2GuoHcc9abc+WTArhTYXd7l+rl7y+UjblVzLDii/Uh2hDsG+lzXrZ0q96iv
         hAkr1GUuNqXJ1lijw3BdY680d5a3KnOZDQ4nhUWwW4chCPSfQVpmzcXLdR66dSJCLEWT
         uHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xvGpzZxevOujxj+30hRMa0axhxBkl9J0eGgVr7LgEmI=;
        b=FtA7Z/Wzmpf//NW4KafTvg0CqDa0Wz1BPVyYnGhxUnWoLadNKTZidk4TboDKIlr+pr
         xZ90VKKFR/aXHRjMkKCs9gIjX0afvwDZ1X1B2pxk6OVbuYni3V2oTdAOC1v+ammZD8Ha
         bFiD9ge3sFYwOm92/S+Cstl4Dd890SqfkCMrRNsWLZpwWFChtZzERCLAID840XWVRU16
         2uvxMQW03SPcypcCMq68dZPBmLvgQN00ecSNTFnAQENJMVTuQOHV9hZWxCO6vrtowORV
         OKVrs9kIWEbDOT/9dcdqP3eux9GJ18WLrYwIZx3cbGNTuZTAfVuXMdeRQKIm28bS7nqO
         6fhg==
X-Gm-Message-State: AOAM532w+i/wmEpQ5KhVDl/+0W9BaAY/6qjffUAx9RFIZpsjtUx1c3zE
	A0LPS4SbfzJ14yQQW7muO7v92Z5zZFk=
X-Google-Smtp-Source: 
 ABdhPJzIb/GrZOd9vuXxHgFU57NbzH6ab4OpNzYfakss6LAcSu1Js7OGUelIKsewPCk6Z4wmPbVISg==
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr6414667wrv.557.1642588910198;
        Wed, 19 Jan 2022 02:41:50 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/39] puzzles: upgrade to latest revision
Date: Wed, 19 Jan 2022 11:41:11 +0100
Message-Id: <20220119104117.2120127-33-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160725

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index f2fe7d7b96..0bf878fc96 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b56c994b721f7cb5c5bcf09c5d695d4ae07d3052"
+SRCREV = "229d062d6ce63f0a5e00d2de62ee0fb389ccfdb6"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


