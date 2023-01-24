Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291EDC54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 21:59:52 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.29639.1674597591343750411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 13:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpgM34gZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id h24so10486693qta.12
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 13:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIYQvRK+1UilyJ5hMpAPPVwyCS6dxukY6zILqY/yrho=;
        b=dpgM34gZP8jloy8gCEnKj4jbud/9hUeOZPyUDvZkTTMSHQfEEzEcTDy33+Q7YgErsC
         reKjxiMMc4qv6r//tKCR/UHntoJZaurPRV3ecnBVQyz/4LpPGEnozPx8oyyeiJZezBn7
         00slKzWMaqU00Qe4cVSw1AaQKcA4D+wfwVXpvnk9Zvl2ZGPSjKW/CgHIkCQLbHdZFAk6
         1Gschyx0c0juGdAz6BktrBWFmrT1p1WjNgrsbjIBBg6XGy4yIYao2tNWWyEFp8ONmBKr
         PYNSrrZGiIfNTLSZWu9tttvHCWaks8ibRshZOZ+4N+chNhI9MCLqrM80xzjZI3PcjrIx
         YkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIYQvRK+1UilyJ5hMpAPPVwyCS6dxukY6zILqY/yrho=;
        b=jTfaLD5qshY3OwAjtjCfBb7uWd2KqeG2C+zqlYRI68xLiXaRW5E8nsEm3bKvA1AA8z
         DGmi1tKcz+cfRFXAwlDmLAt9GTIidJkkUQH8vhQ5ePdUF8OMfj+PisimSnxgZVWVR5eE
         dztwAtWZwoK+KoUOw+SyJnK979f/18heFWZSyJ3d2ewF/OIQ17bzN/MMZLYX9kQl4OBB
         41NkRg9+ahP/cvebKnykD6B4F1zjOrrhB4Yzi715EwBMRnRxs3Cs/iAAalDDs6TfX/I4
         HvgeY+jHKBE5KXbCpfVvW+MOU1cpNOnQ35ejX+dY0Wf19ESb6cD1tIGIdXXGVldMjzfW
         GBEg==
X-Gm-Message-State: AFqh2krcE3B9sjTvAIgmbd5Iy7ZiuXVB/HZkL15Yr8Em84vdkt56YDRq
	v2mXZkxi3h/CiqLT1E9m6UI=
X-Google-Smtp-Source: AMrXdXuDXW8MdbRW7cWDRGj/7V9VbcN+6/k256nBy7LWrksz84RiiKwQSzTAyoUfczlsyPOX3iFcCQ==
X-Received: by 2002:a05:622a:1a92:b0:3b6:36f2:5f61 with SMTP id s18-20020a05622a1a9200b003b636f25f61mr59232928qtc.47.1674597590272;
        Tue, 24 Jan 2023 13:59:50 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8014c000000b003b0766cd169sm2049813qtg.2.2023.01.24.13.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 13:59:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make 6.1 default
Date: Tue, 24 Jan 2023 16:59:45 -0500
Message-Id: <cover.1674597466.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 21:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176332

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

As promised, here are the commits to switch us over to 6.1 as the
default.

I'll also send a series for poky to bump things there as well.

Also, if there are any significant problems, we'll just shelve this
while I look at any issues. But at this point, it is worth getting
the patches out there to move the needle to 6.1

Bruce

The following changes since commit 3c3fd6a65e8103f74ae382d196d486b31a168b39:

  insane: Improve patch warning/error handling (2023-01-21 07:46:38 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/5.19: drop recipes
  conf/qemu: bump preferred kernel version to 6.1

 meta/conf/machine/include/x86/x86-base.inc    |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 .../linux/linux-yocto-rt_5.19.bb              | 45 ------------
 .../linux/linux-yocto-tiny_5.19.bb            | 30 --------
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 70 -------------------
 5 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.19.bb

-- 
2.34.1


