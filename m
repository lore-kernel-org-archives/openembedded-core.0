Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbf6D-0000lN-4m
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:41:33 +0200
Received: by pzk36 with SMTP id 36so461556pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=gT3XqVkleYHaD40ATdJMJI50Vgw682tlOBTWSYoSjgg=;
	b=MXJVHlWEoJAKbgcHA5smZFvxAXR5kJc0zp5X81GThIzKVmVrhxmdDcccwMVNgbpH7Q
	8qRq/kVdg6ljQho+3M5/lyk5MXSgQNF4Mdq+hHgvc871dsVqrf3XkA43alIR6QWAJQYV
	TySxfMS7pg6x6/qZ1kfq54DbjmuK6fDGELtvU=
Received: by 10.68.32.66 with SMTP id g2mr19270pbi.26.1309293470794; Tue, 28
	Jun 2011 13:37:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Tue, 28 Jun 2011 13:37:20 -0700 (PDT)
In-Reply-To: <4E515DF7-1213-4AA9-9304-28F77241AD43@dominion.thruhere.net>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com>
	<BANLkTimkA5FhK-TSKomjVfH37QnrLg0cMA@mail.gmail.com>
	<4E515DF7-1213-4AA9-9304-28F77241AD43@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 13:37:20 -0700
Message-ID: <BANLkTi=11aC1mcxPKikDmCR-Q9szyOuVCA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 28 Jun 2011 20:41:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 1:33 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 28 jun 2011, om 22:31 heeft Khem Raj het volgende geschreven:
>
>> On Tue, Jun 28, 2011 at 10:36 AM, Darren Hart <dvhart@linux.intel.com> w=
rote:
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
>>>> =C2=A0 incompatible with everything else
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
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'armv7a-hardfp' as package a=
rch
>>>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in=
 package arch
>>>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
>>>>
>>>> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARG=
ET_FPU
>>>> =C2=A0for armv7a and will generate slow code, angstrom does turn it on=
)
>>>
>>>
>>> oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
>>> meta-texasinstruments) and does make use of the neon coprocessor, but
>>> still uses the softfp float-api:
>>>
>>> TARGET_CC_ARCH =3D "-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon
>>> -mfloat-abi=3Dsoftfp -fno-tree-vectorize"
>>>
>>> Seems like the oe-core tune files need to be synced up with vendor laye=
rs?
>>>
>>
>> Well for enabling hardfp its a fundamental decision and I guess using so=
ftfloat
>> in oe-core is probably best choice and the floating point parameter pass=
ing ABI
>> I am taking about we still use -mfpu=3Dneon so gcc will still try to uti=
lize it
>> but -fno-tree-vectorize is going to subdue the use of neon intrs since g=
cc
>> is disallowed to vectorize
>
> Experience has shown that -fno-tree-vectorize generates faster code with =
gcc 4.5 :)

Someday I will try to benchmark and find out whats going on for myself.


