Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QOwJk-0006ko-Ev
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:26:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2011 11:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,262,1304319600"; 
   d="scan'208";a="4075717"
Received: from unknown (HELO [10.255.12.149]) ([10.255.12.149])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2011 11:23:53 -0700
Message-ID: <4DDBF7BA.2000706@linux.intel.com>
Date: Tue, 24 May 2011 11:23:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
In-Reply-To: <20110524172330.GC18086@sakrah.homelinux.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 24 May 2011 18:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/24/2011 10:23 AM, Khem Raj wrote:
> On (24/05/11 09:36), Darren Hart wrote:
>> I've started pulling in the 15 or so patches to u-boot from meta-ti. In
> 
> why ? its a BSP recipe and bsp layer is best place for it IMO unless you
> want to have some of those machines in a different layer.


The underlying goal here is to improve the Beagleboard support in
meta-yocto, without unnecessarily duplicating work. It was suggested at
ELC that we modify the u-boot and linux-yocto recipes/sources to include
the beagleboard specific changes from meta-ti. Once the boot loader and
kernel were in place, we would look to using the still-under-discussion
layer tooling to integrate the rest of meta-ti.


> 
>> doing so I've come across some questions I'd like you thoughts on.
>> Specifically, where to put these changes. Some points of context:
>>
>> 1) oe-core is intended to support emulated machines only
>> 2) oe-core has a "virgin" u-boot recipe (no patches)
>> 3) meta-yocto does not have a u-boot recipe (no bbappend either)
>> 4) meta-ti has it's own u-boot recipe with per-machine patches
>>
>> A stated goal was to bring the Yocto Project's u-boot support for the
>> Beagleboard in line with that in meta-ti. There are several ways I can
>> go about this.
>>
>> a) create a bbappend in meta-yocto and duplicate the meta-ti
>>    modifications in bbappend form.
>> b) Modify the oe-core recipe directly
>>
>> While a) is the most direct approach to accomplish our goal, it requires
>> continual maintenance and duplicates effort. I don't care for this
>> approach. b) has the potential to consolidate all beagleboard u-boot
>> recipe work into a single place. It could simplify the meta-ti and
>> eliminate the need for a bbappend in the meta-yocto layer.
>>
>> The question of whether bootloaders have a place in oe-core should
>> probably be addressed. While they aren't needed for the emulated
>> machines, they are a highly reusable component for real systems, and
>> that seems justify keeping them in oe-core. Does anyone disagree with
>> this assessment?
>>
>> I propose pulling the necessary changes to u-boot from meta-ti into
>> oe-core. My initial scan suggested the beagleboard patches are mostly
>> contained to beagle specific source files. I would prefer to pull in all
>> the patches for all machines into the SRC_URI, rather than divide them
>> up by machine. This reduces complexity considerably. For the couple of
>> patches that collide, we would keep those as machine specific.
>>
>> As a final part of the work, I would include my beagleboard patch status
>> audit in the included patches and continue to work on reducing the
>> patches in the recipe for the beagleboard.
>>
>> Thoughts?
> 
> Well I am in similar boat where I wanted to build atom-pc for angstrom
> but I was thinking using meta-intel layer instead of pulling stuff out
> and stuffing it elsewhere and certainly not oe-core


I think the difference I'm seeing is that u-boot is a common recipe (it
exists in oe-core) and ideally it would track the upstream git
repository. If the recipe in oe-core is not intended to be used for any
real machines and isn't used as a base for bbappends in layers like
meta-ti (meta-ti has a complete uboot_git.bb), then it should just be
removed entirely.

I believe that there is value in not duplicating this recipe and
consolidating the modifications to it in a single place makes sense. The
fact that it needs so many non-upstream patches I think is something
that also needs to be addressed.

The second part is that we want to ensure the linux-yocto recipe and
kernel have complete support for the Beagleboard. This isn't something
we can do by just reusing a layer. The linux-yocto recipe takes a
different approach to managing BSP specific source and config changes. I
believe it reduces duplication of effort for things like bug fixing,
security fixes, and config fragment management.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


