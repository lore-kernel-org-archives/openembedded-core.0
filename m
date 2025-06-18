Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1577AC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:20:45 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.2255.1750234834806565677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 01:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWlVqFin;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6facba680a1so79351416d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750234834; x=1750839634; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wki4tSAKIaU1ARn/G7ZQhwiBqv88ZiGZMxQde5PCSLs=;
        b=MWlVqFinYa5P3cbm647j5fNt+g1zEa4W5SohE1EtxKsFWw6fVGRdYyYmMrB3v0Pxgw
         qsqe3K2967JZiV8AArqbhPcm2WhzYK88Sr02tCDmifuvTVXpfTbjCRIbGDAo+Zmtamgk
         vyuG9CICktKOifKGLqm4bwABzkPjA3k9xINyV2cvtOHED3htyYc7YRgJ3e6+Qe6sH8b5
         APqgmXHhbJwjl4uFALhuMhsidmMfIR6NtElAYWZARNENGYZ+ZLSmoyJ4INGlY2WOMtXM
         uDGhSfev04yXLau79u7ufCGABAEpqwDo6etopWgQRvBDSOt2fTmqlmm9Z4zP9g1id0B2
         CyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234834; x=1750839634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wki4tSAKIaU1ARn/G7ZQhwiBqv88ZiGZMxQde5PCSLs=;
        b=rswaEch9qZqaqDrYYhtWe9OSDigKGUqVqT45Qx2fhj1qH/Zv1x3pGk3hLAaGOZc8/B
         JZdMARFaOc66kO2RXXR3yILF+WmxOWdxtuOo71xJKoUHA9CTigIvhIHJxmitLPLYpNud
         21nef7bKYU7MvC47owj2/w4qSbUyTf5k3vHAUE9EGyhqALt5GJX3A9DP+68Kh+jO3O0F
         fiMpZqW/KbpFN/uOgc16Qd5aATNAQQf+Ou6RtBOfh7AeU2RIkI3XyxPcEToEXJEIB/KK
         rrmatL/QVcXaOh/uD0mp77TxEiVeCr8FsAXqegNVc8NKjcjn2vHtXFAtVVky++oqzKcN
         ynZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVC/0mQa879+sUQIvIJDNIMzf3NBz6X8xbmGwcwIQNVrMMGQfF/IQCJoCSqTD+ofYCO6Z1PVsvD0SrEEDycmKi0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyL+BvqWFWJrX8i1xJ7mqcGwZC/DQmX3WUbiwEP/ZmTWW2lEv9c
	MB1ja+ZTksK/RLJ3tMM5M6Q+AisrHfGAuFFQI1NVj0vh7+czMK/GxV1YG47nbhKwMQ+sgw65hmB
	BtGsun5gDaH6GEYRXjLhpaVZ/rTiunbA=
X-Gm-Gg: ASbGncuLlNWffdvlLz+AqYvUVYF3mFlCo+GgGqqwxp5cwckFsSz4c48eVoyAhfLHZ5Z
	ArBI6HzFhyNyFZUQe5NylHXWP7+kHi0F0kE2gu6PHGBqJ47c8gMt/AGUWe4lNUeSfdL9iMtAoR6
	Z1rO9pJ8DP0rJQWVBGvIoUMLAxWlMFSqYGyqyrbJu86eT/5x8dfEZbaOpnsfPHV27GjLTbJyzN1
	5HCXRbsLKIIzrlz
X-Google-Smtp-Source: AGHT+IGRNlKYSjtU9wFeIEOfaXOQuRtHDK9luwKIJzoyHmN3OTf4D9IzRS1D2enPTgqrZA9B7ZrIgHxjUA3DAFhagY4=
X-Received: by 2002:a05:6214:1314:b0:6fa:fe02:8219 with SMTP id
 6a1803df08f44-6fb47627bd2mr311223976d6.7.1750234833772; Wed, 18 Jun 2025
 01:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750176125.git.steve@sakoman.com> <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
 <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com> <582ab22a-f015-4611-b1d5-3c2c624585a1@windriver.com>
 <9470af8d-87e5-40bc-a79d-cddbf58c92ca@gmail.com> <af5e4d92-5144-4c26-ac56-423c2fa5286f@windriver.com>
 <47bc64c5-3a95-439a-952a-601114f15f86@gmail.com> <CA+chaQfFjHJxEoCiU0NaqqwWYSFAwckm6sKrsGbWFy_E4u8fUA@mail.gmail.com>
