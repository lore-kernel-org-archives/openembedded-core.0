Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tb7xl-0001Mn-SU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 11:55:26 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:41800 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tb7kA-0003NJ-Bu for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 05:41:22 -0500
Date: Wed, 21 Nov 2012 05:41:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1211210534120.29954@oneiric>
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
Subject: "bitbake -c fetchall" doesn't appear to process EXTRA_IMAGEDEPENDS values
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
X-List-Received-Date: Wed, 21 Nov 2012 10:55:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  short followup to yesterday, it seems that running

  $ bitbake -c fetchall ... whatever ...

won't fetch anything defined solely with EXTRA_IMAGEDEPENDS, although
the fetching *will* be done during the build.

  in my case, using oe-core and meta-ti layers to build for
pandaboard, and here's the versions of u-boot allegedly part of the
process:

$ bitbake -s | grep u-boot
nativesdk-u-boot-mkimage                          :2011.06-r0
u-boot                                            :2011.12-r8 <- there
u-boot-fw-utils                                   :2011.06-r1
u-boot-mkimage                                    :2011.06-r0
u-boot-mkimage-native                             :2011.06-r0
$

but the fetchall fetches only the 2011.06 version.  a simple kludge
was to simply force the fetch by adding:

  CORE_IMAGE_EXTRA_INSTALL = "u-boot"

to my local.conf before starting the fetch.

  just FYI, the meta-ti layer uses this extensively:

$ grep -r EXTRA_IMAGEDEPENDS *
conf/machine/beagleboard.conf:EXTRA_IMAGEDEPENDS = "u-boot"
conf/machine/keystone-evm.conf:#EXTRA_IMAGEDEPENDS = "u-boot"
conf/machine/beaglebone.conf:EXTRA_IMAGEDEPENDS = "u-boot"
conf/machine/include/keystone.inc:EXTRA_IMAGEDEPENDS += "u-boot"
conf/machine/include/ti814x.inc:EXTRA_IMAGEDEPENDS += "u-boot"
conf/machine/include/davinci.inc:EXTRA_IMAGEDEPENDS += "u-boot"
conf/machine/include/omap4.inc:EXTRA_IMAGEDEPENDS += "u-boot"
conf/machine/include/omap3.inc:EXTRA_IMAGEDEPENDS += "u-boot x-load"
conf/machine/include/ti33x.inc:EXTRA_IMAGEDEPENDS += "u-boot"
conf/machine/include/ti816x.inc:EXTRA_IMAGEDEPENDS += "u-boot"
$

  so is this an actual bug?  or am i doing something silly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


