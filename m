Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QOw3b-0006YT-Di
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:10:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2011 11:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,262,1304319600"; 
   d="scan'208";a="6869904"
Received: from unknown (HELO [10.255.12.115]) ([10.255.12.115])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2011 11:07:12 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>
Date: Tue, 24 May 2011 13:07:10 -0500
Message-ID: <1306260430.2491.2.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 18:10:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 10:51 -0700, Koen Kooi wrote:
> Op 24 mei 2011, om 19:23 heeft Khem Raj het volgende geschreven:
> 
> > On (24/05/11 09:36), Darren Hart wrote:
> >> I've started pulling in the 15 or so patches to u-boot from meta-ti. In
> > 
> > why ? its a BSP recipe and bsp layer is best place for it IMO unless you
> > want to have some of those machines in a different layer.
> > 
> >> doing so I've come across some questions I'd like you thoughts on.
> >> Specifically, where to put these changes. Some points of context:
> >> 
> >> 1) oe-core is intended to support emulated machines only
> >> 2) oe-core has a "virgin" u-boot recipe (no patches)
> >> 3) meta-yocto does not have a u-boot recipe (no bbappend either)
> >> 4) meta-ti has it's own u-boot recipe with per-machine patches
> >> 
> >> A stated goal was to bring the Yocto Project's u-boot support for the
> >> Beagleboard in line with that in meta-ti. There are several ways I can
> >> go about this.
> >> 
> >> a) create a bbappend in meta-yocto and duplicate the meta-ti
> >>   modifications in bbappend form.
> >> b) Modify the oe-core recipe directly
> >> 
> >> While a) is the most direct approach to accomplish our goal, it requires
> >> continual maintenance and duplicates effort. I don't care for this
> >> approach. b) has the potential to consolidate all beagleboard u-boot
> >> recipe work into a single place. It could simplify the meta-ti and
> >> eliminate the need for a bbappend in the meta-yocto layer.
> >> 
> >> The question of whether bootloaders have a place in oe-core should
> >> probably be addressed. While they aren't needed for the emulated
> >> machines, they are a highly reusable component for real systems, and
> >> that seems justify keeping them in oe-core. Does anyone disagree with
> >> this assessment?
> >> 
> >> I propose pulling the necessary changes to u-boot from meta-ti into
> >> oe-core. My initial scan suggested the beagleboard patches are mostly
> >> contained to beagle specific source files. I would prefer to pull in all
> >> the patches for all machines into the SRC_URI, rather than divide them
> >> up by machine. This reduces complexity considerably. For the couple of
> >> patches that collide, we would keep those as machine specific.
> >> 
> >> As a final part of the work, I would include my beagleboard patch status
> >> audit in the included patches and continue to work on reducing the
> >> patches in the recipe for the beagleboard.
> >> 
> >> Thoughts?
> > 
> > Well I am in similar boat where I wanted to build atom-pc for angstrom
> > but I was thinking using meta-intel layer instead of pulling stuff out
> > and stuffing it elsewhere and certainly not oe-core
> 
> Speaking of meta-intel layers, when I add them to bblayer.conf I get:
> 
> ERROR: Error parsing /OE/tentacle/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto-stable_git.bb: Failure expanding variable FILESEXTRAPATHS, expression was ${FILESEXTRAPATHS}:/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto-stable which triggered exception Exception: variable FILESEXTRAPATHS references itself!
> 
> Same for jasperforest, emenlow, fishriver and crownbay. The only intel layer I can add without breaking the parsing step is sugarbay :(
> 

Must be something recent - I've built several of those successfully over
the past few days, will take a look though...

Tom

> Same goes for meta-xilinx, that breaks in the uboot recipe with some NoneType and string errors.
> 
> regards,
> 
> Koen
> 




