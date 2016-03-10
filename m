Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01B08731AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 21:55:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2ALtue8019731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 10 Mar 2016 13:55:57 -0800
Received: from server.local (147.11.119.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 10 Mar 2016 13:55:56 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Gortmaker
	<paul.gortmaker@windriver.com>
References: <cover.1455203562.git.bruce.ashfield@windriver.com>
	<2e6d2b75837731be983d888eaa82a9cfcf660e85.1455203562.git.bruce.ashfield@windriver.com>
	<1455287765.16142.321.camel@linuxfoundation.org>
	<1455291157.16142.323.camel@linuxfoundation.org>
	<1455352317.16142.344.camel@linuxfoundation.org>
	<1455383832.16142.365.camel@linuxfoundation.org>
	<20160302014146.GE20979@windriver.com> <56E07128.2060401@windriver.com>
	<1457558624.2804.181.camel@linuxfoundation.org>
	<56E0F427.7030708@windriver.com>
	<1457643576.2804.228.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56E1ED68.6060202@windriver.com>
Date: Thu, 10 Mar 2016 16:55:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457643576.2804.228.camel@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>, "saul.wold" <saul.wold@intel.com>,
	poky@yoctoproject.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] poky: update qemu* to prefer 4.4 kernel
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
X-List-Received-Date: Thu, 10 Mar 2016 21:55:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-10 3:59 PM, Richard Purdie wrote:
> On Wed, 2016-03-09 at 23:12 -0500, Bruce Ashfield wrote:
>> On 2016-03-09 4:23 PM, Richard Purdie wrote:
>>> On Wed, 2016-03-09 at 13:53 -0500, Bruce Ashfield wrote:
>>>> As another follow up. The thread can be summarized as "It doesn't
>>>> look like it should have worked before, and qemu's pat emulation
>>>> may be the issue'.
>>>>
>>>> The suggestion is to run with 'nopat', which is what Richard
>>>> originally
>>>> did.
>>>>
>>>> So I'm going to prep a patch that drops the kernel patch, and
>>>> leaves
>>>> nopat enabled on the qemu command line. That should get us put
>>>> back
>>>> together in a semi-permanent way.
>>>
>>> How sure are we this is a bug in QEMU's pat emulation? If that is
>>> the
>>> case we should file a bug against qemu and try and fix it rather
>>> than
>>> work around it...
>>
>> It could still be something that the kernel can work around, Toshi
>> did say:
>>
>> There is a matter of how qemu emulates CPU features.  There is no
>> such
>> Intel CPU that supports PAT w/o MTRR.  This is why the current code
>> assumes this dependency.
>>
>> Which is likely the trigger, we've send information about the cpu to
>> him, and with that there's a chance for a pat fix.
>>
>> He repeated our thought of running with 'nopat' while a fix is
>> considered.
>>
>> It may be some time before that happens, and I was going to test
>> with the kernel patch dropped, and nopat in the qemu boot args. If
>> that works, I'd rather run with that, and then revisit when (if)
>> there's more changes upstream.
>
> Reading the other thread, it looks like if MTRR is disabled, PAT needs
> to be disabled too. That sounds like a simple enough patch which is
> going upstream imminently so I think the preferred solution is to get
> that into our kernels and then drop my patch?

Yep. Looks like there's a patch to disable the pat based on the flags
of the cpu model being proposed.

When that's out, I'll merge it, and then we'll drop this. So for now,
we wait a bit longer.

Bruce

>
> Cheers,
>
> Richard
>


