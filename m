Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11CBC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 21:02:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.83026.1723582970342062666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 14:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJ8+iUOK;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-710e39961f4so2474224b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723582970; x=1724187770; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHNHItowKg5deIQ4Q0Wx6odNgxt9gyJv49zrUGeWwy8=;
        b=bJ8+iUOKW6S3QR3SPULm3wWSJ0zWPaW/4B8yr5lDE1T7snltznOVzvD4xemSsPbu/B
         s2kGk0prdM2d6IWpiXWsJ0MijaX5D7OC+jRH7cMk31RWJ0wlOi7bXT7kylTUE+Z66el8
         Dv7TMqJf/67+2DbFidHuek5GqQensoLYmmlDfkMArjymTAbjXMv4kqswiMcATQ55QIQo
         tVyy+dmQhR3B+cL3ysi5hVhyBwJazD5sAcCwg9SA/l8hmHgcIOjG3/BR2aLen3QNG8z1
         r3kKqyNCgxCEREeQh3LxReGZv9/5MPFoNJY0fhVXKKGN/Yhftcajrrvhh8M1VRLKxQKE
         2WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723582970; x=1724187770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHNHItowKg5deIQ4Q0Wx6odNgxt9gyJv49zrUGeWwy8=;
        b=dbGeW+/VmIoPfeSIqjJ6C8ROAQBkWtEGb1iNEg+qK05nQgOg3qXjwPi0PcbPvQ2MqU
         Np2DgTA6yYG+17Mp3C8ay4kTXIeV8tR4ekYHnxZ/hD8xgHolE4aDFT8s2ekGs0N4Qd3H
         cRx8VgXSs1+EHw3TFhuH1OIzm5jmTjILT1tBrJlJFPJoZLVhFDMzXyEy6GxSpQHOHk1B
         OO+mbHusog/4NSs740cco27V6N1euZJ3TnJ1pfTX8ewiPabqPXe+0wt0UOjGcPgPNfk6
         2iYp7VQrN2yppluzuTJweOHhXjM7jcxHPvg1WnMS8H3RTa01Q/d/FsWI3xx0ner4+SXD
         9HQw==
X-Forwarded-Encrypted: i=1; AJvYcCX5CEe/SO20kasgv2Zfl03eUkY8IO7hcHOvCngWry0wxGXBVCh0v5KmNsrmWIA5a+rdJTYHFP48/v7MI831zUW/blcRgPtl+EQl5pZl2mE0j7wu+KSa010T
X-Gm-Message-State: AOJu0YygVTLaj9EIBCiqX7eOilQ6RCC/maETM5XwQZwa0p86hcU9Hr6w
	30WPtiJG+5Y9CVFVr4t97baEAjfT3cCO/830pCBqvCt1MXL00FProw0boyUamu0figWV9MKyTkn
	AugUs57IKij1rXYSgLe5qfvwnomWAB2rWfw4=
X-Google-Smtp-Source: AGHT+IHFtOBKZDHvUYD9s/feIleA9pZmzWNJkuQdQDQXRU2Bi82EpK5NGHLyDLEzoAizOVZubj+0MuCDajAq1QmvRlw=
X-Received: by 2002:a05:6a21:e94:b0:1c4:c879:b77f with SMTP id
 adf61e73a8af0-1c8eae97a13mr1013741637.27.1723582969378; Tue, 13 Aug 2024
 14:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
 <20240813195753.576442-2-bruce.ashfield@gmail.com> <ZrvHMQCZgXQjYCj4@kudzu.us>
In-Reply-To: <ZrvHMQCZgXQjYCj4@kudzu.us>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2024 17:02:34 -0400
Message-ID: <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
To: Jon Mason <jdmason@kudzu.us>
Cc: richard.purdie@linuxfoundation.org, Jon.Mason@arm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 21:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203293

