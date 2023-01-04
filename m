Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB45BC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 17:42:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.19482.1672854173190029795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 09:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cv4h56iP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso27117425wmp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRrkqbI4JYdrwcCxWxDBfiew4o6eJhlX5AZ0JOMW8EQ=;
        b=Cv4h56iPhtHjYc6zcNpGbUS5ifvC23kdt2HIxRSGF+4/Xif9O+Vq5ANCVQmh23E3k0
         EQ3JgGzydKhSTD4/+PG1YIl8Ew+qBAlwCSlOKYapDMj6ib4TGFg5CFzTjNNNelZMsbPc
         2ZLHWzSDLtbofhYXQz/MoMc8m8LNbhhB/OX+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRrkqbI4JYdrwcCxWxDBfiew4o6eJhlX5AZ0JOMW8EQ=;
        b=lU+IQyDwx8DtP4k+EGwkmmoiUmUu+BDof1ZCbxyBMUr2cqYRWuvVzkDxSSUtKnJbqp
         6141TIZeyrFOwx3+yLKFMlbNAFhHuHUnN8fyRD5Tof+Xkfs5KJFitqb5TXZ6WviEy5W9
         XBUwy3q7qCJfIR21UV/XFustPuyg29OJNkdhqeOF6eKBmLAVO0EAYUh27wkGZelb2I5t
         +YtZWpP5KOf75Svj+8rMSbbjpruYdbPb9t4a6ed1NqJ4jzXkgNmSCjBPXyliSH8PZnPV
         7UYSPzT+D8AXrUbM2sLmv7H70XhkPKbhioUQdtKlpddQS5lV8tsBofg0JClU0tLIh1sI
         LHIw==
X-Gm-Message-State: AFqh2kozELjxpHda4IXJkdiUpNaJ6f5lNzB+KLN29ouPGzF0aGiWLNV2
	AzehF7RjZfozvV2e1QWM6f69bw==
X-Google-Smtp-Source: AMrXdXuZNnHdlnkYw8PVBxfbPgVhvQoDnRAFQkhZ7yJABOqQKbJ5Owz8Y5VUdYjBEwGa53x4rPK6ZQ==
X-Received: by 2002:a05:600c:4da0:b0:3d3:5027:4cce with SMTP id v32-20020a05600c4da000b003d350274ccemr36297856wmp.10.1672854171356;
        Wed, 04 Jan 2023 09:42:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527? ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003d9b89a39b2sm10251195wmc.10.2023.01.04.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 09:42:50 -0800 (PST)
Message-ID: <1008758809c64c84413879f9985e743249cfd965.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Load proper sound drivers for QEMU x86
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: toertel@gmail.com, openembedded-core@lists.openembedded.org, 
	michael.opdenacker@bootlin.com
Date: Wed, 04 Jan 2023 17:42:50 +0000
In-Reply-To: <20230104121808.1065203-1-toertel@gmail.com>
References: <20230104121808.1065203-1-toertel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 17:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175502

On Wed, 2023-01-04 at 13:18 +0100, toertel@gmail.com wrote:
> From: Mark Jonas <toertel@gmail.com>
>=20
> The patch series fixes a regression where images built for QEMU x86 and
> x86-64 did not contain sound drivers matching the QEMU device emulation
> configuration. Additionally, the right drivers are now also auto-loaded
> when starting the image.
>=20
> root@qemux86:~# uname -a
> Linux qemux86 5.19.17-yocto-standard #1 SMP PREEMPT_DYNAMIC Fri Nov 18 21=
:13:18 UTC 2022 i686 GNU/Linux
>=20
> root@qemux86:~# lsmod
> Module                  Size  Used by
> bnep                   20480  2
> snd_intel8x0           32768  0
> snd_ac97_codec        114688  1 snd_intel8x0
> ac97_bus               16384  1 snd_ac97_codec
> snd_pcm                86016  2 snd_ac97_codec,snd_intel8x0
> snd_timer              28672  1 snd_pcm
> snd                    57344  4 snd_ac97_codec,snd_timer,snd_intel8x0,snd=
_pcm
> soundcore              16384  1 snd
>=20
> root@qemux86:~# cat /proc/asound/cards
>  0 [I82801AAICH    ]: ICH - Intel 82801AA-ICH
>                       Intel 82801AA-ICH with STAC9700,83,84 at irq 10
>=20
> Mark Jonas (2):
>   conf/machine: Match QEMU x86 sound kernel module
>   linux-yocto: Autoload sound driver on QEMU x86
>=20
>  meta/conf/machine/qemux86-64.conf         | 3 ++-
>  meta/conf/machine/qemux86.conf            | 3 ++-
>  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
>  3 files changed, 9 insertions(+), 2 deletions(-)

These look good, I'm happy to see the patches, thanks!

As Bruce mentions, a kernel config fragment would be a nice added bonus
to ensure the right config options stay around or error if they're
changed upstream.

One thing I've learnt is that the best way to ensure these kinds of
things stay "fixed" once we fix them is to tweak our automated testing
to check them.

I'm wondering if there is something we could/should add to:

"bitbake core-image-sato -c testimage"=C2=A0

to check for the presence of a /proc/asound/cards entry for example?

The idea here is that now it is working, we'd try and ensure it stays
working!

Cheers,

Richard



