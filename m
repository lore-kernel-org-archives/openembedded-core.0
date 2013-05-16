Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1Uctr5-0004tf-UI; Thu, 16 May 2013 10:48:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2013 01:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,683,1363158000"; d="scan'208";a="334970833"
Received: from unknown (HELO helios.localnet) ([10.255.12.131])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2013 01:29:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 16 May 2013 09:29:48 +0100
Message-ID: <2253707.h5Yg7SAvOu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <879938A8-B7BD-4FA6-A38B-F2DDF9D5A48B@dominion.thruhere.net>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1499979.6pTC18VfFV@helios>
	<879938A8-B7BD-4FA6-A38B-F2DDF9D5A48B@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 16 May 2013 08:48:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 May 2013 08:31:33 Koen Kooi wrote:
> Op 15 mei 2013, om 16:44 heeft Paul Eggleton <paul.eggleton@linux.intel.com>
> het volgende geschreven:
> > On Tuesday 14 May 2013 09:36:02 Koen Kooi wrote:
> >> What triggered PR going backwards this time was a BSP removing its
> >> netbase
> >> bbappend because it wasn't needed anymore. That's great, I hate netbase
> >> bbappends since they tend to be ifupdown specific and don't work as
> >> 
> >> intended with connman/NM/netctl/etc. Long story short:
> >> 	ERROR: Package version for package netbase-dbg went backwards which
> >> 	would
> >> 
> >> break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package
> >> version
> >> for package netbase-staticdev went backwards which would break package
> >> feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package version for package
> >> netbase-dev went backwards which would break package feeds from
> >> (0:5.0-r3.1
> >> to 0:5.0-r1.2) ERROR: Package version for package netbase-doc went
> >> backwards which would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)
> >> ERROR: Package version for package netbase-locale went backwards which
> >> would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package
> >> version for package netbase went backwards which would break package
> >> feeds
> >> from (0:5.0-r3.1 to 0:5.0-r1.2)
> >> 
> >> To avoid things like that in the future I have a few recommendations I'd
> >> like to get feedback on:
> >> 
> >> 1) For a given BSP split it in multiple layers:
> >> 	a) One 'core' BSP layer with only:
> >> 		o Bootloader
> >> 		o Kernel
> >> 		o Tooling to build bootloader/kernel/image
> >> 	
> >> 	b) One BSP layer with bbappends for shadow/netbase/xorg-conf/etc
> >> 	c) One or more layers with bbappends for libav/clutter/etc[2]
> > 
> > I don't like this. This will mean effectively 3x the number of BSP layers,
> > with independent testing effectively expected for the different
> > combinations; I don't think this will be practical. It's fine for distros
> > with pre-supplied lists of layers but lots of users are assembling their
> > own layer stacks and this is just going to add pain for them.
> 
> The flip side is that adding BSP layers becomes a lot safer. I don't mind
> adding layers. Adding layers is easy.

For distros like Angstrom it is, yes, as I said above.

> Removing layers is pretty much impossible, though.

With PRINC gone would there be any other issue that would make removing layers 
a problem?

> >> 2) *Never* use PRINC in type b) bbappends
> >> 
> >> 3) Avoid PRINC in general
> > 
> > Do we even need PRINC at all any more? I realise we have PRINC values
> > around in bbappends that we can't easily drop without causing the problem
> > you mentioned.
> 
> If PRSERV would work reliably we wouldn't need it. But even with the current
> flaky PRSERV PRINC is causing more problems than it's supposed to solve.

Can you help us to find out what's wrong with the PR server, assuming it's more 
than just PRINC-related? I suspect you'd need to be preserving the database 
prior to each build; maybe dumping the database into a file within buildhistory 
at the end would do the trick and then we'd have the repo revisions to go with 
that in the same place.

> >> During the last TSC meeting we discussed that there is currently no way
> >> to force maintainers to behave. I think the most we can do is have clear
> >> guidelines on the OE side and enforce those during the "Yocto Project
> >> Compatible" process.
> > 
> > Being more specific in the Yocto Project Compatible process requirements
> > might help; I wasn't involved in developing that process so I can't
> > really comment more than that. That wouldn't help with other layers in
> > the OE community that aren't put through that process however.
> > 
> > I think we need to improve the documentation we have about what is and
> > what is not appropriate in a BSP layer. Most of the time it's not that
> > maintainers are too lazy or deliberately setting out to force values,
> > it's that they don't know they're doing anything wrong because we haven't
> > documented all of the best practices anywhere. There was recently a
> > question on this very mailing list about what constitute distro policy
> > settings in the context of what shouldn't go into a BSP layer; the
> > response has been a resounding "".> 

You didn't respond to this; I think this is the biggest issue we have. 
Contributors cannot be expected to just know the right way to do things unless 
you've made it easy for them to learn in the first place.

> >> And have the layer index orange/red flag layers that
> >> do stupid things. Come to think of it, that would actually be the most
> >> visible way to go, having wikipedia style warning banners on the
> >> offending
> >> layers.
> > 
> > I think that's reasonable as long as maintainers can understand the
> > problem. We'd need to be notifying maintainers directly about
> > specifically what they are doing wrong and how to fix it; just putting a
> > warning in the index isn't enough IMO. The layer index does record
> > maintainer information and regularly reads layer metadata, so we have the
> > infrastructure to do this now, just not the specific tools.
> 
> My thinking was that adding such a banner would email the maintainers of
> that layer. That still assumes that the layer maintainer actually reads
> email, which I don't think is true for a lot of layers :/

It's not just adding the banner but what the banner contains; in most cases 
the banner is going to be much shorter than the necessary explanation. In the 
most recent issue which we've been alluding to, the maintainer was very 
responsive when contacted directly and once they understood the nature of the 
problem, it was solved rapidly.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


