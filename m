Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B06C001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 22:49:05 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.49087.1691448538638405719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 15:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cbGVTAT+;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-583e91891aeso57718157b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691448538; x=1692053338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jq35O56f34J/zEZxELHKkIN1C6U5m7HvlR4g+zQCqI=;
        b=cbGVTAT+EiabwkHZz2pJcbIwInPnyJeOX1iCnawUZhTIypqb+3//lHdChAuILhAP9C
         AJDOxIPWGyjAA2GkFwFQSsjn8mGaA9mv4F7rAYaWH6z31w5gAVNRvX0IRqjzxJ/YpElG
         s6JKwP7WyTIkIasXo2/mre98mr5ChIxvaGXXY/XqDtCkwtXZ2nyiukfNQX8rJb+HvsNb
         0Tti7YwMsaE3/2z4NaTjW7RfPzuB42CsMJh1rK0jeT4hCZW0/6tXWAx95xtL5209rW4m
         u1z9NKus+JwRtWWRDcFrK0azZg73FdaoFqwvvyKh8+rGuKqaCwLqseSOLU2VEtu0Fm2+
         4Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691448538; x=1692053338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Jq35O56f34J/zEZxELHKkIN1C6U5m7HvlR4g+zQCqI=;
        b=d1KDcwba160y1eANeeuwYgC1YzgLv0Fy+x6ZNUI0EBBVhjJaLMq+vIg78wnFLGYGAV
         CqEbBW/MiStAxeocz/Y0JqXtU1ngRP5zOR4Z/JWV06xWeS335lT/L50cSWz52h67bKaE
         Vi15ZCLC9C+NjPPankSv4MGOdSMMvjMKA6yB/yd/4zSFQ3hUtUNuNcxf+VhGFVEvXcyM
         nO902AnQCB9+vI6jReqN1+D6gYh/4kdAvOds2mLYs0nNU3nAn1T4oXLBsBhFUSzO4M5H
         rSQ9Vt2JF+RQaUc8jcKa5SqRAeMgfUPRtN9XfN7trQaALx8Y6zxCX//cp4ZDfny9bNS6
         MYGw==
X-Gm-Message-State: AOJu0YwSf4rfZod2oGlNJYgk68A8ERIFeywY3a13xbVK3v8+gClsQrMl
	KMItBPmxFCztx75EMYQa4TrBLgUvw8LiJY+DuPM=
X-Google-Smtp-Source: AGHT+IE6RCo/3CcwgCqgFvKj/EEMy6lQT7WxId1HV6TlhttpJPJDVutOImp8b242tFIHK4BKSOOZ1f6uz2vcQvDYWX4=
X-Received: by 2002:a81:8383:0:b0:583:d1fa:1fc4 with SMTP id
 t125-20020a818383000000b00583d1fa1fc4mr13158608ywf.26.1691448537697; Mon, 07
 Aug 2023 15:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com> <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local> <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
 <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
 <202308071440247bbfcdd8@mail.local> <202308072237172d39a14b@mail.local>
In-Reply-To: <202308072237172d39a14b@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 7 Aug 2023 23:48:45 +0100
Message-ID: <CAMw=ZnRZ-LNhpGvvDH+OBk7LuvdCyxTW5mZGB_f+D8wuB6weLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 22:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185626

On Mon, 7 Aug 2023 at 23:37, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 07/08/2023 16:40:25+0200, Alexandre Belloni wrote:
> > Hello,
> >
> > I've been looking a bit more at this. there is definitively another
> > issue here which is the first one I found:
> >
> > x86_64-poky-linux-objcopy: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognized
> >
> > This is the main issue here.
> >
> > $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: MS-DOS executable PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
> > $ objdump -p /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognized
> >
> > I tested with v253.7 and I properly get:
> >
> > $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
> > $ ./build-st/tmp/sysroots-components/x86_64/binutils-cross-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump -h /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> >
> > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub:     file format pei-x86-64
> >
> > Sections:
> > Idx Name          Size      VMA               LMA               File off  Algn
> >   0 .text         0000d7f0  0000000000004000  0000000000004000  00000400  2**4
> >                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> >   1 .reloc        0000000c  0000000000012000  0000000000012000  0000dc00  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   2 .data         00002ab0  0000000000013000  0000000000013000  0000de00  2**4
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   3 .dynamic      00000100  0000000000016000  0000000000016000  00010a00  2**2
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   4 .rela         00000630  0000000000017000  0000000000017000  00010c00  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   5 .dynsym       00000018  0000000000018000  0000000000018000  00011400  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   6 .sdmagic      0000002a  000000000001a460  000000000001a460  00011600  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >
> > I really believe the recipe is not generating a working efi.stub. Can
> > you check?
> >
>
> I've built systemd-boot v254 outside of YP and it generated a proper
> linuxx64.efi.stub. I still don't get why the recipe doesn't generate a
> working binary.
>
> The issue seems to be at the linuxx64.elf.stub generation as I took the
> one from my YP build, ran it through elf2efi.py on my PC and this didn't
> generate a working linuxx64.efi.stub

Strange - do you see a difference in compiler/linker flags? That would
be the only thing I can think of

