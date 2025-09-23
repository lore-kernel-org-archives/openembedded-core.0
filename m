Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D59CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:05:43 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.42.1758654334564383628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PnOW00gm;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4d00ad6337cso28686331cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654333; x=1759259133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJyJqAB4jjaTrQM2Ho29s7cR0eJGouf7drAd+TyLjHg=;
        b=PnOW00gm+aZeoK9vTcdeWqz265bJub+mh1FZ4C1HhIR1/IkyzonK6H6VkeNIDWURgY
         GvtUBpW3VoDxxOZBCZQPNrp0HqveCEiqKQgdm7qusg0mCA6RiGncHzkhc5cdBldJPUms
         P2MdAzCONkaxOODi2bUH3nR+jjkpBcFncAUGVyW9BErC9/Y46Qa3iNDyfP2ZLdAPEDlM
         uxv2+Er2fcQTXYWUYzMxEHhkh+lX6d2dgkTLzdj+5TRrPkNLEg/Tl5mepgBFwHwaHsUn
         mBLLgJty1TpiId1UIpP3LcINhUPjTUF2AJXUKK3Bv/5kobkNbmAjooZy/qQ/O25I8gyS
         /pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654333; x=1759259133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJyJqAB4jjaTrQM2Ho29s7cR0eJGouf7drAd+TyLjHg=;
        b=VBxUDxDAQto62fcQAXS9dDRlF2uPWlL0w19m7P8H0XVoFCBIq9pK5DegoIL6H4TqK4
         wrqbDnFHSe+ACF8QrHyG6k8kvhVTZpWz/gRaGbeuboxQ6VBZhJ4kuWJRrL/XhXcG5aib
         T4wC0565BLFIBLrS/NenRukGzderYM+BavnsTeIPxLH8YHilZ7Rcs9S1Mc5hh0MG+LrP
         NmZiLVt+W2rsiMHSooHR7woHELfTwQT1C1FVWMAZlKqMQX6w7qzaUrPJib/1C6GJMM0O
         eYqiZq2PjdCRsHreuHe+NyirWgR+Rw5YJET7GZ3iK9L4b6WrDDmhZVwfKr9YMuKIHJVa
         JBSA==
X-Gm-Message-State: AOJu0YyeLlzXOQLgqiwKvdZt79Q6G2cxnwY/FArLeyN2gaAXE4+ohHXX
	dVZlS5nQZG17EoiCQvRXoe5jKMB3H3Bu25fJhRjWwlkeDp1a+E4iKCx6
X-Gm-Gg: ASbGncsqKMy4F7v24CN3y53FLfvLaJDvaREXf3vy/k5Gv0X+3NOmA07scZhONOWQvJ6
	01PA/RlsowByhKNVkg8f3LmFN54gR6EDLaVSeQ1YzefS3L6cYNBbwSmZwN4zUrTFDhLUC/MrHgl
	LrXKuHsWsT1yG25qukXOwcXezF6t6IMYlqra7QcXZOV2CeEeQKZQwhq6pCMgdziL5PSDur8qc/S
	3rvqwQNLN/m94JHo+8U0DXT8synZFTGZ8yPVyxQ8LmpbopAGp9YcCPi/CxrI0jxzCW2f8oiLu6n
	ho9TDTQNX51WWP4K4wHEGvi45BJSo0fUFjB79HUgbMDTKbvBMREPsGN/xhzNwP4Pf3djxAyi/aa
	8RHZGX+Bp6Nwf63z8xCzB215qR2Vqqdg0Acyk/vq/JJtn1+OKtiVo3tod8xDqWW2SjQCsiKdrEm
	QXdlrab4+P3PJEqUZHl0MYBO9/ZL/tmhgehaltou67EQ7vt+DUDqSjOIo=
X-Google-Smtp-Source: AGHT+IHFVZ9kerX+Ci4AgjE+PzRZKQ0gYy53uZvwYXMDUbynVNElBqsNzyUfk6+eIrw2fADj/GDLzw==
X-Received: by 2002:a05:622a:1aa7:b0:4b7:ad2a:750c with SMTP id d75a77b69052e-4d36773de63mr40103421cf.2.1758654333315;
        Tue, 23 Sep 2025 12:05:33 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7b0c0934e27sm55463576d6.64.2025.09.23.12.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:05:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: -stable and genericarm64 configuration updates
Date: Tue, 23 Sep 2025 15:05:26 -0400
Message-Id: <cover.1758654194.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223913

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest -stable bumps for our active kernels, and a nice
extension / cleanup series from Mikko for genericarm64.

Everything has passed my build and boot testing. I did see a OOM with
genericarm64 and systemd (using runqemu), but that seems unrelated to
the configuration changes.

For anyone reading the -dev kernel has also gone to 6.17-rc7.

Cheers,

Bruce

The following changes since commit e90bc48bdaa2234cad52bbb2800f5246c277ffbd:

  bitbake: tests/fetch: Update tests after bitbake tag removal (2025-09-23 09:37:35 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/6.12: update to v6.12.48
  linux-yocto/6.12: update CVE exclusions (6.12.48)
  linux-yocto/6.16: update to v6.16.8
  linux-yocto/6.16: update CVE exclusions (6.16.8)
  linux-yocto/6.16: genericarm64 refactoring, extension and clean-up

 .../linux/cve-exclusion_6.12.inc              | 1464 ++++++++++++++---
 .../linux/cve-exclusion_6.16.inc              | 1462 +++++++++++++---
 .../linux/linux-yocto-rt_6.12.bb              |    6 +-
 .../linux/linux-yocto-rt_6.16.bb              |    6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |    6 +-
 .../linux/linux-yocto-tiny_6.16.bb            |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |   28 +-
 8 files changed, 2585 insertions(+), 421 deletions(-)

-- 
2.39.2


