Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.48022.1629248298135906223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 17:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=zmCZfLFo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id e14so1138184qkg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wgaNvz/kS0pycHMXBDAgqpH/LDQzbSJKWK7tcEe5PnM=;
        b=zmCZfLFon5ZSK2BSlWa/hmJpC2vmJzh7MZyVAn3pdTRkyvrQlc6l32wLib8LipwVTy
         TzjnvhMhwIzO1Zi59OBLurysv6hvW5dAlcL8y8YNoOYai7BnCJlERW5NmdK60rVFNXg3
         jJneYOt41jgmkCRaVGRmBgMwacPV59XkAcztZQQveVqQamzc+TgDGkUl4rbPr7h+io2N
         5eI0qYOW6dM03EYznkNhKX72LlNI0I6dj+ki+tFxzgi34nuANBDVnHoQ9axLB9250+DK
         6hktoZbS+OkK6Py9irToZu5yYWDzfMO482S+I0XBJN1QrCaXLL/GpCeuEZNUQOqboPoU
         D6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wgaNvz/kS0pycHMXBDAgqpH/LDQzbSJKWK7tcEe5PnM=;
        b=n3Bwr/HFbl/amL4vxyqArp7gEVsIz48g12xzTJ4HzUFPs0ujLqhepbD4tj+RqwNIDU
         Wjx+VL1oxP3wpGgfYVtQTPwvsbwrUQW638ziixlOJ3ohYh3fUkW9SqNywYjrBFShvc9q
         RNWKG7NrfYXoTmi6kNTk0dPxnxG1qC661DKuC8DcPsGaysU8Tjf0XQgDvA+4IU62rwqn
         SzT/cCnHmG3rMntaFCFuAL6KVOTy9EjXUCGQ8juX91H74wzwrCYTmwz9e9FMJpeo9fS6
         f+Itzq/YRNhx8lGLBER6VJ4TuQUdm5aw8hN/kQUUUfhdhtIbteR+3yTb0ot4k1j4kKvA
         oAvg==
X-Gm-Message-State: AOAM533xM6z7wIAdhd7rWz5BC1lxNwtG7FfNWh7k5EiSoKxUrcWTC+qM
	wnXH4cJR+ePAcv/0ZoI+GhC4LXYvJuCbMuuI1gJq1w==
X-Google-Smtp-Source: ABdhPJzEFR9L+/o8ApOUFyHXyrmGjGJWi86SF8Be2JHp1XPH23dXs7pyxbjDZL16n5B0ibsIOYlUpJyYAx2nx5karoA=
X-Received: by 2002:a37:6846:: with SMTP id d67mr6676005qkc.110.1629248297110;
 Tue, 17 Aug 2021 17:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210816220144.26018-1-jdmason@kudzu.us> <YRwfyaIJa9A9Psm+@piout.net>
In-Reply-To: <YRwfyaIJa9A9Psm+@piout.net>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Tue, 17 Aug 2021 20:58:06 -0400
Message-ID: <CAPoiz9xLGYUw-eXUN7TxrfDaD6+S2w1YWDHz3m5Z-Nwgw7psaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] tunes: the great migration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 4:44 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Jon,
>
> I did run that through the autobuilders:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2457
>
> This is mostly good, the meta-arm failure is about a kernel patch not
> applying, I don't think it is related, you'd have to rebase
> meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch

Yes, this is fallout from the kernel updating behind us.  That patch
was upstreamed and is now unnecessary.  I have a patch queued to
address it.

Thanks for all the testing.  This was quite an invasive change and it needed it.

Thanks,
Jon

