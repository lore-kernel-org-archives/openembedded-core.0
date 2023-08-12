Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BCDC41513
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 14:50:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.66756.1691851803655643924
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Aug 2023 07:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FRQNne1S;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c8so12778985e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691851802; x=1692456602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z92qMdU2e2PrwQir9k7AjN7aGuZVsUpm0Fb24rjpG6g=;
        b=FRQNne1S2xpqsJ5dRcrF3btbC4RwlOrk7yFqcU6S3oM2Iot//M3YY5ZSPabz6+EUwV
         PvVTQQlQCxSGGlgb403jTnztH9/tmolTPbgzFE96EC9k9LwZA35P/1VD0ixrB/Zx8Bll
         IfqldlM5o7A1p41X7GnpYj+DGwpLQuf4wteZbSRbvSfBdSY91efTWfEgHXu53ZPZTgZ/
         2SkOvPHqRLYdyJQL5voVSXEvThdKHXtCl7yx0sUDoRfUFdOgyfnZZN5iFW58eEpMGGY3
         r5+7/fOXnLOgq2hwS2NgIALPwRvQi+yHoqPJopJuUUhNSvMwgX3kQXbpOTJIv4slcFa4
         JdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691851802; x=1692456602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z92qMdU2e2PrwQir9k7AjN7aGuZVsUpm0Fb24rjpG6g=;
        b=gCIjQk29Ctcq17xQ5kCc9f5Qoz+7gKBxAp4hwM8ci1kYBW6p/RqvZ6SZ/EkRPU2jQI
         BFOxy4yhuXlvYcJvdyS0LGdy6iLZibKOPr/ExJiXVrf7qtgtveiVcW6RXUyHYEaxxDtm
         cDAB7ktIyIBGvxV+cfUPIU0QpBMfvWll0AjkjGbd1e5MyxJnQmn4EAnJtJ/JQygMbjqP
         IYPuMX5AoJ4PXGqnD/tiw3Jq0sZavPwErJAF/Pz0qw3xrhn7jXoxiT3Hna1e+SL5h2VC
         jdmT6aNUZnVoMi1tAAKkmI1PxgXOfHCqokV67RavC0CiCJm9LdUneUKV2s15HcEcHjuS
         TmSQ==
X-Gm-Message-State: AOJu0YxXUC/p1fEaLIwgpxI1/InpE5r+sBNqDyzFqNyGh7KyMFBYqVDj
	WFrHklwUT8PMBvE42atvOPkqT1U211M=
X-Google-Smtp-Source: AGHT+IE92WjPvZikNF0EBh9B+kz9aZt95HDGisTijtDy3MdLqypCjQp7RtPB0iEfbdXhGrfOYsuwrQ==
X-Received: by 2002:a05:600c:253:b0:3fe:1d13:4664 with SMTP id 19-20020a05600c025300b003fe1d134664mr4221700wmj.6.1691851801394;
        Sat, 12 Aug 2023 07:50:01 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:d87f:1a4a:4f88:2c3f])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c028500b003fe1ca92151sm8455717wmk.26.2023.08.12.07.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 07:50:00 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 0/3] Introduction of cargo-c class and recipe
Date: Sat, 12 Aug 2023 16:49:51 +0200
Message-Id: <cover.1691851365.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 14:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185857

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This is an RFC for introducing a new class and recipes that
help building C-ABI compatible header and library around
rust code.

The third patch is not meant to be merged (at least I'm
wondering if this is really usefull in oe-core) but
this could help the review and comment since it
demonstrat how to use the class and for what
purpose.

The following changes since commit 05095c116602d1a8c388cc02afffcc36230138f7:

  qemuboot: Update hardcoded path to match new layout (2023-08-11 13:21:31 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-c-introduction

Frederic Martinsons (3):
  rust: add cargo-c recipe
  classes-recipe: add cargo_c.bbclass
  rust: provide examples for C library generation in rust

 meta/classes-recipe/cargo_c.bbclass           |   41 +
 meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
 meta/recipes-devtools/rust/cargo-c_0.9.18.bb  |   22 +
 .../rust/files/0001-Add-Cargo.lock-file.patch | 2180 +++++++++++++++++
 .../rust/rust-c-lib-example-bin_git.bb        |   16 +
 .../rust/rust-c-lib-example-crates.inc        |   79 +
 .../rust/rust-c-lib-example_git.bb            |   15 +
 7 files changed, 2806 insertions(+)
 create mode 100644 meta/classes-recipe/cargo_c.bbclass
 create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
 create mode 100644 meta/recipes-devtools/rust/cargo-c_0.9.18.bb
 create mode 100644 meta/recipes-devtools/rust/files/0001-Add-Cargo.lock-file.patch
 create mode 100644 meta/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
 create mode 100644 meta/recipes-devtools/rust/rust-c-lib-example-crates.inc
 create mode 100644 meta/recipes-devtools/rust/rust-c-lib-example_git.bb

-- 
2.34.1


