Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2DCCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 16:31:40 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.4730.1712766692962295600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 09:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CykHGAhX;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4349685c845so20221241cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712766692; x=1713371492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdHrIU6k7/+wr6BWHJiq+Zjnm4LNR/Amm6DwU3jfhnE=;
        b=CykHGAhXPm5fBZcU7tTTH9va/tqnGQr8lHfhT2yi16zWBTScNMOFfmfh3q6lKEiuxk
         Mnekmd+tOIOjBiCPtpOsIi/jxbGpaVNpCQWAVTgH+ckjZiSky67curnPvMe3fY8gJ2lE
         FG9sgsF1Ay+vCDo+7+1R6Qx2C5MhQqMsPkvZjNPHBinb31W66E047A/s6/r9ozxP2d2b
         bwje3dW84H4Y9C8NI7Z9hVv29VRyiyM8LkAtvPtu1PZp2KdQLlUMesmI7MHTrUmQTz4h
         6x4ACysoDlDpIkt76pB6SPIUTNqoaYRNpTeULS/hf+5RZFYswqHaR37tsYyRPaPTOMsu
         Rr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712766692; x=1713371492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdHrIU6k7/+wr6BWHJiq+Zjnm4LNR/Amm6DwU3jfhnE=;
        b=dc26EhOsljVh9fwttqOR59YGhWUkJ0QxlKTZFcGbG1yvVBazkDyYqBWtA+XBt+DB+9
         sERR5mmsYo8uhVJIP8QVtAAF77s0wVhvZHZOqUA+MzVM1nWEacMY2+mQ9Fvu1uuxWfSC
         ZVOHtCTuK+Si4foaqoHXUUtfeXRw2cvisOyQpwoJOEWSjXprwvjNjCjkHigzZym6HSTh
         KpqufalGawjCQ6JW6HSFoWUe1U0OXEw37aMAZLUmdMR8rGdyWvPzjC/83CmBiYCX4HKn
         TZQ8/3Mw6pplBOeOxEHeo55YdOvHoU4Pd9hdpglenKO9524j997vie1HiG8+gs4sx8Hj
         jyAA==
X-Gm-Message-State: AOJu0YzDGQH0eJZGo2hyTy9MFTfJzEbSN08lL4AIc7QKhhG5c42vHkLs
	83PcrzzFe/uhZGCxyswDyQNUcjxukEZiUPFD/h7zlnQusfnEy0SkR2mZcsHu
X-Google-Smtp-Source: AGHT+IEICFFbqq0kRC2MmvbS6bMGQ8u9zLdB1leStFQuBvGlBwoq+jg6Xk2m+vpyVlyd4kZcVIq4qg==
X-Received: by 2002:a05:622a:11c2:b0:434:fb72:a7c with SMTP id n2-20020a05622a11c200b00434fb720a7cmr3294272qtk.20.1712766691802;
        Wed, 10 Apr 2024 09:31:31 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id k11-20020ac8474b000000b004313b7cf2c7sm3857985qtp.39.2024.04.10.09.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 09:31:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto/5.4: configuration warning fixes
Date: Wed, 10 Apr 2024 12:31:30 -0400
Message-Id: <20240410163130.441714-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 16:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198103

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: net/cfg: remove CONFIG_NET_SCH_CBQ
    Date: Thu, 6 Jul 2023 12:39:20 -0400

    commit 051d442098421c28c7 [net/sched: Retire CBQ qdisc] removes
    CONFIG_NET_SCH_CBQ from the tree, so we drop it from our fragments.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: cfg/net: remove CONFIG_NET_SCH_DSMARK
    Date: Thu, 6 Jul 2023 12:42:07 -0400

    commit bbe77c14ee6185a61b [net/sched: Retire dsmark qdisc] upstream
    has removed CONFIG_NET_SCH_DSMARK so we drop it from our fragments
    as well.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 89b8d2b8258..f912304858a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c93e75bc334ba00df2d66411a0d79c4378cf4af8"
-SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
+SRCREV_meta ?= "ecd382f3477fae022ad1881e4c39e810cdc3c760"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 6e049b03f97..2f947824716 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "d29f3f3a932319053ad24d84b087b0a57908c1bc"
 SRCREV_machine ?= "b6480d09d84d09e7560daa5c1d73917292ae30c0"
-SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
+SRCREV_meta ?= "ecd382f3477fae022ad1881e4c39e810cdc3c760"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2a659e32fd6..108043bd981 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -22,7 +22,7 @@ SRCREV_machine_qemux86 ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
 SRCREV_machine_qemux86-64 ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
 SRCREV_machine_qemumips64 ?= "f59947f338319b1741db5dfac34f08399561ab25"
 SRCREV_machine ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
-SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
+SRCREV_meta ?= "ecd382f3477fae022ad1881e4c39e810cdc3c760"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.39.2


