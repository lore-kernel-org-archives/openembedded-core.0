Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1390DC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 04:18:38 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.35254.1737519514268489781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 20:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VIg20HfK;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-29ff8053384so3730210fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 20:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737519513; x=1738124313; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbaKnAfBPz8GLbIY85H+Jw47YrDWbDeHjwXPhtKHi0Y=;
        b=VIg20HfKDF3c53Y2l+vt8lvnWY8+MzSJAq2naoPnYw4q5y0LAunKCqNxYvlmN91Vkc
         PWQuhl0qbb/U9prK502mlWeO6aXTfJGca2kTEyt1d0gIVDCwurRqGUoDJfNGAEHHPU7h
         vrc6YxFNLGoMZkqnWZnr0Rjk02ei0XJ59m50ypeGeqSjE4ktJ1kOWDFqtvUndAfQxn08
         X2kKVi4RESNHgddARDZruX6LW+SklzNpzbjX586hph/EI7gsAYNdEzSaqHc+jpwAACnC
         7WUilAVhaYI2/CTZcoxMNAiWwouVCtNdVCfcBQAIiFDvUQffUzOrLnLuSIaT5YBEAo2k
         Uwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737519513; x=1738124313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbaKnAfBPz8GLbIY85H+Jw47YrDWbDeHjwXPhtKHi0Y=;
        b=xMbAONFPdwexBnA/72mlvx8pQ0O2TFNtzkrkSZm1pyHqIdjGeAmMHXQgPMNQa5Pz1b
         kpWKO2rA/5hu9hHuRHbMKd/US7t29iLJ5p4+pYIjXN0JXuPoFpBSOsRisLBAtVr5I2TK
         7TRjJWnbewtEAKzCN01CQVQMNp7Z2xfuBQSSFkLs064D9VT64nieaM69jvZRRZKvXtKY
         BOWThx715bIVdazokFxSBi0q0mClbiHeZ85NernbRk+SASz0lI2jDjVCL5KTDpvdruOI
         CS4l1s9UQ749sbxi3njJ4MvNIzq9g78nToufdpRjAlwQMLxQWKYAUAgTJTUN1oWhHlmp
         PctA==
X-Forwarded-Encrypted: i=1; AJvYcCUMEUCu407VsjQBu4p0rkFDywMLwnYCan35dD6vNmmy9a/oeFILO680yDEj6ionkbac60c3MN810Ik/TRVjZMvKEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyfk+lON0muHmVCJub1neDBjDiiJxI4V/QfXrhAMvRhB2WSxJNt
	qEZ706O+V3/znWjOKtGH+rsDIB+7HqWQIOT8cu9FUb48lUOmwGAqboNtloCrSaBpUZiMcrSmaz9
	WBv2Vx5GZYlJMrH3DE6UKFG7wNL8=
X-Gm-Gg: ASbGncuamiL56Uh06tPL2zDDX1T/3y7D7KeEHDziZNSSW+6vxZYQu66EyzFV5WILbah
	PNlKBuZSr9HIwoKR0FYe//AicQovP3OMUq0oOAH3eXBRgzRjfJA==
X-Google-Smtp-Source: AGHT+IGET/LHu+K4KIy9vh2thVr7i+i8X/A/6Ty614kJCRGsd754S2eiw63hTF61M2bX4okrmBGMfEKGjaqGDOqE0fY=
X-Received: by 2002:a05:6871:4915:b0:29e:5522:8ee4 with SMTP id
 586e51a60fabf-2b1c0b4d6c6mr10309292fac.25.1737519513425; Tue, 21 Jan 2025
 20:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com> <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
 <181B122FF6A5F825.28670@lists.openembedded.org> <218aaf1a-7320-4514-bace-78ce19b313f8@windriver.com>
In-Reply-To: <218aaf1a-7320-4514-bace-78ce19b313f8@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2025 20:18:07 -0800
X-Gm-Features: AbW1kvaxMGD2iRc50tgd7ClL9eGjQG532_1_-HYTvQr2loOxwKNR1YfJR6mnzVM
Message-ID: <CAMKF1srqww1x7Yh9qff58cZ2fS2cib4QLBRDmMwh1tHnUyuhmw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
To: Qi.Chen@windriver.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"MacLeod, Randy" <Randy.Macleod@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 04:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210129

On Tue, Jan 21, 2025 at 7:03=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> ping
>
> Is there something I need to do for this patch? Or is this patch not
> suitable for oe-core?
>

