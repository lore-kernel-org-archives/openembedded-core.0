Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96D2C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 23:57:12 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.9007.1705708631909150814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 15:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxwghtGD;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21428d99395so48612fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705708631; x=1706313431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfHv5MeHqGE647D7tBchD1AcP7QMQHVzQniosXegqPE=;
        b=hxwghtGDsIRAzxVuz77nlwIfV2UpANS3/PgjUFyeHFiKFITa0MRZpSp4RBlGlKmN+i
         6GW7iXr/JWafx+zV7kyZXpYMfSTkZxYg0dY3b9wAoPFJH+kteOvS0UvxC2OW2Ip1XUmv
         6FDfBr/EBJznFtM9l4aHc5Jbf9l9Cuu44cH1tTSYKTPRMcCWZW/2x4MtO7LRsXjxANWb
         nl/m/yw5YRrJlmQber4MOP7P/b5NaleWpgRfUJNUCimA29BQzsml5vcsxXRsZHFic/SA
         fT3coyWff96Zj41SHuPaOfq25mQF2r8ICc2QGMKKhlQQCqYqjXjrh5GOvE2KVLFPrgLx
         vf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705708631; x=1706313431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfHv5MeHqGE647D7tBchD1AcP7QMQHVzQniosXegqPE=;
        b=lh3w7DOmfOo5C3oIgLRAh/Epr99tMFT+d9k3RlXNwLfyxbqEa8cJwMJt6pZ4slKOom
         az/lFRVUcfUOXZVT0ohN1NIBQIbKFb8Ub8waGtXAL5pU6z1KLJnti0sLu3OtgtB7+h9w
         97hvfbUTQarHv5AzebC+MgLTMYBjTTxXgY42WKbJMs4tbn7rldUg3VdZ22SvwSSBLnZv
         2SohFfnkWOXdJZzPVroWdngsD1hefRSefheXb4k2NxhWL62Wst89GJAGXFDvvq7VEvDb
         qMbR/gnwBBWRZlGilBqHwE52KMJ00uTz1c3InqxmcIKrFMC2NU47DuWmZcwdpR3GbKSQ
         oduQ==
X-Gm-Message-State: AOJu0Yy/jC/SyD86NbvoIAm8D5/mX4F7KjmTRObWs4BHhpoR2SJLms7H
	idehhMf061iGR3RJi9Ss7QHoFY5rmUP2+WCrSP3nV13kg/WcmjxRnxhFXavvSp14+9uRr+CSxvu
	eq3lkxGEYcCy9IhFp37zdOM5FNHc=
X-Google-Smtp-Source: AGHT+IFpwBRBoEpVVxFI4pv4wYmr8o20oe/ROpD/C5yCOICuNOOusSHDmPs3HVqCRoTo0pw/KhaJuo4Hj7P1czWKnv4=
X-Received: by 2002:a05:6871:5294:b0:206:6399:618a with SMTP id
 hu20-20020a056871529400b002066399618amr844254oac.10.1705708630920; Fri, 19
 Jan 2024 15:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20240117094701.25763-1-thomas.perrot@bootlin.com>
 <abad3986d80e9eae3e7ed69f1ca466678eea042d.camel@linuxfoundation.org>
 <f9050dd0b2bb0c072f891a5b45cf96bdb7b9a7f0.camel@bootlin.com>
 <3d768fea662107ded470e7aa3dbd3e2d561e173a.camel@linuxfoundation.org> <2024011922003945fc56a9@mail.local>
In-Reply-To: <2024011922003945fc56a9@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jan 2024 15:56:44 -0800
Message-ID: <CAMKF1srAGVi6k_OBgRKMMNaat2K=s0bWcTh5f8g10_xDGsKt=g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.4
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Thomas Perrot <thomas.perrot@bootlin.com>, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 23:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194079

