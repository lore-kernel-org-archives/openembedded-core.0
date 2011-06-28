Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbf0N-0000ML-Sa
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:35:32 +0200
Received: by pwi1 with SMTP id 1so433544pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=RpsbUHhSkqVEpqfl4heRoXIJo6i26WPJL8sXUTH+lEU=;
	b=jXzh2+reafTTsUYKzUxIzRQY7v20ocU60HespHwFIqfXnfMILkWwluC0S7OHT/8O+R
	SXgRaS/P9SOzvEoVUlSUdWLwqMpe7Z9zsWMaiAoeiCYFnlQzgA3q1IrEnBh80aEQj3mL
	WmUabraeD1F5UMZNY2SoWuVwO64oMwr35wsxQ=
Received: by 10.68.59.98 with SMTP id y2mr3219251pbq.160.1309293108199; Tue,
	28 Jun 2011 13:31:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Tue, 28 Jun 2011 13:31:18 -0700 (PDT)
In-Reply-To: <4E0A1136.7030402@linux.intel.com>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 13:31:18 -0700
Message-ID: <BANLkTimkA5FhK-TSKomjVfH37QnrLg0cMA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 28 Jun 2011 20:35:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 10:36 AM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
>
>
> On 06/24/2011 04:54 AM, Koen Kooi wrote:
>> Hi,
>>
>> We discussed tune files a bit during last nights TSC meeting and Khem ha=
d
>> expressed the need before, so I'd like to get this discussion started by=
 using
>> armv7a as an example.
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
p/hw,
>> =C2=A0 incompatible with everything else
>>
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
>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'armv7a-hardfp' as package arc=
h
>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in p=
ackage arch
>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
>>
>> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARGET=
_FPU
>> =C2=A0for armv7a and will generate slow code, angstrom does turn it on)
>
>
> oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
> meta-texasinstruments) and does make use of the neon coprocessor, but
> still uses the softfp float-api:
>
> TARGET_CC_ARCH =3D "-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon
> -mfloat-abi=3Dsoftfp -fno-tree-vectorize"
>
> Seems like the oe-core tune files need to be synced up with vendor layers=
?
>

Well for enabling hardfp its a fundamental decision and I guess using softf=
loat
in oe-core is probably best choice and the floating point parameter passing=
 ABI
I am taking about we still use -mfpu=3Dneon so gcc will still try to utiliz=
e it
but -fno-tree-vectorize is going to subdue the use of neon intrs since gcc
is disallowed to vectorize

> --
> Darren
>
>
>>
>> Khem and I would like to start building armv7a (and armv6) in pure thumb=
2 mode
>> but we want to have the variables to turn those knobs make sense and be
>> consistent. RP has expressed his desire to sort this all out before merg=
ing
>> multilib. I'm sure x86/mips/ppc/etc have a similar need, so let's get th=
is
>> discussion started.
>>
>> regards,
>>
>> Koen
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


