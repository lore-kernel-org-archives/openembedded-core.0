Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3A2C4707B
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:14 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.22853.1704169872583152451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2d0X9/Q;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7816e463b8aso386439985a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169871; x=1704774671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8P2uj+CPuCR4KkA+PGoj9zoVN34aKsE79iRpIgCOoY=;
        b=I2d0X9/QCzeaGZBgLzBc/y4am4utGGQpkEgPulkhS178f2LHZg5Z5gk88Z3XFf1azA
         SOtypQ1iOqfdF12XDo0raHZYKr8arD0CZHS112VDKr4UFsSJ+JH11RLJb+naPsXHDlzv
         eGT+4ItxHBT21aEs68D3JXEERl05dndmAbJsMNimRnHNTy1EMCgmamqUHC+Mxex0e9s7
         7rYd9SOPf4S0cWkflbT1D/GKbEV+SpXUpBWFWO7xUngz3d992Hnm5FZlYQ1cTnoTGBbf
         dtqFLaIAeCG7Dl9Wb5/iQ3at9/annvLDKXlXJnNci13PXFK8LDgRCtosS0HdrP4jz704
         eH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169871; x=1704774671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8P2uj+CPuCR4KkA+PGoj9zoVN34aKsE79iRpIgCOoY=;
        b=HCEVF85lzWakBiIT5DtLLcCJv6lRWQgRyadUOhq/itqIlm1N0xiDOzbseLQXNDjPwF
         wXzjyPnaoHH1IrW+jJCFjTGE/LKHwbxYegGZnNGhVvjkl59tk7Owi/1UPT0jtEVUYK3W
         UhF6Zsbt6WwbUgxCbsz40Gxm3Qf8qzacHVYJF8eFPlziLXXzs0KbGYZkDIS9R2ijjPet
         DVVqHQtIZgEULd9h62/s9znsPHPrHu/kth/IYv1Bbm3NCYWmXDYpwtchgTH2KjJJ+r3q
         jEDy8r95mBvJoPXOvgVCIje4jM+ZGa2B0pqsJYVZyGpyjfDXnAoGpRFo4OkjuvjwqOdM
         Xx+g==
X-Gm-Message-State: AOJu0YxZ2ATkDwYTZuuN64YTLPosNcYm4q4a9VqiDXaH1n98RFxeKePH
	8x1m5Cy+EJMnKh6BrMiMY9U=
X-Google-Smtp-Source: AGHT+IHWrdAKjCajkHvgDm3xizbuC7bCZJjjRN6HCjr3y6LVirBjuYqNicIXbKo3N3jMONGOceqQUw==
X-Received: by 2002:a05:620a:2691:b0:781:375a:6dc5 with SMTP id c17-20020a05620a269100b00781375a6dc5mr19382185qkp.104.1704169871523;
        Mon, 01 Jan 2024 20:31:11 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel: consolidated pull request
Date: Mon,  1 Jan 2024 23:31:02 -0500
Message-Id: <cover.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193196

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

As promised, I waited until the new year to send this update
to introduce the 6.6 kernel and libc-headers.

I'll be sending patches to the appropriate lists to remove
6.5 shortly and make 6.6 the default. Once we have the reference
boards updated to 6.6, the 6.1 kernel will also be removed.

I've built 6.6 for all supported arches, core-image-* and have
also tested against musl.

Patches to meta-oe have been sent, and the work done with
6.6 as the -dev kernel means that the tightly coupled packages
already build against 6.6.

I'm sure there will be issues .. as there always are, but at
this point, I need more eyes and test cycles to find those
issues.

Bruce


The following changes since commit fe5d2f0b666c83e3336ea9962c8e2e4c39816e21:

  bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 and 3.9 (2023-12-30 11:03:25 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-libc-headers: update to v6.6-lts
  linux-yocto: introduce 6.6 reference kernel
  linux-yocto/6.6: fix AB-INT: QEMU kernel panic: No irq handler for
    vector
  linux-yocto-rt/6.6: fix CVE exclusion include
  linux-yocto/6.6: update CVE exclusions
  linux-yocto/6.6: update to v6.6.8
  linux-yocto/6.1: update to v6.1.69

 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 ...aders_6.5.bb => linux-libc-headers_6.6.bb} |    2 +-
 .../linux/cve-exclusion_6.6.inc               | 5172 +++++++++++++++++
 .../linux/linux-yocto-rt_6.1.bb               |    6 +-
 .../linux/linux-yocto-rt_6.6.bb               |   48 +
 .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   33 +
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   72 +
 9 files changed, 5347 insertions(+), 22 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.5.bb => linux-libc-headers_6.6.bb} (83%)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.6.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.6.bb

-- 
2.39.2


