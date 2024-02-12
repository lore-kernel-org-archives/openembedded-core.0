Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB388C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 15:00:59 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8375.1707750050772631369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 07:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaSZX5g1;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5116b2dbd16so3262266e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707750049; x=1708354849; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnodz5X7igkJ2kRf8juyCYYxwA9QiLBmajpZRkW3G9U=;
        b=BaSZX5g1OLHSRd4f0Q97kBfdpdfzqRkavL+Hmu9DVsBqras8GeuFZIzBWbifKLHP7b
         f2eEZZXR+VRS4z4djHGWi5bi3PIqAWwVzG5msyYi6HTD0UTgG4UTI3tzqaZByQmHscwp
         mxVbGvs3v4xICjQ3gO0qGArnqk9xhjs2GBvVIGRvJQswKRtzABYEXTrIcvDFzFjFVXDb
         nN/e2xZmKn/pz8O3+B+xrYleN+IM90gxx5GEMC8AsE4tcgMCIGRlMJOzQDuQoeuCDTMi
         sNPKgXqLRrb1/hUekMIWfx/PqQzygezSAeUfTxp8RCL6wT/DpCb9F3BNZaNV36cZ9H+p
         QdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750049; x=1708354849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnodz5X7igkJ2kRf8juyCYYxwA9QiLBmajpZRkW3G9U=;
        b=VbampYbKGCbrScvi+aC1ENeJO+/mt6kE7SRPnmQITfAAcJST3r2lUhUCN7XMzNmS8o
         EATWNk6tMvmVauaEwHjUTQNWNkpuMlKWTUSxKxvmm0A9aj8f4lmoRbMXUVQR61kiotf2
         1fr43aq2Sqj2jF22+uDzb2BzVgUT2YLCD5WTXfeexcw9/8SwA5iVFNOa7AW1KtbdTUci
         qzmYc7b5Dl1ZYQ8gzqNDqlsgSYpeF2lf71CVcRwG10AOyd6+xpbsZYgHj1Iarc05DVjI
         Ce8XtUid/Y0eUxrpQJizQVHuu0yTsj9KBLTseLoaWcu4SCGWzHle70Q6DwsPdjoz9fW5
         LwKA==
X-Forwarded-Encrypted: i=1; AJvYcCWN5x/wskvCkUryN0PBj3RnanwFmMZMFWrBnoK3bFkRCpg6idb7PkFC+QmAHmuTNxs3eydacVkRV6w8M/92wNPGNa2KJADHqAn8nMyQWidQjijSKWBcQiz8
X-Gm-Message-State: AOJu0YznHtEIJ+4UKDnfgBJ2FF2u0Zs9FNP07UL84BNCcUcl5YC//vYt
	zEnu8JdSw18Dfci6co+WZiKe99MvQ/I6EZsjGT1rQAmdhXuspt4lfQM0YqNxvrxvGxqpz+Bxy0B
	fU+ZHW/cAY65YpXjlzrf112AtfBI=
X-Google-Smtp-Source: AGHT+IEwCNsr9laxHtL1cz5y8aV2k3pxxx48AGYiR3OwY8FSWtqarOMA90v2ExtboCOOfIIMPxM0kaBgZ3d7uKXVI9I=
X-Received: by 2002:ac2:5963:0:b0:511:6ca4:8020 with SMTP id
 h3-20020ac25963000000b005116ca48020mr2724698lfp.16.1707750048603; Mon, 12 Feb
 2024 07:00:48 -0800 (PST)
MIME-Version: 1.0
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
 <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com> <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca>
 <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com> <ac14ca2-ef63-6ee-d01b-c4ed4b65d78@crashcourse.ca>
In-Reply-To: <ac14ca2-ef63-6ee-d01b-c4ed4b65d78@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 12 Feb 2024 15:00:34 +0000
Message-ID: <CAO5Uq5TYipCFncPuQFBXOr4BtLUDnsXGNr5w5OsyWjxXMpEZsQ@mail.gmail.com>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 15:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195343

On Mon, Feb 12, 2024 at 2:46=E2=80=AFPM Robert P. J. Day <rpjday@crashcours=
e.ca> wrote:
>
> On Mon, 12 Feb 2024, Alex Kiernan wrote:
>
> > On Mon, Feb 12, 2024 at 12:17=E2=80=AFPM Robert P. J. Day <rpjday@crash=
course.ca> wrote:
> > >
> > > On Mon, 12 Feb 2024, Ross Burton wrote:
> > >
> > > > On 12 Feb 2024, at 06:39, Robert P. J. Day via lists.openembedded.o=
rg <rpjday=3Dcrashcourse.ca@lists.openembedded.org> wrote:
> > > > >  more annoying nitpickery ... here:
> > > > >
> > > > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-=
extended/xz/xz_5.4.5.bb#n28
> > > > >
> > > > > it's not clear why someone would go to the trouble of conditional=
ly
> > > > > including run-ptest in SRC_URI as i would have thought the only
> > > > > benefit would be to avoid the triviality of copying run-ptest int=
o
> > > > > WORKDIR, but beyond that, i don't see what the point is, and that=
's
> > > > > the only recipe i've run across that bothers to do that.
> > > > >
> > > > >  is there something more subtle happening here?
> > > >
> > > > No good reason, and I=E2=80=99d approve a patch that removed the
> > > > conditionals on the grounds of cleaning up the recipe and ensuring
> > > > that there=E2=80=99s less conditional paths through the recipe.
> > >
> > >   it gets even stranger when you have a conditional to apply a test
> > > patch, like here:
> > >
> > > https://git.openembedded.org/meta-openembedded/tree/meta-networking/r=
ecipes-protocols/freediameter/freediameter_1.4.0.bb#n21
> > >
> > >   i am also assuming that it's cleaner to conditionally check for
> > > ptest assignment for stuff like SRC_URI and DEPENDS, not with:
> > >
> > >   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest' ...
> > >
> > > but with the more intuitive:
> > >
> > >   ${@bb.utils.contains('PTEST_ENABLED', '1', ...
> > >
> >
> > The PTEST_ENABLED version has the advantage that disabling ptest for a
> > single recipe is much easier. I guess you could manipulate
> > DISTRO_FEATURES on a per-recipe basis, but that feels awful.
>
>   so you're confirming that the second form is equivalent, and more
> intuitive? i just wanted to make sure (again) that there was no
> subtlety i was overlooking.
>

PTEST_ENABLED is just set in ptest.bbclass:

PTEST_ENABLED =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0=
', d)}"
PTEST_ENABLED:class-native =3D ""
PTEST_ENABLED:class-nativesdk =3D ""
PTEST_ENABLED:class-cross-canadian =3D ""

I'd argue checking PTEST_ENABLED is the right way.

--=20
Alex Kiernan

