Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FACD1A43B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:56:15 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.52239.1728903372825721796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bj8aKqg7;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb2f4b282cso28430811fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728903371; x=1729508171; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnbgMfggXZ8Qz/PRvr7I/AUC9s5P4hTRGrXXBKL/O9E=;
        b=bj8aKqg73rpPbYP1VxHuC03qqucNk/B7qB4/qm2kraNvcNfbPaEnCJ2UnLCYW62jdU
         0eSZ2K8yeBNYm2l66UE0EF0Qah9+lilEzr+OLO9a0U4r5xwBMOyP4Cc164cpXUN7elvB
         tYxqqKnU7I6GUya+vOwnLIugKEqfENZQpOcPcQuRMMtImXiNfkSaojWh7cI29Zgr8xXs
         ONJGeYDmBw4CewRCywEZUfwKtUSynrkbo7uoUGdLViWhtZd1DV5XTFwu+R+HFkNTtciI
         gMLj34k3VJWyiVebmxZkoazZlJFhYLqg3G8URTqBb0GXOGOXyfV2jOQQu3IRiTIAyyhQ
         7VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903371; x=1729508171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnbgMfggXZ8Qz/PRvr7I/AUC9s5P4hTRGrXXBKL/O9E=;
        b=rgYYiiBSSkgPlEzLCYW68Slda2rbPKcChkB2LhkD+YX7gxiI6VHGcbwVgqyunYPdoI
         DcXcck+ycmLNigI7bL1fgu/L6SIg5Y+OqRimBxa8Ks2MHetXFA5TMG6Dyy4bSI+QeNSN
         QazFDk6LxYiBsweVEJArbZYGc4hwpBz7YJiAb+sNsUpZkK+OGPI1/8zdaZP0QoAjbNvz
         5VoZtUz8p/DFf2gEvXk4l37o4nTpA7+bAGnLqwKhSU7Ofyz4vd2oMtNy6gpgFhDhInrX
         +wdaOL5F5cL0zhCLpros25uqxLrEw0MarknmNuH5IGdnnn1RATzaXPfZdp6FlrZZWsL3
         3YrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHvGS+aYiJVIs4oN+66obGR2wd2FRWOTj2eqBWz8oDDo0+HR7b3+W/6SSPOn7t8VBD/uRkpEppzqN6A5SiiYcNFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEBq5sNtfG8wmuki6sMlb0EenNMs3/3Q7NixN25qIRcvfqeqEs
	lfvv8mZwjTo/2sTkeVbz3M5Q0Yml9SrdtmkEBVLrNc4MtpCTuzGYvxH1vxmzPwmrFGTLRLIMofB
	NLN5hRRpVy73zhQdeTdbC8LKlJI8=
X-Google-Smtp-Source: AGHT+IGEGf65s+JOPHdMJvOlmIw8MELoVg3l8aLflXpq6Dw6CYs9coxmEfb7RWz1+o7WcOK+6/SHa42GEzl/Y1MxzqQ=
X-Received: by 2002:a05:651c:221d:b0:2fa:d58d:dcf3 with SMTP id
 38308e7fff4ca-2fb329e7a7bmr49935321fa.33.1728903370296; Mon, 14 Oct 2024
 03:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240930-6-11-kallsyms-truncate-v1-1-47fc9143fff9@cherry.de> <2ef09961-4074-44c4-bb7a-d1e1fa17613e@cherry.de>
In-Reply-To: <2ef09961-4074-44c4-bb7a-d1e1fa17613e@cherry.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Oct 2024 12:55:58 +0200
Message-ID: <CA+chaQeNUSUW13FjaH7Vn3Yq3iTE_=XwYVhFKfsjLB9YX_5Aag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH scarthgap RFC] bitbake.conf: Add truncate to HOSTTOOLS
To: quentin.schulz@cherry.de
Cc: Quentin Schulz <foss+yocto@0leil.net>, bruce.ashfield@gmail.com, Ross.Burton@arm.com, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205747

https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D8=
5451cdaee4718233211da1e43db01f5cd2b1aff

On Mon, Oct 14, 2024 at 12:54=E2=80=AFPM Quentin Schulz via
lists.openembedded.org
<quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>
> Hi all,
>
> On 9/30/24 12:36 PM, Quentin Schulz wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Some wic images need this command. Since it is part of coreutils, it do=
esn't really
> > cost anything to have in HOSTTOOLS and it avoids signifiant build depen=
dencies on
> > coreutils-native.
> >
> > [YOCTO #15571]
> >
> > (cherry picked from commit 522000ce5c4f0201cbe42d7826b6a8489ed10117)
> > [necessary for building Linux kernel >=3D 6.11 with CONFIG_KALLSYMS, c.=
f.
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> > The Linux kernel in its 6.11 release or later, with KALLSYMS config
> > enabled, will now fail to build because truncate host tools is
> > required, c.f.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
> >
> > but the kernel recipe doesn't depend on coreutils-native, which is too
> > big of a dependency for what it brings according to Richard (for the
> > original patch destined to wic) and Bruce (as discussed over mailing
> > list for the linux-yocto recipe).
> >
> > Let's backport a patch that was implemented for something else (wic)
> > from styhead/master as truncate is pretty much guaranteed to be present
> > on the host with hopefully no compatibility issues between
> > implementation.
> >
> > Marked as RFC because it's a "big" change and I don't want the ML to
> > just gloss over it without questioning it :)
> >
> > Note: I'm currently NOT building that kernel in my layer, but it'll com=
e
> > at some point next year, though I did hit this issue when doing a very
> > quick test with a local tree.
>
> Any feedback on that patch?
>
> Cheers,
> Quentin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205745): https://lists.openembedded.org/g/openembedde=
d-core/message/205745
> Mute This Topic: https://lists.openembedded.org/mt/108733316/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

