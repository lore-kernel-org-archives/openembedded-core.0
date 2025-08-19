Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E83ACA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:36:33 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.11808.1755603384215984361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jL4eyLZG;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-333f8f02afaso42415261fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755603382; x=1756208182; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyWUJ1hm11cjfHGeRoqOMlqIVXsGqjA6nYNPGJzBzHs=;
        b=jL4eyLZGxSA0sooK13kRKOOcx26yWNsZBDRKPLy5Hu2JuU1RTYtMoKb+hD01q7EaUp
         LYvDjBo62mPeMABTgIWIVFHlVnai7vF683c3RrVL+M2DfB3vJCBefWDlLFzn/58/ivX+
         pMKotCHvpXC+68ZJ7oqd+7fiKC7bXIkaXN1BjhHltdhnsIZUkeNYqlI+EftUv5T53+GV
         MFlYXe1Wsgeyi/hAcJsSeDnVFYC1+NgVTmwDGcx0rT2ODDH7ElKg6pvwOfYQJpsxxwsF
         Ceph5Sjf2ZDMTHE7YltK1X9/99pFRPbYQn1VMCfGOGd3r1XUeUyx/Xjn51Y5NAUYzy4w
         vxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603382; x=1756208182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyWUJ1hm11cjfHGeRoqOMlqIVXsGqjA6nYNPGJzBzHs=;
        b=URSIIZRC8rf2r866pNo63NQO3kepvsNfWEv5a9o3ES6FP/2q9do9U6YaMKZlL6K4tP
         j1OlQEtB5pQbGTiKNCN7Kk1P9kQOjv+7+ZRoevcRvOBFAye17HGB8PWgxgbfnJCKEN1F
         /zsDAJiVXMLzP/bbQcfurtE1VHHzKvK/pSiuNSbkqI3x4hPBqQAjc+dJpWeov4F07wAW
         7StmAS+V+GEr6QW5mwIK1s6jiWSa1CxvFLK+U7oCqfzZPT1TzVXybkIDFUlu+f6Jew15
         8qTpT/03gjc6lYAN+GiZK0GvXeCLXJnoVXOCpPQMctS71EHBejpQ1286JvixelDHAxTz
         Be7g==
X-Gm-Message-State: AOJu0Yy1KqrjPEqgUxfjhMM3tA++iHNFgJDJgmDDLvVx9pSweRqiqcCt
	QtnThTVU7Hd7oqjNBxUdVcmAvZ7efnwfuWQlt4Xvfat6ipIRfHxJqK6pvImYfgE/ATtjH9/qmAC
	NbXHprJYvMyYUsOs2OWOngAp6Gx9mdpY=
X-Gm-Gg: ASbGncvVTjlMxIT63EFgPtkpWDNcBKzJaVjEArfNnfIkueDlYj2+LZgYdTaz2PqfGQ4
	qLEdncMID1seCgy+5MSZkQJMayMtvn04Y8Xyhv1+EkzWFRQlxWLSj9kA6/YFF2VBwZDA/GgDT7j
	IMOHQDdCehY5zY8oAeKq6kKnfziUt8wEaDK+RDgOm9zO4/uU6A4dQKHVRCP/Gok7uhv6Emf7a3W
	bEE6IxWIqGaSKTLkhoA
X-Google-Smtp-Source: AGHT+IFwQZ1x+UkhSrA7+BE9VnXFROx+/ujJDLE3nGW6ZDaVMFUY6FFaztCuiO8D1wm5L0+wl8d5jRTIc8QReBPeed0=
X-Received: by 2002:a05:651c:2125:b0:330:d1e8:78c9 with SMTP id
 38308e7fff4ca-3353080a97emr5590721fa.37.1755603381874; Tue, 19 Aug 2025
 04:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
 <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de> <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
 <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de>
In-Reply-To: <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Aug 2025 13:36:08 +0200
X-Gm-Features: Ac12FXxEJdh3N0SpRDfQEep7IAWNWYTiEABX8nCTEQhl1Qv-bV9YrrKQHnXblJ4
Message-ID: <CA+chaQek-wO5DvPanFJpC+hCgMH2FLn_EeStsgvXDy8LBb4Acg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222103

On Tue, Aug 19, 2025 at 11:57=E2=80=AFAM Quentin Schulz
<quentin.schulz@cherry.de> wrote:
>
> Hi Martin,
>
> On 8/19/25 11:24 AM, Martin Jansa wrote:
> > On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
> > <quentin.schulz@cherry.de> wrote:
> >>
> >> Hi Martin,
> >>
> >> Do we actually support any distribution for Scarthgap that has gcc 15 =
in
> >> its package feed?
> >
> > I haven't built the whole world, but these changes allowed me to build
> > our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2 more
> > changes sent for walnascar).
> >
> > So even when it's not officially supported (or tested on AB), these
> > changes are safe enough, right?
>
> My opinion is if you want to build an old branch on an unsupported
> distro, you maintain a fork yourself. Otherwise use containers (kas,
> CROPS, ...) to build old branches on unsupported distros. Master of
> course is a different topic, and patches to support new
> GCC/glibc/musl/clang/cmake/whatever on yet-unsupported distros is *very
> much* welcome.

I use containers, this one with ubuntu-25.10, I can switch to older
ubuntu if needed, but it's useful to catch issues early (by someone
who can also provided patches where needed, instead of random people
reporting that LTS versions don't work on their new system).

All of these changes are backports from master where it was already
fixed by Khem or me before (with the exception of cairo where I've
backported just 2 fixes from upstream instead of whole minor upgrade
as the rest of the upgrade isn't needed for LTS).

> I'm not sure we need to add on maintainer load by patching Yocto for
> unsupported distros. But that's a call the maintainer(s) and or TSC to ma=
ke.

Agreed, Steve already queued the patches in scarthgap-nut, similar
fixes were already merged in meta-clang and meta-tensorflow, so
hopefully these small changes to keep the LTS buildable on newer OS
versions don't add too much trouble for them.

I am not asking anyone to regularly validate that older LTS work on
newer OS then what was originally tested, but if small already tested
fix is identified, sent and doesn't break anything on older supported
OSes, then is it too much to ask for it being applied?

Cheers,

