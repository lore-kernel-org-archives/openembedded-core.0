Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPseP-0002eC-M9 for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 10:44:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4R8evVF000507;
	Fri, 27 May 2011 09:40:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32581-07; Fri, 27 May 2011 09:40:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4R8eoRN000501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 09:40:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4DDF1DDD.30001@linux.intel.com>
References: <cover.1306444161.git.dvhart@linux.intel.com>
	<e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>
	<1306452282.27470.214.camel@rex>  <4DDF1DDD.30001@linux.intel.com>
Date: Fri, 27 May 2011 09:40:44 +0100
Message-ID: <1306485644.27470.247.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 08:44:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 20:43 -0700, Darren Hart wrote:
> On 05/26/2011 04:24 PM, Richard Purdie wrote:
> > On Thu, 2011-05-26 at 14:12 -0700, Darren Hart wrote:
> >> Note: I used bb.note() instead of bb.debug() to ensure the message at least
> >>       makes it to the console. From what I could gather, bb.debug() doesn't
> >>       go anywhere during recipe parsing.
> > 
> > Why?
> > 
> 
> My thinking was that the only time you would legitimately try and build
> this package when you can't is during a "world" build, which is likely
> an unattended sort of build anyway. The rest of the time you might hit
> this error would be when you intended to build u-boot but are missing
> the requisite configuration bits in your machine config.

You've inserted the note at parsing time though so every time anyone
builds anything this will show up.

In case you wonder why bitbake does this its because it has no idea what
the recipe provides until it attempts to parse it. Yes, you can make
guesses from filenames but those are just a convenience and
BBCLASSEXTEND can make one recipe provide multiple things for example.

foo_git.bb

containing:

PN = "bar"

or

PROVIDES += "something-else"

are both valid things to do too if potentially misleading.

> Since the debug lines don't get logged anywhere, and you have to clear
> tmp/cache in order to retrigger the SkipPackage event with a new bitbake
> command (even with -D), I thought it the most user friendly to ensure
> the message made it out somewhere where it wouldn't get lost.
> 
> > We exclude about 30 different recipes
> 
> I didn't realize it was so many, it's difficult to tell just grepping
> for SkipPackage.

COMPATIBLE_MACHINE and COMPATIBLE_HOST will show more.

> > when parsing and would you really
> > want to see a usability message from each one when you likely don't care
> > about it?
> 
> See above for my rationale on when you "care about it".
> 
> > 
> > A bb.debug is fine and the user can see it if they run with -D to get
> > more info.
> 
> The user won't see it unless they clear tmp/cache, which isn't very
> intuitive (or at least it wasn't to me).
> 
> > A bb.note is just irritating.
> 
> I can resend with bb.debug() if you feel strongly about it, as
> apparently you do. I've answered your "why" question, but I don't feel
> strongly about it. If you want to use bb.debug() I can resend as such
> (or just repush with that single change).

Given my comment above (the note appears all the time, not just for
world), I do feel strongly about this.

Yes, we could do with a better way of showing up which packages were
skipped if the user needs to know but this isn't the way to do it and it
won't scale.

Cheers,

Richard




