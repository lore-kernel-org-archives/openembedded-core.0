Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1461C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 22:37:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.48811.1691447839554667319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 15:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QaOWvyWs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DFA61C0007;
	Mon,  7 Aug 2023 22:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691447837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f7aOqCuRlj7xWogZtn1aY+x55rFKs5VEhmOat8FQ3Ew=;
	b=QaOWvyWslntoeCf3LxhftFH3cZyz4WnjsOtsKHjlDPIaYYT1R2n7Vi5q99PMIdrhlE8rg4
	WOhPAxjylBqi6D9JSNLENMEqZnJ7RPcLFVdiFv4I2gzXf1iIQ4fQqbEdcjQa5QHghtl5KY
	8O3+mK9eMgiEVcwpWeU6N7S/cyOjegL4d51s2tvxVFYoLbCij4mqCYDrUFaDd995a8qLRx
	bj/aUgVlm3JcusI/Qy2KPfpaoh4Jf0OxkcZeNPHHV3zmIzcmCePshkURbbzzHIGDOl3ejF
	nsdDQIVc1wI1GqDZBgLzq8XAN2GiubEWRZy6HNKLHde35NXSkfh0MEv5kAC/NA==
Date: Tue, 8 Aug 2023 00:37:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
Message-ID: <202308072237172d39a14b@mail.local>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com>
 <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local>
 <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
 <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
 <202308071440247bbfcdd8@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308071440247bbfcdd8@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 22:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185625

On 07/08/2023 16:40:25+0200, Alexandre Belloni wrote:
> Hello,
> 
> I've been looking a bit more at this. there is definitively another
> issue here which is the first one I found:
> 
> x86_64-poky-linux-objcopy: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognized
> 
> This is the main issue here.
> 
> $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: MS-DOS executable PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
> $ objdump -p /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) ignored
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> objdump: /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognized
> 
> I tested with v253.7 and I properly get:
> 
> $ file /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
> $ ./build-st/tmp/sysroots-components/x86_64/binutils-cross-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump -h /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub
> 
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub:     file format pei-x86-64
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
>   0 .text         0000d7f0  0000000000004000  0000000000004000  00000400  2**4
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   1 .reloc        0000000c  0000000000012000  0000000000012000  0000dc00  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   2 .data         00002ab0  0000000000013000  0000000000013000  0000de00  2**4
>                   CONTENTS, ALLOC, LOAD, DATA
>   3 .dynamic      00000100  0000000000016000  0000000000016000  00010a00  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>   4 .rela         00000630  0000000000017000  0000000000017000  00010c00  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   5 .dynsym       00000018  0000000000018000  0000000000018000  00011400  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   6 .sdmagic      0000002a  000000000001a460  000000000001a460  00011600  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> 
> I really believe the recipe is not generating a working efi.stub. Can
> you check?
> 

I've built systemd-boot v254 outside of YP and it generated a proper
linuxx64.efi.stub. I still don't get why the recipe doesn't generate a
working binary.

The issue seems to be at the linuxx64.elf.stub generation as I took the
one from my YP build, ran it through elf2efi.py on my PC and this didn't
generate a working linuxx64.efi.stub


> 
> On 06/08/2023 14:56:16+0100, Luca Bocassi wrote:
> > On Sun, 6 Aug 2023 at 14:50, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sun, 2023-08-06 at 14:34 +0100, Luca Bocassi wrote:
> > > > On Sun, 6 Aug 2023 at 14:22, Alexandre Belloni
> > > > <alexandre.belloni@bootlin.com> wrote:
> > > > >
> > > > > On 06/08/2023 14:15:27+0100, Luca Bocassi wrote:
> > > > > > Where does that objcopy command come from? It looks awfully like it is
> > > > > > hard-coding VMAs? That cannot possibly work reliably, the actual VMAs
> > > > > > have to be calculated based on the components being added to the PE.
> > > > > > I'd recommend to use 'ukify' as that makes it much easier, and
> > > > > > actually we have an intern working to add a bbclass for that just now.
> > > > > > But it's not needed, you can do the calculations by hand too, dracut
> > > > > > used to do something similar and was fixed some months ago iirc.
> > > > >
> > > > > This is from do_prepare_partition in scripts/lib/wic/plugins/source/bootimg-efi.py
> > > >
> > > > https://git.yoctoproject.org/poky/plain/scripts/lib/wic/plugins/source/bootimg-efi.py
> > > >
> > > >                 objcopy_cmd = "%s-objcopy" % target_sys
> > > >                 objcopy_cmd += " --enable-deterministic-archives"
> > > >                 objcopy_cmd += " --preserve-dates"
> > > >                 objcopy_cmd += " --add-section
> > > > .osrel=%s/usr/lib/os-release" % staging_dir_host
> > > >                 objcopy_cmd += " --change-section-vma .osrel=0x20000"
> > > >                 objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
> > > >                 objcopy_cmd += " --change-section-vma .cmdline=0x30000"
> > > >                 objcopy_cmd += dtb_params
> > > >                 objcopy_cmd += " --add-section .linux=%s/%s" %
> > > > (staging_kernel_dir, kernel)
> > > >                 objcopy_cmd += " --change-section-vma .linux=0x2000000"
> > > >                 objcopy_cmd += " --add-section .initrd=%s" % initrd.name
> > > >                 objcopy_cmd += " --change-section-vma .initrd=0x3000000"
> > > >                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
> > > >
> > > > Yeah that's a bug, and it needs to be fixed, those sizes can't be
> > > > hard-coded like that, as soon as you build a slightly different stub
> > > > it's going to break.
> > >
> > > Given this is causing multiple breakages on the automated testing, the
> > > systemd upgrade shouldn't have merged. It has. Technically I should
> > > really just revert everything (the upgrade and the fixes on top) and
> > > wait until someone has a fix for this. I'd prefer not to since we
> > > obviously do want to upgrade eventually.
> > >
> > > Is there anything we can do with this short term to make things work?
> > > Can the offsets we need be read from somewhere?
> > 
> > The Arch wiki has good and concise documentation on how to do it:
> > 
> > https://wiki.archlinux.org/title/Unified_kernel_image#Manually
> > 
> > This is the equivalent fix that was merged in Dracut some months ago:
> > 
> > https://github.com/dracutdevs/dracut/commit/f32e95bcadbc5158843530407adc1e7b700561b1
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185570): https://lists.openembedded.org/g/openembedded-core/message/185570
> > Mute This Topic: https://lists.openembedded.org/mt/100516497/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

