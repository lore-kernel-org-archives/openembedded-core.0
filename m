Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F41C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:18:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.10593.1672834710014360687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AYBdBf5d;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t15so23879823wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 04:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmUAweyJP+wPuTRpluHc4jQLAidZfsZEQAyxjn/sC2c=;
        b=AYBdBf5d6yZhNZUd/L28O5Wmlk7OAK1azirmC4U4m6nmIuZgYPVk59m3mDpDGkAjnA
         xdYYCTy0t0+hWaiB5UZPbvw202JRNfvmu11EJy5fQmlxGNW58FynFhlyWx1JwDyI0P2R
         Z2A0YQhCOUu10+E3dTL2eESqczg9wrf25kM2/HMRBXSAZdRHW0DAij6Epclug0DXjQct
         SajyjLez4vxDAQE3MNNUm3Bh/qz/6mLCn87pzFvub3rEVrTx2iEC559O74S+JlQuHTcO
         vTucb/p2IRfuAFNEmgq440fnvr02KMTYuhbWx4XKIBOrPrDsjoHGab9P4pg0Ww8wjhqI
         kErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmUAweyJP+wPuTRpluHc4jQLAidZfsZEQAyxjn/sC2c=;
        b=4TQNsJGPUNJznNvZZBvILIURCe15zQ5vEzjmIk10xvjajql6LR9NWLMhLlbUkuICrH
         RThDmuV1acFOwQNjnpzpptUOal6wCxxazbQ5Ypb62Wax/rtVLpZ/rkK3lS8pWzHmVQH2
         /6HAuuLKTMTfnJSJDqy1JXXYbAx8BlydS/DJ/KT1C2233I9bprG2QGFyxvU5wOW7FZKT
         uY+UnqCN9JBnORFg49qYxNNq8kxAa5kOD+fcMcW3XnwMl8nFzVGWCBDQnAmsvylnrYsm
         TLfmqAv2/V8dCtx/NYtxswq8KG4+iY9YvYHyABsNuCVkuQk/Kcaif0NZaw32VKPmD/7p
         s1XQ==
X-Gm-Message-State: AFqh2krj1pFI4ZBpkjW2xfsIkbvzvZ0hD9Sjl7avEVotxSEz2UGlKy5x
	rKbHorC5LFJHfqvjIkdcFz+DXF3aMBU=
X-Google-Smtp-Source: AMrXdXvf2a/TvpJPk4d9wqA72kGIwn7ixWzq4QBVRd5QBysJnSC8K1AZBd6bcQM214twRt/LGOLidQ==
X-Received: by 2002:adf:cc81:0:b0:275:ae5c:d448 with SMTP id p1-20020adfcc81000000b00275ae5cd448mr28326197wrj.13.1672834708209;
        Wed, 04 Jan 2023 04:18:28 -0800 (PST)
Received: from ThinkCentre.fritz.box (p200300cfaf4b81003e9287465d6a8a6d.dip0.t-ipconnect.de. [2003:cf:af4b:8100:3e92:8746:5d6a:8a6d])
        by smtp.gmail.com with ESMTPSA id d11-20020adffd8b000000b00236545edc91sm33564176wrr.76.2023.01.04.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 04:18:27 -0800 (PST)
From: toertel@gmail.com
To: openembedded-core@lists.openembedded.org,
	michael.opdenacker@bootlin.com,
	richard.purdie@linuxfoundation.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH 0/2] Load proper sound drivers for QEMU x86
Date: Wed,  4 Jan 2023 13:18:06 +0100
Message-Id: <20230104121808.1065203-1-toertel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175469

From: Mark Jonas <toertel@gmail.com>

The patch series fixes a regression where images built for QEMU x86 and
x86-64 did not contain sound drivers matching the QEMU device emulation
configuration. Additionally, the right drivers are now also auto-loaded
when starting the image.

root@qemux86:~# uname -a
Linux qemux86 5.19.17-yocto-standard #1 SMP PREEMPT_DYNAMIC Fri Nov 18 21:13:18 UTC 2022 i686 GNU/Linux

root@qemux86:~# lsmod
Module                  Size  Used by
bnep                   20480  2
snd_intel8x0           32768  0
snd_ac97_codec        114688  1 snd_intel8x0
ac97_bus               16384  1 snd_ac97_codec
snd_pcm                86016  2 snd_ac97_codec,snd_intel8x0
snd_timer              28672  1 snd_pcm
snd                    57344  4 snd_ac97_codec,snd_timer,snd_intel8x0,snd_pcm
soundcore              16384  1 snd

root@qemux86:~# cat /proc/asound/cards
 0 [I82801AAICH    ]: ICH - Intel 82801AA-ICH
                      Intel 82801AA-ICH with STAC9700,83,84 at irq 10

Mark Jonas (2):
  conf/machine: Match QEMU x86 sound kernel module
  linux-yocto: Autoload sound driver on QEMU x86

 meta/conf/machine/qemux86-64.conf         | 3 ++-
 meta/conf/machine/qemux86.conf            | 3 ++-
 meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
 3 files changed, 9 insertions(+), 2 deletions(-)

--
2.34.1

