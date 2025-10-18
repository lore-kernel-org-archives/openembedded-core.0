Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DBCCD195
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 19:14:59 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.11661.1760814890875297231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 12:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgxxSib4;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: petr.vorel@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so860515241.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760814890; x=1761419690; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bkVU/ls6E3Inp0syw0RdVqx5Vf4qprbeDCVEWylQaM=;
        b=dgxxSib4S2yQzDgPTWvn90TDXLYaQNxaVGYii+xhkBuyFJFk0DXpaLPLHwFh4VMhet
         24Ae+VUdKoLHCtdvSRRQ+Qhh89pNEwx7QFGFnqR1XEtRgefyvuYvqRgp/W8SWqmnP66X
         4pEiIBQ7fPgoy4/voVVtZXCtBaPfBXD3Ca8WF/puf7E2bdoK7RfE6bxtJBxSowJ2+eps
         GV6jSu/fTSLF0IDEzUisFEWlohgFs3FWkCw7toEfW9LQxZYozmyJFEwXiuHahQsyYu51
         G8ONkOE1DdZoZ+LRGL8P+jtuIrvRk1MNBSs1wozsZfBE8yq4j2LFxye37n3HxjA6GbQe
         facA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760814890; x=1761419690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bkVU/ls6E3Inp0syw0RdVqx5Vf4qprbeDCVEWylQaM=;
        b=xRzjuJdxm/OJ2YSOdcoOLtl5VNtyron/TKgWkWL5rFg32FYAIwK/AMH/tMHYw/AN46
         pewZVX1VVu6ln3wCgGKPqOhmvOY6OT9sjXieyov1H62/LUPPWT6QDd8VBRv3IBmecWmf
         EpK9pcaGdN7JpAfuZG+0BIdoNx9W8Wl6X4f+RGrStg9kIS3cUjOuI/OBlehCqQsDLWCx
         N26B8PNyhi4jB9epoS31BrswmIKw4p1icPxyv1ANUcynYAJjedn1vukh7MTW+KLuVb11
         vSjimoUBlb12QKXv7ot0vck4kynxW2bPK1Ak3seSKlmyyU/G7+rTL6ETCVI4IDBAusL0
         lhUg==
X-Forwarded-Encrypted: i=1; AJvYcCWS7JshklvfEykQjOF7e+uaEHr0N3Y/7AQWV4uSgCt+FNvhvLAfMtt9uH8ahHaTd1vY4p8H4rk9KOYVGFvsooxDYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5c/sf7Xh2cMhi/CwNnWhHIj0WVvSOunkTs7hvvRFxLBZHz+F/
	QhuTFixhuD5Szmbe2BOnRobCR9guuZaosOLT3v3roB81vggrl4YF9NpX2yuoDAub8jUhxm10aLY
	rvpb67YBzjZrgPukn3ih3X/FUVAK/CsI=
X-Gm-Gg: ASbGnctzIdfwN1JGoBUOcz4Heop3lJg8nvLSJ3CqY01POQn9N6CfABbq+3b3EXGsaJd
	mSgerxV0peFELecV0WstvEcTupYKoZQjRLthw5oN0clrDo8yiCUIq93qS8jKMus7bX8fsmJfAs4
	aIOF/kyNahxucAqqoNr4MROltIEFOkZdzIR3PUiFOKykCQD1xlJRl12yAc7d4YgJW5LVLcE6dZu
	+gniWGfbdigCo1poGWFviCdrmWK9NNahAw6yIn4Y0iM/+ECcrJlB3eMpv4Q+X8xuzG+VDmb
X-Google-Smtp-Source: AGHT+IGBwRwMiicle/K97UAZP9effg7KmLTo9GGWEmpo66FuwUalBdeY8kCBxkFX/SvqFTnvnZU81gHfgdBz3qi7VYU=
X-Received: by 2002:a05:6122:3d09:b0:54a:a251:ad57 with SMTP id
 71dfb90a1353d-5564eeefa92mr2785895e0c.16.1760814889656; Sat, 18 Oct 2025
 12:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251013185934.GA114595@pevik> <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
 <20251017164332.GA355538@pevik> <CANNYZj-6s0z-VgsONFkD-BW-kimhJ1R7bRLsXTJ2NQ7ANjfi4Q@mail.gmail.com>
 <3065c655cb09c8934022b9e9295620024eb3f94c.camel@linuxfoundation.org>
In-Reply-To: <3065c655cb09c8934022b9e9295620024eb3f94c.camel@linuxfoundation.org>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 18 Oct 2025 21:14:38 +0200
X-Gm-Features: AS18NWCPXT0pLW8GWAg2grtY5Fpi2nUgLKZf3z1xqdzX3enzGQ-YuKIY2mTxOyg
Message-ID: <CAB1t1Cw=59ADv+M=bptkEMs4TAotCaE=uc8Nuw39wTMTRQq16w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Yi Zhao <yi.zhao@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Hui Min Mina Chou <minachou@andestech.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 19:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225077

Hi Richard, all,

On Sat, 18 Oct 2025 at 12:06, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2025-10-17 at 20:18 +0200, Alexander Kanavin wrote:
> > On Fri, 17 Oct 2025 at 18:43, Petr Vorel via lists.openembedded.org
> > <petr.vorel=gmail.com@lists.openembedded.org> wrote:
> > > Master branch from my fork [1] do:
> > >
> > > ... $ . oe-init-build-env
> > > ./build $ bitbake ltp
> > >
> > > ERROR: Error importing OE modules: module 'bb.parse' has no attribute 'vardepsexclude'
> > > ERROR: Unable to parse /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
> > > Traceback (most recent call last):
> > >   File "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py", line 372, in eval
> > >     layerid, fragment_name = f.split('/', 1)
> > >     ^^^^^^^^^^^^^^^^^^^^^^
> > > ValueError: not enough values to unpack (expected 2, got 1)
> > >
> > > Kind regards,
> > > Petr
> > >
> > > [1] https://github.com/pevik/openembedded-core
> >
> > Which revision/branch of bitbake repo are you using? Note that bitbake
> > and oe-core repositories are tightly coupled, and if branches are
> > different, or branches are same but one is behind the other, you will
> > get errors such as above, e.g. "ERROR: Error importing OE modules:
> > module 'bb.parse' has no attribute 'vardepsexclude'" is pretty much
> > saying that oe-core is expecting something bitbake on your machine
> > doesn't have.
>
> Just to be clear, try cloning git://git.yoctoproject.org/poky which
> contains both OE-Core and bitbake. This does look like a bitbake/oecore
> version mismatch. I am curious which bitbake version that is? Was it
> distro provided?

I'm sorry for wasting your time, my fault.  I used
git://git.openembedded.org/openembedded-core.git with
git://git.openembedded.org/bitbake.git, which was outdated 2024-09-25:
29e67acb8 ("tests/parse: Add test for unclosed functions")
I forget there are two repos. But lesson learned :).
And thanks for pointing out poky repo.

Kind regards,
Petr

> Cheers,
>
> Richard

