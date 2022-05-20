Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B170C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 16:35:25 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.1073.1653064515402382468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 09:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q8HqxDjQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id m13so1299922qtx.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UlqvYhLrihwFNHdgJUQhA2U61sIiSLfGJqmUIrMogeM=;
        b=Q8HqxDjQFKdDIH9mH8itCpoHYW+DuuXsOBtpwxP7vKLHruVErkY00hR/wWyhXca6Hd
         ZRZVxQuyCXekle0p9eqbZepkoIJL3HRRLbdkbCF1hHAesoZd47kQt0iqjkP/ovSzzt3e
         wOFsArJLvnR82gPHpzn3T2iUPJ2oQKXjQUm9SRcf/a1lRBcl9oCO9C1UbPLifNDq+NLS
         03MmClfcLG0FPGm/9RRcGSFFdRWGtkAumgoOVtJYppRjINWUk/VVxjPduHhe4WdnkHf0
         8I43jOl5lWfe8qJ76VhSKeU2+a8HqH+PMdpCHYI5SrDDcJYRR00H65EN5h4liKdxLOpl
         YU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UlqvYhLrihwFNHdgJUQhA2U61sIiSLfGJqmUIrMogeM=;
        b=GFh9rbeZbaCgP+YzGr1Gl85yVkKFiIYe6UXztCXyFLO2SLryDerUBUDEWY66roaJXS
         IaOT8LgwzNUB5EkVokvLfp0MiS/iaBuqHjTC979RTqTgyBSWDK9CPTHYKwYuw9RrfIJ9
         LukJKgOEHUcfroJ/bdCONQ6QKNnDkrWajL2Q75/RIOWBcTHf0LEJmFux05MznbCnUYCZ
         MeUm7TvkwbBlk7cC+tJjJoPNeXgRIMyymHH2MSg4GbUlC7Zosb+6ZXUKLAwUqhxXGAGv
         RUPH6vbWNxZeDZjcK/yVXwYnoeD/9MEtn8RXMClML1RHblQMyLZ2rRVGqVI3kd3GvfFv
         esPA==
X-Gm-Message-State: AOAM531ZgieAmdKoiGswnGZhpvdHmyeUc/dDd2ajfeFA5PKqsw0VIRDY
	yu7vL1gEgdgqQxMN9ZocNaa+WMO4U29NOD7oHq4=
X-Google-Smtp-Source: 
 ABdhPJwSdBTIy3+BqU5l2JzFORnGfWihDq/D2sjHIrXdU8m1PhLchhJkzNYBpPDXN60jFgs2/0odH1+GQ7RKA0sNQbM=
X-Received: by 2002:ac8:574d:0:b0:2f3:b4aa:700f with SMTP id
 13-20020ac8574d000000b002f3b4aa700fmr8324675qtx.54.1653064514299; Fri, 20 May
 2022 09:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220516224921.37639-1-raj.khem@gmail.com>
 <CAOSpxdaCj5mEPSRzauErNiQ_VP0RmVgiLVscuO4hnM4zG=8FXg@mail.gmail.com>
 <CAMKF1sqR9QOniH9vpneH=Raadp6CDEirxAs5zSUNGG6J7+WGGQ@mail.gmail.com>
 <CAOSpxdbD7JDuPBChB12pJTNLgx4OOGVsngGoLfr0G8Li6e9GMA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbD7JDuPBChB12pJTNLgx4OOGVsngGoLfr0G8Li6e9GMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2022 09:34:48 -0700
Message-ID: 
 <CAMKF1srWBiRshPH5m5K+SFFiOJ3peHPYrKM+28+NuOu45KvrBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl-locales: Switch SRC_URI to new location
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 16:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165946

On Fri, May 20, 2022 at 9:21 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Fri, May 20, 2022 at 5:39 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, May 20, 2022 at 7:50 AM Steve Sakoman <steve@sakoman.com> wrote=
:
> > >
> > > On Mon, May 16, 2022 at 12:49 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Original repository has been less maintained and thusly adelie linu=
x
> > > > community has picked up the package and started to maintain it also
> > > > applied long standing bug fixes.
> > > >
> > > > Now we use new fork by Ad=C3=A9lie Linux, which includes more suppo=
rted
> > > > locales.
> > >
> > > Is this suitable/safe for kirkstone?
> >
> > yes it is.
>
> Doh!  I should have checked before asking.  This recipe was added post
> kirkstone!
>

Yeah and I have fish like memory too. :)

