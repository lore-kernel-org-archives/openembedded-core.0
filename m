Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110B2C4321E
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.7442.1668810542144525232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UA6NNpCK;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id e15so4092927qts.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EItW8+d0zitdEWjPJpte83/PEJwhHG/addLP37m+29Y=;
        b=UA6NNpCKAGzYCkWW25lONVQjjPeN+ENODIRe7DxKHI5brMGiGh3DIK10eckXXUPMtT
         j8pijoqwlZTyHijuem3Q46QSO7kRx1e72ImKKcoJZFrf4sccnjJV4Dk33UFFGxnl09hc
         UVc3Sr3jmPT60FDQSS2PhKaRmOimySkfYby24uMY2QdsVyWekWkUceJq3PX588aPsZGt
         S53agp29GgrUYTwDU9lz4Yvel/SD/YBZtHkqlSSDwkenCGfD+B79lBeh16a7iXocOuZ4
         6nlE7ADH0Qm2SVXAk1RONrjnzQJpE5dsEl0PVJ6EC1fLHFBD85OGLvncNaenCu19tmAm
         gJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EItW8+d0zitdEWjPJpte83/PEJwhHG/addLP37m+29Y=;
        b=V6DXpL2APT/4YV07lmH/8PsQpnbPdgmSXbFVdBZ0UbJoPQcQPvptxdgaxZH0YskBVW
         KjqvBLDzhVlHIFC1f2DjtyxBOP/llJ9G6/Bos4gWH1P8XQSMLLrTEaJ2TAEiYtg0yct1
         w99guG7LjUoQDYfowY3ptixgpMUEVw7ZhD0Bzl7ooJusGgE1brr8lAE9aXzwjsG6vbAk
         ReaNscbgebrBK/0FMne7LjpgvLSfEk2cmDA07wRVvTFkeWrUBeTEQLP6NKMJoTcid0/y
         +Vx2f+FI5cuAPQT9sd2zEL4VxSIeWknwXIyxpUV5QPAckV+QniRAXLA+WLZudkTHJ7xO
         zPNA==
X-Gm-Message-State: ANoB5pn56WxFMgo5LEllBK/MQpLPj+XntRAAUP08H1MW7sX90eOb+EjV
	hlpjxSjT1tCztbHlKsZJe8s=
X-Google-Smtp-Source: AA0mqf7RvM8qsUaF7wuyWujKPyllGFKrCB32orE8SvPKmPvmQIYERY+/+SCD0yJcqevNG9xHXoO3rg==
X-Received: by 2002:ac8:644:0:b0:3a5:9e4f:9d91 with SMTP id e4-20020ac80644000000b003a59e4f9d91mr8568761qth.624.1668810541090;
        Fri, 18 Nov 2022 14:29:01 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/15][v2] kernel: consolidated pull request
Date: Fri, 18 Nov 2022 17:28:44 -0500
Message-Id: <cover.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173494

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is a resend of the 10 patches in my first pull request, with additional
-stable and warning fixes on top.

We need those extra patches to pickup the one of most interest:

   linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure

I was able to isolate the commit causing the failure in the 5.19-stable
updates. did a revert and we are now able to pass the elfutils ptests.

Bruce

The following changes since commit 44bb88cc869f3b42440d6f7aad000e706b739a2b:

  mesa: do not rely on native llvm-config in target sysroot (2022-11-15 09:38:38 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (15):
  linux-yocto-dev: bump to v6.0+
  linux-yocto/5.19: update to v5.19.16
  linux-yocto/5.15: update to v5.15.74
  linux-yocto/5.19: update to v5.19.17
  linux-yocto/5.15: update to v5.15.76
  linux-yocto/5.19: cfg: intel and vesa updates
  kern-tools: integrate ZFS speedup patch
  linux-yocto-dev: bump to v6.1
  kernel-devsrc: fix for v6.1+
  lttng-modules: fix build for v6.1+
  linux-yocto/5.19: security.cfg: remove configs which have been dropped
  linux-yocto/5.15: update to v5.15.78
  linux-yocto/5.19: fix CONFIG_CRYPTO_CCM mismatch warnings
  linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
  linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure

 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  25 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-rt_5.19.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb |  26 +-
 ...on-drop-kmem_alloc-avoid-dereferenci.patch | 278 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.7.bb             |   1 +
 11 files changed, 343 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch

-- 
2.19.1


