Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbewa-0000GN-M1
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:31:37 +0200
Received: by pwi1 with SMTP id 1so431114pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=dJI57V/WVz46qcmTj8KSgUaViMbDPcuJiUBWwzVwnZ8=;
	b=QHW9+XPKjPG1oMw8jzQrhH1piNrJXKVk/ZiFWQ5QW91SNyY3JYiS3n8A8du3tsa1+k
	MqK7QMs3CELWKeuD9KateKRC5+5biuEe+Jb31b3XOSrR+VwT5FzZaNZAmWyleOTTF+z0
	lBZ6vI+cGS22/hSxIbaZB38dNVYbEdVog7YYo=
Received: by 10.68.32.66 with SMTP id g2mr5859pbi.26.1309292871106; Tue, 28
	Jun 2011 13:27:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Tue, 28 Jun 2011 13:27:21 -0700 (PDT)
In-Reply-To: <4E049B38.5000506@windriver.com>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E049B38.5000506@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 13:27:21 -0700
Message-ID: <BANLkTiksMpKHxUB1rYwxHOyyT5WMm6VGfw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Tune files and knobs to turn
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 20:31:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2011 at 7:12 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> A few, what I suspect are corrections. =C2=A0(I'm going to be a bit pedan=
tic here.)
>
> On 6/24/11 6:54 AM, Koen Kooi wrote:
>> Hi,
>>
>> We discussed tune files a bit during last nights TSC meeting and Khem ha=
d expressed the need before, so I'd like to get this discussion started by =
using armv7a as an example.
>>
>> For armv7a capable cores we have the following hardware features:
>>
>> * armv7a instruction set
>> * thumb1 instruction set
>> * thumb2 instruction set
>> * VFP coprocessor
>> * optional NEON coprocessor
>>
>> For the ABI we can choose the following:
>>
>> * softtp without hw support (e.g. no VFP instructions emitted, slow)
>> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, fas=
t)
>> * hardfp, emits VFP and/or NEON instructions, slightly faster than softf=
p/hw, incompatible with everything else
>
> Actually on ARM there are three ABIs possible but those are not it.
>
> OABI - softfp
> OABI - hardfp
> EABI

OABI is probably something we should drop in this era.
So we are left with

a. EABI + soft float ( No hard fp at all)
b. EABI + soft vfp ( Use softfloat calling convention but utilize
hardfp instruction in code generation)
c. EABI + hardfp ( use hardfp for parameter passing and use hard fp
instructions as desrired)

now with hardfp there could be that we use neon or we use vfp only.
and in vfp there are two variants
vfp-d16 and vfp-d32 there are some implementations of armv7 where neon
is not part of SOC and some implement vfp-d16
and some vfp-d32. This greatly affects option b. and c. above

in above case. a and b are compatible provided hardware supports neon/vfp
but c. is not compatible and toolchain obviously needs to be
configured for this as well
unless we want this sort of things in multilib too.

using neon also depends on machine features.

So we need combination of machine features e.g. does it have neon does
it implement vfpv3-d16 or d32 or no FPU at all
then we need hardfloat ABI which is a distro feature I would say and
is only enabled when underlying hardware support
is found through machine features. So we need a switch to select if
hardfp is desired.

Thumb1 and thumb2 can be covered with passing right options globally
to CC iow TARGET_CC_ARCH for most parts

>
> As far as I know nobody uses OABI anymore, and I doubt we should support =
it.
>
> The above are really instructions used within the ABI.
>
>> And the extra knobs:
>>
>> * pure thumb1, no arm instructions (limited use)
>> * thumb1/arm interworking
>> * pure thumb2, =C2=A0no arm instructions
>> * thumb2 interworking (not sure if that's actually usefull, thumb2 has c=
omplete coverage)
>>
>> In OE .dev we have the following vars:
>>
>> TARGET_FPU: switches between hw float and sw float, no reflection in pac=
kage arch
>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or =
'armv7a-hardfp' as package arch
>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in p=
ackage arch
>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
>>
>> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARGET=
_FPU for armv7a and will generate slow code, angstrom does turn it on)
>>
>> Khem and I would like to start building armv7a (and armv6) in pure thumb=
2 mode but we want to have the variables to turn those knobs make sense and=
 be consistent. RP has expressed his desire to sort this all out before mer=
