Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD162C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:17 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.29851.1644427816370283689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yiUFlOYF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id a28so2354490qvb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MM1HNUrekm603gwpMzCubGUZETnWxiuez/X8tStqfJE=;
        b=yiUFlOYFuoyju+eL7vu2w0kFS2yMcWTXD80EKTGbQR0L3R7splCu+ksSI+4iZoDv72
         4nsqKypMz1USds7CD1W57obdWYa/+FVxTJ7KYG+oXR5V3U1JdRw8CuU9Gfz6cOlJrt5b
         Zu0wMqcgB8hssNGGC8e8GV2NFLtTRMHKrLM9nzIpPSwj4xazkjhr/1zRZm3n/H1VyO4j
         3vue44O9m8e7FjK45jR7/DT1PMwJeLiManPJpDWt1xTP0reoVyD78mhxPUqSjWtMMFRN
         T8fL2bzvayLVcOCEMpGGRSVbM8fyrCpAvhed7/pyN0wY0nEmiXaldmn4bDG2zR2fr1Uz
         J9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MM1HNUrekm603gwpMzCubGUZETnWxiuez/X8tStqfJE=;
        b=DGTQtSKbdVmeSDah5K2L1U3Yjo/R8bGYkKWs/STSlHqj3YKv7uhRtJNQRCTECGWlRt
         kaMPCTJos1etDucxAEwcP2aNzsP3Pl1sLeiirvY6jyJE+VGYQyTzZFfFzl1ImtPOqe7M
         EF9mOaUtKrAXhsxM8sJXwlxOzlt7FHstUJLrgd7W/bo1IFrvF+dQ5xd10CpF3xJdSEcF
         mgZ0KzPevppqwHhoHALnvTLI2u571nntHC2AlANdCFnugz/s4Lf/HE7m+ooetotDOBMf
         llw53vLdULHJIKKRFwTZ5eRb/XwdiJC/pBqbvq9938JcqoFzDmoYwQn3Mx5USXxqcH2p
         sEaQ==
X-Gm-Message-State: AOAM533Rb+vg9OHB8JoSUgcc/S4iorw2eWwZWlTRf/XS+OoMUPY6/4Jq
	SEzw9NjfUkCgfpw8RMszmje3C36GPec0IA==
X-Google-Smtp-Source: 
 ABdhPJwPkNvRfGgfd9n6VLS2e9cPvdDACIIu2F5Vs0865jeb1AxfNEiT1KiO1ONm3R0nklj92ExSvg==
X-Received: by 2002:a05:6214:20ee:: with SMTP id
 14mr2221280qvk.38.1644427815276;
        Wed, 09 Feb 2022 09:30:15 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 i4sm9532125qti.24.2022.02.09.09.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:30:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] poky-tiny clean-ups and qemuarm fixes
Date: Wed,  9 Feb 2022 12:30:09 -0500
Message-Id: <20220209173014.1389378-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161569

Fixes to get qemuarmv5, qemuarm64, and qemuarm working with poky-tiny
(again).  While I'm there, do some clean-ups.

This needs https://lists.yoctoproject.org/g/linux-yocto/message/10908
for qemuarm's to work.

Jon Mason (5):
  linux-yocto-dev: add qemuriscv32
  linux-yocto: Remove unnecessary commented out qemuarm entry
  qemuarm: use virtio pci interface for graphics
  qemuarmv5: use arm-versatile-926ejs KMACHINE and add more virtio
    devices
  poky-tiny: enable qemuarmv5/qemuarm64 and cleanups

 meta/conf/machine/qemuarm.conf                     |  3 +--
 meta/conf/machine/qemuarm64.conf                   |  8 ++++----
 meta/conf/machine/qemuarmv5.conf                   | 11 +++++++++--
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb |  5 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      |  3 ---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      |  3 ---
 7 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.30.2


