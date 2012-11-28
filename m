Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tdi2n-0000xP-Oj
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:51:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2012 05:37:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,177,1355126400"; d="scan'208";a="225769745"
Received: from unknown (HELO helios.localnet) ([10.252.122.248])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2012 05:37:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 28 Nov 2012 13:37 +0000
Message-ID: <5890106.Vb1bZqkAH2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1211280808130.578@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<20121128130121.GC3477@jama.jama.net>
	<alpine.DEB.2.02.1211280808130.578@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what is "packagegroup-core-nfs-server"?
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
X-List-Received-Date: Wed, 28 Nov 2012 13:51:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 November 2012 08:14:44 Robert P. J. Day wrote:
> On Wed, 28 Nov 2012, Martin Jansa wrote:
> > On Wed, Nov 28, 2012 at 07:58:45AM -0500, Robert P. J. Day wrote:
> > > On Tue, 27 Nov 2012, Saul Wold wrote:
> > > > On 11/27/2012 08:18 PM, Robert P. J. Day wrote:
> > > > >    poking around core-image.bbclass, and noticed this:
> > > > > PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
> > > > > 
> > > > > except i don't see the corresponding packagegroup-core-nfs-server.bb
> > > > > recipe file.  there *is* a packagegroup-core-nfs.bb file; how is the
> > > > > above processed?
> > > > 
> > > > It's defined in recipes-core/packagegroups/packagegroup-core-nfs.bb
> > > > 
> > > > The line
> > > > PACKAGES = "${PN}-server"
> > > > provides the key you are looking for.
> > > > 
> > >   a followup, for which i'm quite prepared to embarrass myself --
> > > 
> > > where is the "splash" package group defined?  i can see this in
> > > image.bbclass:
> > > 
> > > SPLASH ?= "psplash"
> > > PACKAGE_GROUP_splash = "${SPLASH}"
> > > 
> > > and numerous images add that "splash" package group.  but my first
> > > impression was that any package would be defined under some
> > > "packagegroups/" directory, and would necessarily need to "inherit
> > > packagegroup".
> > > 
> > >   so what am i missing?
> > 
> > PACKAGE_GROUP_foo can be provided by any recipe, not only
> > packagegroup-*
> 
>   ok, that's useful information that doesn't seem to be documented
> anywhere (or is it?).
> 
>   however, if a regular recipe can be used as the basis for a package
> group, would it not still have to contain "inherit packagegroup" to be
> defined as a package group?  or can any regular recipe act as its own
> package group?  i examined the "psplash" recipe and i saw nothing that
> suggested it was available as a package group.
> 
>   i realize these are nitpicky questions but it's the sort of thing
> someone's guaranteed to ask me at some point, so i want to nail it
> down.

So the bit that might be missing here is that the PACKAGE_GROUP structure and 
the packagegroup recipes/class are actually not really related, except that 
the latter may be used to populate the former. "packagegroup" is the new name 
for what used to be known as a "task" in versions before danny and much better 
reflects what these recipes do. PACKAGE_GROUP_* actually came first as a way to 
define items for IMAGE_FEATURES that map to one or more packages, and I'm not 
sure the name choice was a particularly good one - I wonder if it would be 
worth considering renaming it to something like IMAGE_FEATURE_PACKAGES in 
order to avoid confusion, although obviously every rename like this has a cost 
associated.

In any case, I would definitely recommend using the term "package group" to 
refer to packagegroup recipes only, otherwise you're only likely to increase 
people's level of confusion.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


