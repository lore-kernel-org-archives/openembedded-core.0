Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E99AA605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 16:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UG4ZhK009178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Mar 2016 09:04:35 -0700 (PDT)
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 30 Mar 2016 09:04:34 -0700
To: Khem Raj <raj.khem@gmail.com>, Phil Blundell <pb@pbcl.net>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56FBF8CA.20809@windriver.com>
Date: Wed, 30 Mar 2016 19:03:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
X-Originating-IP: [128.224.124.174]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2016 16:04:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 03/29/2016 07:07 PM, Khem Raj wrote:
>> On Mar 28, 2016, at 3:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>>
>> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>>> For AArch64 state, the default tune is aarch32 and include which
>>>     include just the aarch64 feature.
>> I don't really understand what this sentence is trying to say.  Can you
>> re-phrase it so as to be more accessible to non-experts?
>>
>>> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>>> meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
>> If you are deleting existing files, please mention that in the commit
>> message.  And in particular, if you are removing a file that supports
>> generic ARMv8 (if imperfectly) and replacing it with something that is
>> specific to ARMv8-A, please explain why this is a good thing.
>>
>>> +TUNEVALID[crc] = "Enable CRC instructions for ARMv8-a"
>>> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
>>> +ARMPKGSFX_FPU_64 = "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
>> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are not
>> related to the fpu.  Also, the fact that you need to duplicate both this
>> and the crypto one for both FPU and FPU_64 seems like an indication that
>> something elsewhere is misdesigned.
>>
>>> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>>> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8', '-fp-armv8', '', d)}"
>> I don't entirely understand why this one doesn't have an FPU_64
>> equivalent.  Are you always enabling vfp for A64?
>>
>>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch32', 'aarch32:', '' ,d)}"
>>> +MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
>> As previously discussed, I am not wild about "aarch32" as the name of an
>> override which really means "ARMv8 in AArch32 state".  I know there is a
>> school of thought that says that the execution state of older cpus is
>> not AArch32 even if in practice it is indistinguishable, but this
>> doesn't seem to match either the expectations that a rational user of OE
>> is likely to have, or the information in the published literature.
> Don’t disagree with technical argument I said that previously too. All I am trying
> to say is lets take this opportunity to simplify arm tunes starting with armv8
> we have this opportunity and what you suggest will keep the thread alive with
> prior tunes. With armv8 we should match what we do for x86 and x86_64 ideally.

We'll need to take a decision on this and continue the work on tunes.

What is the best way to name the armv8a tunes:
aarch32 and aarch64 or armv8a32 and armv8a64?

Who else need to express his opinion about this and make the decision?

Daniel

>
>>> +ARMPKGARCH_tune-aarch64            ?= "aarch64"
>> This seems a tiny bit short-sighted since presumably there will be an
>> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be then?
>>
>>> +BASE_LIB_tune-aarch64            = "lib64"
>> This seems like more a matter of distro policy and I'm not sure it
>> belongs in a tune file.  If it does then can't you rely on the aarch64
>> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having to
>> duplicate this for all four of the tunes (and the -be equivalents)?
>>
>>> +# Duplicated from arch-arm.inc
>> Please add a comment explaining why you can't include arch-arm.inc.
>>
>> p.
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


