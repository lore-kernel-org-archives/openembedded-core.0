Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qbf2F-0000Sf-6c
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:37:28 +0200
Received: by wwi18 with SMTP id 18so507569wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:33:45 -0700 (PDT)
Received: by 10.216.233.211 with SMTP id p61mr6510392weq.107.1309293225482;
	Tue, 28 Jun 2011 13:33:45 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm319549weq.15.2011.06.28.13.33.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 13:33:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTimkA5FhK-TSKomjVfH37QnrLg0cMA@mail.gmail.com>
Date: Tue, 28 Jun 2011 22:33:38 +0200
Message-Id: <4E515DF7-1213-4AA9-9304-28F77241AD43@dominion.thruhere.net>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com>
	<BANLkTimkA5FhK-TSKomjVfH37QnrLg0cMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 28 Jun 2011 20:37:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 22:31 heeft Khem Raj het volgende geschreven:

> On Tue, Jun 28, 2011 at 10:36 AM, Darren Hart <dvhart@linux.intel.com> =
wrote:
>>=20
>>=20
>> On 06/24/2011 04:54 AM, Koen Kooi wrote:
>>> Hi,
>>>=20
>>> We discussed tune files a bit during last nights TSC meeting and =
Khem had
>>> expressed the need before, so I'd like to get this discussion =
started by using
>>> armv7a as an example.
>>>=20
>>> For armv7a capable cores we have the following hardware features:
>>>=20
>>> * armv7a instruction set
>>> * thumb1 instruction set
>>> * thumb2 instruction set
>>> * VFP coprocessor
>>> * optional NEON coprocessor
>>>=20
>>> For the ABI we can choose the following:
>>>=20
>>> * softtp without hw support (e.g. no VFP instructions emitted, slow)
>>> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, =
fast)
>>> * hardfp, emits VFP and/or NEON instructions, slightly faster than =
softfp/hw,
>>>   incompatible with everything else
>>>=20
>>> And the extra knobs:
>>>=20
>>> * pure thumb1, no arm instructions (limited use)
>>> * thumb1/arm interworking
>>> * pure thumb2,  no arm instructions
>>> * thumb2 interworking (not sure if that's actually usefull, thumb2 =
has complete coverage)
>>>=20
>>> In OE .dev we have the following vars:
>>>=20
>>> TARGET_FPU: switches between hw float and sw float, no reflection in =
package arch
>>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' =
or
>>>             'armv7a-hardfp' as package arch
>>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection =
in package arch
>>> THUMB_INTERWORK: turns on interworking, no reflection in package =
arch
>>>=20
>>> (side note, oe-core/distroless and meta-yocto/poky don't turn set =
TARGET_FPU
>>>  for armv7a and will generate slow code, angstrom does turn it on)
>>=20
>>=20
>> oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
>> meta-texasinstruments) and does make use of the neon coprocessor, but
>> still uses the softfp float-api:
>>=20
>> TARGET_CC_ARCH =3D "-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon
>> -mfloat-abi=3Dsoftfp -fno-tree-vectorize"
>>=20
>> Seems like the oe-core tune files need to be synced up with vendor =
layers?
>>=20
>=20
> Well for enabling hardfp its a fundamental decision and I guess using =
softfloat
> in oe-core is probably best choice and the floating point parameter =
passing ABI
> I am taking about we still use -mfpu=3Dneon so gcc will still try to =
utilize it
> but -fno-tree-vectorize is going to subdue the use of neon intrs since =
gcc
> is disallowed to vectorize

Experience has shown that -fno-tree-vectorize generates faster code with =
gcc 4.5 :)=


