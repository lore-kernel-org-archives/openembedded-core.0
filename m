Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCDBCE7B13
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:40:25 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.34921.1725630017394172801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 06:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Dd8bDrpj;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6d44b6e1aebso19429147b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725630016; x=1726234816; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykQWRs/s1qs62hrIbFQ8jcb8S9SHiBQPW7ZDxduyw7o=;
        b=Dd8bDrpj806aioz9sndHIFPt5XAaNtuC2PsVMW06pXOvSvfAogq6zR4iXNbfgQg7Uk
         rXdW3sTHgJeMM87gGwPEA+0jPENvnsKptztamXMsBwHOWd1GXFQtsP1MPeXymN06fPi2
         PdSpXzz5jJFMPF6f6b/GEuI/gmlvMO6AOFhU9ZKJbDmnDFN0Mpxni+uJLJh6xADoeyfT
         h1d2yUmt+SG+k19OTnfDxPwTeu8GflAJ9NZvJYGoaAkQxRHAQhDGMBFeXcgoYCjp/+cw
         0QxrD65yLs6KxVoatYyMA2pfBXhnWA7NFPkk+edW4oR8Ckwpw0LRfm369wZVPXBoGwu7
         9euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725630016; x=1726234816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykQWRs/s1qs62hrIbFQ8jcb8S9SHiBQPW7ZDxduyw7o=;
        b=qvkHuRe3TnroF0X+7ykE3RrRgrGZtFTAJldDeMba3/pN8qoyrMGD57Gn1JIYfx3h3j
         NgJ3zrQTrbgBa+6b6/3tewSxKHYJvfYMBBlJGP1gRJZwjLqKB6LmUkpJLrj0vClMzkum
         GeGP2MI+0LCIE05ZXaT2iS2f6EMR3E8EXCZo8HGZLgEetCrT6OfFstLopmjct6Ca0zp7
         yAPTpx9Qji6RpZwMpva1H3P3yucvePB6hplGoOSjuMgepeNFsHTWAHAW/SoQwKAxOHv3
         +aY4he1tEx9ojlpLTG+J/cSxAxxIfSOmPjMxgOHV6smdAfNLZcxkIej/8z9e8GGJ6KV+
         Zmzw==
X-Gm-Message-State: AOJu0YzmxPkl9XEMj0tIGKxE3b0VRtjU0Ij4L1t5+Q/1rCWj8WpE5da6
	5R4wqKO3Nsojqb1ZZcwgf8wQIechB1cbBOc1BP8fCL7sWkxhK3B1lKkAoF3MGY5yfIgqUDHj6CA
	yIr2dSguTgeaagMtaQo/9mo2MHRWFUJ/AxiiFCA==
X-Google-Smtp-Source: AGHT+IEZlnLyKzX4UL2HC/QQJb3ap/hrtva+Ewv13ISfkYvpAR0lagrk3DYtexIiBM2k4RURP6GE1IUO4qO4/I0muyg=
X-Received: by 2002:a05:690c:6e06:b0:6b0:f068:8274 with SMTP id
 00721157ae682-6db45164c4amr34873597b3.41.1725630016517; Fri, 06 Sep 2024
 06:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240904052544.2082232-1-raj.khem@gmail.com> <CAMKF1sqN3U0uSv7E+5ZMOS_F+fWcax9Xm1xy+wOf1N-H9OT_MQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqN3U0uSv7E+5ZMOS_F+fWcax9Xm1xy+wOf1N-H9OT_MQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 6 Sep 2024 06:40:05 -0700
Message-ID: <CAOSpxdbhMHYFHnWm3LER+FNPOe9vK7ofG_0gZAeSHkga9kXAxA@mail.gmail.com>
Subject: Re: [PATCH] gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on microblaze
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Mark Hatle <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204267

On Thu, Sep 5, 2024 at 11:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This needs backporting to kirkstone and scarthgap as well.

This patch understandably doesn't cherry-pick to the earlier versions
of gcc in kirkstone and scarthgap.

If someone would like to prepare branch appropriate versions I'd be
happy to add them to my test queues.

Thanks,

Steve

>
> On Tue, Sep 3, 2024 at 10:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Mark Hatle <mark.hatle@amd.com>
> > ---
> >  ...fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-De=
fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > index 6ff16e38e19..4ed55015519 100644
> > --- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-an=
d-UCLIBC_DYNAMIC_LINKE.patch
> > +++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-an=
d-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -1,4 +1,4 @@
> > -From b597a2bc85ffdcf780731a44de02799ebc3d8f61 Mon Sep 17 00:00:00 2001
> > +From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:24:50 +0400
> >  Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> > @@ -184,7 +184,7 @@ index e5d84e180e3..98cb49c189f 100644
> >   #undef GNU_USER_TARGET_LINK_SPEC
> >   #define GNU_USER_TARGET_LINK_SPEC \
> >  diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/lin=
ux.h
> > -index 5ed8ee518be..5553e7cac21 100644
> > +index 5ed8ee518be..299d1a62c81 100644
> >  --- a/gcc/config/microblaze/linux.h
> >  +++ b/gcc/config/microblaze/linux.h
> >  @@ -28,7 +28,7 @@
> > @@ -192,7 +192,7 @@ index 5ed8ee518be..5553e7cac21 100644
> >   #define TLS_NEEDS_GOT 1
> >
> >  -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> > -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
> >   #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> >
> >   #if TARGET_BIG_ENDIAN_DEFAULT =3D=3D 0 /* LE */

