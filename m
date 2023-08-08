Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21691C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 00:01:36 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.50451.1691452890558296297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 17:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JnHjtNr2;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-56d0d7300d9so3548442eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 17:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691452890; x=1692057690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCpN/ipE6ZfwH2QLg+fyGgFXpWVlBY/pw8Mob0cT9y4=;
        b=JnHjtNr2qhFTRQU6YqunmTwLHR+sUDsY/DoqiaDV1srIL7YknHvESogrM/mwLgXckC
         k3PuNoAaA5YrZa+ibKEoZ4MCzE/V5/UifbJ/rTIkSrYNQaRKzlBE8/jarpPE28Vh9aS/
         EeueoGsyd6YModRPawqmLJQwBHQUVoK4DKPj4Eb5QzUp4wcylaL4ErBD3P/NUAUT6MeS
         x1r11hzgYqChCzrlbmeM6YWTRs8zJGx9ezCn7PSbEQNibijTrYwG/gNy4NL7s+qhUp+N
         +xSwYE8VNQJTgy9TI3OsG5jyE1yd8r/O7ZK0rqhiLoaRtuxkwI0JrPnR4YGGCmyLeToQ
         XW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691452890; x=1692057690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCpN/ipE6ZfwH2QLg+fyGgFXpWVlBY/pw8Mob0cT9y4=;
        b=EsnVQ3qhGoTgQHZlkGblZh3S5fhs7YSOEJ/0OOL4ptlVZ2Y3572Xcb2ZC3xp3UFMWY
         z45bSPzlEfT25dj7GumN7aLob11RwJZ9U8X2jmVfURbC536MwiTvsFv1dwKQt+Eio0Se
         PeP18PRT/BzohleGruGNqqAGEbpV3/JBwmc//cpCAO2FVYfh60fJ+TN1mQt2C/+CvQrz
         ZkXc4osEanBeVvuMMh+AePHdspk7P6IzuiLtkMDaPjCZHN49hsFTh6rw/Ua7az7zUnKG
         oHiOr5o2XhSdOJ4SfDTLMM3tTibMsd1Ns4MvjPYEyjOrYk+kVDppBnn2mGv3egzIfmKy
         M9ZQ==
X-Gm-Message-State: AOJu0YzFFP70TzeHC/pjoiSFBpR5OHxyjmICZfTNwAfZOuFL/JmqHv8N
	PRze2jZNy1Tkc6ISO/W598RjXYv896CiZRv0Shk=
X-Google-Smtp-Source: AGHT+IFMF9wGyA3DM2BD2NO4v3CLlmHjACojEkekUGm0OiqiwNKT64qglvHMV7AxT3+4LCq1QLT6PNZmO4yOflfCWTM=
X-Received: by 2002:a05:6808:bca:b0:3a4:243d:dc76 with SMTP id
 o10-20020a0568080bca00b003a4243ddc76mr14023679oik.21.1691452889678; Mon, 07
 Aug 2023 17:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com> <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local> <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
 <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
 <202308071440247bbfcdd8@mail.local> <202308072237172d39a14b@mail.local> <CAMw=ZnRZ-LNhpGvvDH+OBk7LuvdCyxTW5mZGB_f+D8wuB6weLA@mail.gmail.com>
In-Reply-To: <CAMw=ZnRZ-LNhpGvvDH+OBk7LuvdCyxTW5mZGB_f+D8wuB6weLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Aug 2023 17:01:02 -0700
Message-ID: <CAMKF1srqMkp3LrS0wY=K=MbQLnVjbtvczGa9jC4YKcOs+Cpmew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 00:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185627

Can you try this patch on top

https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/mut&id=3D0defb14c=
600170434befe8c94dad4732041a3513

On Mon, Aug 7, 2023 at 3:48=E2=80=AFPM Luca Boccassi <luca.boccassi@gmail.c=
om> wrote:
>
> On Mon, 7 Aug 2023 at 23:37, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 07/08/2023 16:40:25+0200, Alexandre Belloni wrote:
> > > Hello,
> > >
> > > I've been looking a bit more at this. there is definitively another
> > > issue here which is the first one I found:
> > >
> > > x86_64-poky-linux-objcopy: /home/alexandre/poky/build-st/tmp/deploy/i=
mages/qemux86-64/linuxx64.efi.stub: file format not recognized
> > >
> > > This is the main issue here.
> > >
> > > $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/lin=
uxx64.efi.stub
> > > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.e=
fi.stub: MS-DOS executable PE32+ executable (EFI application) x86-64 (strip=
ped to external PDB), for MS Windows
> > > $ objdump -p /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-=
64/linuxx64.efi.stub
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in=
 section .reloc
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in=
 section .reloc
> > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/l=
inuxx64.efi.stub: file format not recognized
> > >
> > > I tested with v253.7 and I properly get:
> > >
> > > $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/lin=
uxx64.efi.stub
> > > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.e=
fi.stub: PE32+ executable (EFI application) x86-64 (stripped to external PD=
B), for MS Windows
> > > $ ./build-st/tmp/sysroots-components/x86_64/binutils-cross-x86_64/usr=
/bin/x86_64-poky-linux/x86_64-poky-linux-objdump -h /home/alexandre/poky/bu=
ild-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > >
> > > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.e=
fi.stub:     file format pei-x86-64
> > >
> > > Sections:
> > > Idx Name          Size      VMA               LMA               File =
off  Algn
> > >   0 .text         0000d7f0  0000000000004000  0000000000004000  00000=
400  2**4
> > >                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> > >   1 .reloc        0000000c  0000000000012000  0000000000012000  0000d=
c00  2**2
> > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >   2 .data         00002ab0  0000000000013000  0000000000013000  0000d=
e00  2**4
> > >                   CONTENTS, ALLOC, LOAD, DATA
> > >   3 .dynamic      00000100  0000000000016000  0000000000016000  00010=
a00  2**2
> > >                   CONTENTS, ALLOC, LOAD, DATA
> > >   4 .rela         00000630  0000000000017000  0000000000017000  00010=
c00  2**2
> > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >   5 .dynsym       00000018  0000000000018000  0000000000018000  00011=
400  2**2
> > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >   6 .sdmagic      0000002a  000000000001a460  000000000001a460  00011=
600  2**2
> > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > >
> > > I really believe the recipe is not generating a working efi.stub. Can
> > > you check?
> > >
> >
> > I've built systemd-boot v254 outside of YP and it generated a proper
> > linuxx64.efi.stub. I still don't get why the recipe doesn't generate a
> > working binary.
> >
> > The issue seems to be at the linuxx64.elf.stub generation as I took the
> > one from my YP build, ran it through elf2efi.py on my PC and this didn'=
t
> > generate a working linuxx64.efi.stub
>
> Strange - do you see a difference in compiler/linker flags? That would
> be the only thing I can think of

