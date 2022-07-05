Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA36C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 08:51:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.82142.1657011079689543036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYfncjoW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id q9so16507406wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=TfqYeHZl7QU7zuuzPfS2KZPMN5+12b3MiEizfNd7iRw=;
        b=YYfncjoWukkp7bDEWiikpXURUMZbH0i2KhGQyqStJNg1Jl6geV3ID1tbV11hfS8/iu
         iPqqoTy+1Dw2KmlIf0/Ub9UZsLawW/CKd78Jn+aDs9UxWGwMfvfNObvJKpGUmb9Sgo2H
         q57VZCyvuDCUvNJK/a3OMU5dvSwYBonxXe+M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=TfqYeHZl7QU7zuuzPfS2KZPMN5+12b3MiEizfNd7iRw=;
        b=ykrRZfvCA+PB0rSkbEYFVIShgKdAayP5h6zZv6jIGLoyxZ3W0pvJ5mtHM4swkJ7Hiv
         VlrkEVHB9T68SFpruBKKdE82HPoVD0d33itJsjhg9Una+4HYGhSM9wXZlNMHwSwyoxMu
         3Q3HQA5FNb3YUjyVi7m7jAUWWJ/vsiMoYnZ0SkXyKm0KE9T0r/YPMsF/kBvCqO4BCOY1
         XcCIdQ8yskQ/MA511dtmzvzoMSZZGkC1Z2bnAdJcI1bDNC+CNBshrpIVcs/gSkaRf+uV
         UwDWYGl1npmDO2aZLs3laknwKxTpKwLy9dXwU4FjpREMPDE2RrQaMAB4bo5i3gq85uvL
         7wpA==
X-Gm-Message-State: AJIora8/8zuVZ7UILszX0G19ttC21+k56DYGgaMVMfHRJIiUNafI4XPC
	ieD6SFxkPPkcnEa9RIuWc4gAAA==
X-Google-Smtp-Source: 
 AGRyM1trcsj6hQ8LvAvMNF59RCZ1i+x3S7/hD7FaUvdBKW278U1ACovbFBzZ19aepoY5R35eKtXJbQ==
X-Received: by 2002:a05:6000:1688:b0:21b:9f71:f046 with SMTP id
 y8-20020a056000168800b0021b9f71f046mr30813631wrd.553.1657011078075;
        Tue, 05 Jul 2022 01:51:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a5d4f8b000000b0020c7ec0fdf4sm38171504wru.117.2022.07.05.01.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 01:51:17 -0700 (PDT)
Message-ID: 
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Andre McCurdy
	 <armccurdy@gmail.com>, Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 05 Jul 2022 09:51:16 +0100
In-Reply-To: 
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
References: <20220701192449.1358325-1-alex@linutronix.de>
	 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
	 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
	 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 08:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167643

On Tue, 2022-07-05 at 10:34 +0200, Alexander Kanavin wrote:
> On Tue, 5 Jul 2022 at 05:09, Andre McCurdy <armccurdy@gmail.com> wrote:
> > My proposal would be to try to reuse Linux kconfig. Users know how to
> > run "make oldconfig", "make menuconfig", etc and I believe all key
> > distro / machine configuration along with which meta layers should be
> > enabled, which branch to use, etc can all be captured within a kconfig
> > .config file. The task at hand would then become writing a tool to
> > translate from a .config file to a set of distro, machine, local.conf
> > config files (and an image recipe?) + drive whichever tool will be
> > used to fetch meta layer git repos.
>=20
> At this point, I have to remind everyone about our harsh reality.
> Which is having lots of core pieces without maintainers:
> https://git.yoctoproject.org/poky/tree/MAINTAINERS.md#n45
>=20
> Let's focus on adding foundational pieces of layer and configuration
> management in a controlled, testable and tested manner for now. Which
> is what I am trying to do. I think discussing grandiose designs for
> things that try to please everybody is just a bit premature, honestly.

There is a time and a place for incremental improvement and also a time
and a place where we need to step back, look at the bigger
picture/problem and try and design for that.

It is no secret that I've been avoiding the layer setup issue, I know
it is a painful topic and will be hard to solve. I'm also acutely aware
that we can't ignore it for that much longer, we need to do something
about it.

The challenge with your approach is that it is bolted directly onto
bitbake-layers, which makes it not only OE-Core API but bitbake API
too. There is a standard such changes need to reach and I'm not
convinced that is doesn't tie our hands in future as is.

I suspect in reality, we could probably have the same functionality in
a separate script in OE-Core, maybe improving the APIs/library
functions from bitbake-layers if needed. That would lower the bar and
mean we could have something focused on eSDK needs rather than the
wider problem.

Of course that potentially misses an opportunity to potentially address
the wider issue. I did at least take the time (on a weekend) to write
down my thoughts, which wasn't particularly easy.

As for kconfig, I don't think we need another config file format. I
have proven that json can encapsulate all the complexities of the
configurations of the autobuilder and kas has also proven the same
think with yaml. Yes, the menus are nice but at some point users will
need to see our config files so I don't think its a much of a win as
people think, unless the entire project used it which it doesn't and is
unlikely to.

Cheers,

Richard