if we are enabling 64K pages then 32bit aarch32 apps should also be
compiled using 64k pages. Usually this could mean different
performance characteristics and 32bit apps are usually only rebuilt if
not used as prebuilts, so how will it function in a multilib
environment?

> Regards,
> Qi
>
> On 1/16/25 12:34, Chen Qi via lists.openembedded.org wrote:
> > Ping
> >
> > Ross & Richard, is there anything else I need to do for this patch?
> >
> > Regards,
> > Qi
> >
> > -----Original Message-----
> > From: Chen, Qi
> > Sent: Thursday, January 9, 2025 9:54 AM
> > To: Ross Burton <Ross.Burton@arm.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: RE: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for b=
uilding 32bit binary with 64K alignment
> >
> > Hi Ross,
> >
> > The "./bsp/marvell-cn10xxx" exists in yocto-kernel-cache's origin/yocto=
-6.6 branch.
> > In its master branch, the marvell-cn96xx.cfg also enables CONFIG_ARM64_=
64K_PAGES=3Dy.
> >
> > This patch was tested on pristine poky + qemuarm64. The test steps are =
in the commit message. I didn't test all softwares in oe-core, but as lib32=
-core-image-full-cmdline started well with no failed systemd service, I ass=
umed that most softwares should also behave well. I also tested lib32-sysst=
at with core-image-minimal.
> >
> > The help text for ARM64_64K_PAGES changed with this commit: https://git=
hub.com/torvalds/linux/commit/db488be354bc85724d7b9523e94435fdaa761a35
> > So 32bit arm was not supported at first, but at some point, it was.
> >
> > Regards,
> > Qi
> >
> > -----Original Message-----
> > From: Ross Burton <Ross.Burton@arm.com>
> > Sent: Thursday, January 9, 2025 1:02 AM
> > To: Chen, Qi <Qi.Chen@windriver.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for b=
uilding 32bit binary with 64K alignment
> >
> > On 25 Dec 2024, at 03:04, Chen Qi via lists.openembedded.org <Qi.Chen=
=3Dwindriver.com@lists.openembedded.org> wrote:
> >> When 64K page size is enabled, for 32bit multilib, we'll need to build
> >> applications with 64K alignment, otherwise, we'll see errors like belo=
w at runtime:
> >>
> >>   root@marvell-cn10xxx:~# /lib/ld-linux-armhf.so.3
> >>     Segmentation fault
> >>
> >> marvell-cn10xxx in yocto-kernel-cache enables CONFIG_ARM64_4K_PAGES=3D=
y by default.
> >> And the issue was first discovered there.
> > Do you mean _64K_PAGES?  Where is this marvell-cn100xxx?  In yocto-kern=
el-cache there are no users of arm64-64kb-pages and nothing called cn10xxx.=
  Is this a Wind River-specific fork of yocto-kernel-cache?
> >
> >> However, there's a kernel config fragment in yocto-kernel-cache which
> >> enableds 64K page size for arm64: arch/arm/arm64-64kb-pages.scc. So
> >> it's easy for other
> >> arm64 BSPs to enable this. And when they do so, they'll have problem
> >> with multilib. This patch adds a config file to help people a little
> >> bit in such situation.
> >>
> >> The max-page-size option is used to fix this issue. This option is
> >> added to both CFLAGS and LDFLAGS for the purpose of covering as many
> >> recipes as possible.
> > First, I should point out that changing the page size is an ABI break, =
and the 32-bit ABI was formalised long before 64kb pages were a thing, so t=
hings _will_ break.  That said the loader should work, as a decade ago binu=
tils 2.25 changed the alignment to 64kb pages by default:
> >
> > https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dld/em=
ulparams/armelf_linux.sh;h=3D280db842208e06e3231ec3a8322369193630a07d;hp=3D=
35891f1fc91bddd03677aaefd7146ae5333e6cf0;hb=3D7572ca8989ead4c3425a1500bc241=
eaaeffa2c89;hpb=3D8335d6aa34b88ce31b62e1b578d54ab4aa364435
> >
> > That won=E2=80=99t help specific pieces of software that eg assume the =
page size is a built-time constant (and use the wrong constant), but hellow=
orld should be good.  Can you replicate with pristine poky master and a min=
imal configuration in a qemu?
> >
> > Ross
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210113): https://lists.openembedded.org/g/openembedde=
d-core/message/210113
> Mute This Topic: https://lists.openembedded.org/mt/110280373/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

