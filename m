Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB02CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 20:39:49 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.4162.1759437579972653992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 13:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gd3ZW4rX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36a6a397477so15797191fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759437578; x=1760042378; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBvsCJ2gq27KAKCtSQz1W5uctsZCkEov2ICBPpbbGAQ=;
        b=Gd3ZW4rXp5Mz1znQu5bAza+QVVLNo7FX22nR3rS3yCUorYxrzNSn7d25fLnS9UTHA7
         /71SHB1JGSMkqE7mFeIpJldJaSn9QJc2dwRb6sHTHfgevLQj4L7Vxre+NhP/Re7ffsFz
         vAfaUX3ZC/PSw1af5o8kp2aip5J6MRcJEvLMHLkgofINAUHG8GfWuRAS1qGQ1JMi3xac
         0V2eCAwXWE3PLuYDaitNHDrVr9UQZcD8MKd3alzG9Lfm91N3FCRz9dcxi7EZIjMou62T
         pkXp5fAgwBlH/eEB366AkLpO0HkBh2M+4iQdrAMCgnq7lCVyvza5Z9cfhZE0AQDGgy2E
         TH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759437578; x=1760042378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBvsCJ2gq27KAKCtSQz1W5uctsZCkEov2ICBPpbbGAQ=;
        b=i52zhEqYo9zRzvsV2HrT7ogzG2RM3fpKzp7IXRFDFUT6Yj3780gobhea27bjDhCTi6
         PZPBZBMX5645zTsgmptY3UiI5llnMsctkomMngqezmDFvp0hLDOPzvpRWaOiIp3wnMlM
         rKcPi5txgKiqsgl6z6tQb3DSexkQ5snB39WzOp6JM6dFNFYlYpi8k0XA0UxjgyCr82pU
         nrkX5JCy52sLKVK+0qeg1ZVt9cCxG2kHUEy1N7aZ3d/BobZkpfcfOfskT2NfHZgzdsZe
         Y6nAqDcVADqLVmjeFnEULYueWLN3FVtFMHz3EfpwEEVuLQkppa11NA7P5UqjsOaR6oNT
         UVCg==
X-Gm-Message-State: AOJu0YzOcTr5TD7jTWuE8my7m4RjBeJLbYjuNjAxzIB8yDW2D7XIdla2
	mn4wfhcO4HezbVuXJ/gT5FhNFnqMNKY6UzL6Ie11/EWRXegsrlJGG+P/TBtRv9GhDmfj6FD6hyM
	337FCUUu5NqiNrOR9SUFjxXSmWdSXEO0=
X-Gm-Gg: ASbGncvpsr26td/jzY4xh+DYBtx1OQ+BmYHHxWMaCPrdlnAjBGoWLopfr4w9gfKOKrl
	CLIMEuz6IUolQ7hi0iQ2hDFOmSQwXp/If/ID2B71pz4/OhZjRAJPKJsMR9k8GHyE47XvrkqyNQu
	Ss6rgBmBIJiNGPVw7GEdjTkFdutWeFPFfhXqL2mF/MbZjl5L2CKN/BLxHffCIGlCQdrDvR5kgyB
	gXWoWhNi+HejtxSupaqD+gSgDVix8Wm70oh/dd6AK7xYeKGcn1HyMgUMSdXsw==
X-Google-Smtp-Source: AGHT+IG2xakaN/noA/b7TFhFYuQlJDaqsGZvepzY8a4duGctKZoN3OUM8GftiddOVZy1XSnLGvDZMurG25ekmVs45po=
X-Received: by 2002:a2e:be1d:0:b0:335:44d4:161b with SMTP id
 38308e7fff4ca-374c36680c9mr1396171fa.2.1759437577741; Thu, 02 Oct 2025
 13:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
 <186AC5F2410FD5FD.16131@lists.openembedded.org> <6c530b3d-83b0-45b1-856b-78bb29f370ef@gmail.com>
