Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D2BC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:07:29 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.56844.1697814444015344855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+7+Rpkk;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7a694254684so36055939f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697814443; x=1698419243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF/ut8LL+QvGV6W+kxnfN7Tqs+UfRwLSgsCTlx2FxIE=;
        b=i+7+RpkkBiD64zEOxkaD56n2FRONSHUrxi/Umb3rpLuX2Fx4GQ2/yv9VRR68rjJoCv
         yccm9KwDePMlLFEjUOgdetVlN4bz6SsiGsSOHfs+CftMooC/p8m4gZvWLuGVQ16yvSfq
         CiiOCFDUtw3MKn/ST44/i0VXfSq++a5yzlOwdjATl637SbPN+uWfdcoM9avcOcRoIvLX
         VAhNlsguNWGqezVUgcAE000eqJDnFmCiqDETc8AuSjMO2ZpC7BZmmD1KEJ8nX3kYAilZ
         jYux8shOH7Uc2Pn0lbcUruaWgzSFEA7kGD/U27a5PCGTY2HFauq3t6rzybI27NDdLOoW
         riig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697814443; x=1698419243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF/ut8LL+QvGV6W+kxnfN7Tqs+UfRwLSgsCTlx2FxIE=;
        b=Q71cxEOWHSPH2syjP+G8SB4xpoquFQl0ruq4yBmjk+GWFqNhdXPz7AJAiW2dyhD9LE
         xhXSIaA43EEnRy8oxvqhYc0ZE8aMEhl64KshCEZATD5wcpoQxanJc0TiEx+YE40Av9GU
         qNTwM2qRCDh9DmrUHX8kqoa6V7vs4KNmzgsQWZyJmQh4uT9fGqUKAoryzyDLT1pWsXT6
         I2Nnk37yNLgFCOJ+FSOyxhuQOz+6LGcIKoLg9PciWgmiYufkIPdmT2ySt1r4bJuQmJlB
         4y+uK6Pwj1Lk0b0DWWGt5yDbdMFXFocl2MI71luSJL/I4BWYor0lhC/reZvA51w7UGup
         4mAA==
X-Gm-Message-State: AOJu0YxNJAQHI68RoyHfwbEruZAz6fP2g4Y0m8DV7gqONROT4wKPhDkn
	7tfTGtkdEAW6zbJGNnfdydW478Mp+w721sPMIJw=
X-Google-Smtp-Source: AGHT+IHn1HCKHxgn4Ru7jiu/cRgRcl6THJsN1phYMIuLpaKPZ3PoEEsVvqvmyiB7MJaq2VQdeBqwFqV8DvAwIA6rqJM=
X-Received: by 2002:a05:6602:3fcb:b0:7a6:8369:b79f with SMTP id
 fc11-20020a0566023fcb00b007a68369b79fmr2631393iob.19.1697814442899; Fri, 20
 Oct 2023 08:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk> <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
 <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk> <c7ac9c5d66b59e6dfac098ae236847dd7d625a1c.camel@linuxfoundation.org>
 <ea0f9ae6-a9bd-400e-ae08-953055f4e927@prevas.dk> <CADkTA4OBb3Us37Cg3VvpwYDy5dai5Q-_+JAoV7a0KZ-jM8ziOA@mail.gmail.com>
 <1b7ff0faa06fea9773d155f0dc5499302f494156.camel@linuxfoundation.org>
In-Reply-To: <1b7ff0faa06fea9773d155f0dc5499302f494156.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Oct 2023 11:07:11 -0400
Message-ID: <CADkTA4NX2Tbj4roTZMSf=-gnA4FVr0upzOOZ9nZ_W0NTjGCnUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189544

On Fri, Oct 20, 2023 at 10:24=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-10-20 at 08:52 -0400, Bruce Ashfield wrote:
> > On Fri, Oct 20, 2023 at 7:19=E2=80=AFAM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> > >
> > > On 20/10/2023 12.13, Richard Purdie wrote:
> > > > On Fri, 2023-10-20 at 12:03 +0200, Rasmus Villemoes wrote:
> > > > > On 20/10/2023 11.38, Richard Purdie wrote:
> > > > > > On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
> > > > > > > On 19/10/2023 14.48, Richard Purdie wrote:
> > > > >
> > > > > > > > The fact this works suggests perf is ignoring TARGET_CFLAGS=
. Is there
> > > > > > > > anything in the perf build system where we should be passin=
g in cflags
> > > > > > > > we really want used?
> > > > > > >
> > > > > > > Well, IIUC, the normal way TARGET_CFLAGS would take effect is=
 via the
