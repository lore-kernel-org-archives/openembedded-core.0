Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOwWe-0001MA-SE
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:40:17 +0200
Received: by pvc30 with SMTP id 30so3177350pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=L0fR3Asl/zgwA9E4/+AKsr8H5d9rV9SFj/qSiykDpdI=;
	b=hoEBLaX7PRnC6qpKAy6jWpc3rnAni1/8JOqf8H7OoBqIw21Jz8M4Dx1yYStcP2T5lD
	SsDkPJyd00u9qHN7IP3HTSz+oqMNCwH2yc16ZpPi5aD0QfxzbtkWV4CFj8AV0qGlJNq0
	SIxApVAQh7U8Vaf373FBvWPFLAOdJYFggskfg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=c9T7RhDhjhUQQx9GgWqgvea9DB02ZaJQtwcJS7RZvuE/8HJEmkNzB4tzutuFeNzt59
	ON53/gfmKrGGatBTOOuOW9F06ybTnPndOH8S2GEYslliUcn/m2ykdA7lWyT1Jk360GYk
	vDjomoUH2ElcNbwJ6x5XRhy3AtOU2rCRm7t4U=
Received: by 10.68.54.65 with SMTP id h1mr3156540pbp.44.1306262234292;
	Tue, 24 May 2011 11:37:14 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l3sm5151457pbq.75.2011.05.24.11.37.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 11:37:12 -0700 (PDT)
Date: Tue, 24 May 2011 11:35:55 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20110524183555.GE18116@sakrah.homelinux.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<4DDBF7BA.2000706@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DDBF7BA.2000706@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 18:40:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/11 11:23), Darren Hart wrote:
> On 05/24/2011 10:23 AM, Khem Raj wrote:
> > On (24/05/11 09:36), Darren Hart wrote:
> >> I've started pulling in the 15 or so patches to u-boot from meta-ti. In
> > 
> > why ? its a BSP recipe and bsp layer is best place for it IMO unless you
> > want to have some of those machines in a different layer.
> 
> 
> The underlying goal here is to improve the Beagleboard support in
> meta-yocto, without unnecessarily duplicating work. 

so essentially you are interested in maintaining this board in
meta-yocto and not use meta-ti as long as you have a process to sync
your changes in a sane manner between two layers I think it should be
ok. However we have to make clear if someone uses both meta-ti and meta-yocto
and he should be absolutely clear about what recipes and configurations
he/she ends up picking.

It was suggested at
> ELC that we modify the u-boot and linux-yocto recipes/sources to include
> the beagleboard specific changes from meta-ti. Once the boot loader and
> kernel were in place, we would look to using the still-under-discussion
> layer tooling to integrate the rest of meta-ti.
> 
> 
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
> >>    modifications in bbappend form.
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
> 
> I think the difference I'm seeing is that u-boot is a common recipe (it
> exists in oe-core) and ideally it would track the upstream git
> repository. If the recipe in oe-core is not intended to be used for any
> real machines and isn't used as a base for bbappends in layers like
> meta-ti (meta-ti has a complete uboot_git.bb), then it should just be
> removed entirely.


I would agree on removing them from oe-core yes

> 
> I believe that there is value in not duplicating this recipe and
> consolidating the modifications to it in a single place makes sense. The
> fact that it needs so many non-upstream patches I think is something
> that also needs to be addressed.

u-boot and any other bootloader for that matter are machine specific
and its very hard to have a common recipe serving needs of all machines

best it could do is abstract out common parts which wont be many in
u-boot case since it just have many differences so having it in bsp
layer is probably the best

> 
> The second part is that we want to ensure the linux-yocto recipe and
> kernel have complete support for the Beagleboard. This isn't something
> we can do by just reusing a layer. The linux-yocto recipe takes a
> different approach to managing BSP specific source and config changes. I
> believe it reduces duplication of effort for things like bug fixing,
> security fixes, and config fragment management.
> 

but linux-yocto have different recipes. Does it also cover u-boot ?
in oe-core we would be able to live without linux-yocto having
beagleboard support since oe-core it should only build qemu
machines

> Thanks,
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel

-- 
-Khem


