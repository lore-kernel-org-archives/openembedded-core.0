Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97E5C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 21:41:26 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.3447.1720734077539935986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 14:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDN2KJh7;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d9db222782so800340b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720734077; x=1721338877; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXsZM4PMHw5ncx4XhdgcuBbJ+P5eAo3H034qRXQpoYA=;
        b=IDN2KJh78K10zPS6uspaWPFq9CDSh5ccgj7uwWOPk9gXDILxI0gqfUr/LntRgqzTtw
         UtQYoHYTNFzsZLGvhMxUIlYniKJLCwjbga7touWWkCcN457bedV6mZ3KaHIKgt/ruVVa
         CVp7DVInZh8VGNJZtyOYXpo14CNL/LH7Re8Q23xD1WDqUToZBWRAnCB4oe/Fgrfc0XXX
         h7IlF+f0D9atALDRATWkuLFNmCSq7fdH2d9Ls+0BHxXcxanKLmbWbKRiqgQwKffgtQDM
         Cu6dDr1Df/Jrqk8GnOzd6uP60Ww2b13yQHL3pNOKpc9bKuziQhywvCA3eMjI2Xgqrnfv
         j8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720734077; x=1721338877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXsZM4PMHw5ncx4XhdgcuBbJ+P5eAo3H034qRXQpoYA=;
        b=uvJjlxxGOj0su3h+XHAe+FvzgMkEKokGl/3mKoxRuAuylOg2CsyaglFrJCGlri06Vq
         cq7ifqVKkIFRxnCh+b0p21auIFaya9mVn7zuRv2ODMLz5KFI5czj9KG50uI7u0Ios/4C
         RHYAYqcj7sh6heaeTUHDOP7G4Sp8yqYkXqV3Z/F2hD4HEny+3GEd42dsoJsJ9QRKO+13
         nOzUxOQEjNc76NMiKD+nUPhPuZL+00kr/2YUOEwR/0ezq+avZR/QhMYHcqH4LHN2QFxq
         y5OOdfg6wxteBmbsPqC6rSVI6eSZ84vxK1OMlHU+ND8gAWMWNcaw1LiLOsB17uov7VeK
         hXDg==
X-Forwarded-Encrypted: i=1; AJvYcCWeALiELalqyVMGIK24EDdVzBEOMhKEjvnxmRmyU1HoRCJZWs+VZE1HMwCxOuTA0OrQXEQNXzDQbPss8aPLGw/uqkaJ3yfbgVl7f2DBkh2MrugUufuD1+G5
X-Gm-Message-State: AOJu0YzwJo/+sZoYbrnXVQtZfgdHBJHZhMKFhEjCRl0UTLno/5bRy/CO
	EJayUbe7h25z+vIG8wfMcnpMAB0tJoyB6abRpqMZ3JFN34W3D709mxgmWQIPp27ssEUFPZ5vbpf
	58sFZ/EseaL7Tncjzdda6NiNffug=
X-Google-Smtp-Source: AGHT+IHqVe6jjEBRkACxOdZWMGcR31M/GMWABR2b1+BQsXEvInI9Q2rorsAWw6gfOEWX787CvUl68W+gH1uqS+pZlSc=
X-Received: by 2002:a05:6870:224e:b0:254:c512:88de with SMTP id
 586e51a60fabf-25eaeca2614mr7714231fac.59.1720734076634; Thu, 11 Jul 2024
 14:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240711093045.1166613-1-richard.purdie@linuxfoundation.org>
 <60E368D9-15B3-430C-800B-14BEF1E4614B@arm.com> <f10ae72f4cd1e0f1b69e362773ec6c92fa4ffa27.camel@linuxfoundation.org>
In-Reply-To: <f10ae72f4cd1e0f1b69e362773ec6c92fa4ffa27.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2024 14:40:49 -0700
Message-ID: <CAMKF1sr=oBDp0_1EE+AXPVenj0xDRBcOx-1Tc5dndRc2R=M1DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distro/include: Add yocto-space-optimize,
 disabling debugging for large components
To: richard.purdie@linuxfoundation.org
Cc: ross.burton@arm.com, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 21:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201794

On Thu, Jul 11, 2024 at 6:35=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Thu, 2024-07-11 at 12:10 +0000, Ross Burton via lists.openembedded.org=
 wrote:
> > On 11 Jul 2024, at 10:30, Richard Purdie via lists.openembedded.org <ri=
chard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > >
> > > +DEBUG_FLAGS:remove:pn-llvm =3D "-g"
> > > +DEBUG_FLAGS:remove:pn-qemu =3D "-g"
> > > +DEBUG_FLAGS:remove:pn-openssl =3D "-g=E2=80=9D
> >
> > This would be difficult to undo if the user did actually want debug sym=
bols, right?
> >
> > This :removes -g (so you can=E2=80=99t :append it back) from the target=
 flags:
> >
> > DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}=
"
> > FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
> > DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_FLAGS} -pipe"
> > SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', =
'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}=E2=80=9D
> > TARGET_CFLAGS =3D "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}=E2=80=9D
> >
> > So with this there=E2=80=99s no obvious way to get symbols for target l=
lvm/qemu/openssl, setting DEBUG_BUILD=3D1 still won=E2=80=99t actually pass=
 -g. The user would have to know to do eg CFLAGS +=3D =E2=80=9C-g=E2=80=9D.
> >
> > I=E2=80=99ll note that webkitgtk3 has approached this problem already a=
nd settled on this:
> >
> > DEBUG_FLAGS:append =3D "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', =
d)}"
> >
> > So -g1 (minimal but functional debugging info) unless DEBUG_BUILD enabl=
ed.
> >
> > I=E2=80=99m fairly against removing _all_ debug symbols for these recip=
es in default builds, although I=E2=80=99d certainly be happy with -g1 as a=
 compromise between space saving and utility.
>
> I agree that the remove is too hard to undo so we can't use this
> approach. We probably need to parameterise it in DEBUG_FLAGS since
> we're likely to need to do this more frequently.
>
> I do still think we should drop -g entirely for llvm though as the
> debug info is just too large even at -g1. I'm particularly keen to keep
> the package sizes down which keeps the sstate object size down too,
> making builds from sstate better over the network.

we can do an append instead and effects will be same
DEBUG_FLAGS:append =3D "-g1"
would add it after -g and -g1 will be effective.

Secondly, it might make sense to do it directly in concerned recipes.


>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201781): https://lists.openembedded.org/g/openembedde=
d-core/message/201781
> Mute This Topic: https://lists.openembedded.org/mt/107159573/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

