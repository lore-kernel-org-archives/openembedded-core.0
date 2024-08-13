Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31210C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 21:45:46 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.83983.1723585540517657928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 14:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cHfpjGvD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.42, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-493e8ef36b4so2218971137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1723585539; x=1724190339; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b35D/bKybiYelKumG/BscGT/VUpuFmOwtD88UnvtBgw=;
        b=cHfpjGvDXmUi8rmA9MNZamHgHOMNg0LJIrvDDq63fwMgteQsDhGvEaAmV9ng3165Sf
         EpFi7Fk7wdeYVtpEh2VXTxsPDqXxbKJo32tbdOCn1LENAKqRR4F794GAHL4YgaoxzH9J
         OmbL6Jy4GK6DVSsPOHTVllNHgOHNpRZiagyXY343SesyLEBW0oeBSYbSXpU7FzVIps68
         qf1GxRDkUyz3kMC/qiIYswkRUuwU6Ne1xF1rXR14bJcqmgWyj21L4GjFtywSt7F/4Djo
         hWdM17/GaoiJ2rF4DEKRN+xTpFEwQiUMebdw5iuZN7xIoRgbDZXdnkDdMw4wZS0ujjRU
         7uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723585539; x=1724190339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b35D/bKybiYelKumG/BscGT/VUpuFmOwtD88UnvtBgw=;
        b=nhYt6rZHP6yc7JQcuVAeJd8DwKLlhmQI8JKHW7H2AVzWw/5pyJqUHzr2fUSoSRGsnv
         K7M5G9/d1rvf1vQFEaCH2csUe0a888FBh7+wKHvbLkwXhxNooEyHfZ5k2mu+yGaVSrLg
         dFeqofFZcGHRNvNUpOFXvRVZo4DP0HM4qvv0+B3I1Xe0SFNUQPX4jdagBUnskk/q1suG
         F6HCJqP0QRgzNkZrcLZq1PWz02CPiKysQrKpCH8PR7o8c36j7LYs2sbjAvBBHpuqQ7wo
         yYwEmdcWj7Heu83QMIZJ6HpxqxxaAVceHD0BxEPnph+dp1HWQQMzX3gOvb283+ykgBV3
         zTEw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWmVRRb2aZOKxQWAlmpdDIa+GkXIqoyaf1RwkE26JiTsVIOLSU+Q7CCoSaOlAmGORjg3l1wF1rSrc9dQskWPr1Xu5QhpERACgctw4PP7Z3N2gGfcNTm3I
X-Gm-Message-State: AOJu0YxhxD3Ueoo05N86oTmrpJmIQPUq5+9YVOdzR8GCnAAg6pfIU8Vm
	9gpnqmbI+mAgzGxeCqG/aoPH3rMZM7pX+IVKhgLdit/rKMFfSv7tZBlIIGOEP02OwQOA8gnHMKs
	=
X-Google-Smtp-Source: AGHT+IFeA7VAw8xI1tU3zvZsLJacRYeQzPOWXHHMphSqSvttGqxnR0d/rapuyCARhsdcCD7SzKPT9g==
X-Received: by 2002:a05:6102:3ed1:b0:48f:ebf2:14d6 with SMTP id ada2fe7eead31-497598bad3fmr1478510137.6.1723585539297;
        Tue, 13 Aug 2024 14:45:39 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d79076sm374552185a.60.2024.08.13.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:45:39 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:45:37 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, Jon.Mason@arm.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
Message-ID: <ZrvUAceA3PQRD1yn@kudzu.us>
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
 <20240813195753.576442-2-bruce.ashfield@gmail.com>
 <ZrvHMQCZgXQjYCj4@kudzu.us>
 <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 21:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203296