>
> Anuj, the remaining failure is in meta-intel:
> ERROR: ParseError at /home/pokybuild/yocto-worker/meta-intel/build/meta-intel/conf/machine/include/intel-corei7-64-common.inc:6: Could not include required file conf/machine/include/tune-corei7.inc
>
> Can you take care of fixing that?
>
> I you want to test, my branch is here:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abelloni/testing
>
>
>
> On 16/08/2021 18:01:41-0400, Jon Mason wrote:
> > New in v2
> > * Fix relocation oversight issue found by Alexandre Belloni
> > * More aggressive sorting of Arm, putting each tune into it's respective
> >   design versioned family
> >
> > I ran a quick and dirty CI on this via gitlab, though now including
> > machines for all present in meta-yocto-bsp.  The results can be found
> > at https://gitlab.com/jonmason00/poky/-/pipelines/353961908
> > NOTE: CI is also including patches from upcoming series to support
> > Cortex-R.  So, it's not 100% pristine.
> >
> > ---
> >
> > Move all tune files into their architecture directory.
> >
> > I'm doing this all as one series, even though they are going to
> > different repos, as an attempt to make this as atomic as possible.
> >
> >
> > Jon Mason (3):
> >   conf/machine: move tune files to architecture directories
> >   yocto-bsp: update machine confs with new tune locations
> >   docs: update docs with new tune locations
> >
> >  documentation/bsp-guide/bsp.rst                               | 4 ++--
> >  documentation/dev-manual/common-tasks.rst                     | 2 +-
> >  documentation/ref-manual/variables.rst                        | 2 +-
> >  meta-yocto-bsp/conf/machine/beaglebone-yocto.conf             | 2 +-
> >  meta-yocto-bsp/conf/machine/edgerouter.conf                   | 2 +-
> >  meta-yocto-bsp/conf/machine/genericx86-64.conf                | 2 +-
> >  meta-yocto-bsp/conf/machine/genericx86.conf                   | 2 +-
> >  meta-yocto-bsp/conf/machine/include/genericx86-common.inc     | 4 ++--
> >  meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc    | 0
> >  meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc   | 0
> >  meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc     | 0
> >  .../machine/include/{ => arm/armv4}/tune-strongarm1100.inc    | 0
> >  meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc     | 0
> >  .../conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc | 0
> >  .../conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc | 0
> >  .../{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc}      | 0
> >  .../armv6m/tune-cortexm0plus.inc}                             | 0
> >  meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc | 0
> >  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc | 0
> >  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc  | 0
> >  meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc  | 0
> >  .../machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc  | 0
> >  meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc        | 0
> >  .../conf/machine/include/{ => microblaze}/tune-microblaze.inc | 0
> >  meta/conf/machine/include/{ => mips}/qemuboot-mips.inc        | 0
> >  meta/conf/machine/include/mips/tune-mips-24k.inc              | 2 +-
> >  meta/conf/machine/include/mips/tune-mips-74k.inc              | 2 +-
> >  meta/conf/machine/include/{ => mips}/tune-mips32.inc          | 0
> >  meta/conf/machine/include/{ => mips}/tune-mips32r2.inc        | 2 +-
> >  meta/conf/machine/include/{ => mips}/tune-mips32r6.inc        | 0
> >  meta/conf/machine/include/mips/tune-mips64.inc                | 3 +++
> >  meta/conf/machine/include/{ => mips}/tune-mips64r2.inc        | 2 +-
> >  meta/conf/machine/include/{ => mips}/tune-mips64r6.inc        | 0
> >  meta/conf/machine/include/{ => mips}/tune-octeon.inc          | 2 +-
> >  meta/conf/machine/include/{ => powerpc}/tune-power5.inc       | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-power6.inc       | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-power7.inc       | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-power9.inc       | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc       | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc      | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc      | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc    | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc    | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc      | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc    | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc    | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc     | 0
> >  meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc     | 0
> >  meta/conf/machine/include/{ => sh}/tune-sh3.inc               | 0
> >  meta/conf/machine/include/{ => sh}/tune-sh4.inc               | 2 +-
> >  meta/conf/machine/include/tune-mips64.inc                     | 3 ---
> >  meta/conf/machine/include/{ => x86}/qemuboot-x86.inc          | 0
> >  meta/conf/machine/include/{ => x86}/tune-atom.inc             | 2 +-
> >  meta/conf/machine/include/{ => x86}/tune-c3.inc               | 0
> >  meta/conf/machine/include/{ => x86}/tune-core2.inc            | 2 +-
> >  meta/conf/machine/include/{ => x86}/tune-corei7.inc           | 2 +-
> >  meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc         | 0
> >  meta/conf/machine/include/{ => x86}/tune-i586.inc             | 0
> >  meta/conf/machine/include/{ => x86}/tune-i686.inc             | 2 +-
> >  meta/conf/machine/include/{ => x86}/x86-base.inc              | 0
> >  meta/conf/machine/qemuarm.conf                                | 2 +-
> >  meta/conf/machine/qemuarm64.conf                              | 2 +-
> >  meta/conf/machine/qemuarmv5.conf                              | 2 +-
> >  meta/conf/machine/qemumips.conf                               | 4 ++--
> >  meta/conf/machine/qemumips64.conf                             | 4 ++--
> >  meta/conf/machine/qemuppc.conf                                | 2 +-
> >  meta/conf/machine/qemuppc64.conf                              | 2 +-
> >  meta/conf/machine/qemux86-64.conf                             | 4 ++--
> >  meta/conf/machine/qemux86.conf                                | 4 ++--
> >  86 files changed, 36 insertions(+), 36 deletions(-)
> >  rename meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv4}/tune-strongarm1100.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc (100%)
> >  rename meta/conf/machine/include/{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc} (100%)
> >  rename meta/conf/machine/include/{tune-cortex-m0plus.inc => arm/armv6m/tune-cortexm0plus.inc} (100%)
> >  rename meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc (100%)
> >  rename meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc (100%)
> >  rename meta/conf/machine/include/{ => microblaze}/tune-microblaze.inc (100%)
> >  rename meta/conf/machine/include/{ => mips}/qemuboot-mips.inc (100%)
> >  rename meta/conf/machine/include/{ => mips}/tune-mips32.inc (100%)
> >  rename meta/conf/machine/include/{ => mips}/tune-mips32r2.inc (95%)
> >  rename meta/conf/machine/include/{ => mips}/tune-mips32r6.inc (100%)
> >  create mode 100644 meta/conf/machine/include/mips/tune-mips64.inc
> >  rename meta/conf/machine/include/{ => mips}/tune-mips64r2.inc (98%)
> >  rename meta/conf/machine/include/{ => mips}/tune-mips64r6.inc (100%)
> >  rename meta/conf/machine/include/{ => mips}/tune-octeon.inc (96%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-power5.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-power6.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-power7.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-power9.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc (100%)
> >  rename meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc (100%)
> >  rename meta/conf/machine/include/{ => sh}/tune-sh3.inc (100%)
> >  rename meta/conf/machine/include/{ => sh}/tune-sh4.inc (93%)
> >  delete mode 100644 meta/conf/machine/include/tune-mips64.inc
> >  rename meta/conf/machine/include/{ => x86}/qemuboot-x86.inc (100%)
> >  rename meta/conf/machine/include/{ => x86}/tune-atom.inc (50%)
> >  rename meta/conf/machine/include/{ => x86}/tune-c3.inc (100%)
> >  rename meta/conf/machine/include/{ => x86}/tune-core2.inc (97%)
> >  rename meta/conf/machine/include/{ => x86}/tune-corei7.inc (97%)
> >  rename meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc (100%)
> >  rename meta/conf/machine/include/{ => x86}/tune-i586.inc (100%)
> >  rename meta/conf/machine/include/{ => x86}/tune-i686.inc (94%)
> >  rename meta/conf/machine/include/{ => x86}/x86-base.inc (100%)
> >
> > --
> > 2.20.1
> >
>
> >
> > 
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
