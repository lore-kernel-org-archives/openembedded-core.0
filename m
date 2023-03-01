Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2603C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:13:59 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.24962.1677683631285006766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3HOMPgY;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id y10so9891575qtj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=se1v+1H0fVrxDPClxIHrgesp4Dosf/R1MyxjK7FLFH0=;
        b=X3HOMPgY3LH+RHgaRkH4fA6MIlDNCRCRVNOJZWwhvx/Byvdl178HzdLY5xURgxIoin
         qow+uj2YC4tvsM59bOCz4HOwx0OnFbCBvUCrZEcZ5fgZszw7gHM/zYq3otKdtlUBOL62
         W+YV45c8asYElYSh3AXs7xhae1/YO6m6nufITDjDo/PRLH2KCAL0WFJMbb8LJlPFXZLw
         xReoPqhQI+ExuU1bc+986GqE8H34kvwJJsQQo8DsXb8JYHET2JdmIdgcl6+9EyYJe+H8
         PGQ1Wyrk2COsf0diX43xdE9S33CM6wrisJiI2UzwwkBS1Pfi3aKf1CZ8bw1KykpUPks7
         S92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=se1v+1H0fVrxDPClxIHrgesp4Dosf/R1MyxjK7FLFH0=;
        b=JPd7VDNgqRkV5p2WJRm+JP9sLf+5jb+5l295SUUaVUWy4mjD7TabYLi8q1BnoHnMw7
         xLt6ztNKaha/VaRLQkUejozk9j1jZDQdzLB+1vP1Q5GrHzXpigKgNXn6+kLeNxdAyR5P
         bo1SJ51+zXM2QfxS4KQCLlpPi6G/3Vc4qr9FM6iLF2yDvgGsbR2qyqc8FTRML4yJcNwU
         HMNb8zNFNS0Y6SdeBPG44THySX8ogJTPd+gQvqDoU7FMRkICdHnUz/veXPdidXK/PgwB
         /8m2RO2uCUHZNjE95KKR+EW5ta9X6fvU9kq53kV9QpXZTqkZn8JJ59BQM5flgKmzQ0xg
         +o9Q==
X-Gm-Message-State: AO0yUKVk0578E596Jp/4hNmqH1VCIc4WQ7PmAw4RVRTP1kcJ7NFLvSRE
	Hm50rf1og0u08SdaGlrB0m8=
X-Google-Smtp-Source: AK7set83IgAO+1XImN1LggekvEILNFqUF0qdzHc0bbsDOVi/nZa869UqX6526Rjwc3/LKYbYcl9cZA==
X-Received: by 2002:ac8:580f:0:b0:3bf:a1f0:4c8 with SMTP id g15-20020ac8580f000000b003bfa1f004c8mr11634371qtg.65.1677683630021;
        Wed, 01 Mar 2023 07:13:50 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
Date: Wed,  1 Mar 2023 10:13:38 -0500
Message-Id: <cover.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177935

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest set of -stable and -rt updates for the supported
kernels.

For those that care, linux-yocto-dev is now fully at 6.2 for your
bleeding edge kernel enjoyment.

I'll send kirkstone and dunfell kernel updates as well shortly,
following by the reference BSP bumps.

Bruce

The following changes since commit 5a5ab7cdec7b3e01ddf95f73453e9fcfdd6b986e:

  scripts/runqemu: move render nodes check to runqemu from selftest (2023-02-27 13:27:37 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto-rt/6.1: fix compilation issue with per cpu stats
  linux-yocto-dev: bump to v6.2
  linux-yocto/6.1: update to v6.1.12
  linux-yocto/5.15: update to v5.15.94
  linux-yocto/6.1: update to v6.1.14
  linux-yocto/5.15: update to v5.15.96
  linux-yocto-rt/6.1: update to -rt7
  linux-yocto-rt/5.15: update to -rt59

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 7 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.34.1


