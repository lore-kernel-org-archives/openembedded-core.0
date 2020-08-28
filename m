Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web11.1351.1598656575258231449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 16:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4A49660AF2
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 23:16:13 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
Subject: Re: [OE-core] Linux v5.8 modules, exec format error
To: openembedded-core@lists.openembedded.org
References: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
 <CADkTA4Ob=JpTsenFdNcKzB_5-8xQ+OGm_eQK_QPOPWeizz89QA@mail.gmail.com>
 <162F8C343CCB5CF7.17615@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <8c6827f6-26c4-b884-5f8b-c7967137a586@embed.me.uk>
Date: Sat, 29 Aug 2020 00:16:11 +0100
MIME-Version: 1.0
In-Reply-To: <162F8C343CCB5CF7.17615@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Quick update, I just did an armv7 build with exactly the same codebase
and everything worked fine. Do you have an aarch64 build could test and
confirm working?

Regards,
Jack.

On 28/08/2020 22:35, Jack Mitchell wrote:
> Hi Bruce,
> 
> All built in-tree, the same recipe builds an armv7h kernel so I'll try a
> build for that and see if it's something aarch64 specific. All the
> modules are failing to load so it's not something specific to g_ether.
> Please see kernel recipe below for reference.
> 
> LICENSE = "GPLv2"
> LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> 
> inherit kernel
> 
> S = "${WORKDIR}/git"
> 
> SRCREV = "redacted"
> KBRANCH = "v5.9-rc2"
> 
> LINUX_VERSION ?= "${KBRANCH}-g${SRCREV}"
> PV = "${LINUX_VERSION}"
> 
> SRC_URI = " \
> 
> git://git@github.com/redacted/linux.git;name=kernel;branch=${KBRANCH};protocol=ssh
> \
> "
> 
> do_configure_prepend() {
>         if [ -n "${KBUILD_DEFCONFIG}" ] && [ -f
> "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
>                 oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" O=${B} ${KBUILD_DEFCONFIG}
>         fi
> }
> 
> Cheers,
> Jack.
> 
> On 28/08/2020 21:55, Bruce Ashfield wrote:
>> On Fri, Aug 28, 2020 at 4:20 PM Jack Mitchell <ml@embed.me.uk> wrote:
>>>
>>> Having just upgraded my mainline kernel recipe to a v5.8/v5.9-rc2 kernel
>>> from v5.5.8 I've found that modules have somehow broken. I've flicked
>>> between the two and confirmed that the old kernel build works, and the
>>> 5.8/5.9 build doesn't. I haven't changed anything bar the git commit
>>> hash. It's a very simple kernel recipe basically just inheriting the
>>> kernel bbclass and setting SRCREV. Running on current tip of master.
>>>
>>> I assume it's something symver related but wanted to ask if anybody
>>> knows anything before I dig too deep.
>>
>> I can say that it is working for me on 5.8 and 5.9-rcX on the reference kernels.
>>
>> qemux86-64 login: root
>> root@qemux86-64:~# uname -a
>> Linux qemux86-64 5.8.4-yocto-standard #1 SMP PREEMPT Wed Aug 26
>> 16:07:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
>> root@qemux86-64:~# lsmod
>> Module                  Size  Used by
>> parport_pc             24576
>> parport                28672  1 parport_pc
>> ata_piix               36864  0
>> floppy                 77824  0
>> sch_fq_codel           20480  1
>>
>> my 5.9-rc is rebuilding right now, so I can double check it over the weekend.
>>
>> Not super useful, but there shouldn't be anything fundamentally
>> broken, since we've been following along with the latest as usual.
>>
>> Is your g_ether built in-tree, or out of tree ?
>>
>> Bruce
>>
>>
>>>
>>> Cheers,
>>> Jack.
>>>
>>> root@rk3399:~# uname  -a
>>> Linux rk3399 5.9.0-rc2 #1 SMP PREEMPT Fri Aug 28 18:47:44 UTC 2020
>>> aarch64 GNU/Linux
>>>
>>> root@rk3399:~# modprobe g_ether
>>> modprobe: ERROR: could not insert 'g_ether': Exec format error
>>>
>>> root@rk3399:~# modinfo
>>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
>>> filename:
>>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
>>> license:        GPL
>>> author:         David Brownell, Benedikt Spanger
>>> description:    RNDIS/Ethernet Gadget
>>> depends:        libcomposite,u_ether,usb_f_rndis
>>> intree:         Y
>>> name:           g_ether
>>> vermagic:       5.9.0-rc2 SMP preempt mod_unload aarch64
>>> parm:           idVendor:USB Vendor ID (ushort)
>>> parm:           idProduct:USB Product ID (ushort)
>>> parm:           bcdDevice:USB Device version (BCD) (ushort)
>>> parm:           iSerialNumber:SerialNumber string (charp)
>>> parm:           iManufacturer:USB Manufacturer string (charp)
>>> parm:           iProduct:USB Product string (charp)
>>> parm:           qmult:queue length multiplier at high/super speed (uint)
>>> parm:           dev_addr:Device Ethernet Address (charp)
>>> parm:           host_addr:Host Ethernet Address (charp)
>>> parm:           use_eem:use CDC EEM mode (bool)
>>>
>>> [jack@arch-corsair ~]$ file g_ether.ko
>>> g_ether.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1 (SYSV),
>>> BuildID[sha1]=375c0485cb8c4b013dc0694725457bd111899f8c, not stripped
>>>
>>
>>
> 
> 
> 
> 