ging multilib. I'm sure x86/mips/ppc/etc have a similar need, so let's get =
this discussion started.
>
> Below is a quick step to capture what all I know of for various architect=
ures,
> inluding ARM. =C2=A0Note the "tunings" are where I'm a bit sketchy on som=
e
> architectures. =C2=A0(I think below also point out why I think this needs=
 to be
> hierarchical.. =C2=A0so it's really easy to inherit common stuff, and ove=
rride only
> the pieces you need to.. =C2=A0specifically the tunings.)
>
> Arch Family: ARM
>
> ABI:
> - EABI little endian
> - EABI big endian
> =C2=A0- canonical os=3Dlinux-eabi
> =C2=A0- library directory is "lib"
>
> CPU/ISA:
> - all use EABI
> =C2=A0- traditional arm instructions
> =C2=A0- thumb1, no arm instructions
> =C2=A0- thumb1/arm, interworking
> =C2=A0- thumb2, no arm instructions
> =C2=A0- thumb2, interworking (note, our customers do use this.. I'm not s=
ure how
> much though)
>
> Tunings:
> - armv4 (both big & little endian)
> - armv5 (both big & little endian)
> - armv5 + vfp
> - armv6 + vfp
> - armv7a + vfp + neon (supports thumb) (little endian)
> - armv7a + be8 (supports thumb) (big endian)
>
> ---
>
> Arch Family: IA32
>
> ABI:
> - x86_32
> =C2=A0- There is a soft-fp variant but it's not really used anymore
> =C2=A0- hardfp
> =C2=A0- defined as an LSB standard
> =C2=A0- library directory is "lib"
> - x86_64
> =C2=A0- hardfp only
> =C2=A0- defined as an LSB standard
> =C2=A0- library directory is "lib64"
> - (x32)
> =C2=A0- new experimental ABI
> =C2=A0- library directory is "libx32"
>
> CPU/ISA:
> - x86_32
> =C2=A0- all use x86_32
> =C2=A0- i586 -> core2 -> corei7
> - x86_64
> =C2=A0- only 64-bit chips supported
> - x32
> =C2=A0- only 64-bit chips supported
>
> Tunings:
> - i586, i686, core2, etc..
> - MMX, MMX2, AVX, etc..
>
> ---
>
> Arch Family: MIPS
>
> ABI:
> - MIPS o32 - soft float - big endian
> - MIPS o32 - hard float - big endian
> - MIPS o32 - soft float - little endian
> - MIPS o32 - hard float - little endian
> =C2=A0- old 32-bit mips library
> =C2=A0- library path is "lib"
>
> - MIPS n32 - soft float - big endian
> - MIPS n32 - hard float - big endian
> - MIPS n32 - soft float - little endian
> - MIPS n32 - hard float - little endian
> =C2=A0- new 32-bit MIPS64 library
> =C2=A0- library path is "lib32"
>
> - MIPS n64 - soft float - big endian
> - MIPS n64 - hard float - big endian
> - MIPS n64 - soft float - little endian
> - MIPS n64 - hard float - big endian
> =C2=A0- new 64-bit MIPS64 library
> =C2=A0- library path is "lib64"
>
> CPU/ISA:
> - MIPS32
> =C2=A0- Various
> - MIPS64
> =C2=A0- Various
>
> Tunings:
> - MIPS32
> =C2=A0- Various
> - MIPS64
> =C2=A0- Various
>
> ---
>
> Arch Family: Power
>
> ABI:
> - ppc32 - hard float
> =C2=A0 - ABI defined by LSB
> =C2=A0 - library path is "lib"
> - ppc32 - soft float
> - ppc32 - e500v1 (soft-float variant -- likely not needed)
> - ppc32 - e500v2 (soft-float variant)
> =C2=A0- library path is "lib"
> - ppc64 - hard float
> =C2=A0- library path is "lib64"
> =C2=A0- ABI defined by LSB
>
> CPU/ISA:
> - ppc32 - hard float
> =C2=A0- ppc603e
> - ppc32 - soft float
> =C2=A0- ppc603ec
> - ppc32 - e500v1 (soft-float variant)
> =C2=A0- -mfloat-gprs=3Dsingle -mspe=3Dyes -mabi=3Dspe
> - ppc32 - e500v2 (soft-float variant)
> =C2=A0- -mfloat-gprs=3Ddouble -mspe=3Dyes -mabi=3Dspe
> - ppc64 - hard float
> =C2=A0- PowerPC 970
>
> Tunings:
> - ppc603e
> - ppc750
> - ppc7400
> - e300c2
> - ppc405
> =C2=A0- ppc405fp for hard float
> - ppc440
> =C2=A0- ppc440fp for hard float
> - ppc476
> =C2=A0- ppc476fp
> - e500mc
> - 8540
> - 8548
> - -maltivec or -mno-altivec
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


