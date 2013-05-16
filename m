Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UcwWu-0005TP-Fb
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 13:39:48 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 00DF1952B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 12:21:13 +0100 (BST)
Message-ID: <5194C123.5090506@r-finger.com>
Date: Thu, 16 May 2013 12:21:07 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
	<1671648.4UWfFTD1eS@helios>
	<CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
	<1368650968.16243.145.camel@pb-ThinkPad-R50e>
	<5194A04E.3000300@r-finger.com>
	<1368700555.6920.118.camel@phil-desktop.brightsign>
In-Reply-To: <1368700555.6920.118.camel@phil-desktop.brightsign>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Thu, 16 May 2013 11:39:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 16/05/13 11:35, Phil Blundell wrote:
> On Thu, 2013-05-16 at 10:01 +0100, Tomas Frydrych wrote:
>> The solution I came up with is to predefine a bunch common
>> configure+depends+rdepends sets in the clutter/cogl includes (there is
>> only a finite number of configurations that makes sense, though my
>> recipes do not cover them all), and then in a Guacamayo-specific
>> bbappend choose a suitable configuration on per-machine basis.
> 
> Right, that sounds fairly reasonable.  Or one could presumably use
> PACKAGECONFIG for this sort of thing.

Yep, that's one of the things I need to clean up in my own recipes.


> It's because we build Cairo with the cogl backend enabled.  That
> introduces a dependency of cairo on cogl (obviously), which is a problem
> because cogl-pango needs pango, which needs harfbuzz, which needs cairo.
> So what we do is build cogl initially with pango disabled, then use that
> to compile cairo and the rest of the stack, and then finally build the
> "real" cogl with everything enabled.

This would probably merit some sort of cogl-initial recipe to add.


> This is something that's just fundamentally difficult in OE; there
> simply isn't any namespace to express that degree of freedom.  DISTRO is
> essentially invariant for any given tmpdir, and the hierarchy in there
> reflects MACHINE and PN.  So, if you want to build the same package with
> a different configuration then either MACHINE or PN is going to have to
> change.  Traditionally of course it's been PN that changes in this
> situation.

I originally went down the PN route, but that meant having to specify
preferred providers and in my use case the sole criterion was the
MACHINE. But for a generic solution, it's probably necessary to have
some PN mechanism in place, maybe the keys in PACKAGECONFIG could be
used to automatically create a mangled PN for non-standard configs.

Tomas


