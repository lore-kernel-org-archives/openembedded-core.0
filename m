Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587F5C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:49:09 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.3279.1748551741605948956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzTzQkFq;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-606440d92eeso659956eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748551741; x=1749156541; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG7Izp9ufH296juANH7X8LbsmGemYPaYd4NRZLm96UY=;
        b=hzTzQkFqBTCusNbYn2RaRFFEvb7Gn7fsAcFlIRPhgiiJy55eBWr54sLyBhUVCp/IB6
         YTEC7XABW6I2c9JpWW/zw6pXyCNjzOY4LFNlDnSuLfGl5pgvhZlXXGFaPKVVHzkMgelq
         izSt4D9WXR13zMRRJZpWSSoA67SL6iOQxn+V2mCwM//kAdSLwdCK3bOWhsK8SOrDARRx
         PYdspUZllhQWawBFe7ZwACWJLYy7ya0eP31KjUi7Eabg6VJOoyvW+b2uRffaXuHsAr+x
         qKiqVUzVsDdzUUEiqxnWHsrUv8WmFUQH4LP98iM73riZLSpcYqOvp2aE8bSZI6rJZlMR
         /NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551741; x=1749156541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG7Izp9ufH296juANH7X8LbsmGemYPaYd4NRZLm96UY=;
        b=BUyOVTQPwo3jGstz8FjOQMPLUqDEE+raLW95KToI1SPWLD+6lYE2YTe+ztasBXGUmf
         dwVa9z2Ojr/CD7x5hHf0kKOUJgkJ7AOAt6fMnZm4iRrQWhQcAMtJQ2M//iBDddnP/lIJ
         w0uinT83JquG1DChXWA1xdor0BCbQgaMg/CoiNX9F7/CBWJ7sJAjwZPOrADs5FyCoL3y
         heiziHowYgSD61Rv/CIIwLs8fZoA5Fd/y04pPhnnoVGJ5n9VLOwIT2If008W4/H354ys
         TZ2zwfOqIaHGDESnMRddFz0NArupfjGTgNTT9+0wrCdwpcmI9j+1UoR2wkzSusK4CO/K
         mc+Q==
X-Gm-Message-State: AOJu0YwQd6hxSKzcOGYO8dz8oAQfy4AetkGkCQFi+2AOnoo53ymsMZ2l
	e4djyzDwitTqFDoN57iBTRhBQt0UR9Zzin+XaHmKbxi6SUeIsoOvjXHARuy2l7ZfuCkvxRLc0lP
	jb7QmYqgfvE1t8O6I2RxsYSAJLW85K0oI+x0/
X-Gm-Gg: ASbGnct23KNBCDGNdnhhaG0p4KdWgY2d40ZA9imCEIQ6g3ZO0HHIZe38k2WRUQzclka
	0T+2ZlvfXQp8nLtscgyHQWuZ8U3RC1V3urlfJJjGuhWeGWKiU4bxdm0QzqtAkVV3JdJZ+DDPgl2
	bOZYqeHCShNYwyWbyl2Du5yXzul6PY2/No
X-Google-Smtp-Source: AGHT+IHcHqg/maLsiiGqfvUEFMWnt9tuGsPqK7lBhcf3e15T0DZm8EnQVZGkqmzSKOC6SR0Bably1va9ckMUTN7txAA=
X-Received: by 2002:a05:6870:7a15:b0:2d0:4a2c:7c22 with SMTP id
 586e51a60fabf-2e9213106d3mr418213fac.18.1748551740824; Thu, 29 May 2025
 13:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-6-16cfc6d9891b@gmail.com> <8779472af099d97425a52fe97f63f5c5e13e9655.camel@linuxfoundation.org>
 <e019bc45-77c9-4c04-905f-d4e0cdaa01b4@gmail.com> <a7bd4a5baccd74088cb3fd6b485ed21bba75547a.camel@linuxfoundation.org>
In-Reply-To: <a7bd4a5baccd74088cb3fd6b485ed21bba75547a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 13:48:34 -0700
X-Gm-Features: AX0GCFvRsI8um4A9EV64QWnESjjNB5OvfKnkKrC3yiHHz6zfCysb_ykflqMl8NM
Message-ID: <CAMKF1somkk_0WY77c=jL_nbrYVyf4GJjL0aZ6AuVykCd6WnFFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 06/13] libjpeg-turbo: Fix build on mips/clang
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217450

On Thu, May 29, 2025 at 1:26=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2025-05-29 at 09:28 -0700, Khem Raj wrote:
> >
> >
> > On 5/29/25 2:22 AM, Richard Purdie wrote:
> > > On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via
> > > lists.openembedded.org
> > > wrote:
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >   meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
> > > >   1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > > b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > > index
> > > > 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e0
> > > > 8e47
> > > > d953bf5773e19 100644
> > > > --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > > +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
> > > > @@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le
> > > > =3D "
> > > > ${@bb.utils.contains("TUNE_FEA
> > > >   DEBUG_OPTIMIZATION:append:armv4 =3D "
> > > > ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
> > > > pointer', '', d)}"
> > > >   DEBUG_OPTIMIZATION:append:armv5 =3D "
> > > > ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
> > > > pointer', '', d)}"
> > > >
> > > > +# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
> > > > +# <instantiation>:13:5: error: invalid token in expression
> > > > +# .if $17 !=3D 0
> > > > +# ^
> > > > +CFLAGS:append:toolchain-clang:mipsarch =3D " -no-integrated-as"
> > > > +
> > > >   PACKAGES =3D+ "jpeg-tools libturbojpeg"
> > >
> > > I noticed you use "-no-integrated-as" but in the next patch in
> > > pixman,
> > > you use "-fno-integrated-as". Should we be consistent or are these
> > > different?
> >
> > they are effectively same. -no-integrated-as is legacy clang option
> > format while -fno-integrated-as is more in line with gcc options
> > it's generally better to use -fno-integrated-as since it follows the
> > conventional flag naming pattern that other compilers might also
> > recognize.
> >
> > I will change it in a follow up for consistency.
>
> I've tweaked the patch and merged it. With the pixman one we need to
> explain the DEPENDS change before that one can go in.
>

Thanks. For DEPENDS I am sending a new version

> Cheers,
>
> Richard

