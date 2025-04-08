Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7D9C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:33:29 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.70867.1744104803437758813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFO2JIpE;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30effbfaf61so57156461fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104801; x=1744709601; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3TJpyZu2eUc6cyodN8MpdYtHVd9BCAG3nqsjFgeoJo=;
        b=OFO2JIpERmiHz71q4AzpsHHhlDRN863nPCRmueFVE698OWrnbzgjU/zDhBFwHgNchO
         osqQ3QHmqgs7p3LJ4sa24QbZEmfeTi9TIxzEJvSqUEGhc6Ulg9a7hGmrvxnK1oWdjAZt
         r0OZ55TF2D1uW72oxc0cjTOhZuoU00R3qO4sm3+str/K7910sRTT1zqDTzxKBRVdnjnd
         IXEx731sZBrX5wN9mOngMQ3M6IekYA5096/Akcq6aAC/goGhCshQ76ZRYoGNwvw+N/M2
         3/8EiNRWuK8l7rqjCgz9rYP+LSbDltagkJpky8FvCdewJtcwDlf7MdOx5ButL2Iw1LOV
         tQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104801; x=1744709601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3TJpyZu2eUc6cyodN8MpdYtHVd9BCAG3nqsjFgeoJo=;
        b=X17woalYXLOCCJHPoo4x6IATkjy/FmxY573beCzLmulfqzzVBU+ec+csWyK5RcuJ16
         /ekHqWpYhr2XLIAKjQJeKMxf0q4NuCYNhwp+TjPhqNUz4CL+mnvvAWGYLid6iXW51ZgH
         hwRaiCChbkTA4ySCQfZqBwfy4OfpE0o3QG3FvUAiiOOMBdPnfOEKMQNI1PqrfPlNu9Ix
         zZQypBDdGAd8O2k4dZspTgujjqupa8Z0VJvfTmnj3X4xbfhaRy8/UXVIMy5VyTemTERh
         /3amamG2Tpa8ojMzHdcpJuSmnpRZu7CkwyonY74tf3wBrAv8qTVaMlk+80BZ+y6zljrf
         2olQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUzVK1gH1cH/J9Lb21KHKarfhtWEHOoAoNqgUyhZ//z6vSiUoRraZJesjBxFC59h/Kyi3TDs2Xj1GN+oAhVnreLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxwco77NM9K98qWxUYE966PUMNuoUyZm+BgNXy+02ZlodpYhNUX
	T58ILFEZednGcTeZO8pBsUOG94lWh3yan1nZ03w3oxUSpKIbQqwzP4EXkHoVumCmhhFEg0exQxY
	wJFEsjDk7pq7dPSsxQPmqEAY6yvo=
X-Gm-Gg: ASbGncsXrvpXpPDSik+iCHGcuRWqV8fBg2YorQTlm+IUBNR38BREppBJcyRQoXtoB8x
	He0KBWRyJkva6FjybhmGTnTdJjwb/VST+1odAXGm4mb3BombV23X1g4XcUpAi66nhqynH/Kwc8C
	hk1ecrAIYqpeRSsebWgU8NQhoTVA6eHWy1Z2yHWwWecVM0qSh01+1OZ9A=
X-Google-Smtp-Source: AGHT+IHlJd55vsaEbGEQr6gd7RK8DW4ZNzMgGF8Akv+tJ12dz1v6Hb+O71uvbNBz1hq0UXDoVXWOIEaPDhSEuzp/Nog=
X-Received: by 2002:a05:651c:3133:b0:309:20da:6188 with SMTP id
 38308e7fff4ca-30f35e6f2c1mr9243321fa.6.1744104801248; Tue, 08 Apr 2025
 02:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com> <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
 <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
 <cdcd72e3c0d2490030eb1b00bef5a11b49ebbfcb.camel@linuxfoundation.org>
 <e5fe985a-9022-00d6-cd92-dd64061fa6d6@konsulko.com> <352101e120074ee9e08455be1c162f2bc36c4ce7.camel@linuxfoundation.org>
 <38637d0589962b50af4bc0f472d7c8e3a5d68e22.camel@gmail.com>
In-Reply-To: <38637d0589962b50af4bc0f472d7c8e3a5d68e22.camel@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 8 Apr 2025 10:33:10 +0100
X-Gm-Features: ATxdqUGlLbT26onkKAWZL61eflqr-hux5pclEL4-DryGY3ykwz7KSiOevYM818k
Message-ID: <CAO5Uq5TO3du4y0R=evYGEuqUpcz64+DVGL7N6GDj2=QwLCVa6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all
 PACKAGECONFIG options, clean up legacy
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>, 
	richard.purdie@linuxfoundation.org, Scott Murray <scott.murray@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214517

