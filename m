Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ualqp-000509-Az for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:51:04 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4ABZTWV029202; Fri, 10 May 2013 12:35:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TArmsyS_64r3; Fri, 10 May 2013 12:35:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4ABZQWV029193
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 10 May 2013 12:35:27 +0100
Message-ID: <1368185566.11129.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Fri, 10 May 2013 12:32:46 +0100
In-Reply-To: <518CD26F.3090901@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 10 May 2013 11:51:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-10 at 11:56 +0100, Tomas Frydrych wrote:
> Hi Richard,
> 
> On 10/05/13 10:05, Richard Purdie wrote:
> >> Yes, I could have submitted clutter 1.12 recipes to oe-core in some form
> >> and shape in the last 6 months, and we would have had a less outdated
> >> package in oe-core; but nevertheless outdated, since again the clutter
> >> 1.14 release came too late to make it into dylan. I can see this
> >> happening again and again.
> > 
> > The trouble is you can make this argument for every single piece of
> > software in OE-Core.
> 
> The clutter related packages are the only ones where I have run into
> this problem.

That is down to the particular development focus you have right now
though. To pick another example, if you're doing arm64 work, the
toolchain is horribly dated in the core. I dare say you could have this
issue for any of the software components (glib, gtk+) and so on.

>  In the last 12 months clutter went through 7 stable
> releases or so, of these there were 3 minor version changes, which
> signal API changes, another minor version change, as well as a major
> version change to 2.0, is on the horizon. If you are developing an
> application using clutter; you need to keep up. If you are using
> Yocto/OE to develop an application using clutter (and people do), then
> everyone is left to maintain their own rolling recipes.

I'd hope that with a decent set of core .inc files in OE-Core, this
wouldn't be a big issue as you could add those newer versions trivially,
then drop them as they make it into the core.

> > A dedicated layer will still have timing issues, it will just move onto
> > your personal schedule rather than the OE-Core one and whilst this will
> > obviously suit you, it likely won't suit all other users.
> 
> For a small dedicated layer the schedule can closely track the upstream.
> It might not suit all clutter users, but I think it could be made to
> work for most of them; the current situation suits no one at all.

The closely track upstream is the key part and I think the core can do
this, apart from the ~six week stabilisation window.


> > I suspect the bigger problem here is that clutter is hard to write
> > recipes for since it needs to suit a number of different targets and
> > configurations. Going to the effort of doing a generic implementation in
> > OE-Core is hard, whereas creating your own layer means you can customise
> > to your usecase and not worry about the other cases. I suspect your
> > reply to this will be that anyone wanting to add other cases can send
> > you patches. The implication is that the layer will become much more
> > specialised/focused than the core recipes currently are.
> 
> My reply is that it clutter is not that complex, there are only a finite
> number of possible configurations that make sense and it should be
> entirely possible to write a good base recipe that can be easily tweaked
> using a bbappend based on machine and distro needs. But that's not the
> real issue.

I agree it should be entirely possible.

> > My preference would still be to fix up the recipes in the core, than
> > have some specific branches for danny/dylan with the 1.12/1.14
> > components in if/as needed. We can create the core recipes so they're
> > properly configurable to the different usecases.
> 
> Fixing up the recipes in oe-core only addresses one aspect of the
> problem. The fast turnover of the clutter packages will remain, as will
> the fact that nothing in oe-core uses clutter, so the oe-core packages
> are untested. Then there is the fact that oe-core does not have any
> machines that clutter could be really used with. Then there are also
> other projects that are closely tied to clutter version, such as (the
> recently removed) mutter, and, dare I say, GnomeShell, which should be
> maintained together.

Well, I originally tried to insist we had some mechanism for testing
clutter in OE-Core however the pieces have either become obsoleted or
removed for other reasons. I do really want to see ptest packages for
clutter which the autobuilder would call into and run. I appreciate GL
support under qemu through software rendering is currently problematic
but I want to see that fixed in the 1.5 cycle.

> I am still to hear any reason why clutter should be in oe-core ... the
> same logic that said mutter should be removed from oe-core applies to
> clutter, I think.

My argument for this is that I really do want to stress out the graphics
stack we have, clutter provides a good way to test some of those
components, particularly some of the more unusual parts. Currently its
mostly build test however we do have plans to make that runtime too. I
do think that clutters unusual usage of the stack makes it particular
useful in this role. I'd appreciate help from anyone who can help make
this all work.

I would therefore like to see a decent set of clutter recipes in the
core.

I keep hearing people arguing for removing many different pieces of the
core. I continue to believe we do need a small set of diverse
technologies in the core, complete with tests (which I want to extend)
to ensure that the core does do something useful.

Cheers,

Richard



