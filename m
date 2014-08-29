Return-Path: <mike.looijmans@topic.nl>
Received: from smtp05.online.nl (smtp05.online.nl [194.134.41.35])
	by mail.openembedded.org (Postfix) with ESMTP id 79BE070EE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:12:03 +0000 (UTC)
Received: from smtp05.online.nl (localhost [127.0.0.1])
	by smtp05.online.nl (Postfix) with ESMTP id 05722522F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:12:03 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp05.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:12:02 +0200 (CEST)
Message-ID: <540019B2.3090102@topic.nl>
Date: Fri, 29 Aug 2014 08:12:02 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1408649791.git.peter.seebach@windriver.com>	<53F77370.2060603@balister.org>	<20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama>	<20140822154954.04d4fc02@e6410-2>
	<20140822214626.GF20524@jama>	<20140822170626.13280b11@e6410-2>
	<20140822222642.GG20524@jama>	<53FB8A87.1010202@windriver.com>	<53F8A551-7665-45B9-A386-DFA43D57E04F@dominion.thruhere.net>
	<53FF3565.1030604@windriver.com>
In-Reply-To: <53FF3565.1030604@windriver.com>
X-Online-Scanned: by Cloudmark authority (on smtp05.online.nl)
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
X-List-Received-Date: Fri, 29 Aug 2014 06:12:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2014 03:57 PM, Mark Hatle wrote:
> On 8/28/14, 8:50 AM, Koen Kooi wrote:
>>
>> Op 25 aug. 2014, om 21:12 heeft Mark Hatle <mark.hatle@windriver.com>
>> het volgende geschreven:
>>
>>> On 8/22/14, 5:26 PM, Martin Jansa wrote:
>>>> On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
>>>>> On Fri, 22 Aug 2014 23:46:26 +0200
>>>>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>
>>>>>> changing
>>>>>> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
>>>>>> still building with -marm doesn't make much sense to me and is only
>>>>>> confusing.
>>>>>
>>>>> I think the distinction is that if you use armv7at-neon, you *can*
>>>>> build
>>>>> specific packages with thumb. Mostly, I guess, I don't think it
>>>>> makes sense
>>>>> to use a tuning that specifically states that it can't run thumb
>>>>> code for
>>>>> processors which can. Although... May not be an important
>>>>> distinction, really,
>>>>> as you note.
>>>>
>>>>> I don't think it makes sense to use a tuning that specifically states
>>>>> that it can't run thumb code
>>>
>>> The defaulttune is supposed to supply what the processor and ABI are
>>> capable of.
>>>
>>> So in the case of armv7a, it's saying no thumb support at all, this
>>> included thumb interwork.
>>>
>>> armv7at says that the processor supports thumb, and interwork
>>> -should- be enabled.  (It can of course be manually disabled, but
>>> that's another issue to be dealt with...)
>>>
>>> armv7at doesn't say it actually includes thumb combines binaries.  (I
>>> argued originally it should, but was overruled for a variety of
>>> reasons... not the least of which is the interwork enabled, and
>>> multilib issues with 'same abi' configurations.)
>>>
>>> So I agree the default should be armv7at or armv7at-neon, unless
>>> there is a compelling reason to leave it as a default with interwork
>>> disabled.
>>>
>>> As for the hard float question.  I'm torn on this.. for compatibility
>>> a lot of the industry is still soft-float based, and frankly I've not
>>> exactly encouraged it with my customers.. (I'm not seeing general
>>> performance improvements, only improvements in select artificial
>>> benchmarks, or specific pieces of code.)
>>
>> Again, softfloat != softfp. The current OE default of softfp *does*
>> use the VFP, it just passed the floats in the integer registers. Which
>> is why you will see no difference with hardfloat except for benchmarks
>> and povray.
>>
>
> Exactly.  Which is why I haven't recommended to my customers that they
> -need- the HF ABI, like others in the ARM world seem to be insisting.
>
> If you have a LOT of functions that pass floats, or you do it often
> enough to see the behavior -- I can see how it would be useful.  But
> this is fairly artificial in most of the embedded workloads I'm familiar
> with.

That's because we all learned to work around the softfp. I got bitten by 
it once, so I also learned to avoid passing floats around across library 
boundaries as much as possible. GCC is smart enough to use hardfloat on 
internal methods, but its hands are tied when interfacing with externals.

There are other, more subtle effects to using hardfloat. For one thing, 
it increases the number of registers available to pass parameters around.

I can see the case for not really needing hardfloat. But I fail to see 
the advantage of strictly adhering to softfp just "because we used to". 
What's the big disadvantage in moving to hardfloat?


>
> So I'd still say I'd like to change the cortexa* DEFAULTTUNES to
> reference armv7at or armv7at-neon (continue the softfp ABI for the time
> being).  I'd be fine with the at-neon version, as I think all of the
> commodity armv7a's have neon.
>
> --Mark


-- 
Mike Looijmans

