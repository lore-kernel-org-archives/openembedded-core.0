Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948D1C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 20:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.7942.1751403285499654903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 13:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by localhost.localdomain (8.18.1/8.18.1/Debian-2) with ESMTP id 561Ksi76145483
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:54:44 -0500
Received: from [192.168.2.98] ([192.168.2.98])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 561Ksh8D014562
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:54:44 -0500
Message-ID: <fd35ebd5-26da-434a-8258-22c7122264b2@kernel.crashing.org>
Date: Tue, 1 Jul 2025 15:54:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libucontext: use hard/soft float
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20250630144814.255656-1-jdmason@kudzu.us>
 <5f3c3690-ae0f-4faf-8e6b-4e0c7b2d8eb6@kernel.crashing.org>
 <CAPoiz9yNoyxxGCzJU4bo7h1XYFjqNFeh1iX15CnLdkZz3025HQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAPoiz9yNoyxxGCzJU4bo7h1XYFjqNFeh1iX15CnLdkZz3025HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by localhost.localdomain id 561Ksi76145483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219720



On 7/1/25 8:24 AM, Jon Mason wrote:
> On Mon, Jun 30, 2025 at 12:32=E2=80=AFPM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>>
>>
>> On 6/30/25 9:48 AM, Jon Mason wrote:
>>> From: Jon Mason <jon.mason@arm.com>
>>>
>>> When building for qemuarm-secureboot in meta-arn with musl and clang,
>>> the following compile error is seen:
>>> - | ../sources/libucontext-1.3.2/arch/arm/swapcontext.S:23:11: error:=
 unknown token in expression
>>> - |  ldr r4, =3D#0x56465001
>>> - |           ^
>>>
>>> This is happening because 1.3 added ifdefs for assembly code for both
>>> hard and soft float, and bcause neither is being defined, it is takin=
g
>>> this path with the issue.
>>>
>>> Since we can tell if soft or hard float is being used via the TARGET_=
FPU
>>> variable, use that and set the relevant makefile flag.
>>>
>>> Signed-off-by: Jon Mason <jon.mason@arm.com>
>>> ---
>>>    meta/recipes-core/musl/libucontext_1.3.2.bb | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recip=
es-core/musl/libucontext_1.3.2.bb
>>> index 2362cba5c8a2..92001bbe7bb5 100644
>>> --- a/meta/recipes-core/musl/libucontext_1.3.2.bb
>>> +++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
>>> @@ -48,3 +48,6 @@ def map_kernel_arch(a, d):
>>>
>>>    EXTRA_OEMESON =3D "-Dcpu=3D${@map_kernel_arch(d.getVar('TARGET_ARC=
H'), d)}"
>>>    inherit meson
>>> +
>>> +TARGET_CPPFLAGS:arm +=3D "${@bb.utils.contains('TARGET_FPU', 'hard',=
 '-DFORCE_HARD_FLOAT', '', d)}"
>>> +TARGET_CPPFLAGS:arm +=3D "${@bb.utils.contains('TARGET_FPU', 'soft',=
 '-DFORCE_SOFT_FLOAT', '', d)}"
>>
>> The above doesn't +=3D to TARGET_CPPFLAGS, it _replaces_ TARGET_CPPFLA=
GS.
>>
>> This is probably not what you want.
>>
>> What I've done in the past is:
>>
>> ARM_TARGET_CPPFLAGS =3D ""
>> ARM_TARGET_CPPFLAGS:append:arm =3D "${@bb.utils.contains('TARGET_FPU',=
 'hard', '-
>> DFORCE_HARD_FLOAT', '', d)}"
>> ARM_TARGET_CPPFLAGS:append:arm =3D "${@bb.utils.contains('TARGET_FPU',=
 'soft', '
>> -DFORCE_SOFT_FLOAT', '', d)}"
>>
>> TARGET_CPPFLAGS .=3D "${ARM_TARGET_CPPFLAGS}"
>=20
> Thanks for the insight Mark, I will happily steal your changes and
> throw it as a v2 :)
>=20
> Is there a place I can look (documentation or code) that will help me
> understand why this is necessary?

Theoretically the bitbake documentation covers the operator and override =
rules..=20
but essentially operators all run, and then a second+ pass is made to rem=
ove=20
overrides.

(:append is an operator, not an override)

So it's not exactly intuitive unless you've worked with it a lot, and eve=
n then=20
it's easy to make mistakes in these odd cases!

But what happens is:

VARIABLE:override +=3D "foo"
VARIABLE:override +=3D "bar"

Evaluation will attempt to add a space and foo to 'VARIABLE:override', fo=
llowed=20
by a space and bar.  Resulting in ' foo bar'

Then override processing causes 'VARIABLE:override' replaces 'VARIABLE' w=
hen the=20
override is present resulting in:

VARIABLE =3D ' foo bar'

I've recently seen CoPilot suggest exactly this to users.  And it USUALLY=
 works,=20
but it's chance vs design.

--Mark

> Thanks,
> Jon
>=20
>>>
>>>
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#219569): https://lists.openembedded.org/g/openemb=
edded-core/message/219569
>>> Mute This Topic: https://lists.openembedded.org/mt/113909237/3616948
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [mark.hatle@kernel.crashing.org]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

