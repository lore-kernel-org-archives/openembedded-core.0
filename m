Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191D8C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 21:06:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.83099.1723583165527117413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 14:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScP032D2;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7c1324be8easo190736a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723583165; x=1724187965; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AjCO599rjpZOAdy/OqkZ3COhwVAG3+P7fmKhECItqg=;
        b=ScP032D2gCDzZrixVwdTqp4nFlcE3u1v7+iD0cUULHoHJanGSEHqZpZ3dNvjrG6vVg
         bGBgzzP/2nZxz4MMrvkM3Nosc3aV+mhOl+qy7zx4iGV15csJsQArurtkp9vYz8sKHVOX
         JwBNrX4DRl2+nEI3Ya8xEV+dKXbRhGkxUjp64moM9hCZiGwZk+R0apD1NLpbHed3BXOc
         dzu0j66mM16qlqWJKyYtFEl4LS8Qr+L9cvo+35cXSrvHBxKDdZLkUhgK3+2yXOVkNRBa
         fOmZtEOr7iF/B5C0xz+8+v1v35rY7l00WO9RD8zLn3aHBryivVZvn0aJ1wV71a3Qb79+
         RJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583165; x=1724187965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AjCO599rjpZOAdy/OqkZ3COhwVAG3+P7fmKhECItqg=;
        b=t9FoB0YDV6hP5iXfIzi6HuEyCyq5ldCemZtUuhsmrDfZmcrp3xnVnteBJQkjbbBe0R
         SbqcyjSm8lRDClHfFUQhS/0ux3Ned224Y9K5atTcyJf2Qqad0UrUpWaaedFu7cjBjaKH
         yVOFLc8kHs5rhBWXuYUB7lKFrCF0e0OhAshBrJwWf0C1f95ECqTS2g9hgxJqf8J+esRt
         AOySuXn6zPABECGda71b/096SYT+D6tPzFAchbxa/hLdw97skxnJVW/Npru+m/ATfPSY
         nNyi0cJtFh+POXV4Qd0hPfb4eS5xfgjjpNNHKqMQhoJUTXPEhmfegIVXM6cwxHVl8/I3
         jE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP7ZjfvFNwFn3BVTgT4SPexrZP0gx2N6Ca9kPkwAFpQrDrSzce3IxTBDsQBnbX0zi1hAoDsJVkD0VSXbjcGW0dSuMYQn0JSlguG8Zqt/G4WxFNku0kjCne
X-Gm-Message-State: AOJu0Yy68GBp5cNhJeriHPeRs2pFlopMUdsdhOexZ0XECwlJ3NjbK2V/
	Kc52ICoeg1OdWgMJOgd+B39CCv9LRsM2yy0iE0LWCBbsQbZJXHZnVDb8vY7RURKGS7OazZUpqc6
	cJBLQnywrNL6v4jaH4z+PrWthBR8=
X-Google-Smtp-Source: AGHT+IEWgaJ5i8t44MHrs8ZwFVHBHdBXs07OWQi1fA2RVmLpi502AsHGluGziI56ySL0bodSNuUEkAgdD9E8vqfTpcg=
X-Received: by 2002:a17:90a:d3c2:b0:2c7:d24b:57f with SMTP id
 98e67ed59e1d1-2d394311115mr6259000a91.19.1723583164613; Tue, 13 Aug 2024
 14:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
 <20240813195753.576442-2-bruce.ashfield@gmail.com> <ZrvHMQCZgXQjYCj4@kudzu.us>
 <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
In-Reply-To: <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2024 17:05:49 -0400
Message-ID: <CADkTA4Oq7Xk5oZ5rsgehWDP_TNRpQFMpcZV-h9NcTYQtnGSTLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
To: Jon Mason <jdmason@kudzu.us>
Cc: richard.purdie@linuxfoundation.org, Jon.Mason@arm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 21:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203294