In-Reply-To: <CA+chaQfFjHJxEoCiU0NaqqwWYSFAwckm6sKrsGbWFy_E4u8fUA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Jun 2025 10:20:21 +0200
X-Gm-Features: Ac12FXxE1yEbkejNFxyuVNdMF9tOIc905xaMbsCoP9-sKIQ5zZvO1JYeTOUxhe0
Message-ID: <CANNYZj-UODqwNz6EuKmVF+p4=bCFs7e6oM3Mu7LjAYLStTYd+Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to systemd_255.21
To: martin.jansa@gmail.com
Cc: skandigraun@gmail.com, ChenQi <Qi.Chen@windriver.com>, steve@sakoman.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 08:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218981

This is a possible scenario, but it is theoretical and not likely at
this point. And if someone is affected by this, then they can find a
way to force a downgrade with the package manager, or maintain the
bogus version with a bbappend, or issue a whole-image update.

I'd rather not force a PE bump on everybody, including the master
oe-core branch.

Alex

On Wed, 18 Jun 2025 at 09:53, Martin Jansa via lists.openembedded.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> It's not tagged, but it was merged to scarthgap branch 13 days ago as:
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D29e623b2ad00555788412fa520fbb9ffec794cbb
>
> We don't depend on package-manager upgrades, so version going
> backwards is not the real blocker for us, but PE bump in all active
> branches seems better fix than people not getting the next systemd
> upgrade (e.g. next systemd minor upgrade with security fixes) in
> projects which use package-manager on target and happened to build the
> package feed with this commit included (e.g. we don't wait for tagged
> "releases" from stable branches).
>
> Regards,
>
> On Wed, Jun 18, 2025 at 9:42=E2=80=AFAM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On 6/18/25 09:36, ChenQi wrote:
> > > On 6/18/25 15:29, Gyorgy Sarvari wrote:
> > >> On 6/18/25 09:24, ChenQi wrote:
> > >>> The author's V1 patch bumped PE.
> > >>> I replied to that patch, asking the author to not bump PE.
> > >>> My reason is that we'll need to bump PE in later releases too
> > >>> (walnascar, master) if we bump PE in scarthgap.
> > >> My main question would be if bumping PE is worse than breaking this
> > >> recipe in this release. Maybe it is - I just didn't see much discuss=
ions
> > >> over this.
> > > Luckily, the commit that introduced this issue was not released yet.
> > >
> > > poky [2][0] $ git describe --contains 417cecf76b
> > > fatal: cannot describe '417cecf76b91f58a61e8cc9e4bc57ddda87aac58'
> > >
> > > poky [2][0] $ git log --oneline scarthgap-5.0.10..417cecf76b | wc -l
> > > 31
> >
> > Oh... indeed. I thought that this was tagged already long ago. Thanks
> > for this, this does answer my concerns.
> >
> > > Regards,
> > > Qi
> > >
> > >>> Regards,
> > >>> Qi
> > >>>
> > >>> On 6/18/25 15:08, Gyorgy Sarvari via lists.openembedded.org wrote:
> > >>>> On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
> > >>>>> From: Savvas Etairidis <setairidis@gmail.com>
> > >>>>>
> > >>>>> The recipe was accidentally renamed with a 'v'
> > >>>>> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
> > >>>>>
> > >>>>> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> > >>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > >>>>> ---
> > >>>>>    .../systemd/{systemd_v255.21.bb =3D> systemd_255.21.bb}       =
      | 0
> > >>>>>    1 file changed, 0 insertions(+), 0 deletions(-)
> > >>>>>    rename meta/recipes-core/systemd/{systemd_v255.21.bb =3D> syst=
emd_255.21.bb} (100%)
> > >>>>>
> > >>>> Personally I'm not affected by this issue, and have no problem wit=
h this
> > >>>> patch, but a few weeks ago there were people who were unhappy when=
 a
> > >>>> similar issue popped up in Walnascar with autoconf (though it was =
caught
> > >>>> before merging), which makes me wonder if this is the way to go.
> > >>>>
> > >>>> Systemd already has a PE[1], exactly because of the same situation=
: "v"
> > >>>> was removed from the start of ${PV} - maybe it's time to bump.
> > >>>>
> > >>>> Anyway, as this patch does no harm to me, this is not a complaint
> > >>>> against it, but I thought it would be worth to mention it at least=
.
> > >>>>
> > >>>> [1]:
> > >>>> https://git.yoctoproject.org/poky/commit/?id=3Df95bbe35b2aab929e50=
471db8ba50781d5027a01
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218977): https://lists.openembedded.org/g/openembedde=
d-core/message/218977
> Mute This Topic: https://lists.openembedded.org/mt/113692551/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

