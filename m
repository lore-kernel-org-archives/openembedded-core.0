Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6147DEB64DD
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 00:51:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.51512.1691455907048872983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 17:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VCBAl+do;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 436641C0003;
	Tue,  8 Aug 2023 00:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691455904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fp9oYRO6MB112yTHY/EDimwJZMO/71MrGoZefMOAso=;
	b=VCBAl+do5dbMZOSSc/5Ot9pd06b6Gb/71b7Ju1a89WB9COjV4OmUDH680xdPZZVbbnkx/S
	rEUrYjT+kxrBBtA18eegZeAxfHUaNG91AlfeXuc1CQYHSCnUgc26l/OVPSnOLsYIxMLGwd
	LsPGnp9HZki2Yx9pmSRGqsR92pAczF3HyOE4ImnwyvVqAyxh6VLFCNTVca63JWxdm/9YWX
	UBm5QYtLWnvLOs6xVnLji7DXLrMiGmbUTicN2OXIYTZsFiEC28oHsZTqdHFEV+EHle6y7t
	OOROQtkucquOtG+tz2itOWPjUk7rMuSrvl9UM16OQdqt9S/2SD/+gx5PgbpRnQ==
Date: Tue, 8 Aug 2023 02:51:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
Message-ID: <202308080051444293001a@mail.local>
References: <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local>
 <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
 <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
 <202308071440247bbfcdd8@mail.local>
 <202308072237172d39a14b@mail.local>
 <CAMw=ZnRZ-LNhpGvvDH+OBk7LuvdCyxTW5mZGB_f+D8wuB6weLA@mail.gmail.com>
 <CAMKF1srqMkp3LrS0wY=K=MbQLnVjbtvczGa9jC4YKcOs+Cpmew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1srqMkp3LrS0wY=K=MbQLnVjbtvczGa9jC4YKcOs+Cpmew@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 00:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185628

On 07/08/2023 17:01:02-0700, Khem Raj wrote:
> Can you try this patch on top
> 
> https://git.yoctoproject.org/poky-contrib/commit/?h=yoe/mut&id=0defb14c600170434befe8c94dad4732041a3513
> 

I have those two patches on top of master:

systemd-boot: Ensure EFI_LD is also passed to compiler driver
systemd: fix efi dependency


> On Mon, Aug 7, 2023 at 3:48 PM Luca Boccassi <luca.boccassi@gmail.com> wrote:
> >
> > On Mon, 7 Aug 2023 at 23:37, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 07/08/2023 16:40:25+0200, Alexandre Belloni wrote:
> > > > Hello,
> > > >
> > > > I've been looking a bit more at this. there is definitively another
> > > > issue here which is the first one I found:
> > > >
> > > > x86_64-poky-linux-objcopy: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognized
> > > >
> > > > This is the main issue here.
> > > >
> > > > $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > > > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: MS-DOS executable PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
> > > > $ objdump -p /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> > > > objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognized
> > > >
> > > > I tested with v253.7 and I properly get:
> > > >
> > > > $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > > > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
> > > > $ ./build-st/tmp/sysroots-components/x86_64/binutils-cross-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump -h /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> > > >
> > > > /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub:     file format pei-x86-64
> > > >
> > > > Sections:
> > > > Idx Name          Size      VMA               LMA               File off  Algn
> > > >   0 .text         0000d7f0  0000000000004000  0000000000004000  00000400  2**4
> > > >                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> > > >   1 .reloc        0000000c  0000000000012000  0000000000012000  0000dc00  2**2
> > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > >   2 .data         00002ab0  0000000000013000  0000000000013000  0000de00  2**4
> > > >                   CONTENTS, ALLOC, LOAD, DATA
> > > >   3 .dynamic      00000100  0000000000016000  0000000000016000  00010a00  2**2
> > > >                   CONTENTS, ALLOC, LOAD, DATA
> > > >   4 .rela         00000630  0000000000017000  0000000000017000  00010c00  2**2
> > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > >   5 .dynsym       00000018  0000000000018000  0000000000018000  00011400  2**2
> > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > >   6 .sdmagic      0000002a  000000000001a460  000000000001a460  00011600  2**2
> > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > >
> > > > I really believe the recipe is not generating a working efi.stub. Can
> > > > you check?
> > > >
> > >
> > > I've built systemd-boot v254 outside of YP and it generated a proper
> > > linuxx64.efi.stub. I still don't get why the recipe doesn't generate a
> > > working binary.
> > >
> > > The issue seems to be at the linuxx64.elf.stub generation as I took the
> > > one from my YP build, ran it through elf2efi.py on my PC and this didn't
> > > generate a working linuxx64.efi.stub
> >
> > Strange - do you see a difference in compiler/linker flags? That would
> > be the only thing I can think of

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

