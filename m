Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TdiAn-00015t-4j
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:59:33 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56330 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tdhx1-0004U4-O6; Wed, 28 Nov 2012 08:45:20 -0500
Date: Wed, 28 Nov 2012 08:45:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <5890106.Vb1bZqkAH2@helios>
Message-ID: <alpine.DEB.2.02.1211280839110.1431@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<20121128130121.GC3477@jama.jama.net>
	<alpine.DEB.2.02.1211280808130.578@oneiric>
	<5890106.Vb1bZqkAH2@helios>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Wed, 28 Nov 2012 13:59:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 28 Nov 2012, Paul Eggleton wrote:

... snip for brevity...

> So the bit that might be missing here is that the PACKAGE_GROUP
> structure and the packagegroup recipes/class are actually not really
> related, except that the latter may be used to populate the former.
> "packagegroup" is the new name for what used to be known as a "task"
> in versions before danny and much better reflects what these recipes
> do. PACKAGE_GROUP_* actually came first as a way to define items for
> IMAGE_FEATURES that map to one or more packages, and I'm not sure
> the name choice was a particularly good one - I wonder if it would
> be worth considering renaming it to something like
> IMAGE_FEATURE_PACKAGES in order to avoid confusion, although
> obviously every rename like this has a cost associated.
>
> In any case, I would definitely recommend using the term "package
> group" to refer to packagegroup recipes only, otherwise you're only
> likely to increase people's level of confusion.

  one more observation just to mess things up a bit more -- the fact
that, despite what one reads in core-image.bbclass, the IMAGE_FEATURES
variable can be used to customize your image in ways that have nothing
to do with packages or package groups.

  witness this from meta/classes/rootfs_ipk.bbclass:

        if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
                if grep Status:.install.ok.unpacked ${STATUS}; then
                        echo "Some packages could not be configured offline and rootfs is read-only."
                        exit 1
                fi
        fi

so there's a potential "image feature" called "read-only-rootfs" which
is clearly not a package group or a package, and of which there is no
mention in core-image.bbclass.

  i had a nice little tutorial going for IMAGE_FEATURES, now i'm going
to have to go back and rethink it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



