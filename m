Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 551 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Oct 2016 11:53:23 UTC
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 60B6F719CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 11:53:23 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id EBDE9A001D0;
	Thu, 27 Oct 2016 13:44:44 +0200 (CEST)
Received: from [172.16.10.21] ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016102713441294-97290 ;
	Thu, 27 Oct 2016 13:44:12 +0200 
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
To: Marek Vasut <marex@denx.de>, Denys Dmytriyenko <denis@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <5811E899.6050000@phytec.de>
Date: Thu, 27 Oct 2016 13:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 27.10.2016 13:44:12,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 27.10.2016 13:44:12,
	Serialize complete at 27.10.2016 13:44:12
X-TNEFEvaluated: 1
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
X-List-Received-Date: Thu, 27 Oct 2016 11:53:23 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252

On 25.10.2016 21:24, Marek Vasut wrote:
> On 10/25/2016 08:32 PM, Denys Dmytriyenko wrote:
>> On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
>>> On 10/21/2016 09:47 AM, Burton, Ross wrote:
>>>
>>> Hi!
>>>
>>>> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
>>>> <mailto:marex@denx.de>> wrote:
>>>>
>>>>     Upgrade U-Boot to the latest version.
>>>>
>>>>
>>>> As usual, u-boot-mkimage broke again:
>>>
>>> That's weird, I successfully built it for nios2 during my tests.
>>> Can you tell me how I can replicate the issue , so I can test for it to
>>> prevent regression and roll out a patch ?
>>
>> Marek, Ross,
>>
>> Any progress on this? Need any help testing?
>>
> Yeah, how do you replicate this issue ?
> 
Hi!
I am just looking at a similar problem and want to jump into the discussion.
As Ross said, the problem is to not respect host/target -- cc/cflags/ldflags.
So to replicate the issue, you can use a bare minimum build host with no
cross toolchain installed, and I guess all targets will fail to build.
As this has been broken so many times, I want to discuss some possible fixes:
In the top level Makefile we have:
HOSTCC = cc
HOSTCFLAGS = ...
The problem is, you cannot properly override those variables, as they get used
a lot to do different things, e.g. in tools/Makefile we have (for cross tools
target) HOSTCC = $(CC) and for HOSTCFLAGS we have appends for configuration. 
Thats why we have the current workaround with a squashed override. I see many
possible solutions and would like to hear your opinion:
1. Make top level Makefile HOST assignments conditional "?="
   - easy
   - will probably not be accepted upstream
2. add "override" to appends in sublevel Makefiles
   - adds complexity/one level of override hierarchy
3. Don't use appends for those variables (like in the kernel Makefile), overrides
   in the recipe
   - clean
   - quite some rework in uboot
4. Hack around in the recipe with class overrides and exports
   - quickfix, no patch required
   - fails easily in the future

Any thoughts?
Stefan