On Fri, Jan 19, 2024 at 2:00=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
>
> On 19/01/2024 19:24:44+0000, Richard Purdie wrote:
> > On Fri, 2024-01-19 at 18:48 +0100, Thomas Perrot wrote:
> > > Hello Richard,
> > >
> > > On Fri, 2024-01-19 at 17:22 +0000, Richard Purdie wrote:
> > > > On Wed, 2024-01-17 at 10:47 +0100, Thomas Perrot via
> > > > lists.openembedded.org wrote:
> > > > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > >
> > > > > This release has:
> > > > > - Synopsys DesignWare APB GPIO driver
> > > > > - Zicntr and Zihpm support
> > > > > - Console print improvements
> > > > > - Smepmp support
> > > > > - Simple FDT based syscon regmap driver
> > > > > - Syscon based reboot and poweroff driver
> > > > > - Non-contiguous hpm counters
> > > > > - Smcntrpmf support
> > > > > - Full sparse hartid support
> > > > > - IPI improvements
> > > > > - RFENCE improvements
> > > > > - Zkr support
> > > > > - Andes custom PMU support
> > > > > Overall, this release mainly adds more ISA extensions, drivers an=
d
> > > > > other improvements.
> > > > >
> > > > > https://github.com/riscv-software-src/opensbi/compare/v1.3.1...v1=
.4
> > > > >
> > > > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > >
> > > > This all seems reasonable but why is there a revert below?
> > >
> > > I reverted it otherwise the following link issue occurs:
> > >
> > > "build/tmp-glibc/work/riscv64-oe-linux/opensbi/1.4/recipe-sysroot-
> > > native/usr/bin/riscv64-oe-linux/../../libexec/riscv64-oe-
> > > linux/gcc/riscv64-oe-linux/13.2.0/ld.bfd:/src/build/tmp-
> > > glibc/work/riscv64-oe-
> > > linux/opensbi/1.4/git/build/platform/generic/firmware/fw_dynamic.elf.=
ld
> > > :54: undefined section `.dynsym' referenced in expression"
> >
> > The commit should at least mention the issue.
> >
> > I'm also not sure that is "Inappropriate", more like "Pending" as in
> > needs further investigation.
>
> The original commit states that relocations don't need to be handled
> because everything is linked statically which is not true in our case,
> else we wouldn't be trying to link dynamically.
>
> >
> > > > > ---
> > > > >  ...re-Remove-handling-of-R_RISCV_-32-64.patch | 88
> > > > > +++++++++++++++++++
> > > > >  .../{opensbi_1.3.bb =3D> opensbi_1.4.bb}        |  8 +-
> > > > >  2 files changed, 92 insertions(+), 4 deletions(-)
> > > > >  create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Revert-
> > > > > firmware-Remove-handling-of-R_RISCV_-32-64.patch
> > > > >  rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb =3D> opensbi_1.4=
.bb}
> > > > > (90%)
> > > > >
> > > > > diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmwar=
e-
> > > > > Remove-handling-of-R_RISCV_-32-64.patch b/meta/recipes-
> > > > > bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-
> > > > > R_RISCV_-32-64.patch
> > > > > new file mode 100644
> > > > > index 000000000000..d14e0b73a9bc
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remov=
e-
> > > > > handling-of-R_RISCV_-32-64.patch
> > > > > @@ -0,0 +1,88 @@
> > > > > +From bfe480929bcc966e1fdf5afdde8d4c22adba7f6f Mon Sep 17 00:00:0=
0
> > > > > 2001
> > > > > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > > +Date: Tue, 16 Jan 2024 15:16:58 +0100
> > > > > +Subject: [PATCH] Revert "firmware: Remove handling of
> > > > > R_RISCV_{32,64}"
> > > > > +
> > > > > +This reverts commit 2a6d72534d44c39e1de0614970a0dad97b1c41ba.
> > > > > +
> > > > > +Upstream-Status: Inappropriate [oe specific]
> > > > > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > >
> > > > If we're going to revert an upstream change, we need to say *why*. =
We
> > > > need to revert it for some OE specific reason but what is that
> > > > reason?
> > > >
> > >
> > > I agree, maybe you have any advice to fix it in another way?
> >
> > I have no idea, I've copied Khem who might or might know who to talk
> > to.

We have so far build a non-PIC version but I would suggest we start
doing PIC version
set FW_PIC=3Dy in EXTRA_OEMAKE and try it out.

> >
> > Cheers,
> >
> > Richard
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194065): https://lists.openembedded.org/g/openembed=
ded-core/message/194065
> > Mute This Topic: https://lists.openembedded.org/mt/103782707/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