> > > > > > > 'export CFLAGS =3D "${TARGET_CFLAGS}'. But in the perf recipe=
, both
> > > > > > > do_compile and do_install start with
> > > > > > >
> > > > > > >         # Linux kernel build system is expected to do the rig=
ht thing
> > > > > > >         unset CFLAGS
> > > > > > >
> > > > > > > And perf's build system does indeed add lots of flags of its =
own, at
> > > > > > > least for most TUs, but nowhere is any -f(macro/debug/file)-p=
refix being
> > > > > > > set.
> > > > > > >
> > > > > > > So I do think that TARGET_CC_ARCH is the best place for flags=
 that we
> > > > > > > really want used. At least as an initial step, because this i=
s known to
> > > > > > > work when using the security_flags.inc file. Maybe there's so=
me cleaner
> > > > > > > way where we don't unset CFLAGS, but that could be a giant ca=
n of worms.
> > > > > > >
> > > > > > > And yes, a comment should be added. Is something like
> > > > > > >
> > > > > > > # Perf's build system adds its own optimization flags for mos=
t TUs,
> > > > > > > # overriding the flags included here. But for some, perf does=
 not add
> > > > > > > # any -O option, so ensure the distro's chosen optimization g=
ets used
> > > > > > > # for those. Since ${SELECTED_OPTIMIZATION} always includes
> > > > > > > # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, =
this also
> > > > > > > # ensures perf is built with appropriate -f*-prefix-map optio=
ns,
> > > > > > > # avoiding the 'buildpaths' QA warning.
> > > > > > >
> > > > > > > too verbose?
> > > > > >
> > > > > > If it were me I'd probably write:
> > > > > >
> > > > > > # The perf makefile has "unset CFLAGS" as "Linux kernel build s=
ystem is
> > > > > > # expected to do the right thing".
> > > > >
> > > > > It's not the perf makefile, it's right there in our recipe itself=
. I
> > > > > don't think upstream perf is to blame.
> > > >
> > > > Sorry, I misunderstood. I thought this was the perf environment tha=
t
> > > > was doing this so in that case your comment does make much more sen=
se
> > > > than mine.
> > >
> > > OK. Bruce, should I resend?
> >
> > Yes, let's go for a resend with the comment added. If we can avoid even=
 some of
> > the pain wondering about this again .. our future selves will thank us =
:)
> >
> > >
> > > > Out of interest did you see what happens if you allow our CFLAGS in=
 and
> > > > remove that unset?
> > >
> > > I don't think I've tried that, but I've tried a few other things that=
 I
> > > thought would be cleaner but which then exploded, so in the end I
> > > decided that just lifting exactly what the poky distro does should be
> > > safest and have the highest likelyhood of being accepted.
> >
> > This is not directed at Rasmus, but a general comment ..
> >
> > For pretty much anything kernel, and perf has always strongly been in
> > that category, we've always unset everything and allowed the Makefiles
> > (and the nested mess of tests, includes and trickery) to set their own
> > flags. It has saved subtle runtime issues and this is one area that the
> > developers tend to know what they are doing.
>
> For the kernel itself, yes, they do. For userspace binaries, we do in
> general have a good idea of how binaries should be being built and
> we're a bit ahead of the curve on the flags/features that should be
> configured.

And I'm saying that these userspace packages in the kernel are
almost as opinionated as the kernel. I generally trust their options
and don't want to control all aspects of the flags. I certainly don't
want to support them as we climb through the new kernel versions,
so keeping the defaults is a much better option.

>
> > When there's a chance to append, they've give us a variable to do so,
> > that's why we've always used EXTRA_CFLAGS, and that likely is the
> > right place to use here as well. But even then, we shouldn't pass ALL o=
f
> > our flags in there, just what we think needs to be in addition to the
> > perf generated set of CFLAGS.
>
> I'm not entirely convinced of that. Which CFLAGS do we have which would
> be harmful to userspace binaries?
>

Optimization has always been an issue, as have been the include paths
(which chain into how we sync the kernel headers and perf similar /
duplicate headers), even some of the security options have caused
troubles as perf really isn't something you can use in a "secure" way.

Which is why we've always added to the flags, versus controlling
them completely.

> I'm basically saying we should at least investigate this as I'm not
> sure which things we have in CFLAGS would be problematic to userspace
> binaries in general. It may not work and that is fine but I don't think
> perf userspace should be that sensitive to the things we usually have
> set.

I don't see a lot of value in looking at it too much, as we are just
trading one set of issues for another. But I of course can't stop
anyone from looking and suggesting changes, I'll just be asking them
for help when I end up crashing into issues during new kernel
introductions :)

Bruce

>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

