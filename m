Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E973C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 10:32:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.26204.1704191563893754917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 02:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C91jAK15;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a27e824d65aso237226966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704191562; x=1704796362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCcgHz+DkhI5b4Jf2cqJi83ZYgvHJ4szdCM6T4tQAVs=;
        b=C91jAK15c9NK6DCaFd9x/DoWkyG3RBj/cNfRGXfIDlvwack0C3RQyitRlDVaBaUJm+
         DtWRHZUaOUQ82UGGYGK5MBt62FSWlgkFBm3SMM2oO96/hSAQ1Ovrkp6NZ+kp3IS8syK0
         OnZTnVMVrqvcqcuQRwxriHAC1erxItTKg4/ZkuQ3MvdIN3nMZ1A2nfl8HwlXhlJy+EMX
         NEU9WNNxPgMnTbnEIuH8LUCwP0fJJ2l3SE5uv2Diu4TE7yoTnhXGBLnMFTurWGtEZXyc
         esl5OVxv4FXw2Zn/xCSV7AnO1oabe2m+3h3mzZcIUdOcJDWkTmY09XxCJ4MhOnjiwNUl
         EADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191562; x=1704796362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCcgHz+DkhI5b4Jf2cqJi83ZYgvHJ4szdCM6T4tQAVs=;
        b=S46S9uQcZL00tzhuDADLyooP6DTNkrMKNocudM8NTO9x72Ho4J2FcC+T1IEdTFwIJA
         i2O1s89ai6xcGk7PUQq4c069StUEm2yJibQt3pVxkBX7DbyA6Cv6fh9xRShcZfDGSlX1
         QF0fJ47OKY+Zx8MrViZqrVYRQaMyCHkI/4T9GbdRs05gtm0yOeCQYLNUomf+6iiQbaUS
         78mP1a16BQih8y3WUHaK8xEhafRHJT7kQVtt7b6D1+p7QwIM8tBpIzCslmX1V4XnC8UQ
         eivA1QLd96AfLLcwhrBr+NC/LbQmn8okomsg3hgvAVo6u0ixYQVDUf4GKp5/Y4wFXA8A
         oVug==
X-Gm-Message-State: AOJu0YxRw5jQa8wRZhCVEXQ9IuVU3LQqpbUs2LSOimato9VW+3NDofdw
	G5B4r/Iq+LRt3sMb7ml15j4Zgy/GB9/DpiX7QpE=
X-Google-Smtp-Source: AGHT+IHPfZJEqUuVniBjKfSQMxZ1LZ1xTl5YDUmIahLb+Pjz3Szen39tmhkEM8bmJISORiNMRhf7i2FCqxJDeab8TRw=
X-Received: by 2002:a17:907:1a51:b0:a23:3753:4d3 with SMTP id
 mf17-20020a1709071a5100b00a23375304d3mr12220789ejc.14.1704191561996; Tue, 02
 Jan 2024 02:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org> <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
In-Reply-To: <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 2 Jan 2024 12:32:30 +0200
Message-ID: <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 10:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193226

On Sat, 30 Dec 2023 at 23:02, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >
> > Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
> > (newer one). Extend the "opencl" package config to include both
> > implementations into the libopencl-mesa (-dev) packages. As the Clover
> > implementation is in maintenance mode and is expected to be removed at
> > some point, it doesn't make sense to split the packages or to provide
> > two config options.
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > [DB: reworked rust class inheritance]
> > [DB: merged "rusticl" and "clover" back to "opencl"]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index efbce5caade5..a192562a7935 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -48,6 +48,12 @@ PROVIDES =3D " \
> >
> >  inherit meson pkgconfig python3native gettext features_check
> >
> > +# We can not include rust conditionally, otherwise it can not be overr=
iden by
> > +# the bbappends.  Instead always include it, but remove the dependenci=
es by
> > +# default.
> > +inherit rust
> > +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', '=
opencl', '', '1', d)}"
> > +
>
> I'd really prefer not to have the rust inherit unconditionally. I have
> some ideas about how we could fix this in bitbake so we may need to
> wait for that if we can't avoid the PACKAGECONFIG issue from appends...

Well, it's not just appends. Extending PACKAGECONFIG from local.conf
also doesn't work. In fact even adding "opencl" to the default
PACKAGECONFIG doesn't work unless I move `inherit
@{bb.utils.contains....` after the PACKAGECONFIG definition. Using
`INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it has a
drawback of including rust unconditionally.


--=20
With best wishes
Dmitry

