Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcInT-0000Rq-Hk
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 19:14:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 09:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,671,1363158000"; d="scan'208";a="302353556"
Received: from unknown (HELO helios.localnet) ([10.255.12.153])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 09:55:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Tue, 14 May 2013 17:55:40 +0100
Message-ID: <1824887.iAjz2He6PC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5192006C.1060803@r-finger.com>
References: <518A6B25.5000108@r-finger.com>
	<1368459699.6920.41.camel@phil-desktop.brightsign>
	<5192006C.1060803@r-finger.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 14 May 2013 17:14:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 14 May 2013 10:14:20 Tomas Frydrych wrote:
> On 13/05/13 16:41, Phil Blundell wrote:
> > It seems a bit hyperbolic to claim that testing clutter is impossible
> > without GPU hardware (either real or emulated).  The majority of the
> > code even in cogl, and virtually all the code in clutter itself, is
> > mostly independent of the underlying GL implementation.  From the point
> > of view of testing whether clutter basically "works" and is correctly
> > built/packaged it seems as though this ought to be quite sufficient.
> 
> There are too separate issues: testing clutter itself, and using clutter
> to test other parts of the graphics stack.
> 
> Re the former, all you can say after testing cogl/clutter against mesa
> software rasterizer is that a particular configuration and a particular
> backend (in oe-core that would be the GLX backend) work with mesa
> software rasterizer. This says nothing about any other configuration,
> with any other backend or whether it works with any other GL/GLES
> implementation.
> 
> In reality, cogl/clutter need patches to build against the likes of TI's
> GLES (e.g., Beagleboard) or to work on the likes of RaspberryPi, and
> these patches cannot be included in oe-core, of course, because oe-core
> knows nothing of such machines. 

Having clutter in OE-Core does not preclude such testing with additional BSPs, 
and I'm unclear on how moving it out to another layer helps at all with this 
specific issue.

> Then there are little annoyances, like
> the fact that over the last year or so, clutter has tended to have a
> dependency on a specific but mostly random versions of libxkbcommon
> (from what I can gather, determined more then anything by whatever the
> Fedora packager happened to package and what version of Fedora the
> clutter maintainer was using), or Clutter's customary insistence on as
> recent glib as you can get. This can all be nicely encapsulated in small
> layer.

This could present a problem. What if I want Clutter but I don't want the 
latest version of glib, but instead the version that is being shipped with OE-
Core that is tested with the other pieces of the system that depend upon it 
(especially given glib has recent history of breaking other packages)? Surely 
the safest alternative is the last stable version of Clutter that works with 
that version of glib? That would make it difficult to depend upon an external 
layer that provides its own newer version of glib would it not?

There's no denying that the maintenance of the Clutter recipes in OE-Core has 
slipped. I don't think that is an argument in itself to split them out, that 
just means we need to recognise that and maintain those recipes more 
effectively. It's not a case where we've missed the release because it was too 
close, we've not updated it for longer than that.

Honestly I think if Clutter continues to be something that people are using to 
develop applications we're much better off with the "canonical" stable version 
being in OE-Core.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


