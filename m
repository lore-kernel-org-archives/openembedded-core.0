Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UajYF-0000lc-2e for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 11:23:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4A97q66020994; Fri, 10 May 2013 10:08:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m9N-AZHnocUu; Fri, 10 May 2013 10:08:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4A984p8021002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 10 May 2013 10:08:05 +0100
Message-ID: <1368176725.11129.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Fri, 10 May 2013 10:05:25 +0100
In-Reply-To: <518A7B37.8050308@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com>
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
X-List-Received-Date: Fri, 10 May 2013 09:23:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-08 at 17:20 +0100, Tomas Frydrych wrote:
> On 08/05/13 16:23, Richard Purdie wrote:
> > On Wed, 2013-05-08 at 16:11 +0100, Tomas Frydrych wrote:
> >> I think it would makes sense to move clutter related packages from
> >> oe-core into a dedicated layer:
> >>
> >> * AFAIK nothing in oe-core requires cogl/clutter/mx,
> >>
> >> * The packages in oe-core are effectively unmaintained, several upstream
> >> releases behind, and pretty much unusable,
> >>
> >> * The somewhat random nature of clutter and cogl releases makes it hard
> >> to sensibly manage these packages within the oe-core release cycle, but
> >> a dedicated layer could follow the upstream developments.
> >>
> >>
> >> I have started work on new clutter and related packages for use by
> >> meta-guacamayo at https://github.com/Guacamayo/meta-clutter, but I'd be
> >> more than happy for the layer to live somewhere else and become the
> >> canonical location for clutter-related bits and pieces.
> > 
> > I have no idea why you've always felt the need to maintain the clutter
> > pieces in your own layer rather than interacting with the ones in
> > OE-Core instead which I'd love to see better maintained. I'm not aware
> > of any barrier that has prevented that.
> 
> It's mostly a matter of timing. Clutter does not provide LTS releases,
> it pretty much deprecates the previous stable branch as soon as new
> stable branch is started, so tracking the upstream reasonably quickly
> matters. The timing for the danny oe-core release and the arrival of
> clutter 1.12 was such that it simply could not have made it into
> oe-core. Needing 1.12 I had no option than to package it elsewhere.
>
> Yes, I could have submitted clutter 1.12 recipes to oe-core in some form
> and shape in the last 6 months, and we would have had a less outdated
> package in oe-core; but nevertheless outdated, since again the clutter
> 1.14 release came too late to make it into dylan. I can see this
> happening again and again.

The trouble is you can make this argument for every single piece of
software in OE-Core. There was nothing stopping you pushing the 1.12
work back into what became dylan as soon as it opened up for changes.
There was also nothing you maintaining an a branch of danny with the
1.12 updates backported into it.

> If there is a good reason to maintain clutter, cogl and mx in oe-core,
> then I'll make patches for 1.14, but I am not convinced there is a good
> reason, and that everyone would be better served by a dedicated layer.

A dedicated layer will still have timing issues, it will just move onto
your personal schedule rather than the OE-Core one and whilst this will
obviously suit you, it likely won't suit all other users.

I suspect the bigger problem here is that clutter is hard to write
recipes for since it needs to suit a number of different targets and
configurations. Going to the effort of doing a generic implementation in
OE-Core is hard, whereas creating your own layer means you can customise
to your usecase and not worry about the other cases. I suspect your
reply to this will be that anyone wanting to add other cases can send
you patches. The implication is that the layer will become much more
specialised/focused than the core recipes currently are.

My preference would still be to fix up the recipes in the core, than
have some specific branches for danny/dylan with the 1.12/1.14
components in if/as needed. We can create the core recipes so they're
properly configurable to the different usecases.

From what I gather you're going ahead with meta-clutter anyway
though :/.

Cheers,

Richard







