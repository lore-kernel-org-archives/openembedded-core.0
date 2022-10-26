Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34055C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:35:24 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.8363.1666794918927482368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 07:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29QEYCwU009981;
	Wed, 26 Oct 2022 09:34:12 -0500
Message-ID: <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
Date: Wed, 26 Oct 2022 09:34:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Ross Burton <ross.burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20221018230820.2385167-1-raj.khem@gmail.com>
 <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org>
 <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 29QEYCwU009981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 14:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172160



On 10/19/22 5:35 AM, Alexander Kanavin wrote:
> This also begs the question if mesa-gl is actually used by anyone, and
> what warrants its continued inclusion in core as opposed to
> product/BSP layers. I'll propose dropping the recipe and merging .inc
> into mesa.bb once patches start flowing.
>=20
> The original commit was:
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D015cb13

(I just saw this, so a little late on the reply, but..)

mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  =
Not=20
everyone wants to use lima support for graphics.

It was broken into two separate packages so that is was VERY clear if you=
 were=20
using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).

--Mark

> Alex
>=20
> On Wed, 19 Oct 2022 at 08:54, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
> wrote:
>>
>> On Wed, 19 Oct 2022 at 08:34, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>>>
>>>> Can you show examples where this is needed? Custom variable does not=
 seem a good idea. I also worry that it=E2=80=99ll break automated update=
s (it=E2=80=99s bad enough with mesa-gl, this might make it worse).
>>>
>>> https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/m=
esa/mesa_git.bb
>>
>> "require recipes-graphics/mesa/mesa.inc"
>>
>> Using recipe includes across layers like this is not a good idea. It
>> imposes requirements on core to continue providing the .inc, and not
>> doing anything with mesa that can 'break' users of that include.
>>
>> Please make it self-contained.
>>
>> Alex
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171964): https://lists.openembedded.org/g/openembe=
dded-core/message/171964
>> Mute This Topic: https://lists.openembedded.org/mt/94420106/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[mark.hatle@kernel.crashing.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

