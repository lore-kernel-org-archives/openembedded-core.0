Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0rm5-0003Y9-7X
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 11:53:50 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56312 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0rWt-0002Uo-PC for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 05:38:03 -0500
Date: Thu, 31 Jan 2013 05:37:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301310531510.22001@oneiric>
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
Subject: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 10:54:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  as a test, i currently have a full core-image-minimal build for an
am180x-evm, so i just did a fetchall to establish a baseline, that
worked fine.

  next, i added:

  BB_NO_NETWORK = "1"

to my site.conf, which failed predictably with:

ERROR: ExpansionError during parsing
/home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
Failure expanding variable SRCPV, expression was
${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
Network access disabled through BB_NO_NETWORK but access requested
with command git ls-remote
git://arago-project.org/git/projects/u-boot-keystone.git
DEV.MCSDK-03.00.00.07 (for url None)
ERROR: Command execution failed: Exited with 1

  ok, so i reverted the BB_NO_NETWORK setting and added to local.conf:

  BB_SRCREV_POLICY := "cache"

predictably, that worked and, according to yesterday's discussion, i
should now be able to do away with network access, so once again:

  BB_NO_NETWORK = "1"

and:

ERROR: ExpansionError during parsing
/home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
Failure expanding variable SRCPV, expression was
${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
Network access disabled through BB_NO_NETWORK but access requested
with command git ls-remote
git://arago-project.org/git/projects/u-boot-keystone.git
DEV.MCSDK-03.00.00.07 (for url None)
ERROR: Command execution failed: Exited with 1

  ok, what have i done wrong?  i thought the whole point of
BB_SRCREV_POLICY was to make the above possible.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


