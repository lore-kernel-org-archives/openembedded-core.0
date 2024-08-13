Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEB5C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 21:39:36 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.83842.1723585156023533052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 14:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=KWctK1dB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.45, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-84118fa2af4so1875411241.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 14:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1723585155; x=1724189955; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exj+ryxZr99GNo51WUc5S4TvKqIkJExg6UwnnC+cX88=;
        b=KWctK1dBryVhhdhQvcFuP0ORq9sGusvxeQuEuzTH4NC3dTRsXjq9xfXoGIT4NY++kV
         eUi6RulKLGPwYP3JRleopV0+h0SWhRCXpMuaSeITQWVX0dumemYr3Ei1F8LF0lGXhgcZ
         J6tvnq49vEtQ9HLO9/mS3dOB+9D8hmUpD08v1GtfayuLrwuoNvmqAgTZXeCtx+yMk7v9
         RAeWUYNEVbkTjR8k5FEyIcQCLi3IkbGgTiyNi3zCRcIcjU6s0VnG7XxiuyiuY6dcRWn9
         bPd9V6Wh12Ps3kj7SEkfAB2yAmsNPk2C1udJb1lw8of7HVQaNke3x/d+hYSlHMnLCwyR
         Lnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723585155; x=1724189955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exj+ryxZr99GNo51WUc5S4TvKqIkJExg6UwnnC+cX88=;
        b=giJhXu4OaFN7O6F8a7PR6qzIevQkcfx8M551rgwszX4sWTfrwoShAYId3qoNWwVRNF
         jtsWYfVFLv1Wa/YDTCS6+XC2/9DhPkXpgjxzCoW0MiAjL2rHljrW/nazLnQCInjzmKqC
         pddHDd8OvCIphf4CqclHHf5o4Gi9rX9ZIFAQTP5K5VaDpfw7of3MVuu0+VZnwGev2Y1S
         wcNOdnPuy90DV02ogLoxaWiNrPg1VDcbW2FXD+zteUsKTskzo3rpjPctz+G46MU5LUKk
         o26NwrmHzpfDHEwiOjM0xCPuYTXq42NnltNacSabkIs+JT+5y/EM+oVasIUJ3W9Iu2F8
         W/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBI9aZcRKApu9rQ40X04XE61ikyvzJIMuAjBId5fIQBvbJGWaC+vXSdTa5jCM9iC4Y17pXtS+BQ7rzQW0Vrm2MRXqaSicjoFExoYToPSZVTCWXNJlcRYBd
X-Gm-Message-State: AOJu0Yw+fo3uzCGbIUU+4dWPt3fCyRaSnecLxWcegY+3VFvRmXRlyd2K
	v/4+O53BVfCkx46ZxHbzjbxY57l41p4fe0rmWM5FWESwoUH1EUdCMnjoRqxBOA==
X-Google-Smtp-Source: AGHT+IG6WF3yEW13Exfar+3G70IDxzhqy6JvcjqYjxuoX/tUDVOc/DSPJ5NZNtSAlnzMC9voMG5h0w==
X-Received: by 2002:a05:6102:c4e:b0:48f:95aa:ae2b with SMTP id ada2fe7eead31-497599e5ccfmr1332560137.28.1723585154826;
        Tue, 13 Aug 2024 14:39:14 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d63fc2sm373263085a.27.2024.08.13.14.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:39:14 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:39:12 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, Jon.Mason@arm.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
Message-ID: <ZrvSgHz3rQXfgZ3j@kudzu.us>
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
 <20240813195753.576442-2-bruce.ashfield@gmail.com>
 <ZrvHMQCZgXQjYCj4@kudzu.us>
 <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
 <CADkTA4Oq7Xk5oZ5rsgehWDP_TNRpQFMpcZV-h9NcTYQtnGSTLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4Oq7Xk5oZ5rsgehWDP_TNRpQFMpcZV-h9NcTYQtnGSTLQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 21:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203295

