Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE775C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:46:07 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.91216.1700747159434163425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHcFzRxU;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35b1d57d7dbso2595445ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700747158; x=1701351958; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcwoLU8hnv88VLYZIVfLDPYKHqCxJN/M1dX47LpjbrA=;
        b=GHcFzRxUF2cY0O67sZ1+b/5Aj8rpGHRVUgDH0TyLXsE1Az/lusd7ypu7oF5jZiWWFL
         LIY00Pk1uH2+ZVT1bgcTP24GVX/fwtwSxhSRaknR++gZ4HYwwr70YpNATYPH2qGQPhE1
         KfrHx0mD9fzjUjVdjjTIEWLEwXqsSduQgGwImVOINsoZ6bbpQjajMQ//i+wYfgK1Ss0F
         P2+bd1+Eb35aDnNvKxOh7o8PgUB6FrUoJm4yMKpwiHOHOAinXG1wvYflE/Dbz9FTmSCB
         62aLxHDkYhzh+9mR0Lz1pgdoG+ha3c69hlqMMKaO5MIfYluKFxubJo9geIwyHGb41huA
         siLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700747158; x=1701351958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwoLU8hnv88VLYZIVfLDPYKHqCxJN/M1dX47LpjbrA=;
        b=no7ulfZcJmE4QbpTuhfInU2yPrc6a8qSTvuceurLlj4NRyoOErmBBByHBY4LRjDwnJ
         ShZIBEZSIt3u8Nk8+BccOKoZ/Q7IvB+az1XUQcbr71LYsC7MP9goJZl9re4zSbWnjHJK
         /F5Fl3DPiC6/a+WRns6W3DEof87FB5mit14Wy4+oAfNxq2+qsfRbCvYHtn8HsUz0X2es
         MPloMds8gfN2Ni9J7if+UZ9YNSP9TelU4AcO2cN/0ZM5izT2kMn+UFhM6Bo148ozuQEu
         qQO225/7N52Od+La/O6eXBexl75HXmCytJVsUKvs0Ri+UQHjSPyCN1IYNzFr4tAeA6KR
         Ypkw==
X-Gm-Message-State: AOJu0Yz60WV9OvBJxKt9FeceR9Uz95QpA7ZNP/qx+xfh98Kx8G+SC6Yt
	vCXulyHt1jYGgBYQ5T83EP/QvnzmAAefUArMl84=
X-Google-Smtp-Source: AGHT+IEb+ZKG7B5zTWJx+AbBsCAcRhP86+a/ROX9BjZU9hmz7lcACCUwJn2XjDqTjz7lnwj5SinYUtgiy0lkuQackl8=
X-Received: by 2002:a05:6e02:2146:b0:359:554:790f with SMTP id
 d6-20020a056e02214600b003590554790fmr6699835ilv.2.1700747158411; Thu, 23 Nov
 2023 05:45:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700620126.git.steve@sakoman.com> <8726ae02d760270f9e7fe7ef5715d8f7553371ce.1700620126.git.steve@sakoman.com>
 <375cd11f8849681f65762a53db3716f5753f3e60.camel@linuxfoundation.org>
In-Reply-To: <375cd11f8849681f65762a53db3716f5753f3e60.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Nov 2023 08:45:46 -0500
Message-ID: <CADkTA4OXFOpmukoMC_+Z4O7rEBHSH5g=g5hi=MUK3yBspAg+zg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 15/16] goarch: Move Go architecture mapping
 to a library
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191151

On Thu, Nov 23, 2023 at 7:40=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Other spaces uses the Go architecture definitions as their own (for
> > example, container arches are defined to be Go arches). To make it
> > easier for other places to use this mapping, move the code that does th=
e
> > translation of OpenEmbedded arches to Go arches to a library.
> >
> > (From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)
> >
> > This commit together with meta-virtualization commit
> > 115f6367f37095415f289fb6981cda9608ac72ff
> > broke meta-virtualization master used with
> > meta-lts-mixins kirkstone/go which is our primary
> > usecase for having kirkstone/go mixin layer
> >
> > Manually crafted since cherry-pick had too many conflicts:
> > * different path to classes
> > * additional architecture loongarch64
> > * different way how to import library
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Jose Quaresma <jose.quaresma@foundries.io>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/base.bbclass   |  2 +-
> >  meta/classes/goarch.bbclass | 27 +++------------------------
> >  meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
> >  3 files changed, 36 insertions(+), 25 deletions(-)
> >  create mode 100644 meta/lib/oe/go.py
>
> This did cause problems for some layers such as meta-virtualization so
> I'd want to check those layers are ok with this?
>

It should be fine, the issues were around it not being present and recipes
trying to use the mapping directly without the go.bbclass being inherited.

It won't be used in kirkstone, so is a no-op there (for meta-virt), but tha=
t
does mean some mixin and multi release compatible layers can more
easily to backports.

Bruce


> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191144): https://lists.openembedded.org/g/openembedde=
d-core/message/191144
> Mute This Topic: https://lists.openembedded.org/mt/102742416/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

