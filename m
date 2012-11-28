Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdiRZ-0001pk-7C
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 15:16:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2012 06:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,177,1355126400"; d="scan'208";a="248519807"
Received: from unknown (HELO helios.localnet) ([10.252.122.248])
	by orsmga002.jf.intel.com with ESMTP; 28 Nov 2012 06:02:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 28 Nov 2012 14:02:34 +0000
Message-ID: <2455772.UuKjZbS977@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1211280839110.1431@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<5890106.Vb1bZqkAH2@helios>
	<alpine.DEB.2.02.1211280839110.1431@oneiric>
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
X-List-Received-Date: Wed, 28 Nov 2012 14:16:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 November 2012 08:45:15 Robert P. J. Day wrote:
> On Wed, 28 Nov 2012, Paul Eggleton wrote:
> 
> ... snip for brevity...
> 
> > So the bit that might be missing here is that the PACKAGE_GROUP
> > structure and the packagegroup recipes/class are actually not really
> > related, except that the latter may be used to populate the former.
> > "packagegroup" is the new name for what used to be known as a "task"
> > in versions before danny and much better reflects what these recipes
> > do. PACKAGE_GROUP_* actually came first as a way to define items for
> > IMAGE_FEATURES that map to one or more packages, and I'm not sure
> > the name choice was a particularly good one - I wonder if it would
> > be worth considering renaming it to something like
> > IMAGE_FEATURE_PACKAGES in order to avoid confusion, although
> > obviously every rename like this has a cost associated.
> > 
> > In any case, I would definitely recommend using the term "package
> > group" to refer to packagegroup recipes only, otherwise you're only
> > likely to increase people's level of confusion.
> 
>   one more observation just to mess things up a bit more -- the fact
> that, despite what one reads in core-image.bbclass, the IMAGE_FEATURES
> variable can be used to customize your image in ways that have nothing
> to do with packages or package groups.
> 
>   witness this from meta/classes/rootfs_ipk.bbclass:
> 
>         if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true",
> "false" ,d)}; then if grep Status:.install.ok.unpacked ${STATUS}; then echo
> "Some packages could not be configured offline and rootfs is read-only."
> exit 1
>                 fi
>         fi
> 
> so there's a potential "image feature" called "read-only-rootfs" which
> is clearly not a package group or a package, and of which there is no
> mention in core-image.bbclass.

Yep, that's intended - there are a number of these. IMAGE_FEATURES controls 
features in the image, whether they are sets of packages to be installed or 
other aspects to enable during image construction.

This particular IMAGE_FEATURES item (read-only-rootfs) is not listed probably 
because it's limited to the ipk backend only and not widely used. There is a 
bug open to implement it for rpm and deb, at which time it should probably be 
added to the list there and to the one in the manual.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