On Tue, Aug 13, 2024 at 05:05:49PM -0400, Bruce Ashfield wrote:
> On Tue, Aug 13, 2024 at 5:02 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Tue, Aug 13, 2024 at 4:51 PM Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Tue, Aug 13, 2024 at 03:57:52PM -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Integrating the following commit(s) to linux-yocto/.:
> > > >
> > > > 1/1 [
> > > >     Author: Bruce Ashfield
> > > >     Email: bruce.ashfield@gmail.com
> > > >     Subject: genericarm64: drop CONFIG_MTD_NAND_FSL_IFC
> > > >     Date: Tue, 13 Aug 2024 15:17:10 -0400
> > > >
> > > >     We are getting the following warning in recent 6.6+ kernels:
> > > >
> > > >         WARNING: linux-yocto-6.6.45+git-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
> > > >
> > > >         [NOTE]: 'CONFIG_MTD_NAND_FSL_IFC' last val (y) and .config val (n) do not match
> > > >         [INFO]: CONFIG_MTD_NAND_FSL_IFC : n
> > > >         [INFO]: raw config text:
> > > >
> > > >             config MTD_NAND_FSL_IFC
> > > >                     tristate "Freescale IFC NAND controller"
> > > >                     depends on (FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST) && HAS_IOMEM && FSL_IFC && MTD_RAW_NAND && MTD
> > > >                     help
> > > >                       Various Freescale chips e.g P1010, include a NAND Flash machine
> > > >                       with built-in hardware ECC capabilities.
> > > >                       Enabling this option will enable you to use this to control
> > > >                       external NAND devices.
> > > >
> > > >             Config 'MTD_NAND_FSL_IFC' has the following Direct dependencies (MTD_NAND_FSL_IFC=n):
> > > >                     FSL_SOC(undefined/n) || ARCH_LAYERSCAPE(=y) || SOC_LS1021A(undefined/n) || COMPILE_TEST(=n) (=y) && HAS_IOMEM(=y) && FSL_IFC(=n) && MTD_RAW_NAND(=y) && MTD(=y)
> > > >             Parent dependencies are:
> > > >                  SOC_LS1021A [SOC_LS1021A] MTD [y] ARCH_LAYERSCAPE [y] HAS_IOMEM [y] FSL_SOC [FSL_SOC] COMPILE_TEST [n] MTD_RAW_NAND [y] FSL_IFC [n]
> > > >         [INFO]: config 'CONFIG_MTD_NAND_FSL_IFC' was set, but it wasn't assignable, check (parent) dependencies
> > > >
> > > >     The most significant missing option that is disabling this config value
> > > >     is FSL_SOC, which is only defined in arch/powerpc.
> > > >
> > > >     As such, there's no sense keeping this option in the genericarm64 config
> > > >     as it is only enabled via arch/powerpc.
> > > >
> > > >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ]
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >
> > > > Jon,
> > > >
> > > > Let me know if these seems ok to you.
> > >
> > > Yes, I just started seeing this in my CI today, but hadn't gotten to looking at it.
> > > A very quick look at the kernel, I see arm64 has ARCH_LAYERSCAPE,
> > > which references MTD_NAND_FSL_IFC.  I think this is the actual cause of the desire
> > > to have this code.  So, we probably want to keep this in the generic
> > > image (as layerscape is what the lx2k/honeycomb platform(s) use).
> > > Is there a reason not to enable FSL_IFC in the config?
> > >
> >
> > It depends on FSL_SOC .. which is only enabled via arch/powerpc.
> 
> I misread that, yah, FSL_SOC is in the || condition, so isn't the critical part.
> 
> if you want to enable the missing dependency, then it should also be something
> resolvable that way.
> 
> My changes are already pushed,  so you'll need to send an update that
> turns it back on and adds the missing dependency.
> 
> My only goal was to get the warning removed. I'm exiting the discussion
> and will await patches, since I have no opinion on how to solve it with
> respect to arch/arm.

That's fair.  I'm sure if it's a problem, we'll know about it soon
enough (though I don't expect that it is).

Thanks,
Jon

> 
> Cheers,
> 
> Bruce
> 
> >
> > >
> > >
> > > FYI, I'm seeing a config fragment warning (which I've also not gotten
> > > around to fixing) with Xen and qemuarm/qemuarm64.
> > >
> > > WARNING: linux-yocto-6.10.3+git-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:
> > > [INFO]: the following symbols were not found in the active configuration:
> > >      - CONFIG_FB_SYS_FOPS
> > >
> > > See https://gitlab.com/jonmason00/meta-arm/-/jobs/7574214060
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/7574213986
> > >
> > > I think this can just be removed, as I don't see it in the kernel
> > > anymore.
> >
> > That''s already fixed in the recent bumps that I've been sending
> > Richard.
> >
> > https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-6.10&id=107c15b3ee3f07842384208ea021588d589e51ef
> >
> > Maybe your meta SRCREVS are different ?
> >
> > Bruce
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > > >
> > > > Bruce
> > > >
> > > >  meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
> > > >  meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
> > > >  meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
> > > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > > index ae56e8a129..c3b4fc1e9b 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > > > @@ -15,7 +15,7 @@ python () {
> > > >  }
> > > >
> > > >  SRCREV_machine ?= "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
> > > > -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> > > > +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > > >
> > > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
> > > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > > index b0e4ab71ae..1c8cfd7d74 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > > > @@ -18,7 +18,7 @@ KMETA = "kernel-meta"
> > > >  KCONF_BSP_AUDIT_LEVEL = "2"
> > > >
> > > >  SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > > -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> > > > +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > > >
> > > >  PV = "${LINUX_VERSION}+git"
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > > index 5688a4b109..948f46621b 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > > @@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > >  SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > >  SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
> > > >  SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> > > > -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> > > > +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
> > > >
> > > >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
> > > >  # get the <version>/base branch, which is pure upstream -stable, and the same
> > > > --
> > > > 2.39.2
> > > >
> > > >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 

