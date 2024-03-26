Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F58CC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 10:57:38 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.5889.1711450653567401185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 03:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=AG6GU9Rt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.172, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d6ee81bc87so3269651fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711450652; x=1712055452; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79NK0mGZoRnqTea6TgZTXlByfakU0Os7k5aWphE6PJU=;
        b=AG6GU9RtcnDJXY4cJFUqp/ZQGiB4rtsWMGeoovy2ZsEWm3phb9rd/jfzvJSdg19If2
         kiwBPpao7ve/8rn2DXnhhEmTAob6YN2VV5XfrND/PEfB45b7VXLtPNE1L4qce5AJwNvW
         Q3wz8CYeUZgMoRhFoWfICOmm+TQgg4ux5E7XRODIkFCJlyY+CcnOm4xhDRlr4opwC0/L
         5ripKDkDsTsDWpHw9dXYq+AskGHh4/NecDd9NnHkyPO75iWMAAyePi9NTFPrkuD1fAqd
         vRwW9LWnoetc7dmKG+pCvSvbQc4ru/9nDURRTzjAobQo9LP/tFzjsRAmu+z2eP/GkdU0
         nFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711450652; x=1712055452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79NK0mGZoRnqTea6TgZTXlByfakU0Os7k5aWphE6PJU=;
        b=UB7ImqsvpFP01pwg+20Fui7Mad/FKjjrwLKym8jDeMOCsOSACYn/ggLRYFLvKN5vak
         ssIsprqaGJJh5TdbrRi/kS+WkmUQsY3QDRkb40pQf7KHipJQztTbIaPriFfRj3swbm2t
         njlAgzNtXuA/RQRBkIGpz1eSrfk+9DXMhM13Cobu84APQbIe9dZtwfiVXk4uMGOHH1z3
         eySOA95xhvMFh8F7/f3wsaeg6r8aL99HF1Acas/w7LhyZDXK1a3tUFWhUDQssvlJhk1d
         ++UwiYkjtN6qC5g0wrxD5Su8AfefiO3q91SQAW7uDQ/sSuHiix/+hpXTyicGxRI4rD8n
         myzQ==
X-Gm-Message-State: AOJu0YyESWscnq0ClkUBjUqAMrfWN9pjUKksFwQ8AIpc5vQx/FlIXMA2
	TPKVCKgbPSppSc0gK1baBgnuGgrWwtkuYPbPYh0FhOvNy55mzpHRVx28lYw2MlOEOEtFgocTBSW
	EKS8BAAUx/Xks3/qvrAjRCfHP5jeDEm4Ti8XpIQ==
X-Google-Smtp-Source: AGHT+IH7gG4l4Ep/bqfW1gi06T2hp/u92sP0FuNasW+69ItAnwJK0qkw1egQeM7hkGfXTZjFkFrR+4rJX1yW9N1GIjw=
X-Received: by 2002:a2e:310a:0:b0:2d4:5f50:1fa with SMTP id
 x10-20020a2e310a000000b002d45f5001famr6156548ljx.41.1711450651806; Tue, 26
 Mar 2024 03:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710952928.git.steve@sakoman.com> <c6e4ac2acf35fb2e477799e6faa1cc30feda44c3.1710952928.git.steve@sakoman.com>
 <CAMRc=Mcb+30=f=yK927_TJnPMgJuU7b77+1jHfufcuvaYPWUjQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mcb+30=f=yK927_TJnPMgJuU7b77+1jHfufcuvaYPWUjQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 11:57:21 +0100
Message-ID: <CAMRc=McwibShE+c1Uq0-DKp3Mb=8-+5_2_prji2aKN=Sa6jt2Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 11/12] linux-firmware: upgrade 20231211 -> 20240220
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 10:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197533

On Tue, Mar 26, 2024 at 11:56=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Wed, Mar 20, 2024 at 5:44=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > License-Update: additional files
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit add81ef0299ea5260f9bdc59ffc8f5cc0e74276f)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  ...{linux-firmware_20231211.bb =3D> linux-firmware_20240220.bb} | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb =
=3D> linux-firmware_20240220.bb} (99%)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211=
.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
> > similarity index 99%
> > rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231211.=
bb
> > rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
> > index 3f201d853f..873ba9cdf0 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
> > @@ -134,7 +134,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db=
5ee3f410780e56711ad48eadc22b8bc \
> >                      "
> >  # WHENCE checksum is defined separately to ease overriding it if
> >  # class-devupstream is selected.
> > -WHENCE_CHKSUM  =3D "3113c4ea08e5171555f3bf49eceb5b07"
> > +WHENCE_CHKSUM  =3D "a344e6c28970fc7daafa81c10247aeb6"
> >
> >  # These are not common licenses, set NO_GENERIC_LICENSE for them
> >  # so that the license files will be copied from fetched source
> > @@ -212,7 +212,7 @@ SRC_URI:class-devupstream =3D "git://git.kernel.org=
/pub/scm/linux/kernel/git/firmw
> >  # Pin this to the 20220509 release, override this in local.conf
> >  SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8ca=
e"
> >
> > -SRC_URI[sha256sum] =3D "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e79=
9fa1caab16a9dbe8bb"
> > +SRC_URI[sha256sum] =3D "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f43=
48184199cb02c2bcd7"
> >
> >  inherit allarch
> >
> > --
> > 2.34.1
> >
> >
>
> I already sent a patch upgrading linux-firmware to the most recent tag[1]=
.
>
> Bart
>
> [1] https://lore.kernel.org/all/20240314100610.21815-1-brgl@bgdev.pl/T/

Ah, nevermind, I didn't see this is for dunfell.

Bart

