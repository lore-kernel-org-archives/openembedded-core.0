Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647CCC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 08:43:05 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.18657.1701420176463581589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 00:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgDV4f0j;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b88c29a995so168267b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701420176; x=1702024976; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVVDH9qFYEIeqfYPoaM1FPlpBgU8t3qSFmeE8DbNGsI=;
        b=SgDV4f0jl63IBvMT2ZtJ0x4XX40tBBf8gVK0q1I1CEuiXKXhVacbGsXbcTuwW6SLLg
         1WHYkGXpw2lM+BRYqxcHqvSuZ2r9Q+rCISJKRF2GGzgObVa6lWlwtiBXnGbSzhfAUHme
         n9/RBj8tJZYkxcfJ/YXbIRt17QMd+5Z6yrHofk+tc4BRVGqFYDNMYgplpt2KzDPH85uF
         khU0caY5fkvyfVoSgJrap+QBRjchcfGG9YUShaJh7O+R7iz6AbVh5rhI3i54uCPW2WG+
         Qf5FJrYkT+rBt5ieodFBAZQ1+6KW/rQiTvtbHzk7ouAscofrvB/8IHUed3lApkVC5P7h
         K/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701420176; x=1702024976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVVDH9qFYEIeqfYPoaM1FPlpBgU8t3qSFmeE8DbNGsI=;
        b=w3h3IF0BeWyUBZr104Ruw0U6XSDYmQv5+ejj0dCwQkyc1BHniLLKF82YmpzqB1kySy
         UrE/p2V3g8hoAKGu6mWy0pAnr0BdLBvXJ8qX6hhH9BPe8LBrahzRpMOFL+zxw+D8yn1d
         Rk4/sutarUurxghqGVAy0BUq7yQse5/FA3M49wytt3iDUoDUKiuyWuArVG7uyVHkIxhr
         zVEXDmsyLzwYxlEJ8UXKI55kT/OkQ7opfDIyA8ZiMvpkoVGUlp1lRW0S3cmZJipiz0zv
         EA7zN+cn1Htrh1UACfl3F6FTOMGLpknRYacZhhGazhVPihkehRzXF1Eyb9D7/FKPcaiH
         j1gQ==
X-Gm-Message-State: AOJu0YwII4q4T8kmBamFANjL2Bsom2/w0TZj9MrKUDj/ZPmBoq+36VC3
	pPXdH9jnUDdZ9gM5v8yQEWi5WJ4Jpff6u/inIzE=
X-Google-Smtp-Source: AGHT+IG0ZQ21i7ozW4TR4iMNOT3Z/agsCLnhNjlU9xy5uh6zpDA+o8Ma7vQdwAnseGCVbQJChFn6ntkdqAv603gKnWE=
X-Received: by 2002:a05:6870:6c19:b0:1fa:f81d:2402 with SMTP id
 na25-20020a0568706c1900b001faf81d2402mr147059oab.12.1701420175643; Fri, 01
 Dec 2023 00:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20231128000701.3180126-1-raj.khem@gmail.com> <2023120107480246bc6385@mail.local>
In-Reply-To: <2023120107480246bc6385@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2023 00:42:29 -0800
Message-ID: <CAMKF1srr3AkHo50JYVp5Yn8swTpnKgwPn_X6gkUGYDR1j9xpWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v11] vte: Separate out gtk4 pieces of vte into
 individual packages
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 08:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191562

On Thu, Nov 30, 2023 at 11:48=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Khem,
>
> The vte upgrade causes librsvg to fail on qemux86-64-x32:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8077/st=
eps/11/logs/stdio
>

I think it could be that os and libc are not computed correctly for rust on=
 x32
Can you try this patch on top of these three.

https://snips.sh/f/WuMM_2WYXh

> I'm not sure how and I was suspecting other rust changes but I confirmed
> this is the 3 patches series as this one was successful:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8083
>
>
> On 27/11/2023 16:07:01-0800, Khem Raj wrote:
> > This avoids adding gtk4 dependencies when image may only desire the gtk=
3
> > pieces of vte.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > ---
> > v11: Package Vte-3.91.gir into ${PN}-gtk4-dev
> >
> >  meta/recipes-support/vte/vte_0.74.1.bb | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-supp=
ort/vte/vte_0.74.1.bb
> > index 8a7054a13cd..071f6684644 100644
> > --- a/meta/recipes-support/vte/vte_0.74.1.bb
> > +++ b/meta/recipes-support/vte/vte_0.74.1.bb
> > @@ -36,7 +36,16 @@ PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfals=
e,gtk4"
> >  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
> >  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,syste=
md"
> >
> > -PACKAGES =3D+ "libvte ${PN}-prompt"
> > +PACKAGES =3D+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prom=
pt"
> > +FILES:libvte-gtk4 =3D "${libdir}/lib*gtk4.so.* ${libdir}/girepository-=
1.0/Vte-3.91.typelib"
> > +FILES:${PN}-gtk4 =3D"${bindir}/vte-2.91-gtk4"
> > +FILES:${PN}-gtk4-dev =3D "${libdir}/lib*gtk4.so \
> > +                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
> > +                        ${datadir}/gir-1.0/Vte-3.91.gir \
> > +                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
> > +                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
> > +                        ${includedir}/vte-2.91-gtk4 \
> > +                        "
> >  FILES:${PN} +=3D"${systemd_user_unitdir}"
> >  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
> >  FILES:${PN}-prompt =3D " \
> > --
> > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191330): https://lists.openembedded.org/g/openembed=
ded-core/message/191330
> > Mute This Topic: https://lists.openembedded.org/mt/102841833/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

