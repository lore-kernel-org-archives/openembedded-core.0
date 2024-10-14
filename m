Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A585AD1626B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:45:46 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.55265.1728913540273425977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 06:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CWDN37Aa;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7afc591c69cso299971285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913539; x=1729518339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqv5737wCwT7+sUj3/ocl8GTGcnPbrqGqRN6d97GOYQ=;
        b=CWDN37AaWu/U4/WoaYHR0IwsNXIrH7ST5eYlZSwBq/915vETaxwkbYX+E6pAg9Psge
         0o5+1DQcXR5TkM8uUG1xj0nbgTnNdB0bvzeDrW4DIibdLqvjKOfw7TTRliRoAtMl62hk
         H0zNR1XajZct0XyMC4f+VSCDHwjRQqx1PN+MYWfoUh0mHymBfWIFX/4rT/cN41uhCfPd
         1bSDvyBk7Nig5Xjy//j5HtoNoXHeKplahR7+JwzlaoliSsdzwLhDGLQ7FOFK5SMnmNUA
         R6JGzVNoBXSYZ4+60dFmOo1xV+CLDwuoh7gYCAHPpTm3Qf9OBJ0+Jj3fgDrzLJ30MSOO
         NBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913539; x=1729518339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqv5737wCwT7+sUj3/ocl8GTGcnPbrqGqRN6d97GOYQ=;
        b=fRxjm8y1rgmEYzNjhAjiJm0TBlsjhlmQuEEhqyhIROGmr5q2pZWVI5EqkEbMWdH6IL
         8yNyVmFWmGNlPzX8UdDRvRLGU26plF95TfavVdM9vPwF1xDFWxpVnLIQ+YHQWi31lefI
         zX6HdivPelZ3pgRtQ0kmEybaMM14LRqss4q20gZfmB55kNf6cvnjmZDD/S02S2A9Y1YF
         xfBDX0iLJh8SWVNlQqkZS2Z4FjzgYti4e4Rl1vvFSCUuLza1jO61wd6PO/fZKLYA6oDQ
         dOMnFKRIpBr00ZpiQUApOkoZVlp5MWrE5LNWSuI1fLWQLR1MEwH12lnpPFjhTegQIvAy
         nONQ==
X-Gm-Message-State: AOJu0YztT7RbkHOThk5KJ2EeB4JVxkNY8HMiyTqNqYsN6WzTukYaOHI2
	ZBIaWC5NST15cILsP0JY0dpf7vRV0X3G/UPsIrHnY4X/W4OnYkQc
X-Google-Smtp-Source: AGHT+IH1I7HL9hUSyFT+D041i+K4PQRhn9tlgqcCCbxy5zYGePuzTG1gu38aUbKms8MznSl+cUpYTg==
X-Received: by 2002:a05:620a:2446:b0:79f:17db:6597 with SMTP id af79cd13be357-7b11a3bccb7mr1864635185a.43.1728913539253;
        Mon, 14 Oct 2024 06:45:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148c71b0sm422617685a.3.2024.10.14.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:45:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
Date: Mon, 14 Oct 2024 09:45:31 -0400
Message-Id: <cover.1728912923.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205770

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the -stable updates I've been collecting for 6.10 and 6.6.

I'm also bumping -dev to 6.12, even though core-image-kernel-dev
isn't quite ready yet (lttng-modules hasn't updated for 6.12), but
all basic sanity tests have passed.

I'll follow up in a bit with some non-version bump changes that
I still have under test.

Cheers,

Bruce


The following changes since commit ca52444cb62fd595bb50ee14d21ecbc56056129c:

  kernel/reproducibility: factor kernel source epoch for common use (2024-10-14 09:27:37 -0400)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto-dev: conditionally add coreutils to depends
  linux-yocto/6.10: update to v6.10.12
  linux-yocto/6.10: update to v6.10.13
  linux-yocto-dev: bump to v6.12
  linux-yocto/6.6: update to v6.6.54
  linux-yocto/6.10: update to v6.10.14

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  8 ++++--
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 7 files changed, 46 insertions(+), 42 deletions(-)

-- 
2.39.2


