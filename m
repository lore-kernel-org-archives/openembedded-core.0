Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ucvp3-0001Cu-KY for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 12:54:16 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcvXP-0000hT-RI; Thu, 16 May 2013 12:35:55 +0200
Message-ID: <1368700555.6920.118.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Thu, 16 May 2013 11:35:55 +0100
In-Reply-To: <5194A04E.3000300@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
	<1671648.4UWfFTD1eS@helios>
	<CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
	<1368650968.16243.145.camel@pb-ThinkPad-R50e>
	<5194A04E.3000300@r-finger.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 16 May 2013 10:54:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-16 at 10:01 +0100, Tomas Frydrych wrote:
> The solution I came up with is to predefine a bunch common
> configure+depends+rdepends sets in the clutter/cogl includes (there is
> only a finite number of configurations that makes sense, though my
> recipes do not cover them all), and then in a Guacamayo-specific
> bbappend choose a suitable configuration on per-machine basis.

Right, that sounds fairly reasonable.  Or one could presumably use
PACKAGECONFIG for this sort of thing.

> > - we have a slightly funky 2-stage bootstrap process for cogl in order
> > to break the dependency cycle with cairo; this involves hacks to the
> > recipes for cogl, cairo, pango and harfbuzz (at least) which I suspect
> > would not be very palatable to oe-core.
> 
> I have never run into this, is this with recent cogls?

It's because we build Cairo with the cogl backend enabled.  That
introduces a dependency of cairo on cogl (obviously), which is a problem
because cogl-pango needs pango, which needs harfbuzz, which needs cairo.
So what we do is build cogl initially with pango disabled, then use that
to compile cairo and the rest of the stack, and then finally build the
"real" cogl with everything enabled.

Obviously the other option would be to build cairo twice, firstly
without cogl and the second time with it.  I don't think there's much to
choose between the two.

> this limitation, but are the wrong place for this, plus it is entirely
> conceivable you might want be able to build different configs for the
> same machine on the same tmp dir (I use pseudo-machines for this, like
> atom-egl, but that is just a nasty hack).

This is something that's just fundamentally difficult in OE; there
simply isn't any namespace to express that degree of freedom.  DISTRO is
essentially invariant for any given tmpdir, and the hierarchy in there
reflects MACHINE and PN.  So, if you want to build the same package with
a different configuration then either MACHINE or PN is going to have to
change.  Traditionally of course it's been PN that changes in this
situation.

p.




