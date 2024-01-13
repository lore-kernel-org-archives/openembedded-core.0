Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8F2C4707B
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 06:13:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.14696.1705126388965892634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 22:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JHgqwPlh;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2c6d6aea44so233813466b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 22:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705126387; x=1705731187; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe8dTesGie7XjcuXnC3rGayeUw9Z6zXuKBEzK7RfwdI=;
        b=JHgqwPlhFNrnxwJnpqDXV5PgVELkERIBGfiuAVDVrcw2Rd2oLcblf94AO2DXsQOheP
         rbJfaoR2Ol++RhCNppQsr1KAYOnm4PCiYwkaFWQkUrjd8DVpHrh5AM02jN+Pw8/xHEkW
         n5hw/J9GuuYYAY2DT1EVy9mud5ljW6kZTebmWvB7jQ4itBnl7VNrPXzyiOgiO17+9WkK
         w8eWtUhQzeNoU/xA3A9BphJaDGABOJdKHFsxe+f6b1O/ExtOGlcPsjnTBXNrw6VDH+9R
         jMsm7uC7kRhigWqsndy4wbKsojYIW39nBAedoMMEPRZkcdB+jJTPsqqqWsxelbcK3fMC
         cD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705126387; x=1705731187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pe8dTesGie7XjcuXnC3rGayeUw9Z6zXuKBEzK7RfwdI=;
        b=gXfqf1pOI1BQrP41/I4Oqxt2BrN5DmWm2s/UP5208PupyIGFyPEfRN0RB/dz76SqJa
         e4gtv5t2vUxRqO76LyAqe/LSoJOS8w2ohYGT+MtP0dXxZbnPH2UgkchPMtbW/hw5Z8Nh
         vpzCmLjSM2UV/z+vpNn2nkm4FTxE+PERL9RbQOUfF0lTgWP/BLWfbetxzMFbLgyq9hLY
         2lm/S5MXgAlH1IvLobCkCnrjWRSsrL3Jm7D0m7Qh+WyRAmqHwCAGhtFQnUcyWIjZoNVG
         rJM+BAFNmYkXaFCiu79i8lWwArIzNvT/PTjWYTTXDm/JaTsXyDABhIWwL/aHlUj7j+X8
         Zcgw==
X-Gm-Message-State: AOJu0YzQdNEk2vE/gpEeGq4B7vzhYnyUCatAFnHT6OIOOaen1k8ZpnYn
	edOqQj9njh+eAJ4hMtTMdiQ1WffJdydUz3mUd2w=
X-Google-Smtp-Source: AGHT+IGr6S2VdjWSE8jUe15l83p7UmuhZ7V+jPWsSI3s6Fyc/P+TTjI/UoeHR/GacpkPhVpD8I/v8tw/PMgMfr911Tk=
X-Received: by 2002:a17:906:fd55:b0:a2b:efa3:6b25 with SMTP id
 wi21-20020a170906fd5500b00a2befa36b25mr913638ejb.5.1705126387124; Fri, 12 Jan
 2024 22:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org> <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
 <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
 <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com>
 <67deee116e78f2d0695e3cb25b284380465d780c.camel@linuxfoundation.org>
 <CALT56yNT-OZbXqqAPJXJ79ih1u_F3O40qoZJDwnhywjFQM-8ZQ@mail.gmail.com> <9296831d-bc09-4c20-b0c3-e419aef8a232@gmail.com>
In-Reply-To: <9296831d-bc09-4c20-b0c3-e419aef8a232@gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sat, 13 Jan 2024 08:12:55 +0200
Message-ID: <CALT56yN=sT14RdiyHJy2ctcosY_pSG0KdN8vJV25TvwsPOifnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 06:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193600

On Fri, 12 Jan 2024 at 12:21, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2024. 01. 02. 23:57 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
> > On Tue, 2 Jan 2024 at 17:30, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Tue, 2024-01-02 at 17:25 +0200, Dmitry Baryshkov wrote:
> >>> On Tue, 2 Jan 2024 at 13:40, Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>> On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
> >>>>> On Sat, 30 Dec 2023 at 23:02, Richard Purdie
> >>>>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>>> On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> >>>>>>> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>>>>>>
> >>>>>>> Mesa now has two OpenCL implementations: Clover (older one) and R=
ustiCL
> >>>>>>> (newer one). Extend the "opencl" package config to include both
> >>>>>>> implementations into the libopencl-mesa (-dev) packages. As the C=
lover
> >>>>>>> implementation is in maintenance mode and is expected to be remov=
ed at
> >>>>>>> some point, it doesn't make sense to split the packages or to pro=
vide
> >>>>>>> two config options.
> >>>>>>>
> >>>>>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
> >>>>>>> [DB: reworked rust class inheritance]
> >>>>>>> [DB: merged "rusticl" and "clover" back to "opencl"]
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> ---
> >>>>>>>   meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
> >>>>>>>   1 file changed, 16 insertions(+), 5 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-g=
raphics/mesa/mesa.inc
> >>>>>>> index efbce5caade5..a192562a7935 100644
> >>>>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
> >>>>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >>>>>>> @@ -48,6 +48,12 @@ PROVIDES =3D " \
> >>>>>>>
> >>>>>>>   inherit meson pkgconfig python3native gettext features_check
> >>>>>>>
> >>>>>>> +# We can not include rust conditionally, otherwise it can not be=
 overriden by
> >>>>>>> +# the bbappends.  Instead always include it, but remove the depe=
ndencies by
> >>>>>>> +# default.
> >>>>>>> +inherit rust
> >>>>>>> +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONF=
IG', 'opencl', '', '1', d)}"
> >>>>>>> +
> >>>>>> I'd really prefer not to have the rust inherit unconditionally. I =
have
> >>>>>> some ideas about how we could fix this in bitbake so we may need t=
o
> >>>>>> wait for that if we can't avoid the PACKAGECONFIG issue from appen=
ds...
> >>>>> Well, it's not just appends. Extending PACKAGECONFIG from local.con=
f
> >>>>> also doesn't work. In fact even adding "opencl" to the default
> >>>>> PACKAGECONFIG doesn't work unless I move `inherit
> >>>>> @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
> >>>>> `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it ha=
s a
> >>>>> drawback of including rust unconditionally.
> >>>> PACKAGECONFIG:append:pn-mesa =3D " opencl"
> >>> Yes, I tried that. I got an error about rust tools not being defined.
> >>> I think the :append: and overrides are handled after the inherit
> >>> argument is handled. So it is either PACKAGECONFIG being fully define=
d
> >>> before inherit (literally before), or inherit ends up with an empty
> >>> argument.
> >> The append and overrides would be expanded at the time the expression
> >> in the inherit statement is evaluated so if that didn't work there is
> >> something else at play...
> > I did not attempt debugging the bitbake itself. However I can see that
> > with this line in local.conf, PACKAGECONFIG is updated, but the RUSTC
> > is not defined (which means that rust.bbclass was not inherited). Then
> > I tried adding opencl to the default PACKAGECONFIG in mesa.inc. If
> > inherit comes before PACKAGECONFIG being set, it is not honoured. If
> > inherit comes after PACKAGECONFIG, it works as expected (and RUSTC
> > gets defined).
>
> Something like this should work:
>
> inherit ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'rust', '', d)}
>
> E.g. the libxml2 recipe does it, although for a different bbclass.

This way enabling opencl in .bbappend is not honoured.

--=20
With best wishes
Dmitry

