Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F318FC7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 13:07:08 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web11.6774.1682168821033732592
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 06:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=christoph.lauer@email.de header.s=s29768273 header.b=l8EAw0R8;
 spf=pass (domain: email.de, ip: 212.227.17.12, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1682168817; i=christoph.lauer@email.de;
	bh=ScJPTA770LJ/QdxuZiVLOQAPwjgemdqGxwLQOq/97IA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=l8EAw0R8A7Y69XrCb1da9c6N8Qdd9E8Qg99pCeWCNTckNJQnxvKKjIAuUb3wmYXvL
	 TiIMfa+0epfK8n7NUq3hXdfSvlCu4swtAIFRxMdqYtuplrdGSJ/8yv/8kEYuip54m5
	 wsfn1MlWMNqtevSMlQ6obuMhQl10x3fQrBMefeUCy6f9R7toqmrt6dgpgKCVSYDgPO
	 sDkDti1E1p2uJ7Fjr3IZ3HXzjOUGVvlDrEdqzf6hhJPdF3JywFt9AA4InWvoMJj3n/
	 oU9S60DCuD5gTj/l/5gJVQlYX2fTJvpAez0/nSidze3Fpj6whUROHDPf/ePqALzalx
	 hopSe6R2qfnrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.35] ([91.23.94.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCogs-1pz2dl2nE8-008yhT; Sat, 22
 Apr 2023 15:06:57 +0200
Message-ID: <7b254d25-03b9-5d0a-4257-4d43c50d069f@email.de>
Date: Sat, 22 Apr 2023 15:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org,
 Christoph Lauer <christoph.lauer@xtronic.de>
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
 <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
 <175785898B60CE37.9727@lists.openembedded.org>
 <CADkTA4MQty2wAcBrDGT=vqVeAHpMbzKjpf8-6xbH7UKa2R6wsg@mail.gmail.com>
From: Christoph Lauer <Christoph.Lauer@email.de>
In-Reply-To: <CADkTA4MQty2wAcBrDGT=vqVeAHpMbzKjpf8-6xbH7UKa2R6wsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NPiy99X6UJpL/BYTc1QP/xwuMppcYJ3h560apWDJrLdMYIPazH1
 Q85/M+oLAPVXN8PTjFM/gz/6SQsUVcJ6oZrumh/WA3atKOFqkQKBjq2tgYHn27LEWt9GKWn
 3BHES0j1IScjQpEcDISr798TlnollvYUWLITOCPKnQB4RwipYM/ApQsvwlAOmvYXgc5eG+l
 mqv19BieWp7bksxGRS13g==
UI-OutboundReport: notjunk:1;M01:P0:Wf8M8nB8RTI=;VR5xUroChTWRFzsgDyNPNzeY2Pz
 54nNK0cXfeOW9AjtwwDdY3cmzkFiVTk62U5GBevR1pdvtGKADYmK0tdyk7mkFVS2NOLBKfjus
 gKd+G03Iu/596iXVSiuBCMnU6E0qVKAdTgROBgAiarw2JbVc+MQgo1omNHFBhVE/+mJNtja7j
 BFhjlVhPpO+2yFPHCKm0zi2Qh+gLDGcNY83E5f6oyhJPDKqtWxRBokom99nvrNFth5i1OoXtT
 ZAgLB6khwaGlAN3pl76QofjYXRtDr98aMRyZJBAar5Lm9fSfaAo/yN1FreL51ujisqqmSryOx
 AAjF8DtBZTdXR/8BQvMF4uy68jLmdnpC9Gi1DsWdzWkUaBbtMrN74seoB+WmMOGGcm4/ypc65
 dtI2GlggwvvwRcM0xKC/CMN2xHvrZTAgAZ4eh1o05+A25qF7YHN5QSTIf0+nILWrK+hwKBDYf
 JVyazP5s24UlYHDCCIe29mKgbo56EqzoUWCGwavw3h/bH4gy45eA8E7GuLaXZ+kv0a2v/l6Px
 mfH0fh74Q6eBCzBNvjKJi07zC9rIuhFRVZyG2RreH62y0WSLLDgjYgmkpd/7LJNxs9X2teRLu
 BgxMYykDwOLLF9IviLWO37IlZf5gr57qJftKVEDz1/h2fcS1H0e6lEX0IbuI3IpmV+xh0jDJL
 z1rkaiSNMIIwGerhPjFHrfL2S6GS7ivcASoylUPeywBwHermwAIFnGrk/D9/6WSevhWC/aWJv
 W8ocehdZC27JoQlz6M01TgVQY6Cafgjut3EsZFXDda3k08Z5HzQ4h+ktfcoyeUS207h/jF1Sn
 3bzArCTxiYNN4+S0KtLPrVSVcEf5VF5dconpAj/LlS8uzwyIbdRWL7i7rCShVids8bvmyi2aM
 k1oaitGoLkl8LmwDuCmCrKuGEJWOrRGJDw3tlVZDcQPncudCl+nZkabphjBdbKpAK1W/pe9XC
 fZTQqw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 13:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180301

Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
> On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
>>>> Hi,
>>>>
>>>> Not related with the previous discussion but just for
>>>> your information.
>>>> The rm_work.bbclass has an exception for the kernel recipes [1].
>>>> So I don't understand why we can't do the same for the make-mod-
>>>> scripts
>>>> who is the twin brother of all these kernel recipes.
>>>>
>>>> [1]
>>>> https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_w=
ork.bbclass#n168
>>>
>>> Ideally we wouldn't be doing this for the kernel recipes.
>>>
>>> There is also a big difference to that and the proposed patch. The
>>> proposed patch was preserving a specific directory rather than an
>>> entire recipe. Removing the task stamps but leaving a small piece of
>>> WORKDIR is quite different to preserving WORKDIR and STAMPS for a
>>> specific recipe. The former is not tested and will break things. The
>>> latter is better tolerated by bitbake.
>>
>> Agreed.
>>
>> Plus, I am working on this now.
>>
>> I have static linking of the scripts/tools working, but what I haven't
>> figured out is how to do that without patching the Makefiles.
>>
>
> It turned out to be quite the battle to get older kernels what was
> required for static linking of the tools.
>
> Attached is my WIP patch. I'm out of the office early next week, but
> will revisit it once I'm back.
>
> Bruce
>
>> Next up will be some rpath trickery.
>>
>> Bruce
>>
>>>
>>> So yes, we could do the same. I'm sure there will be other recipes
>>> people want to preserve for other reasons. Where do we draw the line?
>>> We could preserve everything and drop rm_work, then we wouldn't have
>>> these problems? :)
>>>
>>> Cheers,
>>>
>>> Richard
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180233): https://lists.openembedded.org/g/openembed=
ded-core/message/180233
>> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>

Thank you for your work, I see you put some time and effort into it.
HOSTPKG_CONFIG is, as you mentioned, available since kernel version 5.19
(see kernel patch [1]), so we need a way to call 'pkg-config --static'
with pre-5.19 kernels. A way without modifying the Makefile would be to
modify openssls pkg-config in recipe-sysroot-native of make-mod-script,
so 'pkg-config --libs' actually shows the dependencies of 'pkg-config
=2D-static --libs', but it's a bit hacky.

Also fully-static executables still need the same glibc during runtime
that they were built with, which makes them error-prone and is generally
discouraged. As an alternative, we could build dynamic executables that
use the static libcrypto library. The linker links by default against
the shared library, so we could remove them from recipe-sysroot-native
to force linking against the static library (again, somewhat hacky).

[1]
https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa4840=
d8d61e5

