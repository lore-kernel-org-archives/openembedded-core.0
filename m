Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4262BCD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 13:04:09 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.38071.1725282239461424887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 06:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzU9wCqh;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f51e5f0656so46849671fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725282237; x=1725887037; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9EVn2NctcbUsNGrMqwUReBoFMH7xSrIly2tTt9g/SkE=;
        b=RzU9wCqh5TH0F5t3Isaa+1rNpzh2KRdLUkP6mWo6EFwhVXc/JoKM4MCd9xWxm/AkdD
         fAM6jVw9qOo0yIrkg1NIuUgg3S5BTZz7q5CfD7q7661bZpi9qTqKyhxoYimk2Mjz6k+n
         nNaNLhUE5ZNbiH8g6XUi6QaHxjd78yBrqjxS36tAKpH6B3BRwcvNknl588k/8W3GZpHq
         tiYz+jtRHfqNb2aH7WxFxl5S2VOsUGPaMktsvQSXEZDTbpViBdWFAlrwfdLjcwWdRwgW
         jkDqMc+l6EP+VcyL0W+anjVdvxJiNPhpkxY5R9/g6V89ne+9G94uIrU0B/2MuNPciB76
         THbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725282237; x=1725887037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EVn2NctcbUsNGrMqwUReBoFMH7xSrIly2tTt9g/SkE=;
        b=WD6P4RKkSIrJ7BUfavc0iiZ6Rswl6PmT3i+aXKh8lTGGq+PebsSoO2QwTQ82sZ8KtE
         ZnS/7PVOQbwVGFJLQuQk/eXLVgpDHU93wPhb6kg6FyxbJ0nGSa0AsovTNUtBvmlRRrK6
         xum7unfnk8lFVyvWMM4ut8T0aIdcdpOhnOf1BvgVMzIXqzzbU7lh/Qwm25dviSCbWauV
         UQuQhUycL17kAND1eP5pq+EI8/SNbx72V5sumKvd5clboHB3TbLuNfUDjIwEaPTCJtnj
         94IXMSBf0PMQed0M+DTpInKJheuWDyeO5VyWwxHFFMKTaSkCwxSZ3/t5jgz7gwg/1LWB
         pPFA==
X-Gm-Message-State: AOJu0Yxh3Mh1Fqp+EP7vCKkG2KoPbcybLOVZwoFftW06lvZWoodV21kR
	n/8P6gKpWoS3e52ThNDoZd9rdZ5NUwwDGVYp5Tru67cNm7XSJRUsmMaJN71zllJpeIiSUDKCSQf
	vZufbZs4OA74VVRz2ytD391ilBEU=
X-Google-Smtp-Source: AGHT+IH0mHNANpHhSBeo0evV3SgQnzJbg29UtvfuXI9x3RRyyfEJZuTO4Zt27K2Y6wZOqVoH9Nh48MAFfiYT9fIv0s4=
X-Received: by 2002:a05:651c:19a3:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2f6104f2899mr112733021fa.38.1725282236787; Mon, 02 Sep 2024
 06:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org> <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska> <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska>
In-Reply-To: <ZtWuxNNd9KNxT4T3@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 15:03:45 +0200
Message-ID: <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building Unified
 Kernel Images (UKI)
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204101

On Mon, 2 Sept 2024 at 14:25, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> I've checked and I have not found matching examples. We have everything working
> for UEFI secure boot for multiple ARM64 boards and qemu, including oeqa runtime tests.
> Currently the qemu side changes to support UEFI secure boot are queued to meta-arm[1].
> They could in theory be proposed to poky as well but there is no
> matching machine config for that. meta-arm provides u-boot and many other
> firmware SW components, including fTPM. ovmf seems to be only for x86,
> same for the meta-secure-core side examples for UEFI secure boot.
>
> systemd uki support is really generic and not at all specific to arm
> architectures. That's why I think it belongs to poky. Yes, the tests
> need to be somewhere else currently unless test target HW already
> has UEFI compatible firmware, but even with that the deployment of
> signing keys/certs needs to be done separately.
>
> [1] https://lists.yoctoproject.org/g/meta-arm/topic/patch_v4_00_13/108164747

I've checked now. There is support for UKI in
scripts/lib/wic/plugins/source/bootimg-efi.py

and there's a test for it in

meta/lib/oeqa/selftest/cases/wic.py (see
test_efi_plugin_unified_kernel_image_qemu)
meta-selftest/wic/test_efi_plugin.wks

Which begs the question: why add the class at all? Does it do
something that can't be done by extending wic code? Can you adapt your
work to use the wic plugin using the above as example?

Alex

