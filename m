Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA56C43217
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.2634.1639608044877019388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iCzp6xKi;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u17so40762069wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMplImfBpr4ClnX0lfIMKQNlE/p/RV+/1mWtUuXlVIk=;
        b=iCzp6xKi39AUzeCWy5AFtzFcMC2Tu42nRycRSjAF4QoLYyyLaT2y/EA4OwngCmsDCd
         4OSM3X/75jjO7J+VTRCeyDZpTetwFCOjjogLid8dMGaHzDgBJ5KoS8gJ5KW1LBQc5Dwx
         t3YB4YG1YMwvOPM+S2e6KfGkWGp1GfIJ8PVWWxlCBSTVQ+62JEYv0DOlmfsFD4C2voZE
         M/2ffWIPc7ZHIvzZFo1ZSXovJHRzTJigtw7finfZ9QiVuM+I35uH4PL+mGKNK8vtHOLH
         bm/p1qU53f5nIZs99IFsSdKmLxHbZZKENfFmWvgVqciRFKGTIomlUAWm1EOrs9yflEMT
         ywAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMplImfBpr4ClnX0lfIMKQNlE/p/RV+/1mWtUuXlVIk=;
        b=oKcsd32oH7Oho8B9t43LIcqgOnBH6ZIk9s/PkFBQ7+dJavNyOUD65J6FihXrcnDsA6
         Nh9fUWryD5KyJ/HGJSkd0YHggQmjK4mpvG1ZfMlyMZOojIi4SkS2tuFr5RNE+fiMN3oe
         2k1suNt0CR+tmWFme4I9fREBN42xhV2xsUqanYAuPStjGCyyWYVsRaVTT7UxbBRJk+HS
         5t8GmgL6inUEmHWbcjhE2Q7MvAkii+7NM/G6WryUORijyTc+wABeWCmN4l6jpYG1sxEv
         xt568vEbJ+h6dDI2I6w6jG/8dYwa4pRXB25KsLW0oq9p5lGfdPkPFo5h8aiC5MZizoKQ
         koqg==
X-Gm-Message-State: AOAM530KWiVopmAZ61lGRDNd9tMDoLj5yWjLWUjpVanHcGqYbsRLR5gy
	DbCyBuWB9Wm63Xldm7qQj7Ytq2sc4zB9sA==
X-Google-Smtp-Source: 
 ABdhPJzPoz8K348nuWN1jBIEc1XngupawFdIsFreGZXNf6p9XPT2jqi2n66R+U5esTeMA3s8FexY2g==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr6769476wrz.545.1639608043490;
        Wed, 15 Dec 2021 14:40:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/26] btrfs-tools: upgrade 5.15 -> 5.15.1
Date: Wed, 15 Dec 2021 23:40:15 +0100
Message-Id: <20211215224034.1814148-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159749

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.15.bb => btrfs-tools_5.15.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.bb => btrfs-tools_5.15.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
index 399ba17e3e..9f3c0e9abb 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
            "
-SRCREV = "4d06e4a13d1ce1849a60b68969bc385ab736ddf7"
+SRCREV = "c0ad9bde429196db7e8710ea1abfab7a2bca2e43"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.20.1


