Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6E14371AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 01:35:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t4mXs2CMfz3hjPM;
	Fri, 28 Oct 2016 03:35:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t4mXs1Pr3zvmC4;
	Fri, 28 Oct 2016 03:35:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id F6Ho8UD5RhAE; Fri, 28 Oct 2016 03:35:24 +0200 (CEST)
X-Auth-Info: 2NNapQQCsr1N37vVSSt1An2VcamuFcXObuBSTpcZkOE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 28 Oct 2016 03:35:24 +0200 (CEST)
To: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>,
	Denys Dmytriyenko <denis@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
Date: Fri, 28 Oct 2016 02:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <5811E899.6050000@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Fri, 28 Oct 2016 01:35:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 10/27/2016 01:44 PM, Stefan Müller-Klieser wrote:
> On 25.10.2016 21:24, Marek Vasut wrote:
>> On 10/25/2016 08:32 PM, Denys Dmytriyenko wrote:
>>> On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
>>>> On 10/21/2016 09:47 AM, Burton, Ross wrote:
>>>>
>>>> Hi!
>>>>
>>>>> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
>>>>> <mailto:marex@denx.de>> wrote:
>>>>>
>>>>>     Upgrade U-Boot to the latest version.
>>>>>
>>>>>
>>>>> As usual, u-boot-mkimage broke again:
>>>>
>>>> That's weird, I successfully built it for nios2 during my tests.
>>>> Can you tell me how I can replicate the issue , so I can test for it to
>>>> prevent regression and roll out a patch ?
>>>
>>> Marek, Ross,
>>>
>>> Any progress on this? Need any help testing?
>>>
>> Yeah, how do you replicate this issue ?
>>
> Hi!

Hi!

> I am just looking at a similar problem and want to jump into the discussion.
> As Ross said, the problem is to not respect host/target -- cc/cflags/ldflags.
> So to replicate the issue, you can use a bare minimum build host with no
> cross toolchain installed, and I guess all targets will fail to build.

Well both ARM and nios2 builds for me, so I wonder what sort of stupid
thing am I doing.

> As this has been broken so many times, I want to discuss some possible fixes:
> In the top level Makefile we have:
> HOSTCC = cc
> HOSTCFLAGS = ...
> The problem is, you cannot properly override those variables, as they get used
> a lot to do different things, e.g. in tools/Makefile we have (for cross tools
> target) HOSTCC = $(CC) and for HOSTCFLAGS we have appends for configuration. 
> Thats why we have the current workaround with a squashed override. I see many
> possible solutions and would like to hear your opinion:
> 1. Make top level Makefile HOST assignments conditional "?="
>    - easy
>    - will probably not be accepted upstream

Why ?

> 2. add "override" to appends in sublevel Makefiles
>    - adds complexity/one level of override hierarchy
> 3. Don't use appends for those variables (like in the kernel Makefile), overrides
>    in the recipe
>    - clean
>    - quite some rework in uboot

Can you provide details ?

> 4. Hack around in the recipe with class overrides and exports
>    - quickfix, no patch required
>    - fails easily in the future
> 
> Any thoughts?
> Stefan
> 


-- 
Best regards,
Marek Vasut

