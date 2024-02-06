Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63725C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:27 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.8328.1707262642236265897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 15:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lVGA5fjU;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21946b0f3f1so49259fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707262641; x=1707867441; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj9UtZSIcOjM0ifzWKYSF3C2/PDmaSi58rY+FwDOwcY=;
        b=lVGA5fjUbibEDoxdAInmv9nlt8ZmQxYUkntvzcJKOhrrtPKTqv9YUQaEbpCd8pbK/M
         iw2732/YQANbgZVFmtigsNBQ9Nb/3dXFgJAfwse6MHINrKch8XshjqAxFNf1FvgJBCF9
         dJPgVkd0LUPBoWcqobX0Kj+/jSrrgafPe9R5nyYIOnGR43nKximmxeZ+/H010ewXanWK
         hbm9zeM4iPMo9LK1NJYoXSTJvEaZEtDa4xWxj9zoer4aJQCSWvokFKXYGQOPL9xpTGMn
         iWEzGr4kRIlT2rzj1/Jc72D9ut9iKBuEq1ruD++AOlcXEAMHnHyv1D+UZOm0B0htFe8h
         d/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707262641; x=1707867441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj9UtZSIcOjM0ifzWKYSF3C2/PDmaSi58rY+FwDOwcY=;
        b=l0hQnXyhS3vkJgyQvZjZFdpzIGWGtxHUymigC5Blq8TpJ2ePTO6cvFY0atGqHaXxH6
         +joOzTchXzK8Asr4W9TI5ucqSDrq3MnFzNr+wbMBKkcIMFbNrkaNnh958NHom4d4AOoS
         ahUk2YKKvbgnkDGfrXJGicOKbiwhc/v7+yFCSeWyi/wKhLN7dx6KEvCz9+Oh1fWf7zzl
         xnQ3fp/5lNr2ftbWGkxtXAVJCDTMP5PrkhXVY+EO7Pz87AlIdJfjdiFB6LbYL9QJkb9m
         +3vGb4IJ75gJUnhWQjXTSHZiQB4kjMLqWKBg9wT2IHQBOvpYgoYFiUT9yf6RaOToUXJy
         Rq6Q==
X-Gm-Message-State: AOJu0YxxpMlJubtoPl5ur6oPGaVhFTfEZc8wi7oqISa8Ctz4ELEEcCMA
	sLvgnm6VeRN9od6rv8XF+v9Sv8Eism2JUPJ9ah150BC56xA3fXxMDqvl+olyKLC8aftI2SPz94v
	YSsMAzPPwGbtvqtZKeDzr5Ukuruw=
X-Google-Smtp-Source: AGHT+IH36hsMY6SuskUqxVsoeY372euXeg9rvcm+xrA5pUm/GZ4Yxz25OxUF69Wf5d42uxwwzRFHofYL2fg39Vt6/vc=
X-Received: by 2002:a05:6870:4706:b0:219:953a:61c with SMTP id
 b6-20020a056870470600b00219953a061cmr4822627oaq.44.1707262641424; Tue, 06 Feb
 2024 15:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20240206184941.748116-1-raj.khem@gmail.com> <CADkTA4PBvG6GS33KpYpJxeDJjHMLqZo3P6b-VGrR2f408oKGqQ@mail.gmail.com>
In-Reply-To: <CADkTA4PBvG6GS33KpYpJxeDJjHMLqZo3P6b-VGrR2f408oKGqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Feb 2024 15:36:55 -0800
Message-ID: <CAMKF1srimk024rKh=sXoR9WjVF1+DkNeeeaq=RJf1RJtxJNS3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] kernel-devsrc: Add needed fixes for 6.1+
 kernel build on target on RISCV
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 23:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195036

On Tue, Feb 6, 2024 at 3:27=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> On Tue, Feb 6, 2024 at 1:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/kernel-devsrc.bb | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-=
kernel/linux/kernel-devsrc.bb
> > index 9c3c09e7144..07a20feb8ef 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -224,10 +224,16 @@ do_install() {
> >         if [ "${ARCH}" =3D "riscv" ]; then
> >              cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $ke=
rneldir/build/
> >              cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/b=
uild/
> > +                 # v6.1+
> > +                 cp -a --parents arch/riscv/kernel/asm-offsets.c $kern=
eldir/build/
> >              if [ -e arch/riscv/kernel/vdso/gen_vdso_offsets.sh ]; then
> >                      cp -a --parents arch/riscv/kernel/vdso/gen_vdso_of=
fsets.sh $kerneldir/build/
> >              fi
> > -           cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ =
2>/dev/null || :
> > +                 cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/b=
uild/ 2>/dev/null || :
>
> I'm just off a flight and running on very little sleep, but I can't
> tell what changed in the line
> above here.  Is it whitespace ?

yeah. There seems to be all kinds of tabs and space mix in there.

>
> > +            if [ -e arch/riscv/kernel/compat_vdso/gen_compat_vdso_offs=
ets.sh ]; then
> > +                    cp -a --parents arch/riscv/kernel/compat_vdso/gen_=
compat_vdso_offsets.sh $kerneldir/build/
> > +            fi
>
> I realize I have a mix of conditionals and ||: in the file, but we've
> been doing most of
> the new additions without conditionals. Would the
> gen_compat_vdso_offsets.sh copy
> work in that style ?
>
> i.e.   cp -a --parents
> arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
> $kerneldir/build/2>/dev/null || :
>

Yeah that would work too. Infact. I have just put it as defence
against older kernels where this file may not exist but
perhaps 6.x onwards it will always exist so we can get rid of this
conditional check completely.

> Bruce
>
> > +                 cp -a --parents arch/riscv/kernel/compat_vdso/* $kern=
eldir/build/ 2>/dev/null || :
> >         fi
> >
> >         # include the machine specific headers for ARM variants, if ava=
ilable.
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195016): https://lists.openembedded.org/g/openembed=
ded-core/message/195016
> > Mute This Topic: https://lists.openembedded.org/mt/104203996/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

