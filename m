Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web11.2244.1599032398821533533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 00:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 0402C60275;
	Wed,  2 Sep 2020 07:39:56 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
Subject: Re: [OE-core] Linux v5.8 modules, exec format error
To: Randy Witt <randy.e.witt@linux.intel.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
 <CADkTA4Ob=JpTsenFdNcKzB_5-8xQ+OGm_eQK_QPOPWeizz89QA@mail.gmail.com>
 <162F8C343CCB5CF7.17615@lists.openembedded.org>
 <ab4878e3-da65-2410-eb3a-d815483f085b@embed.me.uk>
 <162F9C3326351CDB.18810@lists.openembedded.org>
 <CADkTA4PRJxj5KdhouVV1h99maCCPwGRTNcaUw2WO4-awKkRD9Q@mail.gmail.com>
 <1a844286-9b72-95c9-56be-979b59d42266@linux.intel.com>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <2da2a00d-13a5-1f3f-c541-ecc40cc27934@embed.me.uk>
Date: Wed, 2 Sep 2020 08:39:52 +0100
MIME-Version: 1.0
In-Reply-To: <1a844286-9b72-95c9-56be-979b59d42266@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable



On 29/08/2020 20:13, Randy Witt wrote:
> On 8/29/20 11:41 AM, Bruce Ashfield wrote:
>> On Fri, Aug 28, 2020 at 10:28 PM Bruce Ashfield via
>> lists.openembedded.org
>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> On Fri, Aug 28, 2020 at 7:15 PM Jack Mitchell <jack@embed.me.uk> wrote=
:
>>>>
>>>> Quick update, I just did an armv7 build with exactly the same codebas=
e
>>>> and everything worked fine. Do you have an aarch64 build could test a=
nd
>>>> confirm working?
>>>
>>> qemuarm64 was working fine here with -rc1. I've started a new build,
>>> but it'll be several hours before I know more (so sometime saturday).
>>>
>=20
> I saw this on linux-modules today,
> https://lore.kernel.org/linux-modules/20200829100334.GK1362448@hirez.pro=
gramming.kicks-ass.net/T/#t
> which references
> https://lore.kernel.org/lkml/20200808101222.5103093e@coco.lan/ saying it
> is a bug in binutils.
>=20
> I haven't looked at it anymore other than seeing this email and that
> issue are both exec format errors on arm. I have to leave and can't
> investigate anymore, but figured this might be useful. If not feel free
> to ignore, and sorry for the noise.

Hi Randy,

Thanks for the heads up, this was indeed was the issue. I'm not sure why
it's not manifesting itself on Bruces builds. It seems to be arm64
specific and directly correlated to the binutils version. There is a
patch coming which will make it in before the release and I assume be
backported to v5.8 stable which is also affected.

Cheers,
Jack.

