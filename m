Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C5DC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 05:01:38 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.36032.1737522096748392678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 21:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIG2HoAN;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2a01bcd0143so4436346fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 21:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737522096; x=1738126896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgfYcnYjDAAHXxiaP6vtcdcBSTR7D10ZfIrnLC+Cw88=;
        b=UIG2HoANhiX2XMXFS96QM8jLk0Z3OurGPKf3+UutTBN/BJnMGhvzR6TBROIj3rTq/o
         xEyErL8QvuHzwYFuZD3FG4S9D5kefzOIyB9q/lHwedXHU0QHykE8RWFAvQwVMB5966B/
         FuJMjJ9U8mTPZxtRTNAw40l+S8V1lN5ttkZkEeMi9y+ppT0/BPcmAGBYHGBPx6OLJoQy
         QxoiaFkdBXAsy2vhRPepZN9Ez7YwQDKEKyFDxNvFQ/o+llhdy5Eki3efYIbpRSUUBWnG
         zsvvXtnAry0R9EiGJ9Rpq/wT9oMhZvqnu6zW9j7ZuYWCUX/s4iPUyg44eCanWaHqOiwo
         33hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737522096; x=1738126896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgfYcnYjDAAHXxiaP6vtcdcBSTR7D10ZfIrnLC+Cw88=;
        b=cwl+1wvSA2HHuHzDDv4OoQLsNfkw84CJ5AlPumJsMEv8uBJMuoOsuiA0hiVI1TRpC8
         ejt10JjuE55RTd72bBJ2N7TyTCr8abnci7s9kmw+vTpMQtwFAGsyIrZatICzF/lfUIkJ
         GpKCk+5UKATZzjttGHCxoxwv2HUOWbO1Nr8xdkBhWlqe4/lsivmYQuPXsq8c9au11X56
         eeVxEbIOwg1jK3RtVrdDbpcyvi8zaXBUO5P4mmUJG5dLsxOJY7uEWnY0z824Eq0Z2g8f
         rGpDgCsNKEDZP1CKUTCcd0wB0Zc/IQ/SGTpyEJ66z6nM1AiW2L/P0YtA81TYDG5CaTVw
         1k0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXYNbZ0wJZXqzGTs6QC9RcCoFpJfPOazgmyQy5yfrAAdQT/51xHVssefOWjyYz5kf0XrQVLwlq3LGlJbl9esrvJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypsfW1firuSwQCXI7rZsZQmZbxTzIjapdLmAyOgqyY75adEfDD
	YbuRYB168/68N+Jx1b7bXtZ9f4F0vLodPVlmwawQP22oFtTaSYiX9rgVdrv1gz7z9aGuO3D+9Ai
	ZEOClamn/dagK50crQJwtos7sqYo=
X-Gm-Gg: ASbGncvTVAXGZPpL60UVMJ2nMRRU4VHD9TkmXXltvtO00dV0IAcJ67iTSxc5bUBwPeA
	nRunwbKYy8qXX1+WbXgLFtJecmKj88glgF96P7ARp/90vMKjVzg==
X-Google-Smtp-Source: AGHT+IHnTbeyNwmqO+Ire9/AzzmCeoeQHscShCNhBJA3bk1XQN7UAzkh2xjPZ9qcmeLFkXIfHaia4xPA7PgMRzyww+U=
X-Received: by 2002:a05:6870:ad93:b0:29e:4ba5:4ddc with SMTP id
 586e51a60fabf-2b1c0b4eb01mr10798317fac.24.1737522095976; Tue, 21 Jan 2025
 21:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com> <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
 <181B122FF6A5F825.28670@lists.openembedded.org> <218aaf1a-7320-4514-bace-78ce19b313f8@windriver.com>
 <CAMKF1srqww1x7Yh9qff58cZ2fS2cib4QLBRDmMwh1tHnUyuhmw@mail.gmail.com> <49d7fc07-48a7-4317-8571-ed84909e8235@windriver.com>
In-Reply-To: <49d7fc07-48a7-4317-8571-ed84909e8235@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2025 21:01:09 -0800
X-Gm-Features: AbW1kvavkAxFLN58ZNbeyLm4Q0JMrm9msEQeN9ZV1obw8l1HnFOMsYAoD8cFBrY
Message-ID: <CAMKF1srTAhC3zpkvMQ7zG-snTsaZ6e9UZ9x-ksbBd1MdYKhn8Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
To: ChenQi <Qi.Chen@windriver.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"MacLeod, Randy" <Randy.Macleod@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 05:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210134

On Tue, Jan 21, 2025 at 8:52=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> On 1/22/25 12:18, Khem Raj wrote:
> > On Tue, Jan 21, 2025 at 7:03=E2=80=AFPM Chen Qi via lists.openembedded.=
org
> > <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> >> ping
> >>
> >> Is there something I need to do for this patch? Or is this patch not
> >> suitable for oe-core?
> >>
> > if we are enabling 64K pages then 32bit aarch32 apps should also be
> > compiled using 64k pages. Usually this could mean different
> > performance characteristics and 32bit apps are usually only rebuilt if
> > not used as prebuilts, so how will it function in a multilib
> > environment?
>
> Hi Khem,
>
> Sorry I don't quite understand what you mean. Could you please elaborate
> it a little bit?
>
> This patch's purpose is that if users enable 64K page for arm64 and they
> want multilib support, they can include this file in some conf file,
> e.g. some-machine.conf or local.conf, to make lib32 apps work.
>
> Do you mean that when users use multilib, they usually have some
> prebuilt app or library with 4K alignment? If so, then this patch is not
> suitable. In such case, they need to turn off the 64K page in kernel conf=
ig.
>

