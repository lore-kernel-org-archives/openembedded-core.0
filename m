Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38388C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 16:00:05 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.38399.1672675196869416372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 07:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DAWrKFNk;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: toertel@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id s9so22679873qtx.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SVJAyOz4wkg8rzi0Jpa3EuoGbaKfnKfotaSVzKDL72c=;
        b=DAWrKFNkKi2oEuNzQTZ9yGpYmO466UhgDE+35H45uBAqG4x9EMXQiyB6j2P5htSbBT
         i30wSCRUp4BmEaG7J91k7oU9SHLHvBDjR6t9FEk7hUKq0UJe00vouFHT1tDDaoCbJvAJ
         11g2LRNEpNeieH8uTAqrWnAagTv6ChiSaOoWA981PzqCSFr3/bi9wtZId0SZWwLUeTJK
         WMYVwE5i83Vc+VQ98aVODob2hM6b6+PgITC/4HVLfesU9dL9VKnen1iYmmcXaIlvV55e
         Wa3lvqnyGPl1LfTYk4K0E3RNymfRQ7dttIMGRcBOfXuyAa1tHm1EPd0FXQjb809t8YO4
         mUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVJAyOz4wkg8rzi0Jpa3EuoGbaKfnKfotaSVzKDL72c=;
        b=AtaonMwY15BShXHEpUtc49+JiM2MVIBBPpJxKIQO7uCi03Z3MUmhHUuWLHugl0AF5n
         p6aAsDiur2Yl2HJlkIJG+qMZ58d2aDKZfiJay+b/Y6AmtGi73KNL45LkcG99sSL/9sw4
         U+wasGnA1RL4y3RgigcZULAPWCI7zPPsUDsj89FhGPYT2swUBBs3T1hBhrA1t/QKD08S
         +1ZyX8ii4huQrpxhZzFN0Loc92d+QMPzVv9bpDMHGW5ioRXMGQwnA1ZDG3rpaBSlbm/+
         fhqLrPGSJqcEKxmvKLkx1NJCQ7NtO68iuinDP+lSNFeJmbIYnfRgeW5IbPNzxwrFMmJl
         /IIg==
X-Gm-Message-State: AFqh2krJuqbxgNAUGyiKvrUGHFzUlhv+WsVz7F7v4W8WKCupRMAeHo+/
	Lh5gN+T7SEg0GXTIPqvvgvZutx+JHfyYvdJLvSbpv86iynM=
X-Google-Smtp-Source: AMrXdXtzUrDRvs8deQdKqbDa7ENRZ8Gn0ngjrrPFgDJccMpCZpCJJr4k63k4oXDXGuLVTtnkSwHoVo/MVK279enYkik=
X-Received: by 2002:a05:622a:2595:b0:3a9:8c90:dce3 with SMTP id
 cj21-20020a05622a259500b003a98c90dce3mr1250540qtb.39.1672675195753; Mon, 02
 Jan 2023 07:59:55 -0800 (PST)
MIME-Version: 1.0
From: Mark Jonas <toertel@gmail.com>
Date: Mon, 2 Jan 2023 16:59:44 +0100
Message-ID: <CAEE5dN25F7=1VXkY0ZE1yBcgdm4S3khoGjVYHFF-z5xTdmTK2w@mail.gmail.com>
Subject: Struggling to get QEMU sound working on core-image-base
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 16:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175318

Hi,

I have difficulties getting core-image-base and QEMU x86-64 sound
output working. I do not even get to the point of having a visible
ALSA sound device.

What part of the puzzle am I missing?

Alternatively, can someone point me to a (simple) YP image where sound
works with QEMU x86 or x86-64?

I built a core-image-base image from latest YP Poky [dunfell,langdale]
with the following additions in a default local.conf:

MACHINE = "qemux86-64"

# Load kernel modules matching QEMU audio support
KERNEL_MODULE_AUTOLOAD += "snd-ens1370"

# Check ALSA cards available
IMAGE_INSTALL:append = " alsa-utils"

EXTRA_IMAGE_FEATURES += "debug-tweaks"

Then I start the core-image-base with "runqemu core-image-base kvm
serial slirp audio nographic".

In the running system I can see that the kernel modules are loaded.

root@qemux86-64:~# uname -a
Linux qemux86-64 5.19.17-yocto-standard #1 SMP PREEMPT_DYNAMIC Fri Nov
18 21:13:18 UTC 2022 x86_64 GNU/Linux

root@qemux86-64:~# lsmod
Module                  Size  Used by
bnep                   20480  2
snd_ens1370            28672  0
snd_pcm               102400  1 snd_ens1370
snd_timer              32768  1 snd_pcm
snd_rawmidi            28672  1 snd_ens1370
snd_seq_device         16384  1 snd_rawmidi
snd                    73728  5
snd_seq_device,snd_timer,snd_ens1370,snd_pcm,snd_rawmidi
soundcore              16384  1 snd

But the /proc/asound/cards is empty and aplay does not find soundcards as well.

root@qemux86-64:~# cat /proc/asound/cards
--- no soundcards ---

root@qemux86-64:~# aplay -l
aplay: device_list:275: no soundcards found...

For easy reproduction of the problem I created a KAS yaml file. You
can find it at
https://gitlab.com/toertel/meta-qemusound

Thanks in advance,
Mark

