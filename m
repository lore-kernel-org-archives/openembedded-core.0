Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B6BC0032E
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 14:33:48 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.18844.1698503619994342641
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Oct 2023 07:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vo3O0VFT;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3575287211bso9034395ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698503619; x=1699108419; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BixfFEvUE061g7TqvEUvZN6fwfbgWiR3QfRhwrhuyY=;
        b=Vo3O0VFTwp+UROwvaX8dR86jez6T0xSWZmvLNwDCDp8oYJ+6/oUsYAem+XVzDX+Xyi
         6RDwHYSzBV5ycSO1Os+kGaYnAuq1yR/PajTIVUVhO+HyitHTjlzfTQPPHUO3Hn94NoFI
         hD7PDj4WKO91uHgSXWsvaosDbZnmMpUamLzCmUN7KgiBylYaUysy5tM+o2Ep724oaN+n
         ZVZkKQCYRoZDr4wjcmBxEwbztXjvTOajCYj9pqKdL4ONsWHwOK6oce59VyUrMRSN6lgc
         nOXfc3qzUY6NvFqmkypHgz36mNhBis8VpXyJcG3SU5f+sJIXM/PYoisOkFtujtl2tNQG
         qtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698503619; x=1699108419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BixfFEvUE061g7TqvEUvZN6fwfbgWiR3QfRhwrhuyY=;
        b=bDp8SbCTKYHpHUP3KBYKBDR+Kj4wfQaT08q46DpzFNV/O0zKA+BNCHARvgHaMvyvuA
         5gHgqfC0nbrSBPHCDDZvek+nEA+juClzG8VLeb9C629rsx0jnRGIKKV3ycePLMHUEFFL
         pPJNQ157bPEDY9PbxhGVqlgieudpjLxl622LcOKoWqMlIX4t+LFuP8pYuuOOIkvzxg4e
         Eg9l7I04P/J/XBkPyxiwvc7KeuMZ/VihUVffkObmhnWoJZ2naJzy8L8EpXO+KCupiH8I
         9O/ShBqqsYIfaUkCysVFZdn1+C0pSEChZpv42nOTEqRKpfRFoNc9H6RwG5QjQqxSaeB6
         Ideg==
X-Gm-Message-State: AOJu0YyU0PoRaEs+jkJALufYn+MB4JgcRpGj442uhhDMAWtvuaQJPJAf
	jgKcJO8xDeuJGJQxM76hsFWgTubR8ey6dMQFU9E=
X-Google-Smtp-Source: AGHT+IGX4sLvuNqJqwdpwsIC/Sn3JhaxonxzKvebC1m95bFm7wzqOL+HhGZOh7LqwmdO/YJ2m4NAMSJY0xir0BbeeJU=
X-Received: by 2002:a05:6e02:1cac:b0:358:9c8:e4d6 with SMTP id
 x12-20020a056e021cac00b0035809c8e4d6mr7816911ill.31.1698503618981; Sat, 28
 Oct 2023 07:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231028000738.968009-1-bhstalel@gmail.com> <CADkTA4PWe7-2GgsiyZMFqppje+hhY_3yUMrENF2DGaKv+pUwEw@mail.gmail.com>
 <18a7bb5f46d14f2ef31ac06f79e73801399c47d0.camel@linuxfoundation.org>
In-Reply-To: <18a7bb5f46d14f2ef31ac06f79e73801399c47d0.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Oct 2023 10:33:27 -0400
Message-ID: <CADkTA4Oge0SDJh9kKUeqDwZCt9NWkTQOUsa0nVABMdS9J=zjFA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] meta: classes-recipe: A class for simple Kernel modules
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: BELHADJ SALEM Talel <bhstalel@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 14:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189767

On Sat, Oct 28, 2023 at 9:51=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-10-28 at 08:35 -0400, Bruce Ashfield wrote:
> > On Fri, Oct 27, 2023 at 8:07=E2=80=AFPM BELHADJ SALEM Talel <bhstalel@g=
mail.com> wrote:
> > >
> > > The module class provides what is needed to compile a Linux Kernel mo=
dule
> > > but since the Makefile is always the same for simple modules that hav=
e
> > > their sources in one directory level, I thought of creating new class=
 wrapper
> > > to automatically prepare the Makefile.
> > > Also, using variable flag feature, a recipe can provide multiple modu=
les
> > > and can be handled the same way as PACKAGECONFIG is used to enabled/d=
isable
> > > features.
> >
> > I find this method of preparing a kernel module much harder to follow
> > (and debug).
> >
> > So Richard is ok with the class, I have no objections, it may serve a c=
lass of
> > developers, but it isn't something I'd support as a first option.
> >
> > But please, create a separate example for it, not modifying hello-world=
, we want
> > that simple and explicit example to persist.
>
> Richard isn't convinced.
>
> In most cases a kernel module from a source repository would have some
> form of makefile included with it. yes, if you're creating one from
> scratch, this is helpful but in general you do create a makefile at
> that point and are unlikely to want to keep auto-generating one.
>
> As such I'm not convinced this class matches the siutation most people
> wanting to build software would be in.

Everyone probably knows that I'm not in favour of generating pretty much
anything that can be clearer and more explicit. :)

I re-read my first reply, and it wasn't clear. It should have read "if
Richard is ok",
... those joining words are important.  What I meant to convey is that
I wouldn't
block something like this, if you were ok with it!

Bruce

>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

