Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED21C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 17:26:54 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.98.1672939606104677396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 09:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X+OXcFpb;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id g10so3086313qvo.12
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 09:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uH1UX778sH0JeD+GcYE+dMiJdJIPWZJoEkssaHkJBv0=;
        b=X+OXcFpbT3kY71UwYJqupKYvIIV8DeqvmIC33nNnhjC0HBSVxeibD67WJbTYkJdkZq
         GNOd0nC/h5OlXPMb/UDI9SgjzMeNEwqruq3FsHLps2fgctrcMMY8IW8A6Ee5uYmCr6Qq
         J3Bcd98v79quow5bYEsYE0Ehft6ytbHh7bHfF73opZzUW+6vL99QK0TII7Gezi63egQV
         Z2EGHXneNL8e+gzVRuxZgzcf4I67YgI5cHESWeQfxN1Q9Hn0CDMJYy+Mfn9QJMApKVKY
         LHnF6NGskb8wJl/leUqz8OpMHnHC8IwVzdNH60/3Vle1rq7qKajxAegnmyDd/liRmyXl
         Z/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uH1UX778sH0JeD+GcYE+dMiJdJIPWZJoEkssaHkJBv0=;
        b=u0AbSB7IYCWNzLmBgcWokd/AwrNIZuP/7eqMF9A9z2ytyPMyU4ioLsbOsLMkLN1cZ+
         AF4tlpPhu4nE/ogyQijlMbBn0vlB+oNMTFKXd7Nuhb3gMFI+4FaA96fkxpES3iMPvVeF
         yZ2InT7Tk1gNH5ePtNvPQ4bGP32w4R8RZF+r1O8rGxb0nrNc2PErYpJtcw00V02es9gT
         /2U18OmDp9IWm/a1+6Z5TOoN0L5xgi4F3K2wRdhERgHmMD0QpIqJvjvpCT7bIq6282Is
         ig6PvAF03Sa3HWhtcAHez2UOghQNCiveTPnp/Rkes1MS0mgG7pb1L6qi7oO/djNjOAQ5
         LGeg==
X-Gm-Message-State: AFqh2kp7IJW98/B+2n5HLYlLwREQxW1NKFWGWVh6rB73H0IqfzrhVUgX
	bBQfSmXCePNMxzd4zd5X6KpI5qGc+IJH/IG1EyBPbM+s
X-Google-Smtp-Source: AMrXdXvhAj2jAFVBGFqSTaAWLKV3Gl362E3G7BLEKFnZvTYPBpzyL7MF3lia+HRCoO8KBtZnsDnZaK1UsEJnFkqH6lE=
X-Received: by 2002:a05:6214:3904:b0:525:1e7e:ae46 with SMTP id
 nh4-20020a056214390400b005251e7eae46mr2901924qvb.49.1672939605167; Thu, 05
 Jan 2023 09:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20230104121808.1065203-1-toertel@gmail.com> <1008758809c64c84413879f9985e743249cfd965.camel@linuxfoundation.org>
In-Reply-To: <1008758809c64c84413879f9985e743249cfd965.camel@linuxfoundation.org>
From: Mark Jonas <toertel@gmail.com>
Date: Thu, 5 Jan 2023 18:26:34 +0100
Message-ID: <CAEE5dN2fi0jYe2STbucvGHLUnVk4w7F3chhK=jWnb4DCtLKdXw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Load proper sound drivers for QEMU x86
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 17:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175545

Hi Richard,

On Wed, Jan 4, 2023 at 6:42 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-01-04 at 13:18 +0100, toertel@gmail.com wrote:
> > From: Mark Jonas <toertel@gmail.com>
> >
> > The patch series fixes a regression where images built for QEMU x86 and
> > x86-64 did not contain sound drivers matching the QEMU device emulation
> > configuration. Additionally, the right drivers are now also auto-loaded
> > when starting the image.
> >
> > root@qemux86:~# uname -a
> > Linux qemux86 5.19.17-yocto-standard #1 SMP PREEMPT_DYNAMIC Fri Nov 18 21:13:18 UTC 2022 i686 GNU/Linux
> >
> > root@qemux86:~# lsmod
> > Module                  Size  Used by
> > bnep                   20480  2
> > snd_intel8x0           32768  0
> > snd_ac97_codec        114688  1 snd_intel8x0
> > ac97_bus               16384  1 snd_ac97_codec
> > snd_pcm                86016  2 snd_ac97_codec,snd_intel8x0
> > snd_timer              28672  1 snd_pcm
> > snd                    57344  4 snd_ac97_codec,snd_timer,snd_intel8x0,snd_pcm
> > soundcore              16384  1 snd
> >
> > root@qemux86:~# cat /proc/asound/cards
> >  0 [I82801AAICH    ]: ICH - Intel 82801AA-ICH
> >                       Intel 82801AA-ICH with STAC9700,83,84 at irq 10
> >
> > Mark Jonas (2):
> >   conf/machine: Match QEMU x86 sound kernel module
> >   linux-yocto: Autoload sound driver on QEMU x86
> >
> >  meta/conf/machine/qemux86-64.conf         | 3 ++-
> >  meta/conf/machine/qemux86.conf            | 3 ++-
> >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> >  3 files changed, 9 insertions(+), 2 deletions(-)
>
> These look good, I'm happy to see the patches, thanks!
>
> As Bruce mentions, a kernel config fragment would be a nice added bonus
> to ensure the right config options stay around or error if they're
> changed upstream.

Quick summary of what I replied to Bruce: The linux-yocto*.bb recipes
(except for the tiny) already use a cfg/sound.scc to enable building
of sound driver modules.

> One thing I've learnt is that the best way to ensure these kinds of
> things stay "fixed" once we fix them is to tweak our automated testing
> to check them.
>
> I'm wondering if there is something we could/should add to:
>
> "bitbake core-image-sato -c testimage"
>
> to check for the presence of a /proc/asound/cards entry for example?
>
> The idea here is that now it is working, we'd try and ensure it stays
> working!

Sounds reasonable. I haven't used automated tests for OE yet so it
might take me some time to dig into it.

Cheers,
Mark

