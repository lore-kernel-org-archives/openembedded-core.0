Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5B3707BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:40:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7PJehkH025025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Aug 2014 12:40:43 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 25 Aug 2014 12:40:43 -0700
Message-ID: <53FB913A.4070506@windriver.com>
Date: Mon, 25 Aug 2014 14:40:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org>
	<20140822133349.76751634@e6410-2> <20140822193910.GD20524@jama>
	<20140822154954.04d4fc02@e6410-2> <20140822214626.GF20524@jama>
	<20140822170626.13280b11@e6410-2> <20140822222642.GG20524@jama>
	<53FB8A87.1010202@windriver.com> <20140825193523.GB23339@haswell>
In-Reply-To: <20140825193523.GB23339@haswell>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Mon, 25 Aug 2014 19:40:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/14, 2:35 PM, Khem Raj wrote:
> On 14-08-25 14:12:07, Mark Hatle wrote:
>> On 8/22/14, 5:26 PM, Martin Jansa wrote:
>>> On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
>>>> On Fri, 22 Aug 2014 23:46:26 +0200
>>>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>
>>>>> changing
>>>>> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
>>>>> still building with -marm doesn't make much sense to me and is only
>>>>> confusing.
>>>>
>>>> I think the distinction is that if you use armv7at-neon, you *can* build
>>>> specific packages with thumb. Mostly, I guess, I don't think it makes sense
>>>> to use a tuning that specifically states that it can't run thumb code for
>>>> processors which can. Although... May not be an important distinction, really,
>>>> as you note.
>>>
>>>> I don't think it makes sense to use a tuning that specifically states
>>>> that it can't run thumb code
>
> yes. We should not have such case in armv7+
>
>>
>> The defaulttune is supposed to supply what the processor and ABI are capable of.
>>
>> So in the case of armv7a, it's saying no thumb support at all, this included
>> thumb interwork.
>
> if thats what we do then we are wrong. Since thumb interwork is
> mandatory when we claim EABI compatibility and I think we have stopped
> supporting Old ABI hence EABI is default which means interworking is
> inherent.
>
>>
>> armv7at says that the processor supports thumb, and interwork -should- be
>> enabled.  (It can of course be manually disabled, but that's another issue
>> to be dealt with...)
>
> FWIW adding 't' in there should just be done when the resulting binary
> is compiled using thumb ISA, using 't' to qualify interworking
> capablility is not required.

See below, you are correct.

>>
>> armv7at doesn't say it actually includes thumb combines binaries.  (I argued
>> originally it should, but was overruled for a variety of reasons... not the
>> least of which is the interwork enabled, and multilib issues with 'same abi'
>> configurations.)
>>
>> So I agree the default should be armv7at or armv7at-neon, unless there is a
>> compelling reason to leave it as a default with interwork disabled.
>
> I dont believe thats the case we simply should not be able to disable
> interworking.

I just went and checked and I'm wrong.  I was thinking the existence of the 
'thumb' tune feature was enabling interwork.. It's actually backwards:

TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' 
-mno-thumb-interwork', ' -mthumb-interwork', d)}"
OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', 
':thumb-interwork', '', d)}"

it's setting of 'no-thumb-interwork' that disables it.


>>
>> As for the hard float question.  I'm torn on this.. for compatibility a lot
>> of the industry is still soft-float based, and frankly I've not exactly
>> encouraged it with my customers.. (I'm not seeing general performance
>> improvements, only improvements in select artificial benchmarks, or specific
>> pieces of code.)
>>
>> But if changing the default to hard float were generally agreed upon (for
>> architectures where VFP are available) then I wouldn't object.
>>
>
> I would leave that choice to distributions for now
>


