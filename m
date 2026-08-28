Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52042C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:46:25 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3812.1787931976811558821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 08:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=d5zHOdnV;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.63])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8D53120B7167;
	Fri, 28 Aug 2026 08:45:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8D53120B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787931941;
	bh=AmnaySCD+/5ZI6oQ3FdxRb8g2KKufA2TAxW/a3H6y9w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=d5zHOdnV0xvCUPxL7JTU3mkW2rfDl2OUNIN3C2DhjiSeUO/va717FBywRvRNjMYCJ
	 OnSFTcfwacxWYgaizvyiJaVCDCBGr9vIdIyl6DdrTE03J2uDrp0hTC75+jFLpVx+/p
	 MNsFnj1MgWIV97RWTKKLF3itqPdmlYQEfBENtMN4=
Message-ID: <d6fbb4c3-6178-4f8e-9421-d3134793acb1@linux.microsoft.com>
Date: Fri, 28 Aug 2026 09:46:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] rust: Avoid passing host-specific
 information to crates Strict Version Hash
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
 <2326647.1787768749336187635@lists.openembedded.org>
 <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
 <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com>
 <18CF75EE37DB8543.642712@lists.openembedded.org>
 <e6874bb2ac2d116380c62b2295da246b79136093.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <e6874bb2ac2d116380c62b2295da246b79136093.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 15:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244555


On 8/27/2026 1:53 AM, Richard Purdie wrote:
> On Wed, 2026-08-26 at 21:47 +0100, Richard Purdie via lists.openembedde=
d.org wrote:
>> On Wed, 2026-08-26 at 14:08 -0600, Alejandro Hernandez wrote:
>>> On 8/26/2026 1:17 PM, Richard Purdie via lists.openembedded.org
>>> wrote:
>>>> On Wed, 2026-08-26 at 11:25 -0700, Dora, Sunil Kumar via
>>>> lists.openembedded.org wrote:
>>>>> Hi Alejandro,
>>>>>
>>>>> Thanks for chasing this one down. Small notes on v3:
>>>>>
>>>>> The commit is tagged [YOCTO #15554], but that bug is
>>>>> "reproducibility
>>>>> failures with 'rustdoc' on rust 1.75" (path-length dependent),
>>>>> RESOLVED FIXED
>>>>> since 2024-08-01 via codegen-units=3D1 / lto=3Doff.
>>>>>
>>>>> What you describe here - artifacts differing by build host arch,
>>>>> causing
>>>>> cross-architecture sstate matches - looks like:
>>>>>
>>>>>  =C2=A0=C2=A0 [YOCTO #16376] AB-INT: build system architecture
>>>>> reproducibility issue
>>>>>  =C2=A0=C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1=
6376
>>>>>
>>>>> which is still open. Could you retag it in v4, unless you had a
>>>>> reason to
>>>>> point at 15554 that I'm missing?
>>>>> ---
>>>>> One pointer that may or may not be relevant: the 1.97.1 upgrade
>>>>> (65271a5d3b)
>>>>> carries an LLVM backport:
>>>>>
>>>>>  =C2=A0=C2=A0 0043-LoopUnroll-Iterate-exit-fold-candidates-in-
>>>>> determini.patch
>>>>>
>>>>> added for a repro issue seen with rust 1.97.0. I haven't looked
>>>>> at whether it
>>>>> interacts with the SVH path at all - just flagging it in case
>>>>> it's useful context.
>>> Hey Richard,
>>>
>>>
>>> Sorry for the incorrect tag.
>> No problem, that is at least easily fixed!
>>
>>> I'll look into these failures as well and send a v4
>> Thanks! I appreciate the work on this as it should improve things a
>> lot.
>>
>>>> I put v3 in for testing on the autobuilder and it looks promising,
>>>> there are some rust test suite failures though:
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4=
472
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/4=
577
>>>>
>>>> and probably more to follow. We may need to exclude those tests?
>>>>
>>>> I also triggered the reproducibility test targets:
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/=
3
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/=
3
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/=
3
>>>>
>>>> those builds are ongoing.
>> One of these completed:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3
>>
>> which leads to:
>>
>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260826-plag=
tpam/packages/diff-html/
>>
>> There looks to be a locale issue, some python config tweaks, curl-
>> config binconfig needing a tweak and a smaller rust issue left.
>>
>> Definitely progress, much fewer recipes showing issues and fewer binar=
y
>> ones and more text ones left...
> Sadly the other two test runs looked less promising:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3
>
> both of which have a lot of rust related looking differences :/
>
> Cheers,
>
> Richard

Hey Richard,


Apologies, I got a bit confused, is the ask to send a v4 with the=20
correct tag and then look at other reproducibility issues?.

or are these reproducibility issues related to the patch and need to be=20
addressed before sending a v4?


Alejandro


>
>

