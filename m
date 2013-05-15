Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UcigP-0000G0-J5; Wed, 15 May 2013 22:52:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4FKaxCt019336; Wed, 15 May 2013 21:36:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6CpD140ZgktK; Wed, 15 May 2013 21:36:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4FKared019328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 15 May 2013 21:36:56 +0100
Message-ID: <1368650024.18324.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 23:33:44 +0300
In-Reply-To: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 20:52:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-14 at 09:36 +0200, Koen Kooi wrote:
> To avoid things like that in the future I have a few recommendations
> I'd like to get feedback on:

In future can we please discuss this on the oe-core list or at least
give a heads up there as this is pretty key to the core of the project
and we've implicitly agreed to discuss architecture there? I appreciate
this affects oe-devel layer maintainers too.

> 1) For a given BSP split it in multiple layers:
> 	a) One 'core' BSP layer with only:
> 		o Bootloader
> 		o Kernel
> 		o Tooling to build bootloader/kernel/image
> 	b) One BSP layer with bbappends for shadow/netbase/xorg-conf/etc
> 	c) One or more layers with bbappends for libav/clutter/etc[2]

You're missing d) which would presumably be everything not in a-c) e.g.
binary graphics libs which aren't bbappends.

I have a feeling this will break more than it solves so I'm not keen on
this and I think we need to dig deeper into the problem and find a
better solution.
> 
> 2) *Never* use PRINC in type b) bbappends
> 3) Avoid PRINC in general

Could we undergo some mass purge of PRINC from master branches and then
change the PR values once and for all in the core recipes? We could make
PRINC throw a bb.fatal() from that point onwards.

> 4) make buildhistory.bbclass mandatory in OE-core

and force enable the PR backwards check? Again, I think the people
you're trying to target to fix these issues are also the people who'd
probably not have the history around to see the issues that most bother
you.

I agree there are some issues here but I think we're going to need a
more creative fix.

My personal view is we need to reduce the number of bbappends. One way
to do this is to make a general/central bsp-files type recipe which
generates all the standard packages (tscalibration data, xorg config and
all the other single machine specific config files).

Yes, this would be a disruptive change but it would significantly clean
up the BSP layers and hopefully make maintenance easier. It is on the
Yocto project proposed features list although we've only got the idea,
we haven't discussed with the community etc. Now would see as good a
time as any.

> There's another use case that suffers from PRINC problems and that is
> removing layers when they break parsing and the maintainer is slow to
> push patches. With the current situation I have to choose between
> "being able to do builds" and "having working feeds".

We have talked about a version wildcard for bbappend. You are still at
the mercy of what the bbappend does though (e.g. when I include
meta-raspberrypi, it changes the psplash logo, regardless of whether I'm
building for the pi).

In many ways the bbappend is too easy and encourages anti-social
behaviour. I would recommend bouncing meta-rpi as being non yocto
project compatible due to the psplash issue if it were to apply which it
has not.

> During the last TSC meeting we discussed that there is currently no
> way to force maintainers to behave. I think the most we can do is have
> clear guidelines on the OE side and enforce those during the "Yocto
> Project Compatible" process. 

How many layers apply for that status though?

> And have the layer index orange/red flag layers that do stupid things.
> Come to think of it, that would actually be the most visible way to
> go, having wikipedia style warning banners on the offending layers.

I think Paul had good feedback here.

> [1] It always happens after editing bblayers.conf and dragging in
> major update to layers. Since I tend to do both at the same time I
> can't say which action triggers it or if it's the combination.
> [2] I spent 3 days trying to figure out why mesa was so *$(*$(@ broken
> before I finally located the bbappends in meta-ti that were causing
> this breakage

I do appreciate understanding where some of the problem arises from,
thanks!

Cheers,

Richard



