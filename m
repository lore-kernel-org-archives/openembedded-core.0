Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9968C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 03:26:47 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.1697.1715225204333559969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 20:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JFRQwbqm;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-23f9c2f1df6so253083fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 20:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715225203; x=1715830003; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWVbxTyycXqRO2BVnoJf0V6cqa6hBTql3bm/hBiJIXs=;
        b=JFRQwbqm8oL3cMC/tUfl2SROOKahY5iGcWVCdCeLfV+/SL7sduhh5aO7Sko4GMCjjT
         Kc7uSzcimGYsp2CjesBiUROlyA7NEeAouiZK7Wawyu9XfrTnDvgubhnmE5Xhz70nT+jY
         o3Za6UKTxKgFqNdDEIWoesarxjTv/Sx2HUdzgRVIKtgO9EV6hr3r30z2QXHsLUUEK7IX
         KcuzUvl07FzV/BjLEF2V2l6HFOwHYRaPCkvJVubfHGZyOGVvuWDu3prxT2XP5Fvgo0XP
         ZPITnPHKFeTWMJDlrcbiaqbmzbYXXLK5vsKFfMVnjKJRSRG5V1jmJU4eoleTPFnMjsWB
         SS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715225203; x=1715830003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWVbxTyycXqRO2BVnoJf0V6cqa6hBTql3bm/hBiJIXs=;
        b=FEjtMQVIuZxp81Pa52KlFwrLmm+GpsERbP47g2lzNPjw9ZQ0K+NTV5C4W7/t+RsnRS
         cvaeO/84tKR168CItdfyNLnqAaEQuE+3j8OtaqxRNKjok6UTqtvY2dz6OlGV8LoAFv0z
         gKZFmZnDbYET0pwji7AZjdLMk5EemdP66U7hNVGCojySDIvKORrrp+pq3Tb3Kx9tKoo1
         4Sywo8oWht0+vXOCZBGMeFwAQOORvAdhymEuoNUYXfx00nad14wZGJtKSM87J7H7wjKi
         qAp05hzf3v4I1b0geWeNcHCSlYk74biurqGXogY+amjtJoItT7+zsBf6rBvxb1keJW2B
         rnGQ==
X-Gm-Message-State: AOJu0YzPWIBmN9g3SPfByjrKhP6OnlXTsh9Ry80/jC30Il3veei7HOA8
	0ntUVX7qVarxRZCmEkCEoxO8owrFMcAdIKemiKNxkYqKjSxbGmfihclxfijkG2i2Qd3/OU3ptgt
	uV6R44miUMyPlO60FG1fPEczlFoKBnLejMIQ=
X-Google-Smtp-Source: AGHT+IE09UOOlWZhwPoyYdVBYmbwknWTVxTVgN3t7hS2C3UqBbiWLBUkWbnwq8FhygotrjKvnJ7+mA8YGyHdbb3erRE=
X-Received: by 2002:a05:6870:a113:b0:23b:f2d0:7b9c with SMTP id
 586e51a60fabf-24097c704admr5064097fac.24.1715225203490; Wed, 08 May 2024
 20:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240509012206.517279-1-raj.khem@gmail.com> <CADkTA4PtK4TvaqpO=0wZMjG78QTygojrDO7S33sTbb4M_ZPiLw@mail.gmail.com>
In-Reply-To: <CADkTA4PtK4TvaqpO=0wZMjG78QTygojrDO7S33sTbb4M_ZPiLw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 May 2024 20:26:17 -0700
Message-ID: <CAMKF1sph6-bJ1UMEaJdfeMKgLsmUDS-WGdCcJtOhg0rb=cwewA@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Enable team net driver
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 03:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199138

On Wed, May 8, 2024 at 8:16=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> On Wed, May 8, 2024 at 9:22=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipe=
s-kernel/linux/linux-yocto_6.6.bb
> > index 71bfbf9e032..4503ec94ae9 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > @@ -66,6 +66,7 @@ KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc c=
fg/paravirt_kvm.scc"
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx=
32", " cfg/x32.scc", "", d)}"
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", ""=
, d)}"
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
>
> We are getting quite a few of these now and that isn't a problem. But
> I think we should
> probably start putting comments above the enable lines so casual users
> will know why
> the various fragments are being enabled.
>
> For example, I don't really know what the team driver is, and why
> ptest needs it!

when we expand ptests for more than core layer, then certain packages
e.g. libteam in meta-oe [1] this config option is needed to be
enabled.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3Ddf35bef3ae6=
411900efdfc3ea5ade23820e9af2f

>
> Bruce
>
> > +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/net/team/team.scc", "", d)}"
> >  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
> >  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
> >  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc=
"
> > --
> > 2.45.0
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

