Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721A6C4321E
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:40 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.1187.1668559112256265354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UuvT/bzL;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 8so10730219qka.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoPxdXA8MtHiHhON/hBuhJ3NF/hiCwCzaqmcHdju9tQ=;
        b=UuvT/bzL9LfBrwWHLH+NHo9W7RK/HLTrLzhH3Zixh9YnNujVhfLdbuC8PKhijm+cHs
         Z4EgaJzMoD7FOFh9XXahNqmzy0UT03+3rusvTVhXT1p2nLk5V5ZlR+Pm1p8geXybQagS
         rvRPyFpyAp7dsxqFrx5hJhnm18O3LmvN+J6tq9knostHh5WDrrniMyV+iIQubii9qRqJ
         o4994aK111SA85RD07meHVEFHD7EQP0E+hGhoAxYL4y5dPmuzzP+XeHiOmFB0o4oAh93
         VI7YjPw3+bPLpzm/eqgxbNr8QnRqY84qB1mDN77wOr9sLz+8P4QJ60a614gCMLLp7+Ou
         lx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoPxdXA8MtHiHhON/hBuhJ3NF/hiCwCzaqmcHdju9tQ=;
        b=LcAJOydOa228DXfUuu5ImwdHEUv9Zv7+O4omSk3rJu6yQFmvLvLaecguxOEPtwNAdw
         Yc5S5mJsFDZAcsGVgslqHUCt9hPj5KXJqNrVWqJN94AX2DS1gJSwmm0NKxN6ab0dqAJg
         ejJ3PagJxbRQjOHS1egJwiqRAG+1Ea3vtfo6EVZm0odsV+YmqcP1CdDrHYuRd24i1oqR
         YIQaTSbIGJ7FFoz7oOz14QyhN4ODS74TVUNj1dzjOmIyKsaMP9UMPh64efugI9W52sIw
         LQoRgtF6+spLn1fEvFbMVvaq4jJCLIdbd/M/xokNs3Dg0jtyj2VA0t5lw0p856jeYRhe
         aREg==
X-Gm-Message-State: ANoB5pl6TITnOfgpJlr+oSzXHWYrH2xueEMdFHuhHQwIQU8iP9qkbJOh
	DsFfCgezkzgHUU40UXQ2gFs=
X-Google-Smtp-Source: AA0mqf4/OUWIcFqfzR68Ko5CiGH7DCV9PIPCELy4bBKySgLnHywOszR+NL4l15jQLIUQAI+gKDnzOg==
X-Received: by 2002:a37:bd02:0:b0:6fa:3477:d62f with SMTP id n2-20020a37bd02000000b006fa3477d62fmr17400357qkf.279.1668559111113;
        Tue, 15 Nov 2022 16:38:31 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:30 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel: consolidated pull request
Date: Tue, 15 Nov 2022 19:38:18 -0500
Message-Id: <cover.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173363

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the batched up -stable and -dev updates that I've been testing
for a while.

I've included both the 6.0 and 6.1 dev kernel updates, as both were
tested, and someone might want to use v6.0 as a development kernel,
and could use that commit as a baseline.

I ran into issues with devsrc and lttng-modules with 6.1, but have
all architectures working now. mips64 is throwing a trace on boot, but
I was able to complete testing. I'll revisit that later for 6.1+.

Cheers,

Bruce

The following changes since commit 44bb88cc869f3b42440d6f7aad000e706b739a2b:

  mesa: do not rely on native llvm-config in target sysroot (2022-11-15 09:38:38 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
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


