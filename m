Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A6BC71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:00:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.803.1750089623529722131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55GG0Mjp019845
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:00:22 -0500
Received: from [192.168.2.13] ([192.168.2.13])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55GG0LVU012648
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:00:22 -0500
Message-ID: <0c3f1531-bf37-455e-b87f-b049fd1037a1@kernel.crashing.org>
Date: Mon, 16 Jun 2025 11:00:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/6] ISA based RISC-V tune implementation
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
 <56a9d083-72f6-44f2-be3a-29691745bcff@gmail.com>
 <18498B713347A8EF.22186@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <18498B713347A8EF.22186@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218833



On 6/16/25 9:12 AM, Mark Hatle wrote:
> 
> 
> On 6/16/25 5:11 AM, Gyorgy Sarvari wrote:
>> On 6/16/25 04:29, Mark Hatle via lists.openembedded.org wrote:
>>> From: Mark Hatle <mark.hatle@amd.com>
>>>
>>> The following implements the risc-v processor tune based on the ISA approach
>>> as documented in the oe-architecture post:
>>>
>>> https://lists.openembedded.org/g/openembedded-architecture/message/2155
>>>
>>> This set also attempts to make u-boot and kernel configurations dynamic
>>> based on the TUNE_FEATURES.
>>>
>>> For the linux-yocto, I suspect that the config fragments should be
>>> sent to the kmeta (kernel-cache), but I'd like a review from Bruce and
>>> others before I do this.
>>>
>>> Additionally, this enables a new (optional) features_check for TUNE_FEATURES.
>>>
>>> I've found numerous items in the system have certain RISC-V ISA expectations
>>> that may need to be addressed over time, however the obvious one is the
>>> Linux kernel requires ima_zicsr_zifencei.  Since it has it's own -march=
>>> setting this will ensure the processor defintion will be compatible.
>>>
>>> Also dynamically configure the QEMU cpu based on the tune_features.  This
>>> is nice to ensure that what we're actually building should be able to run
>>> on real hardware.  However, it does highlight some of the (extension)
>>> limitations in the current design.  (limitations as in extension not yet
>>> enabled.)
>>>
>>> Note: OpenSBI _requires_ the 'c' extension or it will not execute.  I
>>> suspect this can be fixed, but it's beyond my capabilities at this time.
>>>
>>
>> I'm not a particularly advanced risc-v user, but I use qemuriscv64 to
>> run smoketests on Firefox, with a barely-extended core-image-sato.
>>
>> After applying your this patch series, librsvg fails to compile with lot
>> of "undefined reference" errors[1]. I haven't looked into this at all
>> yet, hoping that someone would know the solution from the top of the
>> head. Does this need some magic Rust flag maybe?
>>
>> Beside applying this series, I didn't do any other modifications, and
>> without these changes librsvg builds (did I miss some new config, or
>> another patch?) .
> 
> The ONLY patch required to test this is the first one, the rest are all
> additional functionality based on the first patch.
> 
> Honestly I have no idea how to debug this.  The configuration selected:
> 
> -march=rv64imafdc_zicsr_zifencei -mabi=lp64d
> 
> is perfectly reasonable and contains the 'a' (atomic) operations, so I don't
> know how or why these atomic_loads_4 and _8 would not be defined, yet used by
> the compiler.
> 
> I do see a reference in the error message to:
> 
> .text._ZN69_$LT$smallvec..SmallVec$LT$A$GT$$u20$as$u20$core
> 
> This configuration has _vector_ (v) support _disabled_.
> 
> Could there be something in the toolchain that is assuming vector support is
> always enabled, if so that could be a large part of the problem.
> 
> @Khem any ideas?

I've reproduced the issue.  This due to RUST.  I'm also getting additional error 
messages about the ABI being incorrect (it's definitely not incorrect), so rust 
itself is configured in correctly after this change.

Still investigating.

--Mark

>>
>> [1]: full log:
>> https://gist.githubusercontent.com/OldManYellsAtCloud/e9968f3c63df943e8fd54dc217ab15e6/raw
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218827): https://lists.openembedded.org/g/openembedded-core/message/218827
>> Mute This Topic: https://lists.openembedded.org/mt/113664652/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

