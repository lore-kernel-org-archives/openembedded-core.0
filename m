Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11A6C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4715.1642588902340052923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aAjt8SKb;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id c66so4453923wma.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5mWlld5hIT4cLhbNfpBv1WG6cEQ4AjsnuWmvMHdRxk=;
        b=aAjt8SKb0IvsYqwt3ndJWVyVFvQ07zijYq5EfgiwH2aasGRdhwDxcDny0M3nyMu+7J
         8oUCPNDCO2wY//0sNMrAz977yaq6yKx/hMJqDTd4OAW/VsqPGb31A1EFYBGxJByHbLtU
         yjTb7GuvTMB6rXfCxiRS51Bmj6TftYhNjSagHEjOTmxQlBK7Eh/NiTTgT4TP4YLCRuBE
         s6quhUFljGXxs7pq/ny2MNcGulFGSBXSObAwJXP1gXXXhZwGuyfNu5EfAhbjdeSSHuCf
         8Db4vD/DjzdcfIuMxsRJkisUMNWycme+H0UTodS4t5DQfKcovYCSU3o5rX1WsTYjWTIG
         E9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5mWlld5hIT4cLhbNfpBv1WG6cEQ4AjsnuWmvMHdRxk=;
        b=KYk1rjMzDIKJpC4lHP2oRod1AF9UOX+oGa1yL5pxQ49UZTMyGVf2uA0uszG5TY/6yB
         WrWcFWy0MeG7XLJ19cWUQ82B0AE/86PpN22dSD4xHZR8vJJPc4LF236RZDYcekNHyo/Z
         unwTCa6bwbabj7xmTk0ZRVb3Xmz/W4zutN4L/qINxLHl/381xyS0ulA7kmgNpLfgA4mA
         IQOwDyICTKNdydaBCNrcZxPmC7jmX43qE0+ce++aFJDntLrqCbYmr4gbbLUADK8238W5
         mssnR4fdPlHaH4f/pMwZvidB7ZS5bUMgnxWoXxdjDviI+Wck638nJ9o3rbqe3/mL+3Uo
         HwSg==
X-Gm-Message-State: AOAM532QuDs8GoJlEFNISIyCtGGw4deyy/Ez80hSfgBj3YpCotx6DDUl
	NbctDVg1IiMeUWdaFmz12J148Cg0ukM=
X-Google-Smtp-Source: 
 ABdhPJzyeR4JPvY34r/Ppzbp9OBcPWKfHc2ROv3OpTB8qinpjk5A+3BZ9EdG8HE5tIQB71gpTaBK9A==
X-Received: by 2002:a5d:550d:: with SMTP id b13mr6156654wrv.86.1642588901020;
        Wed, 19 Jan 2022 02:41:41 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/39] mtd-utils: upgrade 2.1.3 -> 2.1.4
Date: Wed, 19 Jan 2022 11:40:59 +0100
Message-Id: <20220119104117.2120127-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160712

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 2004572375..c05d3b7c35 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.3"
+PV = "2.1.4"
 
-SRCREV = "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
+SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
-- 
2.20.1


