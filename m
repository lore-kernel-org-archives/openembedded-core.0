Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QOue3-0004iz-JD
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 18:39:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2011 09:36:45 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.149]) ([10.255.12.149])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2011 09:36:44 -0700
Message-ID: <4DDBDE9D.5000709@linux.intel.com>
Date: Tue, 24 May 2011 09:36:45 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 16:39:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I've started pulling in the 15 or so patches to u-boot from meta-ti. In
doing so I've come across some questions I'd like you thoughts on.
Specifically, where to put these changes. Some points of context:

1) oe-core is intended to support emulated machines only
2) oe-core has a "virgin" u-boot recipe (no patches)
3) meta-yocto does not have a u-boot recipe (no bbappend either)
4) meta-ti has it's own u-boot recipe with per-machine patches

A stated goal was to bring the Yocto Project's u-boot support for the
Beagleboard in line with that in meta-ti. There are several ways I can
go about this.

a) create a bbappend in meta-yocto and duplicate the meta-ti
   modifications in bbappend form.
b) Modify the oe-core recipe directly

While a) is the most direct approach to accomplish our goal, it requires
continual maintenance and duplicates effort. I don't care for this
approach. b) has the potential to consolidate all beagleboard u-boot
recipe work into a single place. It could simplify the meta-ti and
eliminate the need for a bbappend in the meta-yocto layer.

The question of whether bootloaders have a place in oe-core should
probably be addressed. While they aren't needed for the emulated
machines, they are a highly reusable component for real systems, and
that seems justify keeping them in oe-core. Does anyone disagree with
this assessment?

I propose pulling the necessary changes to u-boot from meta-ti into
oe-core. My initial scan suggested the beagleboard patches are mostly
contained to beagle specific source files. I would prefer to pull in all
the patches for all machines into the SRC_URI, rather than divide them
up by machine. This reduces complexity considerably. For the couple of
patches that collide, we would keep those as machine specific.

As a final part of the work, I would include my beagleboard patch status
audit in the included patches and continue to work on reducing the
patches in the recipe for the beagleboard.

Thoughts?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


