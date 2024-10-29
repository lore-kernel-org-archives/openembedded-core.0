Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B43D2AB36
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 12:30:21 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.18302.1730205015060118244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 05:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSfvhfXr;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so5751694e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730205013; x=1730809813; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APkHOVdq++6FV4jQdQ6HEVESGIBBTQXTuLOlqMNrtY0=;
        b=cSfvhfXrcYF7IHVEU5+oAGhixp+xrVFVF1QxZRtWgINUoO2uhxnV6aNbPoTG102jn4
         wcnWJccqPCq74SVuwyt5QaQJRHth5gCRYiSPWzPM7edbK9AmjF9SlTivatzSantxM3z4
         gVzw+P95idA/OxOJoImk10uxpNvXtPKDAqvr5Fwz+CcjpyUt0OkvCk4P5jdZb7mNatt5
         XmEd4dN+FLbstPmkpUwi8dQnUG79O/Nbzznwj5Cgarp0fI3IaeY8N7VQJq7HFXmuDwNX
         T5J5JJqTsjhlTIWSFOiMF5Pxd3xE5VLmX+/i/Qq0aketKxO57j+lsE0dA5iuI38H3gcU
         VE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730205013; x=1730809813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APkHOVdq++6FV4jQdQ6HEVESGIBBTQXTuLOlqMNrtY0=;
        b=PrHCxVOP8YQe8db1YJw9sgivDCxWREbuK+pnBrGqK4A6hxkJn/nqV9wAhTCYFzPnUK
         g7tGn83RnYZk88AvY0p8gvVdlaVilElaqr4LwYC/AJ6d57+HDn1zN38DOl3GPC88Y5N5
         71ZLlL4cR3kF1el9oxOYdpQB5xqlFihd++e3uVlTtBR9pdq00V4M53BH07UQGz3r+W/O
         pQWd5cgbNSg7sHDFz1ODiTDT/xHJtES186zoFA/F7ffKZSUKxiN0SpJ1n03rvJsRXvly
         MvlADJd/NYcv6DJ5lq7P70RUic8u5xwXJhX0zNn1eexRm3r2QXtKY+8eJw7hmIeBr65J
         I+wQ==
X-Gm-Message-State: AOJu0YxVn0G/lmV+Z6ZFNfcsXC4tANfbypMEeoQ5eNks5x9137GlA7Px
	zB3i0rlDyF2oGqqjzFlq5JiWZSinrBnaJM93cc7fMstjwVGnXRNweHv/OMg7AIZ/XJ4koU0rFC8
	WOwLffza+AJ4xQi3Q1LB+ydwjdW+Z6A==
X-Google-Smtp-Source: AGHT+IG542qjkIzaVE8xRWKfhr0NeSn4LBVQAVy1WyjRkwzUk/byVaV1OlthOjTTCqyalikQeZcKoEFwgyPRk/YP4Yg=
X-Received: by 2002:a05:6512:1384:b0:539:f13c:e5ce with SMTP id
 2adb3069b0e04-53b3491ac10mr5514314e87.46.1730205012906; Tue, 29 Oct 2024
 05:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241027170119.2876289-1-martin.jansa@gmail.com>
 <CAOSpxdbdVd5e1HbQgK9cZpJBU-YP9JJRL=AUQ8M41XXiPrWEGA@mail.gmail.com>
 <18026806371753EE.19860@lists.openembedded.org> <CA+chaQfgHV99s7xJH7nwf4UrohB4M8kLWJ0kM-o92jK1K47cyw@mail.gmail.com>
 <1802A935C3F5B889.20159@lists.openembedded.org> <CAOSpxdbjEWRaQJg6+PaP2fNutr0DkMgf+RTqG3Uesuz0+k6JXw@mail.gmail.com>
In-Reply-To: <CAOSpxdbjEWRaQJg6+PaP2fNutr0DkMgf+RTqG3Uesuz0+k6JXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Oct 2024 13:30:00 +0100
Message-ID: <CA+chaQcTR_7V9=uwGNLpWgZzR3cmS-o7fL=zhrYQ1CnAQQyoMA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] xmlto: backport a patch to fix build
 with gcc-14 on host
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206497

On Tue, Oct 29, 2024 at 1:19=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Mon, Oct 28, 2024 at 9:00=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Sun, Oct 27, 2024 at 2:06=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> > >
> > > Not sure what else could be different on autobuilder, passed here wit=
h
> > > poky and poky-altcfg in ubuntu-22.04 as well:
> >
> > I can't reproduce locally either :-(
> >
> > The autobuilder isn't usable right now, but when it becomes available
> > I will try again there.
>
> I tried the patch again, and sadly there were many failures of
> xmlto-native and they occurred on multiple distros.
>
> For detaIls see:
>
> https://valkyrie.yoctoproject.org/#/builders/29/builds/355

:(.

OK, please drop it for now, I'll leave it in my branch and hope that
one day it will fail for me as well.

