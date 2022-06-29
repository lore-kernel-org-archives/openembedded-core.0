Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B028C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 16:20:35 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.13703.1656519626736930181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 09:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AVLxFdoD;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id y14so25511933qvs.10;
        Wed, 29 Jun 2022 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPNsLswmj7cE0KahLFaer9w5DX4TRGa3YtcPE/u5JLA=;
        b=AVLxFdoDtaxlF4MEA+JgoymmBH556+9CsZnGj4TKoU1jmCjg3mnXyA7jkDfc9PHwpU
         nw70CtbgiBf//hx7EdlrWpqJe+qvgOOVcmBME+3noSuN46kC47gHZS3Qd8ZyfNQAEM/5
         IvK+w37uMzwXaVL/3iFVl8TxeEPxD73mbhXlRCoftkPXtvvVV8JXIOmevcNTjaXk+HqA
         Rmfgg4uhcwR07haHEnKoH+S7Yi+ZzqYXZ9Fq54piUakm8D0sbH2BZjWlmnjRPxeRXMUF
         oLOFfyMWHzyc+CY3u/ZZzRI0MCXlZOGDVlHRGfUNFuil0FY0aubf8JZbVV1l3VzG/dSZ
         G9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPNsLswmj7cE0KahLFaer9w5DX4TRGa3YtcPE/u5JLA=;
        b=AXtccBf+Z/cCyFdKs0woaxAwLDCnvLLBuO9i34QZvi+kLJRyD4SWNV9DJ1tRZXweqg
         OGvVxY0HznJZTn3Ccq5TV8JGeCbMxNrOQ/VoYWAeOot5pb3rfYrONIXcHbua2+2r9MFM
         1ZZa7CfHjWNjcyUJFf6fNGmLFx9pM8CNh9Nc9/9JIYE+OmNF51xUsA1FW3Tya5KzTLc4
         Yn8kHHoToJ/Bn9Q/JUVDJQjcBbx3UdKTfkb1uLrGF0DOTGcFGMFno5Of1Cyvepuqi+nF
         rS2LPb+IUgdJ7SAnkZhsMFTOg4GtOjJ4E8Y0o+czD+urZpYZ85TCdqivFkqGgQJD+OQw
         bPRg==
X-Gm-Message-State: AJIora+x0BFhC5sru+DJVq4hd2c8ET0JzLN/Z0SEnfhdMqB3kTXKSMTR
	lFEJiZu/KJukzPIHt6zNksxGESox4DMYnW5ZZAE=
X-Google-Smtp-Source: 
 AGRyM1u8Bcnh0pShhrm5I2FM9pQCzuwzG0bNY05pSK+iAkB7a+OtdDlGOWJMjJ2kzfYToZmIpWRgLiqHxOvenwLuH6o=
X-Received: by 2002:a05:6214:1d2e:b0:470:686a:f5e5 with SMTP id
 f14-20020a0562141d2e00b00470686af5e5mr7336426qvd.24.1656519625549; Wed, 29
 Jun 2022 09:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220524225603.50d60963@melee>
 <20220525043258.8949-1-pgowda.cve@gmail.com>
 <16F24A16BC7F056F.12338@lists.openembedded.org>
 <20220531150529.705390b9@melee>
 <CALY4986aY-X5V2-fcOU+3bovF=kB9t7Uvrh8b_rcqH-pQE9J-w@mail.gmail.com>
 <a3fa5681be1c935b9137ad5c1a8de1c311d0c346.camel@linuxfoundation.org>
 <CALY4984nxJD1Nj8WwweQQ8LkwRFvOg0XBwAWvNUoufc0EnLFPw@mail.gmail.com>
In-Reply-To: 
 <CALY4984nxJD1Nj8WwweQQ8LkwRFvOg0XBwAWvNUoufc0EnLFPw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jun 2022 12:19:59 -0400
