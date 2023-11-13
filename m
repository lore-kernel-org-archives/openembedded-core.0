Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B97CC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 15:22:30 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.39375.1699888944373060223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 07:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PG1FliSx;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9e623356d5dso436845066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 07:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699888942; x=1700493742; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2vgYAXl94xlHLwYE9KEGSr+06MXAVZXKq1JShVSIok=;
        b=PG1FliSxdZfDA2880qaI8qGuD2305Bwrt5FgiIIKKB59x0oRnzwbxdvNYQF9pbxNDF
         ELajNUprIPwsNtqREmV1Zv6j1cD7FX4KyvNWZ7JZHJl6wOt5s1k3eBc6/yR85AJIjUIf
         yiI5poFNnowpHkQOM/zvHL6bdLv1ysW7LpJMMf+PFr+2CpxW8gLBU/wXywoJMLbLLJv0
         S1bzUyLw0uE7ARzT3thkw4tchW4Ic8mGvyQXnSHWugR365dJpK26FRoHNSesRjUabYSz
         wotWD0l9JpeOmw/lSD8oA4pTwXd04SGLmBSSZdcTHUEV8rY182OJU251zcS8XpsKU+I6
         bbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888942; x=1700493742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2vgYAXl94xlHLwYE9KEGSr+06MXAVZXKq1JShVSIok=;
        b=kHgta6VjEX3IbvJNUHAtl1+M4Jx6uZcmF6RY1bKg0gOCT4a2V8F9szjCnxTr4A5xfM
         AqXxzPkMzvwRDy18rKXkn4Pt79RPBhffgBQRvx1fhFgjCUZjboCKD5HsF4beUwSk686H
         JZ0tOZthvoSb2N7NbLk0fF/OjMEtVyCsnl9HdBJ5dTgz83bmS9QAGIeXNQNWW00HkxOk
         jOs3+T2mF798/w+ROwjNRo96SpS9LPwLxnbY1GHeboRq9L74PjJIOFSvnt7E6np0S3tk
         d1KO73jxCqM4NGZrU9VDeM71eZCwGmB89JhoXCDVjvsRWo/v/v+jZUgyvZWXmxRs9Mvl
         S/IA==
X-Gm-Message-State: AOJu0YybmUk5eJuXvltiqe6lnqsOriCCDCxGW7KYlJfRfKZpDKluEE7s
	ZADJ+ghUZxdZAiZdToujcYFWbbUbL92bTzAI06Z3kw==
X-Google-Smtp-Source: AGHT+IFVehC+SB0cncy64k63U4uWcPJpZrGoRDBa4m8Y2jxGEdSx44E3NHCy7SNkzj286dlNcUALcsjDxsZLLQM5yo8=
X-Received: by 2002:a17:906:2a41:b0:9b9:f980:8810 with SMTP id
 k1-20020a1709062a4100b009b9f9808810mr5547358eje.34.1699888942518; Mon, 13 Nov
 2023 07:22:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699714834.git.steve@sakoman.com> <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
 <9d7f39468c47e3ce9f15729562cd69f74b064f15.camel@linuxfoundation.org>
 <CAOSpxdZ6CHz=PfNb19RmuagChYoBNUu1H_FX-5qwOm62PTdEmg@mail.gmail.com> <f9a35fe25b224428bd2bb5400ea96efe87f70a17.camel@linuxfoundation.org>
In-Reply-To: <f9a35fe25b224428bd2bb5400ea96efe87f70a17.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Nov 2023 05:22:11 -1000
Message-ID: <CAOSpxdaPZ6dNbJjQypjhqB2bF_7qkZz07KokMHk7aOV-PdtFEg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 15:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190478

On Mon, Nov 13, 2023 at 4:35=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-11-13 at 04:14 -1000, Steve Sakoman wrote:
> > On Mon, Nov 13, 2023 at 3:42=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > > > We are seeing reproducibility issues where gcc-cross sometimes defa=
ults
> > > > to gnu11 and other times to gnu17.
> > > >
> > > > Specify std=3Dgnu17 rather than leave this to chance.
> > > >
> > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-support/lz4/lz4_1.9.2.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-s=
upport/lz4/lz4_1.9.2.bb
> > > > index c2e24b518c..8cf71fdc04 100644
> > > > --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> > > > +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
> > > > @@ -23,6 +23,7 @@ S =3D "${WORKDIR}/git"
> > > >  # Fixed in r118, which is larger than the current version.
> > > >  CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
> > > >
> > > > +CFLAGS_append =3D " -std=3Dgnu17"
> > > >  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLA=
GS}' DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STA=
TIC=3Dno"
> > > >
> > > >  do_install() {
> > >
> > > I've looked into this a lot more and I'm now of the opinion this is
> > > totally wrong and definitely should not merge.
> > >
> > > An example failure is:
> > >
> > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231109-c=
h73ktqp/packages/diff-html/
> > >
> > > First, it is worth noting the huge size difference. It appears debug
> > > line information is being missed out. The difference in cflags is a
> > > false lead, it is because crti.S is compiled with c17 and the produce=
r
> > > string is being mis-compared, the data is missing on one side.
> > >
> > > So what we're looking for really is a cflags issue where -g is going
> > > missing.
> > >
> > > I did check older failures which look similar:
> > >
> > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231105-_=
xpb575y/packages/diff-html/
> > >
> > > Since we're looking for cflags issues:
> > >
> > > https://github.com/lz4/lz4/commit/7d8d1075e696d585238e6aa6a4f43dc759d=
a250e
> > >
> > > looks interesting and leads to:
> > >
> > > https://savannah.gnu.org/bugs/?func=3Ddetailitem&item_id=3D59230
> > >
> > > If the makefile had intermittently picked up CFLAGS from the
> > > environment, the output would be identical to the previous cflags pat=
ch
> > > in the series, which would cross link the hash equivalence
> > > inputs/outputs and could generally confuse things.
> >
> > Thanks for looking into this!  I will remove the patch from the series.
> >
> > > The real question is which autobuilder worker is compiling without th=
e
> > > -g option and is it a make bug? Perhaps it doesn't matter and we just
> > > need to force the input and output hashes to change to stop the error=
s
> > > once the previous patch is applied.
> >
> > What is the proper way to force the input and output hashes to change?
> >
> > Thanks again!
>
> https://git.yoctoproject.org/poky/commit/?id=3Dad3dfac07f856917434deb073f=
e9c8a788d4c21d
>
> is an example.

Thanks Richard!  I'll test with this and resubmit the series.

Steve

