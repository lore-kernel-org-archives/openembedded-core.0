Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED0AC04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:16:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.14664.1690982190258272799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lmQzy7Vm;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31751d7d96eso5805797f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690982188; x=1691586988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rxh5+HFd5wzXdpw9SPDXFrUvJ6oQzhiuxcCA/MTvEfg=;
        b=lmQzy7VmQIpchGf8teStbly1wTDY3NZklsP14CZ/yXCjz8vrZfZzZdQPrWcF3a59sf
         8+xOHaaS0595O/j87XNb+64RDDFjMhkNxWk6q/5gxKB5ZTdBQAqi7nrxbLZXS/lLKyLw
         DdIMXP+8LyY1Q5ctd1KC9zZUIqMigld4B9AoqHmXc97m+/hvmsD5m8/R5Vl5TcqO/JVF
         PXpMIf1m4MC3apIimsBjUxZkNnGAgQmTBaJ+rXxRktUAKo7PdJ5LPb8H+4kpqunnLZid
         aBD1Q2yia7XUTeRurT5nq7zBAYmCEiLf/44BaUeF9prFFE3DLoZIEn9hhhHoDhAVJrrI
         Gjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982188; x=1691586988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxh5+HFd5wzXdpw9SPDXFrUvJ6oQzhiuxcCA/MTvEfg=;
        b=LiO6ZsgQTEsDApx3I918QZCp3Q8drhEix9p4mBouUG9WoZS/MtgEHYh+BnStG7gR9z
         5ihzAprVIPBwq/XDUOcWWWm1CX2qUaooAdazTZa/b87ZwH/VKd+m0jPTvDS9PSJwrGnA
         Zxdj6QUKyCkObTKxfdYHWAbfcpYkOSCe4hM3GXFdT1rrcC6N5RNal/2MHvrJ67jhz4Yv
         Bylc+xKu56TXgPqzANU/sFANupBEe5fXrFpZ8a7ZxYlkKKvFFZUfkBM2wp9tr/0a+0Mx
         jZTkrnuRE9mr8m0myTak5a5UVbb3oBYZbD9SibBn1OjydJRKNYtvbit4dSY7enIehbKB
         u3Pg==
X-Gm-Message-State: ABy/qLYudwNPy+KqqyjP+7NvmLHubLH6aZteWDyI9o9kvmTvyQderTgb
	svg77BqacvrQCMcRO+OlfMgNMTLwfYA=
X-Google-Smtp-Source: APBJJlGsLevb+jHTNH0ysdcmENx7U6k/N2ZxcN5YM7NmhVmQ1lszzCbm2Uoug7Gdnlx51gaKxzkMWQ==
X-Received: by 2002:a5d:4b0e:0:b0:314:49d2:aaab with SMTP id v14-20020a5d4b0e000000b0031449d2aaabmr4798386wrq.8.1690982188010;
        Wed, 02 Aug 2023 06:16:28 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:ab32:1451:bfe8:2a0f])
        by smtp.gmail.com with ESMTPSA id l18-20020adfe9d2000000b003112f836d4esm18951248wrn.85.2023.08.02.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:16:27 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH 0/3] Use frozen flag for cargo build
Date: Wed,  2 Aug 2023 15:16:02 +0200
Message-Id: <cover.1690981978.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185392

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This patch series force the usage of --frozen instead of --offline during cargo build.
This has the advantage to be sure that Cargo.lock file will not be modified.
Moreover, raise a clear error when Cargo.lock is not present.
For this to work, we must modify ourself the Cargo.lock before building
in case there are git repo that have been patched.

The last commit was for removing rust-hello-world, patch to the
documentation project will follow.

The following changes since commit 692e414aed5313ff275b69e93179aa7c559700f3:

  ffmpeg: Fix wrong code found with gas/2.41 (2023-08-01 09:49:14 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core 15104-check-cargo-lock

Frederic Martinsons (3):
  cargo.bbclass: Use --frozen flag for cargo operations
  cargo_common.bbclass: Handle Cargo.lock modifications for git
    dependencies
  drop rust-hello-world recipe

 meta/classes-recipe/cargo.bbclass             |  7 +++-
 meta/classes-recipe/cargo_common.bbclass      | 41 +++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/lib/oeqa/runtime/cases/rust.py           | 12 ------
 .../packagegroup-core-tools-testapps.bb       |  3 --
 .../rust-hello-world/0001-enable-LTO.patch    | 24 -----------
 .../rust-example/rust-hello-world_git.bb      | 19 ---------
 7 files changed, 47 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
 delete mode 100644 meta/recipes-extended/rust-example/rust-hello-world_git.bb

-- 
2.34.1


