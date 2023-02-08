Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654D9C6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3128.1675840911843332213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jpVgH54X;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so731361wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29UKRMMjxRmgi0NuP0dGIbdzo0Zm1qTjRcqmd/3iEuY=;
        b=jpVgH54Xx7bl23Tluq4BGOJtbsv3JLY2AafP463s1dDgf4QiM6Qgru2mSiT65J0kS3
         ySc5cIZSc0zfOErqfjIaBs4M+edhBYGSkHUm/Ho6PmG0ou7PpuyJApvw+Fs5iufyzXI1
         1L35L7H6Vp2uVztSmofcW6YnkcJlkakomF+W89s+I1/gg9gUxEKmn5J8CnxuxpAPzGMx
         WYOBvZEG6gbigpPpw8m4EBSwNqL5vZS5BLp/PhV3yQga4VMMEDkDzzGVPoEz8iZYucYL
         Vf8ok98B+GD+cpr84Jdy6FD0HaM9uAi9DZaPfhtw2ReahoF95AyDGYavBBrPe4Fgl6Kt
         rXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29UKRMMjxRmgi0NuP0dGIbdzo0Zm1qTjRcqmd/3iEuY=;
        b=Dz92/rDG+taLL8dSbl/ei2IBaLZX5UNGQ2wIeSvpI4uevrAnB1nog6lz2HvZ9nFhm6
         XjCQ5yMugm36h/tksitzOgXXl0URPV55FL/+KN9HE+SHrWoSPbQyjvp7hFEn7blH7UvZ
         JdAPIzokC5LGQNZu5dRSPiW5LTLUvWc1PZfnL1h/72KyG9vbavd00L5YN4MSo0kBy9a5
         zmqeN4Fkdk3ZN83nFKCpsmK7UZsAcN8qQKfGUfj/nkQDCxB8h3WZw015GNRDqntGZ8JO
         SK062EvWmfIka3FlBxksO81Ke0ctN3c/jjcL4gZGl0GLHHHmDMz/DtgLvR/fihL3rjGB
         9SqQ==
X-Gm-Message-State: AO0yUKU2YXBVN6FTjWwUlpIYayeEWhC2vksHzqzlJ12Bt+kz2lDYo4nw
	T08/CHOo8/2WqIximavxJNNdtjMpLxI=
X-Google-Smtp-Source: AK7set9nWEbM+jbhl9YAjt6QnDQATBt0ozcqKpgAxl3uTpng1belOng+au3iAdnzTXYRTu6M/Ad2Ig==
X-Received: by 2002:a05:600c:1887:b0:3dc:4318:d00d with SMTP id x7-20020a05600c188700b003dc4318d00dmr5410360wmp.11.1675840922566;
        Tue, 07 Feb 2023 23:22:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/52] btrfs-tools: upgrade 6.1.2 -> 6.1.3
Date: Wed,  8 Feb 2023 08:21:17 +0100
Message-Id: <20230208072143.2930292-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176865

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../btrfs-tools/{btrfs-tools_6.1.2.bb => btrfs-tools_6.1.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.2.bb => btrfs-tools_6.1.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
index b10d7efdb5..b4dfc5b3f3 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
-SRCREV = "660d10d3fb2e87909d379b0ea3c52934543455c7"
+SRCREV = "908b4b4450320e30fdef693f09b42f4eb93702c3"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.30.2


