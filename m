Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2A6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 22:57:30 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.1028.1704236242662314141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 14:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVgqtmF7;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55676f1faa9so1446358a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704236241; x=1704841041; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAP50cSICmAWViUpB491SV56FabvDMnCIlb6LzRBuAo=;
        b=CVgqtmF79jgwBufGL1JAwRHeWB/QInu4q+bU1FBdcWletvqUEtGlhkDjWYDVHf7iQC
         GxTYfCne0eL8bFJBHoYgjR8dQWifF1fJWXGlSGTdCvPiPyE152Y3bIP1zcSgrlYpuY9Y
         q6w0E5OjtRKJZMBybruFAJUBKWp9Nk7K1WYHnRfApTp2Rl3/oJ64h37kIMYO6o7W3TMn
         3Vi3gbyJYF1prI+OqgkYXthynPWLqbi4f3TDPhKqhFV83bfaPYt4hKYJcCJVkw5OWzwK
         CbxdSmIzedgH/g2mnwR3uG26NvqUhS8g+Fw5L14rR+1hqizwckGwIAExjXjegtmxthHA
         8PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704236241; x=1704841041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAP50cSICmAWViUpB491SV56FabvDMnCIlb6LzRBuAo=;
        b=HvcpJqzc5ZghtdMLrL9tUvUx79OISnojITH8ewi7N74Hvk0cEoQ3qKrSQJDd9rszqz
         PnWeNJBtT8vL3uGA/UmlLqyEwI3PxkrWRy5tELA7x0D0UY/1l22t7iZJt6q04ANz/OZZ
         9xcBtbJCWacRpFsBwxxqmqb1vXdaG1TmeyCCheL3DztnjkSXvcnQM3w9mcZvLy7PaHAL
         vsLVi6IGl7Z/dHtj3bblWb9mO0L0qP/GS0dyLDZAXOA3If8o/xGpcscUOWECzNC3hQ18
         cw66zi7l8a6Ze+ucxDIgxLdf43FowcN0LLGCb6/3mAMfyoKlr7XOkMpZ+vroLMllOzG0
         Xh0w==
X-Gm-Message-State: AOJu0YzAWtrt+lLemH9kHvyulD+Nq75o3iz38tUnP3vjh2kGhVH/HOvB
	4FL/s6EcBdqlbDEXEVYPXJwQ06lqcEhFUw78Et0=
X-Google-Smtp-Source: AGHT+IFMjsPCd3I7O9U9qarBY8GYy2sLHerZ9apifjDmOA1+xgBKNriXqHxi0kiP7+6lBmvH2ZrrRXjANPbINN8hMis=
X-Received: by 2002:a17:906:1609:b0:a26:8ab0:43b3 with SMTP id
 m9-20020a170906160900b00a268ab043b3mr8782162ejd.74.1704236240877; Tue, 02 Jan
 2024 14:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org> <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
 <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
 <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com> <67deee116e78f2d0695e3cb25b284380465d780c.camel@linuxfoundation.org>
In-Reply-To: <67deee116e78f2d0695e3cb25b284380465d780c.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 3 Jan 2024 00:57:09 +0200
Message-ID: <CALT56yNT-OZbXqqAPJXJ79ih1u_F3O40qoZJDwnhywjFQM-8ZQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 22:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193261

On Tue, 2 Jan 2024 at 17:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-01-02 at 17:25 +0200, Dmitry Baryshkov wrote:
> > On Tue, 2 Jan 2024 at 13:40, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
> > > > On Sat, 30 Dec 2023 at 23:02, Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> > > > > > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> > > > > >
> > > > > > Mesa now has two OpenCL implementations: Clover (older one) and=
 RustiCL
> > > > > > (newer one). Extend the "opencl" package config to include both
> > > > > > implementations into the libopencl-mesa (-dev) packages. As the=
 Clover
> > > > > > implementation is in maintenance mode and is expected to be rem=
oved at
> > > > > > some point, it doesn't make sense to split the packages or to p=
rovide
> > > > > > two config options.
> > > > > >
> > > > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@=
gmail.com>
> > > > > > [DB: reworked rust class inheritance]
> > > > > > [DB: merged "rusticl" and "clover" back to "opencl"]
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
> > > > > >  1 file changed, 16 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes=
-graphics/mesa/mesa.inc
> > > > > > index efbce5caade5..a192562a7935 100644
> > > > > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > > > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > > > > @@ -48,6 +48,12 @@ PROVIDES =3D " \
> > > > > >
> > > > > >  inherit meson pkgconfig python3native gettext features_check
> > > > > >
> > > > > > +# We can not include rust conditionally, otherwise it can not =
be overriden by
> > > > > > +# the bbappends.  Instead always include it, but remove the de=
pendencies by
> > > > > > +# default.
> > > > > > +inherit rust
> > > > > > +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECO=
NFIG', 'opencl', '', '1', d)}"
> > > > > > +
> > > > >
> > > > > I'd really prefer not to have the rust inherit unconditionally. I=
 have
> > > > > some ideas about how we could fix this in bitbake so we may need =
to
> > > > > wait for that if we can't avoid the PACKAGECONFIG issue from appe=
nds...
> > > >
> > > > Well, it's not just appends. Extending PACKAGECONFIG from local.con=
f
> > > > also doesn't work. In fact even adding "opencl" to the default
> > > > PACKAGECONFIG doesn't work unless I move `inherit
> > > > @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
> > > > `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it ha=
s a
> > > > drawback of including rust unconditionally.
> > >
> > > PACKAGECONFIG:append:pn-mesa =3D " opencl"
> >
> > Yes, I tried that. I got an error about rust tools not being defined.
> > I think the :append: and overrides are handled after the inherit
> > argument is handled. So it is either PACKAGECONFIG being fully defined
> > before inherit (literally before), or inherit ends up with an empty
> > argument.
>
> The append and overrides would be expanded at the time the expression
> in the inherit statement is evaluated so if that didn't work there is
> something else at play...

I did not attempt debugging the bitbake itself. However I can see that
with this line in local.conf, PACKAGECONFIG is updated, but the RUSTC
is not defined (which means that rust.bbclass was not inherited). Then
I tried adding opencl to the default PACKAGECONFIG in mesa.inc. If
inherit comes before PACKAGECONFIG being set, it is not honoured. If
inherit comes after PACKAGECONFIG, it works as expected (and RUSTC
gets defined).

--=20
With best wishes
Dmitry

