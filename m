Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbf2Q-0000UN-R4
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:37:39 +0200
Received: by pzk36 with SMTP id 36so459125pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=d06QFY6aCzivpNBvTnyI6dhLAfjEJ57SByBFcUPz6ew=;
	b=e64gb5MGtfbFCI3puQEI4Xo3e2xOvP0KsPpG2aYFpEz8P6kW57/DC732wCagusjdko
	1U0CrZ1sC97wJJi4mauKw0bRX2dD9KH30kaU7+u1ARFXH1TQiSLYWkGHskbET7QO20c/
	5AGFkh3I+YMmauT3Wl9dd/eWkK0L5yRWPrtaM=
Received: by 10.68.14.225 with SMTP id s1mr4633614pbc.227.1309293233374; Tue,
	28 Jun 2011 13:33:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Tue, 28 Jun 2011 13:33:21 -0700 (PDT)
In-Reply-To: <4E0A27E9.3050300@linux.intel.com>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com>
	<68079D5A-45A4-42A9-AC3D-9CB3A21A830A@dominion.thruhere.net>
	<4E0A27E9.3050300@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 13:33:21 -0700
Message-ID: <BANLkTikbdfS2-UXkWibL0wrctWSqWA2ddg@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Jun 2011 20:37:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 12:13 PM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
>
>
> On 06/28/2011 10:38 AM, Koen Kooi wrote:
>>
>> Op 28 jun 2011, om 19:36 heeft Darren Hart het volgende geschreven:
>>
>>>
>>>
>>> On 06/24/2011 04:54 AM, Koen Kooi wrote:
>>>> Hi,
>>>>
>>>> We discussed tune files a bit during last nights TSC meeting and Khem =
had
>>>> expressed the need before, so I'd like to get this discussion started =
by using
>>>> armv7a as an example.
>>>>
>>>> For armv7a capable cores we have the following hardware features:
>>>>
>>>> * armv7a instruction set
>>>> * thumb1 instruction set
>>>> * thumb2 instruction set
>>>> * VFP coprocessor
>>>> * optional NEON coprocessor
>>>>
>>>> For the ABI we can choose the following:
>>>>
>>>> * softtp without hw support (e.g. no VFP instructions emitted, slow)
>>>> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, f=
ast)
>>>> * hardfp, emits VFP and/or NEON instructions, slightly faster than sof=
tfp/hw,
>>>> =C2=A0incompatible with everything else
>>>>
>>>> And the extra knobs:
>>>>
>>>> * pure thumb1, no arm instructions (limited use)
>>>> * thumb1/arm interworking
>>>> * pure thumb2, =C2=A0no arm instructions
>>>> * thumb2 interworking (not sure if that's actually usefull, thumb2 has=
 complete coverage)
>>>>
>>>> In OE .dev we have the following vars:
>>>>
>>>> TARGET_FPU: switches between hw float and sw float, no reflection in p=
ackage arch
>>>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' o=
r
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'armv7a-hardfp' as package ar=
ch
>>>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in=
 package arch
>>>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
>>>>
>>>> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARG=
ET_FPU
>>>> for armv7a and will generate slow code, angstrom does turn it on)
>>>
>>>
>>> oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
>>> meta-texasinstruments) and does make use of the neon coprocessor, but
>>> still uses the softfp float-api:
>>>
>>> TARGET_CC_ARCH =3D "-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon
>>> -mfloat-abi=3Dsoftfp -fno-tree-vectorize"
>>
>> Don't confuse softfp calling conventions with softfloat! The above will =
still emit
>> vfp and neon instructions if your set TARGET_FPU =3D hard
>
> Ah. So we would need to add something like:
>
> conf/distro/include/angstrom.inc:TARGET_FPU_armv7a ?=3D "hard"
> conf/distro/include/angstrom.inc:TARGET_FPU_armv7a-vfp ?=3D "hard"
>
> to something DISTRO specific (poky.conf or similar).
>
> It isn't clear to me why this is a distro policy decision instead of
> part of the tune include or the machine config itself.
>
> Can someone elaborate on why this goes where it does?
>

adding to what Koen said. Its a different incompatible ABI
hardfp binaries will not work on softfp root file system
Since its a ABI changer its best left to distros to choose
what ABI they would prefer but in oe-core we need to make
provisions for that. Which we dont have at the moment.

> Thanks,
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


