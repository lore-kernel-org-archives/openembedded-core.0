Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1983B71A8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 02:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B86C20863;
	Fri, 28 Oct 2016 02:11:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id g-Tnt-aaPsvv; Fri, 28 Oct 2016 02:11:38 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 040302023B;
	Fri, 28 Oct 2016 02:11:35 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id D36D5162186; Thu, 27 Oct 2016 22:11:34 -0400 (EDT)
Date: Thu, 27 Oct 2016 22:11:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161028021134.GK2494@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
	<ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
MIME-Version: 1.0
In-Reply-To: <ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 28 Oct 2016 02:11:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 28, 2016 at 02:18:59AM +0200, Marek Vasut wrote:
> On 10/27/2016 01:44 PM, Stefan Müller-Klieser wrote:
> > On 25.10.2016 21:24, Marek Vasut wrote:
> >> On 10/25/2016 08:32 PM, Denys Dmytriyenko wrote:
> >>> On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
> >>>> On 10/21/2016 09:47 AM, Burton, Ross wrote:
> >>>>
> >>>> Hi!
> >>>>
> >>>>> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
> >>>>> <mailto:marex@denx.de>> wrote:
> >>>>>
> >>>>>     Upgrade U-Boot to the latest version.
> >>>>>
> >>>>>
> >>>>> As usual, u-boot-mkimage broke again:
> >>>>
> >>>> That's weird, I successfully built it for nios2 during my tests.
> >>>> Can you tell me how I can replicate the issue , so I can test for it to
> >>>> prevent regression and roll out a patch ?
> >>>
> >>> Marek, Ross,
> >>>
> >>> Any progress on this? Need any help testing?
> >>>
> >> Yeah, how do you replicate this issue ?
> >>
> > Hi!
> 
> Hi!
> 
> > I am just looking at a similar problem and want to jump into the discussion.
> > As Ross said, the problem is to not respect host/target -- cc/cflags/ldflags.
> > So to replicate the issue, you can use a bare minimum build host with no
> > cross toolchain installed, and I guess all targets will fail to build.
> 
> Well both ARM and nios2 builds for me, so I wonder what sort of stupid
> thing am I doing.

Well, that's the thing - your patches didn't change anything around toolchain, 
so it shouldn't break what used to be working before, right? Unless it was 
already broken...

Ross,

Care to elaborate on what is breaking for you and what setup you are using?


> > As this has been broken so many times, I want to discuss some possible fixes:
> > In the top level Makefile we have:
> > HOSTCC = cc
> > HOSTCFLAGS = ...
> > The problem is, you cannot properly override those variables, as they get used
> > a lot to do different things, e.g. in tools/Makefile we have (for cross tools
> > target) HOSTCC = $(CC) and for HOSTCFLAGS we have appends for configuration. 
> > Thats why we have the current workaround with a squashed override. I see many
> > possible solutions and would like to hear your opinion:
> > 1. Make top level Makefile HOST assignments conditional "?="
> >    - easy
> >    - will probably not be accepted upstream
> 
> Why ?

Heh, good one! :)


> > 2. add "override" to appends in sublevel Makefiles
> >    - adds complexity/one level of override hierarchy
> > 3. Don't use appends for those variables (like in the kernel Makefile), overrides
> >    in the recipe
> >    - clean
> >    - quite some rework in uboot
> 
> Can you provide details ?
> 
> > 4. Hack around in the recipe with class overrides and exports
> >    - quickfix, no patch required
> >    - fails easily in the future
> > 
> > Any thoughts?
> > Stefan
> > 
> 
> 
> -- 
> Best regards,
> Marek Vasut
> 

