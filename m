Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38823C3DA66
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:44:57 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.292.1692632688570455776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dmXcxe1P;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7a01d654111so1095179241.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632687; x=1693237487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3k5aROWBgDwyP+7gFdd7g6Lxu9iUrsXzG0c1F3OFbow=;
        b=dmXcxe1P7uqbLMRi5aVrvMMJnATm6FFxi+5gI3T08qoFVE92wkYZ4axQ4RQZtqtuTw
         puY0EOFpCfbFWydSY1iaA5KUDSkEiikfle2aFM0uCl4qPQdi25ajFnnymcC/1x5aLn79
         HwsdAbDHN668B3twXQJHLf684wtkjWmKJ9PNK5KW/DAPOJRDLmeNdPzFXGZkRsf3KOca
         Np+jpvMcjLnCTUHvHTAM0S9SII3TSiXJZ8ZjHj2h1YUEx6BwRYld0FuECgHWQeLo2vHF
         /cQxb9TW+Nh9teztrQ4ohfLcFygjTAwsz3w2dyvRLhmbspD9T8n3/iR03ePJsVyMI9RJ
         sJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632687; x=1693237487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3k5aROWBgDwyP+7gFdd7g6Lxu9iUrsXzG0c1F3OFbow=;
        b=dvhJy6dP+/7Q9GE9aJjv58UTPplhO6ecqkb/VAZsr8O+6X+FUCwNjUUU8eeHIpIDV5
         aOwZ7wjleouhvpu7d1ICgaUdXZdaJCSMQ51ut218BKiXBE8so9dO02IyVycgyRdB0KYZ
         XtotjoDbNXFcs/dIl42Wymy51OzN5mzhw5tw1zu1zPP0ugtwZ6ndOLnctwgYqOyI18qA
         gnKBx0jOqVYkJG4Az0qUBoe8MT5qQGwJulhgxSctManOWdW/yNo7JozHqH9r5QLad8gm
         jjypNTcf7H0Dh1FdAtRff68tx5ma1aGW0G24Umi4RBq/94wf35JqbW8+NN9Sf01HAS9n
         G02A==
X-Gm-Message-State: AOJu0YxKHEPTCKbYSk2MfO6Y2p2aL5qYJe/1u9HjTUR5X/Gi4Rv2QENN
	AN4nxJwRj5k629Ahpb+HH3k=
X-Google-Smtp-Source: AGHT+IGbL/BJGbf4lCgElzqj/i+DPxcO+BDjP0np1d3IsagRWF1vTImWhGk/ybJgrqYYZRQHQXZW2A==
X-Received: by 2002:a67:de0c:0:b0:44d:40b1:926f with SMTP id q12-20020a67de0c000000b0044d40b1926fmr4332745vsk.1.1692632687545;
        Mon, 21 Aug 2023 08:44:47 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] linux-yocto: consolidated pull request
Date: Mon, 21 Aug 2023 11:44:35 -0400
Message-Id: <cover.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186450

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

While we track down the remaining 6.4 boot issues, here is the
set of -stable and specific fixes that I've queued in my kernel
testing tree.

It is possible that some of the 6.4-stable's have fixes for our
boot issues, but I didn't see anything obvious.

In particular we have the -rt warning fix from PaulG and also
a fixup on our isocpus patch.

Cheers,

Bruce

The following changes since commit 37ebe9907ac5639bc200ae50d0d79b14a790ab55:

  oeqa/runtime/rust: correct rust test (2023-08-21 16:15:35 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/6.1: update to v6.1.44
  linux-yocto/6.4: update to v6.4.10
  linux-yocto/6.1: update to v6.1.45
  kern-tools: include utility to post process config diffs
  linux-yocto/6.1: fix uninitialized read in nohz_full/isolcpus setup
  linux-yocto/6.4: fix uninitialized read in nohz_full/isolcpus setup
  linux-yocto/6.4: update to v6.4.11
  linux-yocto/6.1: update to v6.1.46
  linux-yocto/6.1: fix IRQ-80 warnings
  linux-yocto/6.4: fix IRQ-80 warnings

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 7 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.34.1


