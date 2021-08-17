Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.45144.1629233099822188710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 13:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6491BFF802;
	Tue, 17 Aug 2021 20:44:57 +0000 (UTC)
Date: Tue, 17 Aug 2021 22:44:57 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Jon Mason <jdmason@kudzu.us>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 0/3] tunes: the great migration
Message-ID: <YRwfyaIJa9A9Psm+@piout.net>
References: <20210816220144.26018-1-jdmason@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20210816220144.26018-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jon,

I did run that through the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2457

This is mostly good, the meta-arm failure is about a kernel patch not
applying, I don't think it is related, you'd have to rebase
meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch

Anuj, the remaining failure is in meta-intel:
ERROR: ParseError at /home/pokybuild/yocto-worker/meta-intel/build/meta-intel/conf/machine/include/intel-corei7-64-common.inc:6: Could not include required file conf/machine/include/tune-corei7.inc

Can you take care of fixing that?

I you want to test, my branch is here:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abelloni/testing



On 16/08/2021 18:01:41-0400, Jon Mason wrote:
> New in v2
> * Fix relocation oversight issue found by Alexandre Belloni
> * More aggressive sorting of Arm, putting each tune into it's respective
>   design versioned family
> 
> I ran a quick and dirty CI on this via gitlab, though now including
> machines for all present in meta-yocto-bsp.  The results can be found
> at https://gitlab.com/jonmason00/poky/-/pipelines/353961908
> NOTE: CI is also including patches from upcoming series to support
> Cortex-R.  So, it's not 100% pristine. 
> 
> ---
> 
> Move all tune files into their architecture directory.
> 
> I'm doing this all as one series, even though they are going to
> different repos, as an attempt to make this as atomic as possible.
> 
> 
> Jon Mason (3):
>   conf/machine: move tune files to architecture directories
>   yocto-bsp: update machine confs with new tune locations
>   docs: update docs with new tune locations
> 
>  documentation/bsp-guide/bsp.rst                               | 4 ++--
>  documentation/dev-manual/common-tasks.rst                     | 2 +-
>  documentation/ref-manual/variables.rst                        | 2 +-
>  meta-yocto-bsp/conf/machine/beaglebone-yocto.conf             | 2 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf                   | 2 +-
>  meta-yocto-bsp/conf/machine/genericx86-64.conf                | 2 +-
>  meta-yocto-bsp/conf/machine/genericx86.conf                   | 2 +-
>  meta-yocto-bsp/conf/machine/include/genericx86-common.inc     | 4 ++--
>  meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc    | 0
>  meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc   | 0
>  meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc     | 0
>  .../machine/include/{ => arm/armv4}/tune-strongarm1100.inc    | 0
>  meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc  | 0
>  meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc     | 0
>  meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc     | 0
>  .../conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc | 0
>  .../conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc | 0
>  .../{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc}      | 0
>  .../armv6m/tune-cortexm0plus.inc}                             | 0
>  meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc | 0
>  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc | 0
>  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc  | 0
>  meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc  | 0
>  .../machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc | 0
>  .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc | 0
>  .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc | 0
>  .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc     | 0
>  meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc  | 0
>  meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc        | 0
>  .../conf/machine/include/{ => microblaze}/tune-microblaze.inc | 0
>  meta/conf/machine/include/{ => mips}/qemuboot-mips.inc        | 0
>  meta/conf/machine/include/mips/tune-mips-24k.inc              | 2 +-
>  meta/conf/machine/include/mips/tune-mips-74k.inc              | 2 +-
>  meta/conf/machine/include/{ => mips}/tune-mips32.inc          | 0
>  meta/conf/machine/include/{ => mips}/tune-mips32r2.inc        | 2 +-
>  meta/conf/machine/include/{ => mips}/tune-mips32r6.inc        | 0
>  meta/conf/machine/include/mips/tune-mips64.inc                | 3 +++
>  meta/conf/machine/include/{ => mips}/tune-mips64r2.inc        | 2 +-
>  meta/conf/machine/include/{ => mips}/tune-mips64r6.inc        | 0
>  meta/conf/machine/include/{ => mips}/tune-octeon.inc          | 2 +-
>  meta/conf/machine/include/{ => powerpc}/tune-power5.inc       | 0
>  meta/conf/machine/include/{ => powerpc}/tune-power6.inc       | 0
>  meta/conf/machine/include/{ => powerpc}/tune-power7.inc       | 0
>  meta/conf/machine/include/{ => powerpc}/tune-power9.inc       | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc       | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc      | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc      | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc    | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc    | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc      | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc    | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc    | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc     | 0
>  meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc     | 0
>  meta/conf/machine/include/{ => sh}/tune-sh3.inc               | 0
>  meta/conf/machine/include/{ => sh}/tune-sh4.inc               | 2 +-
>  meta/conf/machine/include/tune-mips64.inc                     | 3 ---
>  meta/conf/machine/include/{ => x86}/qemuboot-x86.inc          | 0
>  meta/conf/machine/include/{ => x86}/tune-atom.inc             | 2 +-
>  meta/conf/machine/include/{ => x86}/tune-c3.inc               | 0
>  meta/conf/machine/include/{ => x86}/tune-core2.inc            | 2 +-
>  meta/conf/machine/include/{ => x86}/tune-corei7.inc           | 2 +-
>  meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc         | 0
>  meta/conf/machine/include/{ => x86}/tune-i586.inc             | 0
>  meta/conf/machine/include/{ => x86}/tune-i686.inc             | 2 +-
>  meta/conf/machine/include/{ => x86}/x86-base.inc              | 0
>  meta/conf/machine/qemuarm.conf                                | 2 +-
>  meta/conf/machine/qemuarm64.conf                              | 2 +-
>  meta/conf/machine/qemuarmv5.conf                              | 2 +-
>  meta/conf/machine/qemumips.conf                               | 4 ++--
>  meta/conf/machine/qemumips64.conf                             | 4 ++--
>  meta/conf/machine/qemuppc.conf                                | 2 +-
>  meta/conf/machine/qemuppc64.conf                              | 2 +-
>  meta/conf/machine/qemux86-64.conf                             | 4 ++--
>  meta/conf/machine/qemux86.conf                                | 4 ++--
>  86 files changed, 36 insertions(+), 36 deletions(-)
>  rename meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv4}/tune-strongarm1100.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc (100%)
>  rename meta/conf/machine/include/{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc} (100%)
>  rename meta/conf/machine/include/{tune-cortex-m0plus.inc => arm/armv6m/tune-cortexm0plus.inc} (100%)
>  rename meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
>  rename meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc (100%)
>  rename meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc (100%)
>  rename meta/conf/machine/include/{ => microblaze}/tune-microblaze.inc (100%)
>  rename meta/conf/machine/include/{ => mips}/qemuboot-mips.inc (100%)
>  rename meta/conf/machine/include/{ => mips}/tune-mips32.inc (100%)
>  rename meta/conf/machine/include/{ => mips}/tune-mips32r2.inc (95%)
>  rename meta/conf/machine/include/{ => mips}/tune-mips32r6.inc (100%)
>  create mode 100644 meta/conf/machine/include/mips/tune-mips64.inc
>  rename meta/conf/machine/include/{ => mips}/tune-mips64r2.inc (98%)
>  rename meta/conf/machine/include/{ => mips}/tune-mips64r6.inc (100%)
>  rename meta/conf/machine/include/{ => mips}/tune-octeon.inc (96%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-power5.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-power6.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-power7.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-power9.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc (100%)
>  rename meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc (100%)
>  rename meta/conf/machine/include/{ => sh}/tune-sh3.inc (100%)
>  rename meta/conf/machine/include/{ => sh}/tune-sh4.inc (93%)
>  delete mode 100644 meta/conf/machine/include/tune-mips64.inc
>  rename meta/conf/machine/include/{ => x86}/qemuboot-x86.inc (100%)
>  rename meta/conf/machine/include/{ => x86}/tune-atom.inc (50%)
>  rename meta/conf/machine/include/{ => x86}/tune-c3.inc (100%)
>  rename meta/conf/machine/include/{ => x86}/tune-core2.inc (97%)
>  rename meta/conf/machine/include/{ => x86}/tune-corei7.inc (97%)
>  rename meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc (100%)
>  rename meta/conf/machine/include/{ => x86}/tune-i586.inc (100%)
>  rename meta/conf/machine/include/{ => x86}/tune-i686.inc (94%)
>  rename meta/conf/machine/include/{ => x86}/x86-base.inc (100%)
> 
> -- 
> 2.20.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