On Tue, Aug 13, 2024 at 5:02=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Tue, Aug 13, 2024 at 4:51=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrot=
e:
> >
> > On Tue, Aug 13, 2024 at 03:57:52PM -0400, bruce.ashfield@gmail.com wrot=
e:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Integrating the following commit(s) to linux-yocto/.:
> > >
> > > 1/1 [
> > >     Author: Bruce Ashfield
> > >     Email: bruce.ashfield@gmail.com
> > >     Subject: genericarm64: drop CONFIG_MTD_NAND_FSL_IFC
> > >     Date: Tue, 13 Aug 2024 15:17:10 -0400
> > >
> > >     We are getting the following warning in recent 6.6+ kernels:
> > >
> > >         WARNING: linux-yocto-6.6.45+git-r0 do_kernel_configcheck: [ke=
rnel config]: specified values did not make it into the kernel's final conf=
iguration:
> > >
> > >         [NOTE]: 'CONFIG_MTD_NAND_FSL_IFC' last val (y) and .config va=
l (n) do not match
> > >         [INFO]: CONFIG_MTD_NAND_FSL_IFC : n
> > >         [INFO]: raw config text:
> > >
> > >             config MTD_NAND_FSL_IFC
> > >                     tristate "Freescale IFC NAND controller"
> > >                     depends on (FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1=
021A || COMPILE_TEST) && HAS_IOMEM && FSL_IFC && MTD_RAW_NAND && MTD
> > >                     help
> > >                       Various Freescale chips e.g P1010, include a NA=
ND Flash machine
> > >                       with built-in hardware ECC capabilities.
> > >                       Enabling this option will enable you to use thi=
s to control
> > >                       external NAND devices.
> > >
> > >             Config 'MTD_NAND_FSL_IFC' has the following Direct depend=
encies (MTD_NAND_FSL_IFC=3Dn):
> > >                     FSL_SOC(undefined/n) || ARCH_LAYERSCAPE(=3Dy) || =
SOC_LS1021A(undefined/n) || COMPILE_TEST(=3Dn) (=3Dy) && HAS_IOMEM(=3Dy) &&=
 FSL_IFC(=3Dn) && MTD_RAW_NAND(=3Dy) && MTD(=3Dy)
> > >             Parent dependencies are:
> > >                  SOC_LS1021A [SOC_LS1021A] MTD [y] ARCH_LAYERSCAPE [y=
] HAS_IOMEM [y] FSL_SOC [FSL_SOC] COMPILE_TEST [n] MTD_RAW_NAND [y] FSL_IFC=
 [n]
> > >         [INFO]: config 'CONFIG_MTD_NAND_FSL_IFC' was set, but it wasn=
't assignable, check (parent) dependencies
> > >
> > >     The most significant missing option that is disabling this config=
 value
> > >     is FSL_SOC, which is only defined in arch/powerpc.
> > >
> > >     As such, there's no sense keeping this option in the genericarm64=
 config
> > >     as it is only enabled via arch/powerpc.
> > >
> > >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ]
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >
> > > Jon,
> > >
> > > Let me know if these seems ok to you.
> >
> > Yes, I just started seeing this in my CI today, but hadn't gotten to lo=
oking at it.
> > A very quick look at the kernel, I see arm64 has ARCH_LAYERSCAPE,
> > which references MTD_NAND_FSL_IFC.  I think this is the actual cause of=
 the desire
> > to have this code.  So, we probably want to keep this in the generic
> > image (as layerscape is what the lx2k/honeycomb platform(s) use).
> > Is there a reason not to enable FSL_IFC in the config?
> >
>
> It depends on FSL_SOC .. which is only enabled via arch/powerpc.

I misread that, yah, FSL_SOC is in the || condition, so isn't the critical =
part.

if you want to enable the missing dependency, then it should also be someth=
ing
resolvable that way.

My changes are already pushed,  so you'll need to send an update that
turns it back on and adds the missing dependency.

My only goal was to get the warning removed. I'm exiting the discussion
and will await patches, since I have no opinion on how to solve it with
respect to arch/arm.

Cheers,

Bruce

>
> >
> >
> > FYI, I'm seeing a config fragment warning (which I've also not gotten
> > around to fixing) with Xen and qemuarm/qemuarm64.
> >
> > WARNING: linux-yocto-6.10.3+git-r0 do_kernel_configcheck: [kernel confi=
g]: This BSP contains fragments with warnings:
> > [INFO]: the following symbols were not found in the active configuratio=
n:
> >      - CONFIG_FB_SYS_FOPS
> >
> > See https://gitlab.com/jonmason00/meta-arm/-/jobs/7574214060
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/7574213986
> >
> > I think this can just be removed, as I don't see it in the kernel
> > anymore.
>
> That''s already fixed in the recent bumps that I've been sending
> Richard.
>
> https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-6.10&id=
=3D107c15b3ee3f07842384208ea021588d589e51ef
>
> Maybe your meta SRCREVS are different ?
>
> Bruce
>
> >
> > Thanks,
> > Jon
> >
> > >
> > > Bruce
> > >
> > >  meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/r=
ecipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > index ae56e8a129..c3b4fc1e9b 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > @@ -15,7 +15,7 @@ python () {
> > >  }
> > >
> > >  SRCREV_machine ?=3D "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
> > > -SRCREV_meta ?=3D "e55e4407942bae43ef8ba463b38e48995b023187"
> > > +SRCREV_meta ?=3D "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > >
> > >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${K=
BRANCH};name=3Dmachine;protocol=3Dhttps \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta=
/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > index b0e4ab71ae..1c8cfd7d74 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > @@ -18,7 +18,7 @@ KMETA =3D "kernel-meta"
> > >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> > >
> > >  SRCREV_machine ?=3D "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > -SRCREV_meta ?=3D "e55e4407942bae43ef8ba463b38e48995b023187"
> > > +SRCREV_meta ?=3D "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > >
> > >  PV =3D "${LINUX_VERSION}+git"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/reci=
pes-kernel/linux/linux-yocto_6.6.bb
> > > index 5688a4b109..948f46621b 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > @@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?=3D "e402da9835bfae267f409a=
48c3a2cb6e231f9d94"
> > >  SRCREV_machine:qemux86-64 ?=3D "e402da9835bfae267f409a48c3a2cb6e231f=
9d94"
> > >  SRCREV_machine:qemumips64 ?=3D "97d2336ea9ce4eac6b30a75b26f33b83827d=
38aa"
> > >  SRCREV_machine ?=3D "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > -SRCREV_meta ?=3D "e55e4407942bae43ef8ba463b38e48995b023187"
> > > +SRCREV_meta ?=3D "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > >
> > >  # set your preferred provider of linux-yocto to 'linux-yocto-upstrea=
m', and you'll
> > >  # get the <version>/base branch, which is pure upstream -stable, and=
 the same
> > > --
> > > 2.39.2
> > >
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

