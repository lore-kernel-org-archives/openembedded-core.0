Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F9EC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 21:23:27 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.8334.1752096200273644038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 14:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 569LNHmZ446283;
	Wed, 9 Jul 2025 16:23:18 -0500
Received: from [192.168.2.97] ([192.168.2.97])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 569LNHqh011997;
	Wed, 9 Jul 2025 16:23:17 -0500
Message-ID: <dec95982-288f-43a8-91dd-47d60174de67@kernel.crashing.org>
Date: Wed, 9 Jul 2025 16:23:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 6/6] qemuriscv: Dynamically configure qemu
 CPU
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1751492664-12569-7-git-send-email-mark.hatle@kernel.crashing.org>
 <84caeee4b92dad27f67c745c63aaafbf9abb6c1b.camel@linuxfoundation.org>
 <a23f5658-d4a8-4ad1-8eb5-924a36d04bad@kernel.crashing.org>
 <368a2856-e12a-45dc-940b-cfa269a4bc13@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <368a2856-e12a-45dc-940b-cfa269a4bc13@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 569LNHmZ446283
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 21:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220111



On 7/9/25 11:23 AM, Khem Raj wrote:
>=20
>=20
> On 7/9/25 7:54 AM, Mark Hatle via lists.openembedded.org wrote:
>> I will investigate.
>>
>> I suspect SOME of this may be test cases with hard coded riscv assembl=
y
>> in them using extensions that we've not enabled.
>>
>> The configuration listed in the logs for the kernel are:
>>
>> rv64imafdc
>>
>>   =C2=A0'[=C2=A0=C2=A0=C2=A0 0.000000] riscv: base ISA extensions acdf=
im\n'
>>   =C2=A0'[=C2=A0=C2=A0=C2=A0 0.000000] riscv: ELF capabilities acdfim\=
n'
>>
>> The 'v' (vector) extension is intentionally not enabled to match the
>> software configuration, but some tests may be trying to use it.
>>
>> I'll walk through this and attempt to get this identified for real.
>=20
>=20
> We should be enabling the rvb23 (rv64gcv) profile as default for qemu, =
since
> that is the baseline for a RISCV profile that OE will be used as base
> infrastructure and we should target that commonly, perhaps changing

I disagree that the 'baseline' should be rv64gcv.  Because this is a vari=
able=20
ISA, we need the baseline to be something reasonably common across multip=
le=20
vendors.  (Note, I didn't say all vendors).  rv64gc seems to be common fr=
om the=20
research I did, the 'v' is also available, but not as widely available on=
=20
non-workstation oriented chips.

> default tune for qemuriscv64 to consider that would be a good thing. I
> know there is
> a value in constructing the ISA+extension set that qemu emulates based
> on tune selection and whatever rv64gcv devolves down in terms of
> extensions.

BEFORE my work, the tune was "riscv64".  (I maintained this after as well=
)

https://git.yoctoproject.org/poky/tree/meta/conf/machine/include/riscv/ar=
ch-riscv.inc?h=3Dwalnascar

https://git.yoctoproject.org/poky/tree/meta/conf/machine/include/riscv/tu=
ne-riscv.inc?h=3Dwalnascar

This mapped to rv64gc (NO V), so that is what I implemented.  How did I=20
determine it was rv64gc and not rv64gcv?  I queried the compiler to see w=
hat the=20
default options were since the ISA was not defined anywhere.

If we want to move to rv64gcv, then that can be adjusted in:

https://git.yoctoproject.org/poky/tree/meta/conf/machine/include/riscv/tu=
ne-riscv.inc

Just change the 'riscv64' configuration to add the 'v'.

I don't really care what our default is as long as someone defined it and=
 tests=20
it.  BUT I do care that NOT using our default WILL continue to work.

Just moving to rv64gcv unconditionally isn't right.  Not all riscv cores =
have=20
vector units, or even the compressed extension, let along f/d floating po=
int.=20
So we have to be flexible or there is no purpose to this work.


I believe it's key for the RISC-V sponsors who will end up owning this wo=
rk to=20
speak up.  I can say what I know, you can say when you know -- but ultima=
tely=20
I'm only going to be doing this work until it meets my needs and then I'm=
 going=20
to step back while other people implement what they need.  (I'm not going=
 to=20
abandon it, but I need the work _now_, so I had to step in to implement i=
t.)

What we do NOT have to be is platform that runs portable code with Ubuntu=
/Red=20
Hat and others.

For _MY_ purposes, _MY_ chips do not have a vector unit, my rv32 do not h=
ave=20
double precision floating point (only single).  Additional the following =
items=20
are all user selectable:

rv32i vs rv32e (e is not compatible with Linux, but is with baremetal!)
rv64i

m - optional
a - optional
f - optional
d - only available with rv64i
c - optional (not recommended)
(as well as some z extensions)

Linux REQUIRES rv<size>ima

It does not require fdc (or v) as well as the z extensions (except for zi=
csr and=20
zifencei).

--Mark


>>
>> --Mark
>>
>> On 7/9/25 4:17 AM, Richard Purdie via lists.openembedded.org wrote:
>>> On Wed, 2025-07-02 at 16:44 -0500, Mark Hatle via
>>> lists.openembedded.org wrote:
>>>> From: Mark Hatle <mark.hatle@amd.com>
>>>>
>>>> Use TUNE_FEATURES to dynamically configure the QEMU emulated CPU for=
 the
>>>> options selected by the DEFAULTTUNE.
>>>>
>>>> Note: OpenSBI currently requires 'c' (compressed instructions) or it
>>>> will
>>>> not work.
>>>>
>>>> Change the base device configuration to use a different variable to
>>>> select
>>>> the emulate devices.=C2=A0 This will allow a user to override or app=
end the
>>>> QB_OPT_APPEND without the riscv32 override getting in the way.
>>>>
>>>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>>>> ---
>>>>  =C2=A0=C2=A0meta/conf/machine/include/riscv/qemuriscv.inc | 31 ++++=
+++++++++++++--
>>>>  =C2=A0=C2=A01 file changed, 28 insertions(+), 3 deletions(-)
>>>>
>>>
>>> FWIW I narrowed down the ptest failures to this patch.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#220090): https://lists.openembedded.org/g/openembe=
dded-core/message/220090
>> Mute This Topic: https://lists.openembedded.org/mt/113956553/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