> Steve
>
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/musl/musl-locales_git.bb | 21 +++++++++++++++---=
---
> > > >  1 file changed, 15 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/reci=
pes-core/musl/musl-locales_git.bb
> > > > index 40b20e250d2..92532237e03 100644
> > > > --- a/meta/recipes-core/musl/musl-locales_git.bb
> > > > +++ b/meta/recipes-core/musl/musl-locales_git.bb
> > > > @@ -2,15 +2,15 @@
> > > >  # Released under the MIT license (see COPYING.MIT for the terms)
> > > >  #
> > > >  SUMMARY =3D "Locales support for musl"
> > > > -HOMEPAGE =3D "https://gitlab.com/rilian-la-te/musl-locales"
> > > > +HOMEPAGE =3D "https://git.adelielinux.org/adelie/musl-locales/-/wi=
kis/home"
> > > >  LICENSE =3D "MIT & LGPL-3.0-or-later"
> > > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf5713fba707073020b1db2=
acaa73e78 \
> > > >                      file://LICENSE.MIT;md5=3Da4f1c6864a83ddf4b754c=
dab7d593523"
> > > >
> > > > -SRC_URI =3D "git://gitlab.com/rilian-la-te/musl-locales;protocol=
=3Dhttps;branch=3Dmaster"
> > > > +SRC_URI =3D "git://git.adelielinux.org/adelie/musl-locales;protoco=
l=3Dhttps;branch=3Dmain"
> > > >
> > > >  PV =3D "1.0+git${SRCPV}"
> > > > -SRCREV =3D "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
> > > > +SRCREV =3D "cac3dcdccd1d0c08d17f4919d862737d64b76f79"
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > > @@ -28,46 +28,55 @@ python () {
> > > >
> > > >  # only locale binaries are under GPL-3.0-or-later others are MIT
> > > >  LICENSE:${PN} =3D "LGPL-3.0-or-later"
> > > > -LICENSE:locale-base-ch-de =3D "MIT"
> > > > +LICENSE:locale-base-cs-cz =3D "MIT"
> > > >  LICENSE:locale-base-de-ch =3D "MIT"
> > > >  LICENSE:locale-base-de-de =3D "MIT"
> > > >  LICENSE:locale-base-en-gb =3D "MIT"
> > > >  LICENSE:locale-base-en-us =3D "MIT"
> > > >  LICENSE:locale-base-es-es =3D "MIT"
> > > > +LICENSE:locale-base-fi-fi =3D "MIT"
> > > >  LICENSE:locale-base-fr-fr =3D "MIT"
> > > >  LICENSE:locale-base-it-it =3D "MIT"
> > > >  LICENSE:locale-base-nb-no =3D "MIT"
> > > >  LICENSE:locale-base-nl-nl =3D "MIT"
> > > >  LICENSE:locale-base-pt-br =3D "MIT"
> > > > +LICENSE:locale-base-pt-pt =3D "MIT"
> > > >  LICENSE:locale-base-ru-ru =3D "MIT"
> > > > +LICENSE:locale-base-sr-rs =3D "MIT"
> > > >  LICENSE:locale-base-sv-se =3D "MIT"
> > > >
> > > > -PACKAGES =3D+ "locale-base-ch-de \
> > > > +PACKAGES =3D+ "locale-base-cs-cz \
> > > >               locale-base-de-ch \
> > > >               locale-base-de-de \
> > > >               locale-base-en-gb \
> > > >               locale-base-en-us \
> > > >               locale-base-es-es \
> > > > +             locale-base-fi-fi \
> > > >               locale-base-fr-fr \
> > > >               locale-base-it-it \
> > > >               locale-base-nb-no \
> > > >               locale-base-nl-nl \
> > > >               locale-base-pt-br \
> > > > +             locale-base-pt-pt \
> > > >               locale-base-ru-ru \
> > > > +             locale-base-sr-rs \
> > > >               locale-base-sv-se \
> > > >               "
> > > > -FILES:locale-base-ch-de +=3D "${datadir}/i18n/locales/musl/ch_DE.U=
TF-8"
> > > > +FILES:locale-base-cs-cz +=3D "${datadir}/i18n/locales/musl/cs_CZ.U=
TF-8"
> > > >  FILES:locale-base-de-ch +=3D "${datadir}/i18n/locales/musl/de_CH.U=
TF-8"
> > > >  FILES:locale-base-de-de +=3D "${datadir}/i18n/locales/musl/de_DE.U=
TF-8"
> > > >  FILES:locale-base-en-gb +=3D "${datadir}/i18n/locales/musl/en_GB.U=
TF-8"
> > > >  FILES:locale-base-en-us +=3D "${datadir}/i18n/locales/musl/en_US.U=
TF-8"
> > > >  FILES:locale-base-es-es +=3D "${datadir}/i18n/locales/musl/es_ES.U=
TF-8"
> > > > +FILES:locale-base-fi-fi +=3D "${datadir}/i18n/locales/musl/fi_FI.U=
TF-8"
> > > >  FILES:locale-base-fr-fr +=3D "${datadir}/i18n/locales/musl/fr_FR.U=
TF-8"
> > > >  FILES:locale-base-it-it +=3D "${datadir}/i18n/locales/musl/it_IT.U=
TF-8"
> > > >  FILES:locale-base-nb-no +=3D "${datadir}/i18n/locales/musl/nb_NO.U=
TF-8"
> > > >  FILES:locale-base-nl-nl +=3D "${datadir}/i18n/locales/musl/nl_NL.U=
TF-8"
> > > >  FILES:locale-base-pt-br +=3D "${datadir}/i18n/locales/musl/pt_BR.U=
TF-8"
> > > > +FILES:locale-base-pt-pt +=3D "${datadir}/i18n/locales/musl/pt_PT.U=
TF-8"
> > > >  FILES:locale-base-ru-ru +=3D "${datadir}/i18n/locales/musl/ru_RU.U=
TF-8"
> > > > +FILES:locale-base-sr-rs +=3D "${datadir}/i18n/locales/musl/sr_RS.U=
TF-8"
> > > >  FILES:locale-base-sv-se +=3D "${datadir}/i18n/locales/musl/sv_SE.U=
TF-8"
> > > >
> > > >  UPSTREAM_CHECK_COMMITS =3D "1"
> > > > --
> > > > 2.36.1
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#165700): https://lists.openembedded.org/g/opene=
mbedded-core/message/165700
> > > > Mute This Topic: https://lists.openembedded.org/mt/91152448/3620601
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [steve@sakoman.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

