Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B62AC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:35:06 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.1036.1685482498964756067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 14:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pw8nggQZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2af28303127so54153161fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685482497; x=1688074497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=520x1KnnNzE2ZuhhzLPosvikC1KRcs3Fw0At9st1mS8=;
        b=pw8nggQZ9zKk/qmGoV49HQ5WIT2jZEMjiRwijd0kCWBd6SUi5gdhdSW7f5NYO4hlIB
         bxXh4X/S2EDYRyJP+ydIQkRvESPoLq1Ckcl5XT67TPq4m4wwaQfxZMN44cn/xnGekSBi
         Zb/pj3P0coB0hzGM9DCuG+bhNA5YFqA+kJ6/PNeH9RrDWCWzZo9vEOdo33dPwe7ASn5Q
         z5LVY83OdhQD8vo7gpFAPUj1i08nuCLNCWX5ktYLMIUMzE5vGxMQw2cCHjB2wm7PlJQZ
         0VJeQpZE65Yf91f2YZkc+SzuNMelW5Yf4+iiJ9gRXcqoLRu8CdwSR+Y2HPoS+oKP3g/H
         eyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685482497; x=1688074497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=520x1KnnNzE2ZuhhzLPosvikC1KRcs3Fw0At9st1mS8=;
        b=AvXZtfTaa0lpHnCapoWlewPikNTa7vOPDbmatFnyzkaSz3vyda1QTQ7482j1o96ZIN
         WR90JHdkOZOU/OaFqkxfyvC9tJm6MJk8s28+5v4dUYdmHb5mWQednUXmZwa14+GSOx3z
         9S/MQZTk1Pjb+ujBvsjAGk9zL6NQ8JqeGqSIGMEX4XUgeN0oEwgdcp7Zqrecpz+lTsq4
         Nos1mC9b8pd8E6o8/zC1CziQZx6E9H/Ao7x1ob9M590YCQ24KIl/OFjattUajbjtnfNL
         eAMJBSktMBVlaFxZ2lRE46khKnUWnR9+sTf7wmqHo7QKud2fCNyb+NSyX95Qv9N8pPTk
         kElA==
X-Gm-Message-State: AC+VfDxsnZPojx1t6MtV/VON0e2HMtYZ8ud9plyfiseb6ZQKu0JHs4y5
	wPlA4Ph54dcSc1MvKPiuxGCO50VMQkKKwvXYY2ZmlR5s
X-Google-Smtp-Source: ACHHUZ5SY0xOO4uIKgDrc13l9drgf4JslxkkCm5iy3ExustNPAmVp4XB0juN5wAgN1AQFz9I5tKzIUlwlxgHMxzS20Y=
X-Received: by 2002:a2e:a305:0:b0:2af:228a:8670 with SMTP id
 l5-20020a2ea305000000b002af228a8670mr1537322lje.2.1685482496961; Tue, 30 May
 2023 14:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230530204117.949199-1-JPEWhacker@gmail.com> <bf7d98b4ee31c416072db5437da44ce7a4c0f841.camel@linuxfoundation.org>
 <CAJdd5GbHuoJFe8BbvjUbG=iPmedYtJTgOx-fyNu86zms+gDeeQ@mail.gmail.com> <ef0bb20cfd481f73e5958233e487067b02da1e4b.camel@linuxfoundation.org>
In-Reply-To: <ef0bb20cfd481f73e5958233e487067b02da1e4b.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 30 May 2023 16:34:45 -0500
Message-ID: <CAJdd5GYqz=iMD5Yf6UOLb5yrU5b-KxCOBacOFsWGQ195gJr9ew@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/package: mark PKGDATA_VARS as a
 dependency of emit_pkgdata
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 21:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181956

On Tue, May 30, 2023 at 4:30=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-05-30 at 16:25 -0500, Joshua Watt wrote:
> > On Tue, May 30, 2023 at 4:23=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2023-05-30 at 15:41 -0500, Joshua Watt wrote:
> > > > emit_pkgdata needs to re-run when PKGDATA_VARS changes, but bitbake=
 is
> > > > unaware of this because the code that uses it is in a python librar=
y.
> > > > Fix this by explicitly marking PKGDATA_VARS as a dependency
> > > >
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  meta/classes-global/package.bbclass | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/classes-global/package.bbclass b/meta/classes-glo=
bal/package.bbclass
> > > > index e8055a9cdc5..c466601266e 100644
> > > > --- a/meta/classes-global/package.bbclass
> > > > +++ b/meta/classes-global/package.bbclass
> > > > @@ -381,6 +381,7 @@ python emit_pkgdata() {
> > > >      import oe.packagedata
> > > >      oe.packagedata.emit_pkgdata(pkgfiles, d)
> > > >  }
> > > > +emit_pkgdata[vardeps] +=3D "PKGDATA_VARS"
> > > >  emit_pkgdata[dirs] =3D "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runt=
ime-reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
> > > >
> > > >  ldconfig_postinst_fragment() {
> > >
> > > Is the auto dependency code somehow breaking for that function?
> >
> > It empirically seemed to not re-run the functions when I changed that
> > variable as part of a (now abandoned) way to fix the SPDX builds.
> >
> > I thought the code scanner didn't go into library functions; or am I
> > mistaken there?
>
> That used to be the case but I added:
>
> https://git.yoctoproject.org/poky/commit/bitbake/lib?id=3Df3bcd3c9a91f621=
2c30b9c778c11f3c8a9f6f1d4
> and then:
> https://git.yoctoproject.org/poky/commit/bitbake/lib?id=3D2b406a3174b8142=
b1ae00e6cff4af43317a78f94
>
> so it should auto-detect dependencies.
>
> It is certainly possible something isn't working but I'd like to
> understand what...

Hmm, good point.... I'm not sure; it's very possible I did something
else wrong, let me try again to see what happens

>
> Cheers,
>
> Richard

