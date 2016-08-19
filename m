Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 181A770018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:57:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7JEv4IR000816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Aug 2016 07:57:04 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Aug 2016 07:57:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1471281772.git.bruce@zedd.org>
	<a68dd58391c30a64e3b0830152b0ffbce04f90cb.1471281772.git.bruce@zedd.org>
	<1471533301.16712.11.camel@linuxfoundation.org>
	<19315d97-49eb-da07-d137-c28d51b3e7d0@windriver.com>
	<1471533645.16712.13.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <4baf8dd3-5bb8-aef8-a339-0aad7224329a@windriver.com>
Date: Fri, 19 Aug 2016 10:57:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471533645.16712.13.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] linux-yocto/4.1: bump to v4.1.29
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
X-List-Received-Date: Fri, 19 Aug 2016 14:57:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-18 11:20 AM, Richard Purdie wrote:
> On Thu, 2016-08-18 at 11:16 -0400, Bruce Ashfield wrote:
>> On 2016-08-18 11:15 AM, Richard Purdie wrote:
>>> On Mon, 2016-08-15 at 14:26 -0400, Bruce Ashfield wrote:
>>>> Integrating the korg 4.1.29 -stable release
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce@zedd.org>
>>>> ---
>>>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>>>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>>>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20
>>>> ++++++++++---
>>>> -------
>>>>  3 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> FWIW since the update before this one, we've seen a lot of
>>> instability
>>> in ppc:
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/
>>> builds/881/steps/Running%20Sanity%20Tests/logs/stdio
>>>
>>> basically the network seems very flaky. Doesn't happen every time
>>> but
>>> we are seeing a rising number of these kinds of 'random' failures.
>>> Are
>>> there any ppc changes or fixes which look like they're responsible,
>>> I'm
>>> pretty sure its something 4.1 kernel related...
>>>
>>> The update also triggered a new 'error' for amd_nb in the error log
>>> parsing which I just whitelisted, probably from some change in the
>>> configuration options enabled.
>>
>> I have a 4.1.30 update queued locally, and I'll double check to see
>> what may have changed in the configuration that could explain any
>> new warnings or instability.
>
> Just to be clear, the amb_nd change was on qemux86* on 4.1
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/builds/911/steps/Running%20Sanity%20Tests/logs/stdio
>
> fixed with:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=26b0657b2f78751e60df6e695d5bc0dd703a5bc2

I had a look at this, and I don't have a root cause for why this is
just popping up now. I'm trying to track down an older build, so I can
compare the .configs.

The kernel code, and Kconfig files themselves haven't changed in some
time, and the symbol in question AMD_NB is default 'y' if the
dependencies are met. We include cfg/amd.scc in all of the qemux86*
builds, so it gets enabled (as it should have before).

I could force that option off, but the whitelist is an appropriate fix,
since this is an interaction between qemu and the kernel, whereas the
files that include amd.scc are targeted at a range of platforms.

>
> The ppc issue is a separate one.

I've been blasting away on my 4.1.30 qemuppc build, and I'm not seeing
anything yet, but I will keep trying.

Bruce

>
> Cheers,
>
> Richard
>
>