Right, so I am ok with it being a separate machine config with
appropriate guardrails
but not default, as such someone could enable it as it might be
appealing for performance
etc.

> Regards,
>
> Qi
>
> >
> >> Regards,
> >> Qi
> >>
> >> On 1/16/25 12:34, Chen Qi via lists.openembedded.org wrote:
> >>> Ping
> >>>
> >>> Ross & Richard, is there anything else I need to do for this patch?
> >>>
> >>> Regards,
> >>> Qi
> >>>
> >>> -----Original Message-----
> >>> From: Chen, Qi
> >>> Sent: Thursday, January 9, 2025 9:54 AM
> >>> To: Ross Burton <Ross.Burton@arm.com>
> >>> Cc: openembedded-core@lists.openembedded.org
> >>> Subject: RE: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for=
 building 32bit binary with 64K alignment
> >>>
> >>> Hi Ross,
> >>>
> >>> The "./bsp/marvell-cn10xxx" exists in yocto-kernel-cache's origin/yoc=
to-6.6 branch.
> >>> In its master branch, the marvell-cn96xx.cfg also enables CONFIG_ARM6=
4_64K_PAGES=3Dy.
> >>>
> >>> This patch was tested on pristine poky + qemuarm64. The test steps ar=
e in the commit message. I didn't test all softwares in oe-core, but as lib=
32-core-image-full-cmdline started well with no failed systemd service, I a=
ssumed that most softwares should also behave well. I also tested lib32-sys=
stat with core-image-minimal.
> >>>
> >>> The help text for ARM64_64K_PAGES changed with this commit: https://g=
ithub.com/torvalds/linux/commit/db488be354bc85724d7b9523e94435fdaa761a35
> >>> So 32bit arm was not supported at first, but at some point, it was.
> >>>
> >>> Regards,
> >>> Qi
> >>>
> >>> -----Original Message-----
> >>> From: Ross Burton <Ross.Burton@arm.com>
> >>> Sent: Thursday, January 9, 2025 1:02 AM
> >>> To: Chen, Qi <Qi.Chen@windriver.com>
> >>> Cc: openembedded-core@lists.openembedded.org
> >>> Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for=
 building 32bit binary with 64K alignment
> >>>
> >>> On 25 Dec 2024, at 03:04, Chen Qi via lists.openembedded.org <Qi.Chen=
=3Dwindriver.com@lists.openembedded.org> wrote:
> >>>> When 64K page size is enabled, for 32bit multilib, we'll need to bui=
ld
> >>>> applications with 64K alignment, otherwise, we'll see errors like be=
low at runtime:
> >>>>
> >>>>    root@marvell-cn10xxx:~# /lib/ld-linux-armhf.so.3
> >>>>      Segmentation fault
> >>>>
> >>>> marvell-cn10xxx in yocto-kernel-cache enables CONFIG_ARM64_4K_PAGES=
=3Dy by default.
> >>>> And the issue was first discovered there.
> >>> Do you mean _64K_PAGES?  Where is this marvell-cn100xxx?  In yocto-ke=
rnel-cache there are no users of arm64-64kb-pages and nothing called cn10xx=
x.  Is this a Wind River-specific fork of yocto-kernel-cache?
> >>>
> >>>> However, there's a kernel config fragment in yocto-kernel-cache whic=
h
> >>>> enableds 64K page size for arm64: arch/arm/arm64-64kb-pages.scc. So
> >>>> it's easy for other
> >>>> arm64 BSPs to enable this. And when they do so, they'll have problem
> >>>> with multilib. This patch adds a config file to help people a little
> >>>> bit in such situation.
> >>>>
> >>>> The max-page-size option is used to fix this issue. This option is
> >>>> added to both CFLAGS and LDFLAGS for the purpose of covering as many
> >>>> recipes as possible.
> >>> First, I should point out that changing the page size is an ABI break=
, and the 32-bit ABI was formalised long before 64kb pages were a thing, so=
 things _will_ break.  That said the loader should work, as a decade ago bi=
nutils 2.25 changed the alignment to 64kb pages by default:
> >>>
> >>> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dld/=
emulparams/armelf_linux.sh;h=3D280db842208e06e3231ec3a8322369193630a07d;hp=
=3D35891f1fc91bddd03677aaefd7146ae5333e6cf0;hb=3D7572ca8989ead4c3425a1500bc=
241eaaeffa2c89;hpb=3D8335d6aa34b88ce31b62e1b578d54ab4aa364435
> >>>
> >>> That won=E2=80=99t help specific pieces of software that eg assume th=
e page size is a built-time constant (and use the wrong constant), but hell=
oworld should be good.  Can you replicate with pristine poky master and a m=
inimal configuration in a qemu?
> >>>
> >>> Ross
> >>>
> >>>
> >>>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#210113): https://lists.openembedded.org/g/openembe=
dded-core/message/210113
> >> Mute This Topic: https://lists.openembedded.org/mt/110280373/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