On Mon, Apr 7, 2025 at 5:44=E2=80=AFPM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> On Thu, 2025-04-03 at 17:52 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2025-04-03 at 12:46 -0400, Scott Murray wrote:
> > > On Thu, 3 Apr 2025, Richard Purdie wrote:
> > >
> > > > On Thu, 2025-04-03 at 07:42 +0100, Alex Kiernan wrote:
> > > > > On Wed, Apr 2, 2025 at 8:33=E2=80=AFPM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via
> > > > > > lists.openembedded.org wrote:
> > > > > > > connman has a legacy style, this patch set adds in all the
> > > > > > > PACKAGECONFIG
> > > > > > > options which the upstream pacakge supports, removes
> > > > > > > patches which are no
> > > > > > > longer required, explicitly supports operation alongside
> > > > > > > systemd-resolved and
> > > > > > > reworks the packaging so that PACKAGECONFIG and explicit
> > > > > > > package selection for
> > > > > > > every VPN is no longer required.
> > > > > > >
> > > > > > > Everything up to the final patch should be backward
> > > > > > > compatible cleanup of the
> > > > > > > existing recipe, with only the final patch reworking the
> > > > > > > packaging.
> > > > > > >
> > > > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > > > ---
> > > > > > > Alex Kiernan (5):
> > > > > > >       connman: Merge .inc into .bb
> > > > > > >       connman: Delete patches for gold and MIPS binutils
> > > > > > > fix
> > > > > > >       connman: Move ppp from DEPENDS to PACKAGECONFIG
> > > > > > >       connman: Add all build options as PACKAGECONFIG
> > > > > > >       connman: Rework to avoid splitting into many single
> > > > > > > binary packages
> > > > > > >
> > > > > > >  meta/recipes-connectivity/connman/connman.inc      | 221 -
> > > > > > > --------------------
> > > > > > >  ...vice-stop-systemd-resolved-when-we-use-co.patch |  26 -
> > > > > > > --
> > > > > > >  ...ange-visibility-to-default-for-debug-symb.patch |  31 -
> > > > > > > --
> > > > > > >  .../connman/connman/no-version-scripts.patch       |  47 -
> > > > > > > ----
> > > > > > >  meta/recipes-connectivity/connman/connman_1.44.bb  | 154
> > > > > > > +++++++++++++-
> > > > > > >  5 files changed, 147 insertions(+), 332 deletions(-)
> > > > > >
> > > > > > This failed in testing on the first try. I've added:
> > > > > >
> > > > > > diff --git a/meta/recipes-core/images/build-appliance-
> > > > > > image_15.0.0.bb b/meta/recipes-core/images/build-appliance-
> > > > > > image_15.0.0.bb
> > > > > > index 03f02d14ae8..c5ddea79005 100644
> > > > > > --- a/meta/recipes-core/images/build-appliance-
> > > > > > image_15.0.0.bb
> > > > > > +++ b/meta/recipes-core/images/build-appliance-
> > > > > > image_15.0.0.bb
> > > > > > @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> > > > > >  LIC_FILES_CHKSUM =3D
> > > > > > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384
> > > > > > 361b4de20420"
> > > > > >
> > > > > >  IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-
> > > > > > ssh-openssh packagegroup-self-hosted \
> > > > > > -                 kernel-dev kernel-devsrc connman connman-
> > > > > > plugin-ethernet dhcpcd \
> > > > > > +                 kernel-dev kernel-devsrc connman dhcpcd \
> > > > > >                   tzdata python3-pip perl-misc"
> > > > > >
> > > > > >  IMAGE_FEATURES +=3D "x11-base package-management splash"
> > > > >
> > > > > Is keeping all those RPROVIDES (plus doubtless more at this
> > > > > point)
> > > > > actually useful? I can see it in the traditional distribution
> > > > > world,
> > > > > but for OE-Core it feels mostly redundant to me.
> > > >
> > > > Short term, it will help fix people's builds and give some level
> > > > of
> > > > runtime compatibility. Long term, it would be deadweight we
> > > > carry. I'm
> > > > therefore torn.
> > > >
> > > > I did note that meta-agl ran into a similar issue:
> > > >
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/=
1250
> > > >
> > > > With the above tweak and the tweaked nftables, the rest of the
> > > > build
> > > > was ok through.
> > >
> > > If you're leaning towards taking it, we can adapt in AGL, though I
> > > can't
> > > guarantee there won't be a brief instance of AB breakage before I
> > > push
> > > a change.  Overall, I'm a bit ambivalent about removing the split
> > > out
> > > packages.  I understand the desire for simplifying it, but I also
> > > see
> > > some benefits to still mirroring what most other distributions do
> > > with
> > > networkmanager packaging since there still seems to be some
> > > interest in
> > > attempting to do binary packagefeeds...
> >
> > To be honest, I'm torn, I could be persuaded either way.
> >
> > I copied more people to collect viewpoionts as well as make them
> > aware
> > of the potential breakage.
> >
> > Cheers,
> >
> > Richard
>
> I don't use conman, so my opinion is not really relevant here.
>
> But I think that PACKAGECONFIGS are of course the big advantage of
> Yocto compared to binary distributions. But one should also not forget
> why binary distributions are very successful in many areas: You can
> address many different use cases with one distribution without having
> to recompile different packages just to put together slightly different
> firmware variants. With systemd or NetworkManager, for example, we have
> the option of using PACAKGECONFGS as well as splitting it up into small
> packages. This is very useful, at least for us, which is why I think
> removing package splitting would also be a disadvantage for connman.
>

For this case, you literally have to add the PACKAGECONFIG and then
pull the resulting package into the image, the defaults are such that
you end up with a minimal package and no plugins.

But my sense here is that the consensus is to keep the splitting.

--=20
Alex Kiernan

