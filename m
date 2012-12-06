Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tgg1f-0007TM-AE
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 19:18:23 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:44919 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tgfnj-0007Bq-1a for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:03:59 -0500
Date: Thu, 6 Dec 2012 13:03:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212061253340.15222@oneiric>
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
Subject: slightly confused about .bbappend file and FILESPATH
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
X-List-Received-Date: Thu, 06 Dec 2012 18:18:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  currently writing a tutorial page on how .bbappend files and
FILESPATH work, and i wanted to use a live example, but now i'm
confused.

  using meta-ti layer, i chose to build core-image-minimal for a
beagleboard, for which the meta-ti layer has the following under
recipes-core/netbase/ that i want to use as an example:

$ find
.
./netbase_5.0.bbappend
./netbase-5.0
./netbase-5.0/beagleboard
./netbase-5.0/beagleboard/interfaces
$

where the .bbappend file contains only:

THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"


  so my *understanding* is that this should result in nothing more
than the "interfaces" file from the original oe-core recipe being
overridden, based on the enhanced entries at the front of FILESPATH
that should search in the meta-ti layer first.

  but here's the problem -- for fun, i used chris larson's bitbake-env
to print the value of FILESPATH for that recipe when building for
beagle, and formatted to get:

FILESPATH="/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/linux-gnueabi
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/arm
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/build-linux
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/pn-netbase
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/beagleboard
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/omap3
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/armv7a
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/class-target
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/forcevariable
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/libc-glibc
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/beagleboard
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/omap3
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/armv7a
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/class-target
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/forcevariable
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/libc-glibc
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/beagleboard
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/omap3
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/armv7a
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/class-target
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/forcevariable
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/libc-glibc
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/beagleboard
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/omap3
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/armv7a
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/class-target
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/forcevariable
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/libc-glibc
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/"

  see the oddity?  the first few entries will *not* find the
interfaces file in the meta-ti layer, as they don't refer to the
"netbase-5.0" directory (as do the ones in oe-core).

  am i just not understanding something basic here?  i'm building a
core-image-minimal for a beagle right now to see what i end up with,
but given the FILESPATH above, how is the build supposed to pick up
the beagle-specific "intxgerfaces" file without a reference to that
meta-ti directory "netbase-5.0"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


