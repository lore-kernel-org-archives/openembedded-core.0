Return-Path: <wesley.lindauer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00475C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 05:00:12 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.14561.1661144405960141423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kV0Qq1bH;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: wesley.lindauer@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id n21so7117452qkk.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Y71wWku5xeJVArKbBwuHxilQNIYi17ESAfRV51LjW/U=;
        b=kV0Qq1bHx81inJGCvL/Wfo1e+3nQkBL63818nr2qSePDkdVZ1shmgLd14kqZ46hHxq
         2z1JklJyQR/+MIQi28ifFM3oY+sO0773RAdiW8EtRI+UrvOQL4Zm8Ju+rnvdUVgZQ3Jm
         1qQXEKe330fNpGqP583OWqKPQ1BeRu8K+BpEivkxM1DCfz69bCP247VuRnKcX2mBISWM
         mUB3eV2uqwoEDmIBl6IBSbhYRsvPTLP3UAcIPv61zkxBvrTePNiDvw9wirlymBwfFhxt
         I1S7nHKEzreAsjga5bgooOYC5BqCnk/DURWblWiFKJIDQnZxv3aqDxRovhx7yyfGlEFa
         hkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Y71wWku5xeJVArKbBwuHxilQNIYi17ESAfRV51LjW/U=;
        b=xmExayf2eNBl22Fa6zrY8HiuLjuwNAz9R1W2CzZ1zriZ5W10OBafLjqKKAO9m1CWxI
         nkrxP6JXMlus17T2Csyi8ZAbF3LJRY402t+l75JHeDbZlx+95NmWfm1T99VApjSTWJzt
         plaPMdMVxCO8in4dBFO/4YcdaYNCpGseTap2b+9/SaUE9HnKs0ny3F1qSBZ9TaWCGDfG
         YzISiU5HBm3eds7ZxvDLWi8iJmyttXfKJUyALxUXIJSPW1svAiHa93S6gCQJWaYSmkjd
         VKInIvvjV1p+9NMzaiMMvDwvDWDTmySfvr3OwSYt6zHzN82cjGt+kCIkRk0TRKoCu5/o
         nsbw==
X-Gm-Message-State: ACgBeo0BYmcW5xS4dyWIZcJXXbcriMMjqG+Pzy9BG/r+WBcJI3osnZ7T
	jb5QfcuXFk/97MzE3FJq8MdIu51xeL7LZg==
X-Google-Smtp-Source: 
 AA6agR6fxUyRtFYSURC1iNx3qAPZbapjxrtrHGZCrQRf53Z6bZH41gyhanjgkwDNGLK10j5MYsAjNw==
X-Received: by 2002:a05:620a:4613:b0:6bb:61c1:819 with SMTP id
 br19-20020a05620a461300b006bb61c10819mr11724786qkb.736.1661144404792;
        Sun, 21 Aug 2022 22:00:04 -0700 (PDT)
Received: from nova.wlindauer.baselinux.net
 (cpe-192-181-152-172.kya.res.rr.com. [192.181.152.172])
        by smtp.gmail.com with ESMTPSA id
 y16-20020ac85f50000000b0031ecddf2278sm8997964qta.37.2022.08.21.22.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 22:00:04 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wes Lindauer <wesley.lindauer@gmail.com>
Subject: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore list
Date: Mon, 22 Aug 2022 00:59:19 -0400
Message-Id: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 05:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169658

It should not matter what xz/zstd parallelism and resource usage is set to
when determining hash signatures. This allows sharing more sstate across
host machines with different CPU configurations.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dd2df8a552..d9eb1831ea 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -944,7 +944,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
-    OMP_NUM_THREADS BB_CURRENTTASK"
+    XZ_MEMLIMIT XZ_THREADS XZ_DEFAULTS ZSTD_THREADS OMP_NUM_THREADS BB_CURRENTTASK"
 BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
-- 
2.25.1


