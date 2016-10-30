Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2B0719A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 18:19:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t6Qkr42dVz3hk4C;
	Sun, 30 Oct 2016 19:19:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t6Qkr3f1tzvkwH;
	Sun, 30 Oct 2016 19:19:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 9MM86xmYdoXa; Sun, 30 Oct 2016 19:19:47 +0100 (CET)
X-Auth-Info: qEiBF23dyNpTmhh9zX8y2n3lfUyQF60eqdc4MIZOAFs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 30 Oct 2016 19:19:47 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
	<ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
	<6BB27325-3BFC-461B-B568-438E4CF04963@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8d80d35b-ff76-fd66-fd62-86355d03839a@denx.de>
Date: Sun, 30 Oct 2016 19:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <6BB27325-3BFC-461B-B568-438E4CF04963@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 18:19:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 10/28/2016 06:23 AM, Khem Raj wrote:
> 
>> On Oct 27, 2016, at 5:18 PM, Marek Vasut <marex@denx.de> wrote:
>>
>> On 10/27/2016 01:44 PM, Stefan Müller-Klieser wrote:
>>> On 25.10.2016 21:24, Marek Vasut wrote:
>>>> On 10/25/2016 08:32 PM, Denys Dmytriyenko wrote:
>>>>> On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
>>>>>> On 10/21/2016 09:47 AM, Burton, Ross wrote:
>>>>>>
>>>>>> Hi!
>>>>>>
>>>>>>> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
>>>>>>> <mailto:marex@denx.de>> wrote:
>>>>>>>
>>>>>>>    Upgrade U-Boot to the latest version.
>>>>>>>
>>>>>>>
>>>>>>> As usual, u-boot-mkimage broke again:
>>>>>>
>>>>>> That's weird, I successfully built it for nios2 during my tests.
>>>>>> Can you tell me how I can replicate the issue , so I can test for it to
>>>>>> prevent regression and roll out a patch ?
>>>>>
>>>>> Marek, Ross,
>>>>>
>>>>> Any progress on this? Need any help testing?
>>>>>
>>>> Yeah, how do you replicate this issue ?
>>>>
>>> Hi!
>>
>> Hi!
>>
>>> I am just looking at a similar problem and want to jump into the discussion.
>>> As Ross said, the problem is to not respect host/target -- cc/cflags/ldflags.
>>> So to replicate the issue, you can use a bare minimum build host with no
>>> cross toolchain installed, and I guess all targets will fail to build.
>>
>> Well both ARM and nios2 builds for me, so I wonder what sort of stupid
>> thing am I doing.
> 
> 
> perhaps, its manifesting when toolchain is used from sstate, moreover the sstate
> comes from a mirror which is populated from a workspace which has different
> build time paths, which means its encoding a different default sysroot into
> toolchain. So unless you add TOOLCHAIN_OPTIONS to the CC and its ilk
> you will have issues.
> 
> May be you can reproduce it by
> 
> 1. build first time ./oe-init-build-env /path/to/build1
> 2. Now set another builddir may be using ./oe-init-build-env /path/to/build2
> 3. Add a SSTATE_MIRROR pointing to sstate from first builddir add below to local.conf
> 
> SSTATE_MIRRORS ?= "\
> file://.* file:///path/to/build1/sstate-cache/PATH”
> 
> 4. bitbake <package>
> 5. bitbake -ccleansstate <package>
> 6. bitbake package

This seems pretty convoluted. If I understand Ross correctly, it might
be easier to just try the build on centos?

-- 
Best regards,
Marek Vasut

