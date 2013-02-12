Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1U5LqH-0001GB-Bh; Tue, 12 Feb 2013 20:48:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 11:31:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,652,1355126400"; d="scan'208";a="284830524"
Received: from unknown (HELO helios.localnet) ([10.252.120.87])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 11:32:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Feb 2013 19:32:33 +0000
Message-ID: <26170862.UdgPXC9k0H@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <20130212191902.GD3300@jama>
References: <2760168.9kFd94gL1F@helios> <20130212191902.GD3300@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 19:48:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 February 2013 20:19:02 Martin Jansa wrote:
> On Mon, Feb 11, 2013 at 05:09:01PM +0000, Paul Eggleton wrote:
> > * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe
> > that is ahead of 1.0; the OE-Core version has two patches not in the
> > meta-oe version but that both have been merged upstream in the git
> > revision being used in the meta-oe version. There is no newer stable
> > release. What do we do here? Should we ask upstream (Chris) for a new
> > stable release?
> 
> tslib is also requested on devices where kernel driver returns too much
> noise, tslib can filter that, evdev needs separate filter like
> http://atrey.karlin.mff.cuni.cz/~metan/evfilter/
> but that isn't integrated in OE.

OK. I think the best course of action is to petition upstream for a stable 
release and then update OE-Core to that, then we can drop the recipe from 
meta-oe without ill effect.

> > * xserver-nodm-init: the two versions are quite distinct. Not sure I
> > understand the full history here but perhaps someone else can fill in the
> > blanks...?
> 
> The biggest difference is integrated xinput-calibrator and use of
> xserver-common_1.34.bb

So can you see a means for us to move this into OE-Core? Where are the points 
of conflict?

> > * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see
> > this as a distro policy decision; these should move to the layers for
> > whichever distros want this. FWIW, this is particularly egregious if
> > you've already built Qt, then add meta-oe and find Qt is being
> > unexpectedly rebuilt.
>
> MySQL and PostgreSQL are not in oe-core so it cannot be replaced with
> simple PACKAGECONFIG option in oe-core recipe, but I also prefer to
> share such .bbappend somewhere instead of every distribution reinventing
> the wheel when trying to enable something as simple as db in qt.

We kind of discussed this already - PACKAGECONFIG can't work for this  anyway 
because at least for the database drivers it's a tri-state switch. At the 
moment all these bbappends really do is set QT_SQL_DRIVER_FLAGS, DEPENDS and 
set the correct include directory. This is not a particularly advanced 
mechanism, is unlikely to change, and I don't think it's too much to ask for 
this to be set in each distro layer. This is distro policy and should not be 
expressed in meta-oe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