On Tue, Aug 13, 2024 at 4:51=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Aug 13, 2024 at 03:57:52PM -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/.:
> >
> > 1/1 [
> >     Author: Bruce Ashfield
> >     Email: bruce.ashfield@gmail.com
> >     Subject: genericarm64: drop CONFIG_MTD_NAND_FSL_IFC
> >     Date: Tue, 13 Aug 2024 15:17:10 -0400
> >
> >     We are getting the following warning in recent 6.6+ kernels:
> >
> >         WARNING: linux-yocto-6.6.45+git-r0 do_kernel_configcheck: [kern=
el config]: specified values did not make it into the kernel's final config=
uration:
> >
> >         [NOTE]: 'CONFIG_MTD_NAND_FSL_IFC' last val (y) and .config val =
(n) do not match
> >         [INFO]: CONFIG_MTD_NAND_FSL_IFC : n
> >         [INFO]: raw config text:
> >
> >             config MTD_NAND_FSL_IFC
> >                     tristate "Freescale IFC NAND controller"
> >                     depends on (FSL_SOC || ARCH_LAYERSCAPE || SOC_LS102=
1A || COMPILE_TEST) && HAS_IOMEM && FSL_IFC && MTD_RAW_NAND && MTD
> >                     help
> >                       Various Freescale chips e.g P1010, include a NAND=
 Flash machine
> >                       with built-in hardware ECC capabilities.
> >                       Enabling this option will enable you to use this =
to control
> >                       external NAND devices.
> >
> >             Config 'MTD_NAND_FSL_IFC' has the following Direct dependen=
cies (MTD_NAND_FSL_IFC=3Dn):
> >                     FSL_SOC(undefined/n) || ARCH_LAYERSCAPE(=3Dy) || SO=
C_LS1021A(undefined/n) || COMPILE_TEST(=3Dn) (=3Dy) && HAS_IOMEM(=3Dy) && F=
SL_IFC(=3Dn) && MTD_RAW_NAND(=3Dy) && MTD(=3Dy)
> >             Parent dependencies are:
> >                  SOC_LS1021A [SOC_LS1021A] MTD [y] ARCH_LAYERSCAPE [y] =
HAS_IOMEM [y] FSL_SOC [FSL_SOC] COMPILE_TEST [n] MTD_RAW_NAND [y] FSL_IFC [=
n]
> >         [INFO]: config 'CONFIG_MTD_NAND_FSL_IFC' was set, but it wasn't=
 assignable, check (parent) dependencies
> >
> >     The most significant missing option that is disabling this config v=
alue
> >     is FSL_SOC, which is only defined in arch/powerpc.
> >
> >     As such, there's no sense keeping this option in the genericarm64 c=
onfig
> >     as it is only enabled via arch/powerpc.
> >
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > Jon,
> >
> > Let me know if these seems ok to you.
>
> Yes, I just started seeing this in my CI today, but hadn't gotten to look=
ing at it.
> A very quick look at the kernel, I see arm64 has ARCH_LAYERSCAPE,
> which references MTD_NAND_FSL_IFC.  I think this is the actual cause of t=
he desire
> to have this code.  So, we probably want to keep this in the generic
> image (as layerscape is what the lx2k/honeycomb platform(s) use).
> Is there a reason not to enable FSL_IFC in the config?
>

It depends on FSL_SOC .. which is only enabled via arch/powerpc.

>
>
> FYI, I'm seeing a config fragment warning (which I've also not gotten
> around to fixing) with Xen and qemuarm/qemuarm64.
>
> WARNING: linux-yocto-6.10.3+git-r0 do_kernel_configcheck: [kernel config]=
: This BSP contains fragments with warnings:
> [INFO]: the following symbols were not found in the active configuration:
>      - CONFIG_FB_SYS_FOPS
>
> See https://gitlab.com/jonmason00/meta-arm/-/jobs/7574214060
> https://gitlab.com/jonmason00/meta-arm/-/jobs/7574213986
>
> I think this can just be removed, as I don't see it in the kernel
> anymore.

That''s already fixed in the recent bumps that I've been sending
Richard.

https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-6.10&id=
=3D107c15b3ee3f07842384208ea021588d589e51ef

Maybe your meta SRCREVS are different ?

Bruce

>
> Thanks,
> Jon
>
> >
> > Bruce
> >
> >  meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-rt_6.6.bb
> > index ae56e8a129..c3b4fc1e9b 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > @@ -15,7 +15,7 @@ python () {
> >  }
> >
> >  SRCREV_machine ?=3D "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
> > -SRCREV_meta ?=3D "e55e4407942bae43ef8ba463b38e48995b023187"
> > +SRCREV_meta ?=3D "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> >
> >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBR=
ANCH};name=3Dmachine;protocol=3Dhttps \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/r=
ecipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > index b0e4ab71ae..1c8cfd7d74 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > @@ -18,7 +18,7 @@ KMETA =3D "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> >
> >  SRCREV_machine ?=3D "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > -SRCREV_meta ?=3D "e55e4407942bae43ef8ba463b38e48995b023187"
> > +SRCREV_meta ?=3D "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipe=
s-kernel/linux/linux-yocto_6.6.bb
> > index 5688a4b109..948f46621b 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > @@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?=3D "e402da9835bfae267f409a48=
c3a2cb6e231f9d94"
> >  SRCREV_machine:qemux86-64 ?=3D "e402da9835bfae267f409a48c3a2cb6e231f9d=
94"
> >  SRCREV_machine:qemumips64 ?=3D "97d2336ea9ce4eac6b30a75b26f33b83827d38=
aa"
> >  SRCREV_machine ?=3D "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > -SRCREV_meta ?=3D "e55e4407942bae43ef8ba463b38e48995b023187"
> > +SRCREV_meta ?=3D "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream'=
, and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and t=
he same
> > --
> > 2.39.2
> >
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

