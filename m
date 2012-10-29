Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TStya-0005qF-QQ
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 19:22:16 +0100
Received: from mail32-am1-R.bigfish.com (10.3.201.238) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Mon, 29 Oct 2012 18:08:42 +0000
Received: from mail32-am1 (localhost [127.0.0.1])	by mail32-am1-R.bigfish.com
	(Postfix) with ESMTP id 8DB2732017F;
	Mon, 29 Oct 2012 18:08:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i1155h)
Received: from mail32-am1 (localhost.localdomain [127.0.0.1]) by mail32-am1
	(MessageSwitch) id 1351534120314630_6794;
	Mon, 29 Oct 2012 18:08:40 +0000 (UTC)
Received: from AM1EHSMHS011.bigfish.com (unknown [10.3.201.249])	by
	mail32-am1.bigfish.com (Postfix) with ESMTP id 4A67A1C00E1;
	Mon, 29 Oct 2012 18:08:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS011.bigfish.com
	(10.3.207.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 29 Oct 2012 18:08:39 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.103]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0318.003; Mon, 29 Oct 2012 18:08:38 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Thread-Topic: [OE-core] [PATCH] u-boot.inc: update linker arguments to pass
	--sysroot arg (BUILD BREAKAGE)
Thread-Index: AQHNtgBrV/2+ASMxlUS1Y1PAFOHAmw==
Date: Mon, 29 Oct 2012 18:08:37 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A72C925@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1343319703-15704-1-git-send-email-msm@freescale.com>
	<1343554172.16998.32.camel@ted> <508E4BAF.9080901@dresearch-fe.de>
	<CAEsOVNdBpH__03pF_M4eHbb+Etanx0AfAh3U-5vHAXoGcueKzQ@mail.gmail.com>
In-Reply-To: <CAEsOVNdBpH__03pF_M4eHbb+Etanx0AfAh3U-5vHAXoGcueKzQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: update linker arguments to pass --sysroot arg (BUILD BREAKAGE)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 18:22:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F9DFD8B3033B18428D578D18DD8B54D8@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 29, 2012 at 9:36 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> On Mon, Oct 29, 2012 at 4:26 AM, Steffen Sledz <sledz@dresearch-fe.de> wr=
ote:
>> On 29.07.2012 11:29, Richard Purdie wrote:
>>> On Thu, 2012-07-26 at 11:21 -0500, Matthew McClintock wrote:
>>>> If we are building from sstate-cache it's possible to be building
>>>> from another folder on another machine, therefore the linker requires
>>>> that a proper --sysroot is passed too it so it can find things like
>>>> libgcc.a and avoid errors such as:
>>>>
>>>> | arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-f=
loat   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=3D0x80008000 -I/local/yocto/upst=
ream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beaglebo=
ard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229=
d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /lo=
cal/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp=
/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib=
/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/includ=
e -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=3Daapcs-linux -mno-thumb-inter=
work -march=3Darmv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-top=
level-reorder   -o hello_world.o hello_world.c -c
>>>> | arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-f=
loat   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=3D0x80008000 -I/local/yocto/upst=
ream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beaglebo=
ard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229=
d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /lo=
cal/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp=
/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib=
/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/includ=
e -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=3Daapcs-linux -mno-thumb-inter=
work -march=3Darmv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-top=
level-reorder   -o stubs.o stubs.c -c
>>>> | arm-poky-linux-gnueabi-ld  -r -o libstubs.o  stubs.o
>>>> | arm-poky-linux-gnueabi-ld -g -Ttext 0x80300000 \
>>>> |                    -o hello_world -e hello_world hello_world.o libst=
ubs.o \
>>>> |                    -L. -lgcc
>>>> | arm-poky-linux-gnueabi-ld: cannot find -lgcc
>>>> | make[1]: *** [hello_world] Error 1
>>>>
>>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>>> ---
>>>>  meta/recipes-bsp/u-boot/u-boot.inc           |    2 +-
>>>>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
>>>>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
>>>>  meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    1 +
>>>>  4 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>>
>>> Merged to master, thanks.
>>
>> While trying to migrate the u-boot support for our machine from oe-class=
ic i hit a problem with this patch. :(
>>
>> The
>>
>>   EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREF=
IX}gcc ${TOOLCHAIN_OPTIONS}"'
>>
>> in u-boot.inc leads to compiling problems with some build support tools.=
 The tools (e.g. bmp_logo) are now compiled with the target compiler (arm-o=
e-linux-gnueabi-gcc in our case) instead of the host compiler. This results=
 in build errors like
>>
>> | ./bmp_logo logos/denx.bmp >/pm/sledz/oe-core/build/tmp-eglibc/work/hip=
ox-oe-linux-gnueabi/u-boot-v2009.03+git91+e60beb13cf0135dc71c541021487b5ccc=
4d269cb-r8/git/include/bmp_logo.h
>> | /bin/sh: ./bmp_logo: cannot execute binary file
>>
>> Reverting to
>>
>>   EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX}'
>>
>> seems to fix this problem.
>
> That however will break building from sstate... we might need to patch
> u-boot's Makefiles here...

Looking closer you are using a really old u-boot. Can you update? The
Makefile for bmp_logo uses HOSTCC so this should not be an issue with
a recent u-boot.

-M=



