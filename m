Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F5BC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 20:08:45 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21336.1787774924947051226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 13:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=Ev96VSpk;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.59])
	by linux.microsoft.com (Postfix) with ESMTPSA id D292C20B7167;
	Wed, 26 Aug 2026 13:08:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D292C20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787774890;
	bh=8+M9qjR5gUO8aSLa/7Orwef5HHv5ku6GmQye3h31b/o=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Ev96VSpklnHvGYpd/le0pJGLKKYjJE54vG7uWwF43U9lEPKeXUeWEyYcgYDXjRIdd
	 ymqlzLFQNY3T3xYZFZ7cYpGlcbRqaLAMOB1qrM/zMLyRPvl5L22UrDL73Fv8JbOkdy
	 52cglZS86EZAGAilYETAOo/KFdO2EzSu88K6kOjk=
Message-ID: <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com>
Date: Wed, 26 Aug 2026 14:08:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] rust: Avoid passing host-specific
 information to crates Strict Version Hash
To: richard.purdie@linuxfoundation.org, SunilKumar.Dora@windriver.com,
 openembedded-core@lists.openembedded.org
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
 <2326647.1787768749336187635@lists.openembedded.org>
 <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 20:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244413


On 8/26/2026 1:17 PM, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2026-08-26 at 11:25 -0700, Dora, Sunil Kumar via lists.openembe=
dded.org wrote:
>> Hi Alejandro,
>>
>> Thanks for chasing this one down. Small notes on v3:
>>
>> The commit is tagged [YOCTO #15554], but that bug is "reproducibility
>> failures with 'rustdoc' on rust 1.75" (path-length dependent), RESOLVE=
D FIXED
>> since 2024-08-01 via codegen-units=3D1 / lto=3Doff.
>>
>> What you describe here - artifacts differing by build host arch, causi=
ng
>> cross-architecture sstate matches - looks like:
>>
>>  =C2=A0 [YOCTO #16376] AB-INT: build system architecture reproducibili=
ty issue
>>  =C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16376
>>
>> which is still open. Could you retag it in v4, unless you had a reason=
 to
>> point at 15554 that I'm missing?
>> ---
>> One pointer that may or may not be relevant: the 1.97.1 upgrade (65271=
a5d3b)
>> carries an LLVM backport:
>>
>>  =C2=A0 0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patc=
h
>>
>> added for a repro issue seen with rust 1.97.0. I haven't looked at whe=
ther it
>> interacts with the SVH path at all - just flagging it in case it's use=
ful context.

Hey Richard,


Sorry for the incorrect tag.

I'll look into these failures as well and send a v4


Alejandro

> I put v3 in for testing on the autobuilder and it looks promising, ther=
e are some rust test suite failures though:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4472
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/4577
>
> and probably more to follow. We may need to exclude those tests?
>
> I also triggered the reproducibility test targets:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3
>
> those builds are ongoing.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244412): https://lists.openembedded.org/g/openembed=
ded-core/message/244412
> Mute This Topic: https://lists.openembedded.org/mt/120939810/4354175
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

