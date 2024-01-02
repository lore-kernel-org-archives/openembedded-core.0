Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F80C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:25:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.31199.1704209139384914479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 07:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXn8erpL;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55614bb435aso3308314a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704209137; x=1704813937; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu99k64XyylJfWYCy8iSCQ+8BCfOXgb49xte/EKJzi0=;
        b=BXn8erpLmsfOUvPTHVg5g5NnJm5twUKxTH+AO73Rn2m/yjTz1NfcNNZ51Jqs18mxdU
         95XeVnl3NnS330j3TbXe4YY8SfF1MDIZ8+B/SugoF4ZvdmroOVoLAX6Wkfh/FD1WHelu
         RAmMIr9AviJcw0V9aClPo05mywsEm7Hll1+VHojsOv9nMnprnmhvZuWKQeO8mysxIVOR
         2iYVRcHcHGzF1CBqUAXlWVc8Ku+ELIAVvclbnoXpKHdu77wqKGCjHm7h/q9mjL9w0cwQ
         Uq4EWz+e1M76bR1K2DUxHy7x+IkK9jN9BZgM6POJuNVU/MxOb90nuFrucxpFIj/BZVXL
         Er6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704209137; x=1704813937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu99k64XyylJfWYCy8iSCQ+8BCfOXgb49xte/EKJzi0=;
        b=hop9YD3M9d3LiuF39ojbo8fgzvzWJJzlKIIUIsM1CmDWmxN0mEgR5MxUGbfpZfv6EL
         FvR2jHC+73pviKZKddtzvS+y1AGtUIDl+8/oj+dwdIXebaf9CkN4PUZxNH70SrxDeIaS
         y5TtwODs/uHcYtNIA27TgXBQVBpgqD/rlN5VvvgbK6j9ToE3U8D35oSnP9EJF27DXbJS
         AP0RJewi7RN1j9ByeKOkng3SovNW3Sv3UjGGI3U9g+ccWUtWOFVsP+yQgZdfrfWrCYGv
         Np+tPHhewgNs4zzzFOo00I8SoNoYVIydV9M7N+8VEatKrkz0LKHDYRUeg/600VlbQNPH
         pLNQ==
X-Gm-Message-State: AOJu0YyakG11voik8QDF8fTofjhvlx6jE+jgADOv5mjAxrG7ISHq0DY3
	aoAK5ViY0FP7d6w4Aatu3b9r8DJipT0xTXxUc1w=
X-Google-Smtp-Source: AGHT+IFSJZTRQ6uQkJrgvkA51q7a6vEwtEI0bCNqS+lzrYxHozUG8gmUYZ00UrKd1vZQRPtZphaA+tTLJFE4VY6mHfk=
X-Received: by 2002:a17:906:154:b0:a28:6425:8f53 with SMTP id
 20-20020a170906015400b00a2864258f53mr593481ejh.71.1704209137471; Tue, 02 Jan
 2024 07:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org> <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com> <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
In-Reply-To: <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 2 Jan 2024 17:25:26 +0200
Message-ID: <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 15:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193239

On Tue, 2 Jan 2024 at 13:40, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
> > On Sat, 30 Dec 2023 at 23:02, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> > > > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> > > >
> > > > Mesa now has two OpenCL implementations: Clover (older one) and Rus=
tiCL
> > > > (newer one). Extend the "opencl" package config to include both
> > > > implementations into the libopencl-mesa (-dev) packages. As the Clo=
ver
> > > > implementation is in maintenance mode and is expected to be removed=
 at
> > > > some point, it doesn't make sense to split the packages or to provi=
de
> > > > two config options.
> > > >
> > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> > > > [DB: reworked rust class inheritance]
> > > > [DB: merged "rusticl" and "clover" back to "opencl"]
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
> > > >  1 file changed, 16 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gra=
phics/mesa/mesa.inc
> > > > index efbce5caade5..a192562a7935 100644
> > > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > > @@ -48,6 +48,12 @@ PROVIDES =3D " \
> > > >
> > > >  inherit meson pkgconfig python3native gettext features_check
> > > >
> > > > +# We can not include rust conditionally, otherwise it can not be o=
verriden by
> > > > +# the bbappends.  Instead always include it, but remove the depend=
encies by
> > > > +# default.
> > > > +inherit rust
> > > > +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG=
', 'opencl', '', '1', d)}"
> > > > +
> > >
> > > I'd really prefer not to have the rust inherit unconditionally. I hav=
e
> > > some ideas about how we could fix this in bitbake so we may need to
> > > wait for that if we can't avoid the PACKAGECONFIG issue from appends.=
..
> >
> > Well, it's not just appends. Extending PACKAGECONFIG from local.conf
> > also doesn't work. In fact even adding "opencl" to the default
> > PACKAGECONFIG doesn't work unless I move `inherit
> > @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
> > `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it has a
> > drawback of including rust unconditionally.
>
> PACKAGECONFIG:append:pn-mesa =3D " opencl"

Yes, I tried that. I got an error about rust tools not being defined.
I think the :append: and overrides are handled after the inherit
argument is handled. So it is either PACKAGECONFIG being fully defined
before inherit (literally before), or inherit ends up with an empty
argument.

--=20
With best wishes
Dmitry

