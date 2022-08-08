Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96EEC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 18:35:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.2213.1659983700475251539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 11:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WgW4AgGB;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id a9so13857161lfm.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 11:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8RgMvRlL7CSarcuQ91FbGkh7+mMQxgF87sYzwXsYpk=;
        b=WgW4AgGBIufPOMAxmKruTxT15dDVqodK6ZYEuPVMt+/vVSnBzd9En9sEmzLBDW4luW
         pKoweh0RaWNI8wO1AMFBhBFOYsWhKZOssW1AeWP8e6lYTfQT9axGPtEi7BPYnzAzhPrP
         Rm5vPayfI3ggpPzQhOQE+Yiq7FTLUe8GOdVK3SjkEcTHWD+Fx6AdCrlUphx7/SdoL5FC
         zbnGQ9pOQ/FkMVTRg0blshNxMKodtI3FRcjjzuNPv3CWV2lyg2oKb7D/IX1wq/tWaaWT
         ff1+sq0tfQ+6L+5tD5LEifvuGwqpxfOlLT+YyOKd3uRtxJ6q4t31Z5NJmhlTDHUwPfrW
         EBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8RgMvRlL7CSarcuQ91FbGkh7+mMQxgF87sYzwXsYpk=;
        b=AU9zVzIAos/iTdpn+MJ+Zcr0Z0gokmlTKqCPE4uP3dGwygAfR+6hvj5SXKh0YCrB0l
         EX48lX0TRrZfFP7m1zrT02DW0ESDx9hGwbGGH1+Gy1cYf6uWSvzBYzquRKvSD+AxhBOz
         B0kVJAijCDwWY4Z6QMXNjpR9qBg3mEhqzl+yvg36aluJitZnu3OkZo7nMDYdPNGNVzcl
         WLI9I54vaRYbUlcXBiJ+i/MTwmbllf43Ukk35dHtPlxiu+q/TJ4X9hyCqo/JoAlo/KVo
         ZfGJpIdfco6EoazFz1rLDVKHa2rE1wJUaUKflhJYSTJ+/Q5nWiFMNZaULZTj6CyV/F0N
         AORQ==
X-Gm-Message-State: ACgBeo2d9gkDZll5aZy9vixGODXQsrMUmcvawrdP2ssTDWWguuHrPTfs
	/ijbGXoQves9iXNaC/PN0+Sm4gSXUKra75eSOxQ=
X-Google-Smtp-Source: 
 AA6agR6X7I/AC9r+oQz+bHIVnjZLIX/fT6Jv+hmeUlxU4XK/dNqgS0PRTG0b5uc872sjQUn7uWivBu50ruZSA6D3Bm4=
X-Received: by 2002:ac2:4209:0:b0:48a:7386:978f with SMTP id
 y9-20020ac24209000000b0048a7386978fmr6770635lfh.521.1659983698537; Mon, 08
 Aug 2022 11:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
 <CADkTA4NvmFOT+gW4z9Lx_2VMQ4aVSPkGcXnfTXDZ8zwD61G0ag@mail.gmail.com>
 <87a68d011dd53f284b7021a8d2a3858140ef2c4d.camel@linuxfoundation.org>
In-Reply-To: 
 <87a68d011dd53f284b7021a8d2a3858140ef2c4d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 20:34:46 +0200
Message-ID: 
 <CANNYZj_Dr+L4yMAkZNdOssd9+x3yrH1=DsBJAR7C0a1pDsJD1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/13] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 18:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169114

On Mon, 8 Aug 2022 at 15:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > Using modifier ffffffffffffff
> > > failed to set mode: Invalid argument
> > >
> >
> > I did do graphical tests on x86-64, and didn't see any issues. I'll
> > have another look.
>
> This is virgl GL passthrough in qemu so not a commonly tested thing,
> you'd need to run the selftest. I'm hoping AlexK has some ideas on this
> one.

Patch sent :-)

Alex

