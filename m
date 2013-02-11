Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1U4x7n-0006eP-UJ; Mon, 11 Feb 2013 18:25:04 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2013 09:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="261133846"
Received: from unknown (HELO helios.localnet) ([10.252.120.60])
	by orsmga001.jf.intel.com with ESMTP; 11 Feb 2013 09:09:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 17:09:01 +0000
Message-ID: <2760168.9kFd94gL1F@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
MIME-Version: 1.0
Subject: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Mon, 11 Feb 2013 17:25:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

I'd like to make an attempt to remove all appends and overlayed recipes from 
the meta-oe layer. As I've said previously, I don't believe meta-oe - as a 
collection of very useful additional recipes that many wish to be able to use 
on top of their OE-Core based build configurations - should be making any 
possibly unexpected changes to those configurations. Any such changes ought to 
be the province of distro layers alone.

We've already removed all of the obvious overlayed recipes and the meta-
systemd split removed most of the pieces that were there for systemd support; 
there are just a few remaining recipes and appends that need to be dealt with. 
I'll catalogue these below with my comments.

Currently we have the following overlayed recipes:

* icon-naming-utils: meta-oe has a newer version (0.8.90 vs OE-Core's 0.8.7) 
and it uses BBCLASSEXTEND rather than OE-Core's native recipe. I would propose 
to just move the meta-oe version to OE-Core since it appears to be superior.

* libmad: both layers have the same version. The meta-oe version has some 
slightly different versions of the MIPS compiler flag fix and -fforce-mem removal 
patches but I think these can be ignored, since the OE-Core versions of these 
patches have proper headers and are presumably working. The OE-Core version 
has LICENSE_FLAGS that the meta-oe one doesn't, but is missing an avr32-
specific optimisation patch that is in the meta-oe version. What would we do 
with the latter? Is it appropriate to add to the OE-Core recipe?

* tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe that is 
ahead of 1.0; the OE-Core version has two patches not in the meta-oe version 
but that both have been merged upstream in the git revision being used in the 
meta-oe version. There is no newer stable release. What do we do here? Should 
we ask upstream (Chris) for a new stable release?

* xserver-nodm-init: the two versions are quite distinct. Not sure I 
understand the full history here but perhaps someone else can fill in the 
blanks...?

As far as bbappends go we have:

* meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
As far as I can tell this just adds an /etc/busybox-syslog.default file 
containing OPTIONS="-C64" and seems to have been added for systemd support. 
I'm not sure why this wasn't moved to meta-systemd, but I assume it needs to 
be merged into OE-Core now that systemd support is being added there... ?

* meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
Another bbappend apparently for systemd support. Again, this should have been 
moved to meta-systemd; do we now need to merge it into OE-Core?

* meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
This is adding qwt to the qte toolchain. As far as I am concerned this is a 
distro policy decision - Qwt is a third-party library that is not part of Qt. 
I believe this should be moved to the layers for whichever distros want this.

* meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
* meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see this 
as a distro policy decision; these should move to the layers for whichever 
distros want this. FWIW, this is particularly egregious if you've already 
built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.

* meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
Builds against external libav instead of using the builtin copy of ffmpeg, 
apparently for better performance on ARM (and presumably that is not the only 
benefit). It's less clear to me what should be done with this, but I'd still 
rather it could be eliminated. OE-Core does not have ffmpeg/libav; one wonders 
if it should or not.

Thoughts?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