>>
>> still working here:
>>
>> qemuarm64 login: root
>> root@qemuarm64:~# uname -a
>> Linux qemuarm64 5.9.0-rc2-yoctodev-standard #1 SMP PREEMPT Sat Aug 29
>> 14:26:30 UTC 2020 aarch64 aarch64 aarch64 GNU/Linux
>> root@qemuarm64:~# lsmod
>> Module=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size=C2=A0 Used by
>> sch_fq_codel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 20480=C2=A0 1
>> openvswitch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 155648=C2=A0 0
>> nsh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=A0 1 openvswitch
>> nf_conncount=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 20480=C2=A0 1 openvswitch
>> nf_nat=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40960=C2=A0 1 openvswitch
>> nf_conntrack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1105=
92=C2=A0 3 nf_nat,openvswitch,nf_conncount
>> nf_defrag_ipv6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20480=C2=
=
=A0 2 nf_conntrack,openvswitch
>> nf_defrag_ipv4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16384=C2=
=
=A0 1 nf_conntrack
>> root@qemuarm64:~#
>>
>> Bruce
>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>> Regards,
>>>> Jack.
>>>>
>>>> On 28/08/2020 22:35, Jack Mitchell wrote:
>>>>> Hi Bruce,
>>>>>
>>>>> All built in-tree, the same recipe builds an armv7h kernel so I'll
>>>>> try a
>>>>> build for that and see if it's something aarch64 specific. All the
>>>>> modules are failing to load so it's not something specific to g_ethe=
r.
>>>>> Please see kernel recipe below for reference.
>>>>>
>>>>> LICENSE =3D "GPLv2"
>>>>> LIC_FILES_CHKSUM =3D
>>>>> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>>>>>
>>>>> inherit kernel
>>>>>
>>>>> S =3D "${WORKDIR}/git"
>>>>>
>>>>> SRCREV =3D "redacted"
>>>>> KBRANCH =3D "v5.9-rc2"
>>>>>
>>>>> LINUX_VERSION ?=3D "${KBRANCH}-g${SRCREV}"
>>>>> PV =3D "${LINUX_VERSION}"
>>>>>
>>>>> SRC_URI =3D " \
>>>>>
>>>>> git://git@github.com/redacted/linux.git;name=3Dkernel;branch=3D${KBR=
ANCH};protocol=3Dssh
>>>>>
>>>>> \
>>>>> "
>>>>>
>>>>> do_configure_prepend() {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${KBUILD_D=
EFCONFIG}" ] && [ -f
>>>>> "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake_call -C ${S} CC=3D"${KERNEL_CC}"
>>>>> LD=3D"${KERNEL_LD}" O=3D${B} ${KBUILD_DEFCONFIG}
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>>> }
>>>>>
>>>>> Cheers,
>>>>> Jack.
>>>>>
>>>>> On 28/08/2020 21:55, Bruce Ashfield wrote:
>>>>>> On Fri, Aug 28, 2020 at 4:20 PM Jack Mitchell <ml@embed.me.uk> wrot=
e:
>>>>>>>
>>>>>>> Having just upgraded my mainline kernel recipe to a v5.8/v5.9-rc2
>>>>>>> kernel
>>>>>>> from v5.5.8 I've found that modules have somehow broken. I've
>>>>>>> flicked
>>>>>>> between the two and confirmed that the old kernel build works,
>>>>>>> and the
>>>>>>> 5.8/5.9 build doesn't. I haven't changed anything bar the git comm=
it
>>>>>>> hash. It's a very simple kernel recipe basically just inheriting t=
he
>>>>>>> kernel bbclass and setting SRCREV. Running on current tip of maste=
r.
>>>>>>>
>>>>>>> I assume it's something symver related but wanted to ask if anybod=
y
>>>>>>> knows anything before I dig too deep.
>>>>>>
>>>>>> I can say that it is working for me on 5.8 and 5.9-rcX on the
>>>>>> reference kernels.
>>>>>>
>>>>>> qemux86-64 login: root
>>>>>> root@qemux86-64:~# uname -a
>>>>>> Linux qemux86-64 5.8.4-yocto-standard #1 SMP PREEMPT Wed Aug 26
>>>>>> 16:07:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
>>>>>> root@qemux86-64:~# lsmod
>>>>>> Module=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size=C2=A0 Used by
>>>>>> parport_pc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 24576
>>>>>> parport=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28672=C2=A0 1 parport_pc
>>>>>> ata_piix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 36864=C2=A0 0
>>>>>> floppy=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 77824=C2=A0 0
>>>>>> sch_fq_codel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 20480=C2=A0 1
>>>>>>
>>>>>> my 5.9-rc is rebuilding right now, so I can double check it over
>>>>>> the weekend.
>>>>>>
>>>>>> Not super useful, but there shouldn't be anything fundamentally
>>>>>> broken, since we've been following along with the latest as usual.
>>>>>>
>>>>>> Is your g_ether built in-tree, or out of tree ?
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Cheers,
>>>>>>> Jack.
>>>>>>>
>>>>>>> root@rk3399:~# uname=C2=A0 -a
>>>>>>> Linux rk3399 5.9.0-rc2 #1 SMP PREEMPT Fri Aug 28 18:47:44 UTC 2020
>>>>>>> aarch64 GNU/Linux
>>>>>>>
>>>>>>> root@rk3399:~# modprobe g_ether
>>>>>>> modprobe: ERROR: could not insert 'g_ether': Exec format error
>>>>>>>
>>>>>>> root@rk3399:~# modinfo
>>>>>>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
>>>>>>> filename:
>>>>>>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
>>>>>>> license:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPL
>>>>>>> author:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 David Brow=
nell, Benedikt Spanger
>>>>>>> description:=C2=A0=C2=A0=C2=A0 RNDIS/Ethernet Gadget
>>>>>>> depends:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libcomposite,u_=
ether,usb_f_rndis
>>>>>>> intree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y
>>>>>>> name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
g_ether
>>>>>>> vermagic:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.9.0-rc2 SMP preemp=
t mod_unload aarch64
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
idVendor:USB Vendor ID (ushort)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
idProduct:USB Product ID (ushort)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bcdDevice:USB Device version (BCD) (ushort)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
iSerialNumber:SerialNumber string (charp)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
iManufacturer:USB Manufacturer string (charp)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
iProduct:USB Product string (charp)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qmult:queue length multiplier at high/super speed
>>>>>>> (uint)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
dev_addr:Device Ethernet Address (charp)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
host_addr:Host Ethernet Address (charp)
>>>>>>> parm:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
use_eem:use CDC EEM mode (bool)
>>>>>>>
>>>>>>> [jack@arch-corsair ~]$ file g_ether.ko
>>>>>>> g_ether.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1
>>>>>>> (SYSV),
>>>>>>> BuildID[sha1]=3D375c0485cb8c4b013dc0694725457bd111899f8c, not stri=
pped
>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
>>> --=20
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>
>>
>>
>>
>>
>>
>=20
>=20
>=20
>=20
