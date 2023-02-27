Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A683C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 06:43:41 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.84671.1677480214457876781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 22:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S7i+HZAj;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id e21so4428080oie.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 22:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8EXPA1u9qPxDIQ1gJigY1KOiMwkmMlrvq4/eZfM4eQ=;
        b=S7i+HZAjcW/J/SZUpNGz6zee+iOAhYCBm3giCUeSeCp+jxHOIzYOaJeydQaryPJp1H
         MTa/vqYDyiHJEsOI9twIW7pPLll71v2MlIP92oDJ4yeF0iwHGrpdxVSAqQiwcrw3seDw
         0OPHbUkVFPvExuB0g0c92jamMt6kC7O4J0Qhc6QkxKeQQhPtKOvF69/HZYBYKlhBpnub
         WjitUInnKIKwLQXO4xjyPvmiIhwHuO0EcEgsn1GC9XL8/wyGhBzHfK6OZ0f4ju75L5KW
         Io1TugpXatjPZze2tUQ11MZUzG2ZgxlURB7GhxgdYEZIVFbDkbYStK1xFnYIqrOjQzub
         g45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8EXPA1u9qPxDIQ1gJigY1KOiMwkmMlrvq4/eZfM4eQ=;
        b=fnc8S0XZloUzAyEMedvaujj7nW/wP7xz16tpMF1n0xYUjvtTWOmy7liz6AplBQZKMg
         /xVNW7o0Osfz2QdcaU+54wJuh8uOXkAqIOUkZDUpRIdTAc66TcfOvP9SMnEOHn0yMNie
         /zd5/Lyv9yRG6wQ20IUzhrlW6aVfPWhmGGYf1at4B7RIHV7avNR5PKHorgFgqGxhTMww
         1LdlxSVIqwG6p6eEsTY3Q7k2W8MnHh0Cky44TaijtjtMG6NhEBWkB0+zRkK6qgjZZzI3
         uL0VUTTjd5P9TaIEfJi6LmNopA1RwkgVUWDzcJy68p94qFlq6mpDz6PVEMirMYCIucug
         eFHw==
X-Gm-Message-State: AO0yUKXXgiTPCtbqq2m8SDGZQbhbwf/3ko9MOVL5xJvDoyVlSOvdlUA7
	+P0plBWMQzmOh9W36O9asHa+R0enaLlGANe3o/VbjZKfWx0=
X-Google-Smtp-Source: AK7set8RvCKGymHjisZjLrp8vrHFzBQi9AZGj6URYK5hxDWkRKoukMhs+VwKkuEGUkWdZ3TQAqPyoQ88tAo1qVE2okM=
X-Received: by 2002:aca:1e0c:0:b0:383:bae2:3ac9 with SMTP id
 m12-20020aca1e0c000000b00383bae23ac9mr3014243oic.2.1677480213628; Sun, 26 Feb
 2023 22:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20230223065816.3151823-1-raj.khem@gmail.com> <Y/f3/n9f4AxtHcoo@mail.local>
 <CAMKF1srZ=NMtKo_Pn=s9ow913j8AmC9heZKGKyHRB6RAStJFdA@mail.gmail.com>
In-Reply-To: <CAMKF1srZ=NMtKo_Pn=s9ow913j8AmC9heZKGKyHRB6RAStJFdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Feb 2023 22:43:07 -0800
Message-ID: <CAMKF1sqeDrCv_+StXhwdWjgrvuq6jANu0Ysydausev0rVsk6xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 06:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177773

On Thu, Feb 23, 2023 at 5:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Thu, Feb 23, 2023 at 3:34 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Could this be the cause of this?
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230223-79=
c9rmcw/packages/diff-html/
>
> most likely yes. I will take a look. Lets work on merging the other
> binutils and gdb upgrade patch meanwhile.

I looked at the diffoscope outputs you posted and it is noting the
difference in EFL flags

changing from
 0x0000000000000018 (BIND_NOW)
to
 0x000000000000001e (FLAGS)              BIND_NOW

However, in my local build I see that when I enable --enable-new-dtags
 than I always get
 0x000000000000001e (FLAGS)              BIND_NOW


but when I check the glibc builds without the patch then I get flags
to be 0x0000000000000018

So I wonder if we are comparing previously built glibc ( using
binutils without this patch )
with glibc compiled with binutils using this patch.

>
> >
> > On 22/02/2023 22:58:16-0800, Khem Raj wrote:
> > > Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PA=
TH is searched before
> > > DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> > > DT_RUNPATH, this order ensures that injecting
> > > malicious shared objects is way harder with DT_RUNPATH.
> > >
> > > This is now default on major linux distributions already
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/binutils/binutils.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recip=
es-devtools/binutils/binutils.inc
> > > index b2dbf241df..c69d29448f 100644
> > > --- a/meta/recipes-devtools/binutils/binutils.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > > @@ -96,6 +96,7 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFI=
X} \
> > >                  --disable-werror \
> > >                  --enable-deterministic-archives \
> > >                  --enable-plugins \
> > > +                --enable-new-dtags \
> > >                  --disable-gdb \
> > >                  --disable-gdbserver \
> > >                  --disable-libdecnumber \
> > > --
> > > 2.39.2
> > >
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#177602): https://lists.openembedded.org/g/openemb=
edded-core/message/177602
> > > Mute This Topic: https://lists.openembedded.org/mt/97178429/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alexandre.belloni@bootlin.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

