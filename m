Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7091C4707B
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:50:07 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.9515.1704772199901978875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtMFDEW+;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5987a7640adso135587eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 19:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704772199; x=1705376999; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOMPGvG7jNfN46sjfUjwt1m9TYbNwLbDiR4r5nb2cI8=;
        b=MtMFDEW+zoMAjfJ2f7xPPEsJ3c9Nr61slC/rac5Ss4C2Bz+SnIDul7Sf2OHlohKaXJ
         kiVhIqEQNdsjLQwTH0ufj/nyET9NC3ri/1gPuRrrrqc5O/MlCyD5VlnedkXKwHobTqNW
         JmTJn4f5O01nyuMGWns7Bz4ZbpNXRQC+m6IwMz5U7YkspMt8Ubl1UfppUkt0eNKCSYP6
         nFYibViqToTQUCb6JYT9bo7B2QFBKYD3RlFt0mA23JXnYCIzadJbXS0G3dBHxizDRWUO
         7bjhKEP6h6ihgAN3YW9jqWqpe040RzxuWAsdXbTfWNRsUFtlkBn5xh/HhIfXqLUlz4Cv
         XzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704772199; x=1705376999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOMPGvG7jNfN46sjfUjwt1m9TYbNwLbDiR4r5nb2cI8=;
        b=ve29eI14IxcZgvBL6daGlD5DrfXmM0jTu20oeFd8d+wRLZjfSE7H7QKUhdd4wm0/WV
         EkXSHjH51wEy9nQ/2ZO7O6oLl2e11PaH4eCT3Qx50Nj5SA8+eSPQPuOmlh5ZwpcjMVzY
         FAoZ/a8UJfiNxaHVeoKFq2ytoTxK+tANgFBm1qLvM6FHrun7esEobNpeZnausyZGjoRi
         4Wq8kch59O/hEf+IM6wZ2KuTqynEIfVsNRip6VHBWk6luYAwQmImyGKvgnHYLpYhOLc/
         Dg7ZCwl+wNWPGs+b8tlcofGe0xqhReHK5yFlcl8FPG3eb2+K3SHR8JJP20qveUwCIFu1
         WA6g==
X-Gm-Message-State: AOJu0YwKLMMz/yw3pMTWtv8c8lnhXTix6rGIxb1w3ZhEN6oUUKlgiGR/
	Ed9w0YxESkEzJ1fmXD8TDI7nbS3JTGZ6RmnPg0o=
X-Google-Smtp-Source: AGHT+IEAqJ8eDXFpLkL1XmA/+aBQh+BuXuhWfq6Dtad6bY06MkpQc5O5jUAsNNV0Ivd4kMGxFBR6U3ZAyKTvtjyeXDY=
X-Received: by 2002:a05:6870:8189:b0:204:41a5:4ed6 with SMTP id
 k9-20020a056870818900b0020441a54ed6mr2298943oae.15.1704772199167; Mon, 08 Jan
 2024 19:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
 <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com> <62591061a843999d470506252d6044f50ac81228.camel@linuxfoundation.org>
In-Reply-To: <62591061a843999d470506252d6044f50ac81228.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:49:33 -0800
Message-ID: <CAMKF1srS6EfRxA5ZSGAxZ7nLT9=wF2_DoP0EDNhbSWNyRwxhVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] classes/recipes: Switch to use inherit_defer
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 03:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193440

On Mon, Jan 8, 2024 at 2:39=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-01-08 at 17:14 +0000, Ross Burton wrote:
> > On 3 Jan 2024, at 14:59, Richard Purdie via lists.openembedded.org <ric=
hard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > --- a/meta/classes-recipe/gnomebase.bbclass
> > > +++ b/meta/classes-recipe/gnomebase.bbclass
> > > @@ -28,7 +28,7 @@ FILES:${PN} +=3D "${datadir}/application-registry  =
\
> > > FILES:${PN}-doc +=3D "${datadir}/devhelp"
> > >
> > > GNOMEBASEBUILDCLASS ??=3D "meson"
> > > -inherit ${GNOMEBASEBUILDCLASS} pkgconfig
> > > +inherit_defer ${GNOMEBASEBUILDCLASS} pkgconfig
> >
> > Feels like this should be split into inherit pkgconfig and inher_defer =
${GNOMEBASEBUILDCLASS}.
>
> I guess did it this way for ease in the patch, it won't really make
> much difference either way, particularly for pkgconfig given how simple
> that class is.
>
> >
> > > +inherit populate_sdk_base
> > > +IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar("SD=
K_OS")]}"
> >
> > Whilst you=E2=80=99re here change this to foo if bar else flob, this bo=
olean subsetting idiom drives me insane.
>
> I don't really mixing up changes as it just makes review harder so
> whilst I don't mind changing that, I think it should be done
> separately.
>
> > > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > @@ -14,7 +14,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/driver/${BPN=
}-${PV}${XORG_DRIVER_COMPRESSOR
> > > FILES:${PN} +=3D " ${libdir}/xorg/modules/drivers/*.so"
> > >
> > > XORGBUILDCLASS ??=3D "autotools"
> > > -inherit ${XORGBUILDCLASS} pkgconfig features_check
> > > +inherit_defer ${XORGBUILDCLASS} pkgconfig features_check
> >
> > As above.
> >
> > > -inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHE=
RIT} python3native multilib_header
> > > +inherit autotools texinfo binconfig-disabled pkgconfig multilib_head=
er
> > > +inherit_defer ${PYTHON_INHERIT} python3native
> >
> > Why is python3native defered?
>
> In the past there were some ordering issues around the python classes
> so I was just being careful not to cause more problems in the patchset
> than I was already trying to debug. It probably isn't necessary but at
> the time I wasn't 100% sure and there were bigger issues.
>
> I can make the above tweaks if they really bother you...
>

Look into evolution-data-server-native.bb from meta-gnome
it inherits native and provides own default do_compile/do_install functions

it now needs to use
inherit_defer native

which parses but then the functions provided by the recipe are overridden
by ones from autotools class perhaps because it is deferred too ?

> Cheers,
>
> Richard
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193434): https://lists.openembedded.org/g/openembedde=
d-core/message/193434
> Mute This Topic: https://lists.openembedded.org/mt/103502916/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