On Tue, Aug 13, 2024 at 05:02:34PM -0400, Bruce Ashfield wrote:
> On Tue, Aug 13, 2024 at 4:51 PM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Tue, Aug 13, 2024 at 03:57:52PM -0400, bruce.ashfield@gmail.com wrote:
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
> > >         WARNING: linux-yocto-6.6.45+git-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
> > >
> > >         [NOTE]: 'CONFIG_MTD_NAND_FSL_IFC' last val (y) and .config val (n) do not match
> > >         [INFO]: CONFIG_MTD_NAND_FSL_IFC : n
> > >         [INFO]: raw config text:
> > >
> > >             config MTD_NAND_FSL_IFC
> > >                     tristate "Freescale IFC NAND controller"
> > >                     depends on (FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST) && HAS_IOMEM && FSL_IFC && MTD_RAW_NAND && MTD
> > >                     help
> > >                       Various Freescale chips e.g P1010, include a NAND Flash machine
> > >                       with built-in hardware ECC capabilities.
> > >                       Enabling this option will enable you to use this to control
> > >                       external NAND devices.
> > >
> > >             Config 'MTD_NAND_FSL_IFC' has the following Direct dependencies (MTD_NAND_FSL_IFC=n):
> > >                     FSL_SOC(undefined/n) || ARCH_LAYERSCAPE(=y) || SOC_LS1021A(undefined/n) || COMPILE_TEST(=n) (=y) && HAS_IOMEM(=y) && FSL_IFC(=n) && MTD_RAW_NAND(=y) && MTD(=y)
> > >             Parent dependencies are:
> > >                  SOC_LS1021A [SOC_LS1021A] MTD [y] ARCH_LAYERSCAPE [y] HAS_IOMEM [y] FSL_SOC [FSL_SOC] COMPILE_TEST [n] MTD_RAW_NAND [y] FSL_IFC [n]
> > >         [INFO]: config 'CONFIG_MTD_NAND_FSL_IFC' was set, but it wasn't assignable, check (parent) dependencies
> > >
> > >     The most significant missing option that is disabling this config value
> > >     is FSL_SOC, which is only defined in arch/powerpc.
> > >
> > >     As such, there's no sense keeping this option in the genericarm64 config
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
> > Yes, I just started seeing this in my CI today, but hadn't gotten to looking at it.
> > A very quick look at the kernel, I see arm64 has ARCH_LAYERSCAPE,
> > which references MTD_NAND_FSL_IFC.  I think this is the actual cause of the desire
> > to have this code.  So, we probably want to keep this in the generic
> > image (as layerscape is what the lx2k/honeycomb platform(s) use).
> > Is there a reason not to enable FSL_IFC in the config?
> >
> 
> It depends on FSL_SOC .. which is only enabled via arch/powerpc.
> 
> >
> >
> > FYI, I'm seeing a config fragment warning (which I've also not gotten
> > around to fixing) with Xen and qemuarm/qemuarm64.
> >
> > WARNING: linux-yocto-6.10.3+git-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:
> > [INFO]: the following symbols were not found in the active configuration:
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
> https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-6.10&id=107c15b3ee3f07842384208ea021588d589e51ef
> 
> Maybe your meta SRCREVS are different ?

It's from this morning, but I do expect it lacks your fixes.  Thanks.

Seems like my CI is unhappy today.  Very convenient that Ross is on holiday, almost as if he planned it that way.

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
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > index ae56e8a129..c3b4fc1e9b 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > @@ -15,7 +15,7 @@ python () {
> > >  }
> > >
> > >  SRCREV_machine ?= "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
> > > -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> > > +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > >
> > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > index b0e4ab71ae..1c8cfd7d74 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > @@ -18,7 +18,7 @@ KMETA = "kernel-meta"
> > >  KCONF_BSP_AUDIT_LEVEL = "2"
> > >
> > >  SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> > > +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > >
> > >  PV = "${LINUX_VERSION}+git"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > index 5688a4b109..948f46621b 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > @@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > >  SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > >  SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
> > >  SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> > > +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > >
> > >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
> > >  # get the <version>/base branch, which is pure upstream -stable, and the same
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
> 

