Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqVWk-0004t6-Hl for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 21:30:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78JPoKT005366
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 20:25:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04327-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 20:25:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78JPimh005360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 20:25:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3C6E0A52-0FD9-4951-9D39-4B433F76B20D@kernel.crashing.org>
References: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
	<1312815314.14274.213.camel@rex>
	<3C6E0A52-0FD9-4951-9D39-4B433F76B20D@kernel.crashing.org>
Date: Mon, 08 Aug 2011 20:25:13 +0100
Message-ID: <1312831513.14274.234.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: how to pass or set specific gcc flags?
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
X-List-Received-Date: Mon, 08 Aug 2011 19:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 10:46 -0500, Kumar Gala wrote:
> On Aug 8, 2011, at 9:55 AM, Richard Purdie wrote:
> 
> > On Sun, 2011-08-07 at 12:08 -0500, Kumar Gala wrote:
> >> We'd like to pass:
> >> 
> >> --enable-targets=all
> >> 
> >> on ppc when we target a 64-bit platform but happen to build a 32-bit
> >> toolchain & rootfs, its useful to still have 64-bit support in the
> >> compiler to build a 64-bit kernel if desired in this scenario.  Also,
> >> this seems useful for the multilib situation.
> >> 
> >> Wondering what the best way of doing this.  Adding something into the
> >> tune-ppcFOOBAR file but not sure how to do that so it gets picked up
> >> by the right toolchain pass.  And what do we even override?  I
> >> suggested adding a GCC_EXTRA_OECONF.
> > 
> > I'd caution against this since we don't currently handle packaging of
> > toolchains directly using multilibs and I suspect the compiler wouldn't
> > bootstrap properly either.
> > 
> > Its not the compiler itself I worry about but pieces like libc and
> > libgcc.
> 
> I dont think they have any issue with --enable-targets on ppc.

No, I'm suggesting the build system can't cope with that, e.g. if there
are multiple libgcc's produced we have no way to correctly individually
package them.

> The issue is I'm trying to look at this based on our customer view
> point.  The majority of our customers that would utilize 64-bit are
> going to want to start with a 32-bit rootfs and than add some 64-bit
> bits to it.  Rather than the other way.

Ok, so why not define your multilib the other way around? Start with a
64 bit system and add 64 bit as the multilib?

> This is one reason I'm asking about how to deal with tune-ppce5500.inc
> and 32-bit vs 64-bit.

In these cases you need to define 32 and 64 bit tunes and then you can
select the appropriate tune as needed.

> Now it might be ok short term since we have 2 toolchains, etc for
> multilib.  However at some point (shortly) we have to address this.
> 
> I think the 2 toolchains is UGLY and confusing to customers/users.
> While I understand it from the point of view on how to take steps to
> get multilib going it doesn't mean we shouldnt start thinking about
> how to address these issues.

We've been working on multilb for a while and so far its taken some
significant work by several people to get things working as they are
now. We really need to spend some some and stabilise and consolidate
that work so far at this point.

I'm more than happy to think about consolidating the toolchain pieces,
its on the future ideas list but I don't believe its appropriate right
now. I'd like the work done so far to work properly before we try
enhancing it further.

I'd hope that the toolchains are actually pretty hidden from
customers/users to, I don't think its as ugly as you're making out and
actually has some benefits.

Cheers,

Richard