In-Reply-To: <6c530b3d-83b0-45b1-856b-78bb29f370ef@gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Thu, 2 Oct 2025 22:39:34 +0200
X-Gm-Features: AS18NWCVrl-rpDunbJbJPYxnce0nfytJtrJyqFOBto2ne2m4v3B1-hHmsrRqmJ8
Message-ID: <CAJo0Az40OEnqyuzU_G3uvyf_+bB=+TRd-tsoHDUoGs9xduJ78A@mail.gmail.com>
Subject: Re: [OE-core] How to have multiple rust cargo vendors
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 20:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224382

Ah that would be great. Actually I had seen the firefox recipes and
did notice something which looked like something what I would be
needing. So if you could send an RFC that would be awesome.

On Thu, Oct 2, 2025 at 10:33=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 10/2/25 22:17, Gyorgy Sarvari via lists.openembedded.org wrote:
> > You can add those in the SRC_URI, as regular git repos, with +=3D. Make
> > sure to set the "name" parameter to the crate name, and set the
> > "destsuffix" to ensure the sources won't mix. After do_configure step
> > one of the cargo/rust classes will go through the SRC_URI content, and
> > add these git-crates to the cargo config as local patches.
>
> Oh, now I see that this is a workspace - sorry for not looking closer
> before.
>
> At this time cargo_common doesn't support workspaces from git crates...
>
> I find it interesting on a personal level, because I just implemented
> workspace support like 2 weeks ago, but couldn't find any project using
> workspace crates from git beside Firefox, and didn't want to submit it
> only for that. (And since Firefox recipe switched away too)
>
> If I find my implementation again, will submit it tomorrow as an RFC.
>
> >
> > On 10/2/25 21:40, Tom Geelen via lists.openembedded.org wrote:
> >> I'm trying to create a recipe for uv (https://docs.astral.sh/uv/) to
> >> be added to meta-python.
> >> Problem I currently cannot seem to resolve is that I need multiple
> >> cargo vendor support.
> >>
> >> I have created the draft recipe and added the inc file with the crates
> >> using the update-crates command.
> >> However it missed several crates as they are not from crates.io but
> >> via git (see below).
> >>
> >> How would I add this to the recipe below?
> >>
> >> SUMMARY =3D "An extremely fast Python package and project manager,
> >> written in Rust."
> >> HOMEPAGE =3D "https://pypi.org/project/uv/"
> >> LICENSE =3D "Apache-2.0 & BSD-2-Clause & MIT"
> >> LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3D86d3f3a95c324c9479bd=
8986968f4327 \
> >>                     file://LICENSE-MIT;md5=3D45674e482567aa99fe883d327=
0b11184"
> >> RECIPE_MAINTAINER =3D "Tom Geelen <t.f.g.geelen@gmail.com>"
> >>
> >> SRC_URI[sha256sum] =3D
> >> "e6e1289c411d43e0ca245f46e76457f3807de646d90b656591b6cf46348bed5c"
> >>
> >> inherit pypi python_maturin cargo-update-recipe-crates
> >>
> >> require ${BPN}-crates.inc
> >>
> >> SRCREV =3D "d8efd77673c9a90792da9da31b6c0da7ea8a324b"
> >>
> >> PYPI_PACKAGE =3D "uv"
> >>
> >>
> >> [[package]]
> >> name =3D "version-ranges"
> >> version =3D "0.1.1"
> >> source =3D "git+https://github.com/astral-sh/pubgrub?rev=3Dd8efd77673c=
9a90792da9da31b6c0da7ea8a324b#d8efd77673c9a90792da9da31b6c0da7ea8a324b"
> >> dependencies =3D [
> >>  "smallvec",
> >> ]
> >>
> >> Regards,
> >>
> >> Tom
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#224380): https://lists.openembedded.org/g/openembed=
ded-core/message/224380
> > Mute This Topic: https://lists.openembedded.org/mt/115558933/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