Message-ID: 
 <CAMKF1srehoo3zV-vYBGHCY33feV7qFdMe0E4Z05UDwyWuq=D-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
To: Pgowda <pgowda.cve@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 16:20:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167387

you want to check the rust/llvm depchain and see if it pokes at host
for zlib and if it does then make it point to right zlib in native
sysroot if enabled or otherwise forcibly keep the
support disabled.

On Wed, Jun 29, 2022 at 4:18 AM Pgowda <pgowda.cve@gmail.com> wrote:
>
> Hi Richard,
>
> Thanks very much for pointing that out.
> I could reproduce the issue on the docker host that does not contain zlib-devel.
> Trying to analyse the issue on dependency of zlib.
> It would be helpful if you could give some pointers on zlib dependency
> as it would have been seen in other recipes as well.
> It would help us in fixing the issue appropriately.
>
> Thanks,
> Pgowda
>
> On Mon, Jun 6, 2022 at 2:21 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2022-06-03 at 18:37 +0530, pgowda cve wrote:
> > > Hi Luca,
> > >
> > > Regarding the issue
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14818
> > >
> > > I ran the Oe-Selftest for Rust as well as completed packages and did
> > > not come across any issues.
> > > a@yow-fedora-builder1 build]$ uname -a
> > > Linux yow-fedora-builder1 5.16.18-200.fc35.x86_64 #1 SMP PREEMPT Mon
> > > Mar 28 14:10:07 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
> > >
> > > The log of tests can be seen as follows:-
> > > The command used to run the test was as mentioned in the Bugzilla.
> > > oe-selftest -a -t machine -t toolchain-system -j 15
> > >
> > > test_libatomic: PASSED (113.76s)
> > > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > > gcc.GccLibGompSelfTestSystemEmulated.test_libgomp: PASSED (637.21s)
> > > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > > gcc.GccLibItmSelfTestSystemEmulated.test_libitm: PASSED (133.31s)
> > > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > > gcc.GccLibStdCxxSelfTestSystemEmulated.test_libstdcxx: PASSED
> > > (2546.63s)
> > > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > > gcc.GxxCrossSelfTestSystemEmulated.test_cross_gxx: PASSED (744.56s)
> > > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > > glibc.GlibcSelfTestSystemEmulated.test_glibc: PASSED (1101.43s)
> > > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > > meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: PASSED (54.33s)
> > > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > > meta_ide.MetaIDE.test_meta_ide_can_compile_c_program: PASSED (0.19s)
> > > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > > meta_ide.MetaIDE.test_meta_ide_had_installed_meta_ide_support: PASSED
> > > (0.01s)
> > > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > > runqemu.QemuTest.test_qemu_can_shutdown: PASSED (45.98s)
> > > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > > rust.RustSelfTestSystemEmulated.test_rust: PASSED (8381.70s)
> > > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > > gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (3.92s)
> > > 2022-06-03 08:39:22,336 - oe-selftest - INFO - SUMMARY:
> > > 2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest () - Ran 16
> > > tests in 19613.479s
> > > 2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest - OK - All
> > > required tests passed (successes=15, skipped=1, failures=0, errors=0)
> > >
> > > I also ran the Rust Oe-Selftest individually and did not find any issues.
> > > Can you please share the environment file so that I can reproduce and
> > > fix the issue?
> >
> > There isn't any magic environment we can share here I'm afraid. We
> > don't know why it happens on some autobuilder workers and not on
> > others, this is something we need to investigate and fix. This is one
> > of the challenges of these "intermittent" issues.
> >
> > The errors seem to relate to zlib so it may be worth looking at whether
> > host headers influence the rust build and those may be causing some
> > kind of determinism issue. You may have to build the binaries one a
> > system with the headers, then run them on a system without for example.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167369): https://lists.openembedded.org/g/openembedded-core/message/167369
> Mute This Topic: https://lists.openembedded.org/mt/91327291/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

