Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21F68607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 14:15:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u87EFJQn006251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Sep 2016 07:15:19 -0700
Received: from server.local (147.11.117.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 07:15:18 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1473240442.20226.111.camel@linuxfoundation.org>
	<86d45370-2472-5be2-d1c9-b0e44bd53291@windriver.com>
	<1473251611.10544.9.camel@linux.intel.com>
	<9bbebe09-5e7b-0125-460e-54c5ecb4c95a@windriver.com>
	<1473256835.10544.18.camel@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8fa069ee-7141-ae85-5b91-94885d4205f1@windriver.com>
Date: Wed, 7 Sep 2016 10:15:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473256835.10544.18.camel@linux.intel.com>
Subject: Re: Speed regression in the 4.8 kernel?
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
X-List-Received-Date: Wed, 07 Sep 2016 14:15:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-07 10:00 AM, Markus Lehtonen wrote:
> On Wed, 2016-09-07 at 08:44 -0400, Bruce Ashfield wrote:
>> On 2016-09-07 8:33 AM, Markus Lehtonen wrote:
>>> On Wed, 2016-09-07 at 07:56 -0400, Bruce Ashfield wrote:
>>>> On 2016-09-07 5:27 AM, Richard Purdie wrote:
>>>>> Hi Bruce,
>>>>>
>>>>> I deliberately spaced out the merges of various things so we could
>>>>> get
>>>>> performance measurements of the system as it happened.
>>>>> Unfortunately
>>>>> the 4.8 kernel appears to regress the kernel build time quite
>>>>> significantly:
>>>>>
>>>>> The raw data:
>>>>>
>>>>> ypperf02,master:9428b19a7dd1d265d9f3211004391abe33ea0224,uninative
>>>>> -1.3
>>>>> -414
>>>>> -g9428b19,1:01:32,4:21.16,1:00:32,2:10.86,0:16.19,0:11.21,0:01.20,5
>>>>> :34.
>>>>> 73,26701616,6445160,1477762,5446116
>>>>> ypperf02,master:9428b19a7dd1d265d9f3211004391abe33ea0224,uninative
>>>>> -1.3
>>>>> -414
>>>>> -g9428b19,1:04:14,4:23.82,1:00:40,2:13.70,0:16.18,0:11.28,0:01.22,5
>>>>> :45.
>>>>> 48,26697516,6445724,1478048,5446490
>>>>> ypperf02,master:b9d90ace005597ba35b59adcd8106a1c52e40c1a,uninative
>>>>> -1.3
>>>>> -438
>>>>> -gb9d90ac,1:03:16,7:22.13,1:02:46,2:16.60,0:16.32,0:11.04,0:01.21,5
>>>>> :42.
>>>>> 11,30852876,10550952,1707255,5912282
>>>>> ypperf02,master:f7ca989ddc6d470429b547647d3fbaad83a982d9,uninative
>>>>> -1.3
>>>>> -446
>>>>> -gf7ca989,1:04:42,7:29.05,1:03:04,2:19.71,0:16.21,0:11.05,0:01.24,5
>>>>> :52.
>>>>> 83,30845748,10551316,1707615,5912122
>>>>>
>>>>> which shows the time for "bitbake virtual/kernel -c cleansstate;
>>>>> time
>>>>> bitbake virtual/kernel" goes from 4:20 to 7:22. The disk footprint
>>>>> of
>>>>> the build went from 26GB to 30GB. The build with rm_work size went
>>>>> from
>>>>> 6.4GB to 10.5GB. The overall build time went up 2-3 minutes which
>>>>> looks
>>>>> like the increased kernel build time. The increased time may well
>>>>> be
>>>>> from the increased data being generated/processed.
>>>>
>>>> Is it the actual compile itself ? What's the trick to actually get
>>>> individual task
>>>>
>>>> For the disk footprint, I can check the refs in the tree and purge
>>>> anything that may be dangling. That being said, I can't do that to
>>>> the repository on the git server, so we may need someone that can
>>>> issue a git gc directly on the repository.
>>>>
>>>>>
>>>>> We can't ship M3 with this much of a performance degradation and
>>>>> increased space usage :(. Any idea what changed?
>>>>
>>>> Nope. I can only focus on one thing at a time. I was worried about
>>>> a functionally correct kernel (which I still am) and haven't looked
>>>> at anything in the peripheral yet.
>>>>
>>>> If I can get individual task timings, I can look at it more.
>>>>
>>>> I'm seeing significantly faster meta data phases, etc, so I'm
>>>> interested
>>>> to know if this is purely in the build steps.
>>>
>>> In my own test setup I'm seeing similar increase in kernel build time.
>>>
>>> Comparing the buildstats of kernel builds from before and after the 4.8
>>> I
>>> got the following numbers (these are cpu times consumed by the tasks
>>>
>>> TASK                      ABSDIFF   RELDIFF  CPUTIME1    CPUTIME2
>>> do_package                 +17.5s   +133.1%     13.1s -> 30.6s
>>> do_deploy                  +19.9s  +1449.4%      1.4s -> 21.3s
>>> do_package_write_rpm       +86.8s   +714.7%     12.1s -> 98.9s
>>> do_compile_kernelmodules  +139.4s    +35.9%    388.2s -> 527.6s
>>> do_compile                +201.1s    +30.0%    670.3s -> 871.4s
>>
>> ok. So as long as the significant increases aren't in do_kernel_metadata
>> or do_patch (those two I've measured), we are dealing with something
>> in the kernel build itself. I can deal with the footprint by inspecting
>> the repo, but Kbuild is a tougher nut to crack.
>
> I took a look at the kernel build directory size and there was a huge
> difference (500M vs. 3.5G). Seeing that significant change I took a look at
> the kconfigs and found out that CONFIG_DEBUG_KERNEL and CONFIG_DEBUG_INFO
> are enabled, among other things. Looking at the kernel metadata I can see
> that these are enabled in ktypes/base/base.cfg.
>
> I guess this is not intended?

Sure enough, there's a missing series in the 4.8 and master branches
of the kernel meta repo.

I'm going to do a full audit and will send meta data updates once I've
ensured nothing else is missing.

Bruce

>
> Thanks,
>   Markus
>
>
>> Out of curiosity, is the 4.4 kernel on master showing a significantly
>> shorter build time ? I'm assuming the before is the 4.4 kernel .. but
>> I just wanted to be sure, so we can rule out something else that might
>> be pathologically reacting to the sheer amount of I/O in a kernel build.
>>
>> Bruce
>>
>>>
>>>
>>> I haven't tried to analyze what is causing this yet, though.
>>>
>>>
>>> Thanks,
>>>   Markus
>>>
>>
>


