Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4B4C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:14:19 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.37715.1699884854174058820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=avHWOY5H;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso6976920a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 06:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699884852; x=1700489652; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2SefdEjjWuzCSntrR4Hs45kFU0mDHGytyB78DQ8Uh0=;
        b=avHWOY5H+YH/f8FhVnda1s84HhEO9yeKB4rDPSX9i3Ca4xEJU0fl5VkGcR/sOKLT1w
         3k3+myKc/sNWQ9Ziv6jS0obx71P0IwRSK4w2yUpzWLMY6xagEg5kHTGLnX7YbV/0HHNm
         r4yYwz6tq5u3VUIv29zyjLNhLCj0Yi6Sdz6LbY3jl85Rfup/pT1bQYAf5PC1dmn7NFWw
         AIse8Q65Npzv1mJpFAvFsobMoFnrCxiqmMBMf1xeeYqJ50/RH8gBT/sqMaIhQX+IU+Zm
         b54wxlHoldX7662QIoeCA7C5qmkKInX8gJH4WoG3NSnnnTlgG71A8x/MW3Dx+7OpsmD4
         nOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884852; x=1700489652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2SefdEjjWuzCSntrR4Hs45kFU0mDHGytyB78DQ8Uh0=;
        b=hemEfhW8TLs2dBwV90TqwETr3asdBQ+xUlribSg6BAEr7C1R41kldMHZpSuL/312UF
         UtlBrS0VQYU/jd6VG3YNQON9zmWIJr7o8pNiErAbbOJKbKkTK7a7XDewu8Yx5lx16HH7
         oUt2Qukl4P6c3K/q2VjEsPu7srL0+jXoPctyT89zwPFdJkbnC1jbrlEceI+SzquyK+0a
         BdSOQEtgDbk+MRu1mVmRmexSL0yHGKUjUiI9MrLN00Zw0ZlbS0EcNLidJZWwITobuJOg
         c10Li7+w2dl9xqNrnGtjC18a73CyQ9xFJRXYK2rUfro8vwQt5DIIy0WCB33l3UDIcmSx
         OF5Q==
X-Gm-Message-State: AOJu0YwgaJYcjFxGds1KANt/pGv+vRuG+D3iAOdc+rjDuxRsfoJsCtTE
	wpOd6WQT6EaGrsm3RLkH4S7cKiyDUr207ekCoJMgQg==
X-Google-Smtp-Source: AGHT+IFZvrn3g3/JWf3yV4o3LSWk+Qj8TyGsGEGEGVzUIkxPcgcdH2hufW4I9wC54QXa6yx9wewXCDEJDr47hCH0b+w=
X-Received: by 2002:a17:906:6806:b0:9e6:b485:cb2c with SMTP id
 k6-20020a170906680600b009e6b485cb2cmr4604252ejr.72.1699884852170; Mon, 13 Nov
 2023 06:14:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699714834.git.steve@sakoman.com> <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
 <9d7f39468c47e3ce9f15729562cd69f74b064f15.camel@linuxfoundation.org>
In-Reply-To: <9d7f39468c47e3ce9f15729562cd69f74b064f15.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Nov 2023 04:14:01 -1000
Message-ID: <CAOSpxdZ6CHz=PfNb19RmuagChYoBNUu1H_FX-5qwOm62PTdEmg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 14:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190474

On Mon, Nov 13, 2023 at 3:42=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > We are seeing reproducibility issues where gcc-cross sometimes defaults
> > to gnu11 and other times to gnu17.
> >
> > Specify std=3Dgnu17 rather than leave this to chance.
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-support/lz4/lz4_1.9.2.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-suppo=
rt/lz4/lz4_1.9.2.bb
> > index c2e24b518c..8cf71fdc04 100644
> > --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> > +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
> > @@ -23,6 +23,7 @@ S =3D "${WORKDIR}/git"
> >  # Fixed in r118, which is larger than the current version.
> >  CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
> >
> > +CFLAGS_append =3D " -std=3Dgnu17"
> >  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}'=
 DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=
=3Dno"
> >
> >  do_install() {
>
> I've looked into this a lot more and I'm now of the opinion this is
> totally wrong and definitely should not merge.
>
> An example failure is:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231109-ch73k=
tqp/packages/diff-html/
>
> First, it is worth noting the huge size difference. It appears debug
> line information is being missed out. The difference in cflags is a
> false lead, it is because crti.S is compiled with c17 and the producer
> string is being mis-compared, the data is missing on one side.
>
> So what we're looking for really is a cflags issue where -g is going
> missing.
>
> I did check older failures which look similar:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231105-_xpb5=
75y/packages/diff-html/
>
> Since we're looking for cflags issues:
>
> https://github.com/lz4/lz4/commit/7d8d1075e696d585238e6aa6a4f43dc759da250=
e
>
> looks interesting and leads to:
>
> https://savannah.gnu.org/bugs/?func=3Ddetailitem&item_id=3D59230
>
> If the makefile had intermittently picked up CFLAGS from the
> environment, the output would be identical to the previous cflags patch
> in the series, which would cross link the hash equivalence
> inputs/outputs and could generally confuse things.

Thanks for looking into this!  I will remove the patch from the series.

> The real question is which autobuilder worker is compiling without the
> -g option and is it a make bug? Perhaps it doesn't matter and we just
> need to force the input and output hashes to change to stop the errors
> once the previous patch is applied.

What is the proper way to force the input and output hashes to change?

Thanks again!

Steve

