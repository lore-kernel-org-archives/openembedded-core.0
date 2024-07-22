Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6A7C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 21:23:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.29792.1721683399522657286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 14:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rm/ZH41v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4279c924ca7so34761915e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721683398; x=1722288198; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZDBAs+7FYkxeTXv7S6uefkO/aH8nSiqvyEgLZBaQLsE=;
        b=Rm/ZH41v2zA7ylu6dY2vhF7QvXh4d+M06qUMn5fkHjt81LSAF0C5lk8N1aOLI/cGvc
         tPmB0uv0JGLzInULh5LFS8lte8BQJa/ef/RXZi6ZXXjUqVvw2Iuv7JCkLW/Kv45x5DCO
         veZdHRRnW9pZRelo8e2F1jptIEhd+VusIPhds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721683398; x=1722288198;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDBAs+7FYkxeTXv7S6uefkO/aH8nSiqvyEgLZBaQLsE=;
        b=H8C135l4rq0M1XTZZ7X5WS/llwMIiP7x5ghe74pVXyw0CKZEZrdCPIJiOTXTl+4ggj
         7sH+bfIQa/X9uHAoHO8gMXD2hguOB1wXb6V6bizhTasNHOWaksRnpoF5kBLQVCLGG8g+
         wjdUC1zljWpghVdgpD90DYPN8FmoYQoG4MMxAQW7tftfYpxrCz88e47nbMVKEplrFdRH
         UyHVMgI3lDrH9TsPW8AzHrkMDulCqIOmF0uZyNSuv5pfB4NOMvkKp8AH2LNU5HnfmnLZ
         qDIdGoP+hF8B12E3O3t6gWQJG51VbyoVRsFOrPXTSrGceBajZWpxaikwNMSXW+fMf1Z9
         +zxg==
X-Gm-Message-State: AOJu0YwaP8T7bvzbBPag/zfw3yIumWtA5R6rbqIvbPjnEFsPmqcN1MVJ
	6782fwe5TU4WE9VQ6//m2D2RQad3Vh/9OfNTMHE8KP0kTpBT18SWXlRh85khgn4=
X-Google-Smtp-Source: AGHT+IHVsf/i8tluO7U3Txby5ac+oNcK/9vdDrH5IILHUd7LCkmVyvyRwTuu/EEP7X8Dn37o86uafg==
X-Received: by 2002:a05:600c:468e:b0:426:6ead:5709 with SMTP id 5b1f17b1804b1-427dc520518mr52826055e9.9.1721683397748;
        Mon, 22 Jul 2024 14:23:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2981:be39:a4a4:14a2? ([2001:8b0:aba:5f3c:2981:be39:a4a4:14a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ec8ccsm9506452f8f.97.2024.07.22.14.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:23:17 -0700 (PDT)
Message-ID: <d2f84b88c3f12c1844c3c0fbefe4973dc27d06f5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2024 22:23:16 +0100
In-Reply-To: <20240722211816.GS17572@denix.org>
References: <20240722053459.2462155-1-denis@denix.org>
	 <d938bbd2df1a8138bd8e181e945cd0911f22d03e.camel@linuxfoundation.org>
	 <20240722211816.GS17572@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 21:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202326

On Mon, 2024-07-22 at 17:18 -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 22, 2024 at 09:51:51PM +0100, Richard Purdie wrote:
> > On Mon, 2024-07-22 at 01:34 -0400, Denys Dmytriyenko via
> > lists.openembedded.org wrote:
> > > From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> > >=20
> > > Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to
> > > gcc-cross-canadian.
> > > This will improve (but not fix) reproducibility of gcc-cross-
> > > canadian.
> > > Also move this code to functions to avoid code duplication.
> > >=20
> > > Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > ---
> > > v3 - add common functions to gcc-common.inc instead of gcc-
> > > configure-common.h
> > >=20
> > > =C2=A0meta/recipes-devtools/gcc/gcc-common.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 19
> > > +++++++++++++++++++
> > > =C2=A0.../gcc/gcc-configure-common.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > > =C2=A0.../gcc/gcc-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> > > =C2=A0meta/recipes-devtools/gcc/gcc-cross.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 15 ++-----------
> > > --
> > > =C2=A0meta/recipes-devtools/gcc/gcc-target.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++-----------
> > > ---
> > > =C2=A05 files changed, 26 insertions(+), 28 deletions(-)
> >=20
> > I ran a test build with this series and there is still a
> > reproducibility issue:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5097
> >=20
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240722-tr5=
vb5sa/packages/
> >=20
> > the key difference appearing to start in gcc-src.
>=20
> Thanks. What's the simplest way to reproduce it locally?

Build the affected recipes in two different build paths and compare the
packages in question.

You could narrow down the selftest to that recipe and then "oe-selftest
-r reproducible.ReproducibleTests.test_reproducible_builds" too.=20

Change targets in meta/lib/oeqa/selftest/cases/reproducible.py to be
the recipe in question rather than the default of:
'core-image-minimal', 'core-image-sato', 'core-image-full-cmdline',
'core-image-weston', 'world', 'virtual/librpc', 'virtual/libsdl2',
'virtual/crypt' to narrow it down and make it faster.

You can likely use most things from sstate too rather than rebuilding
most of one of the builds.

Cheers,

Richard

