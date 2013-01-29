Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U07Q7-0001wH-5G
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 10:24:10 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:53802 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U07Ax-0004cp-5p for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 04:08:19 -0500
Date: Tue, 29 Jan 2013 04:08:10 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301290359260.12134@oneiric>
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
Subject: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
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
X-List-Received-Date: Tue, 29 Jan 2013 09:24:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  not sure if this is expected behaviour, but i'm using the meta-ti
layer to build a core-image-minimal for a am180x-evm.  i'm using
"own-mirrors" to use my own premirrors directory and i've collected
all of the necessary tarballs and actually completed the build, after
which i make sure i have saved all of the tarballs so i don't need
to download anything for a subsequent build.

  as a test, i totally delete my build and start over, but this time
with

  BB_NO_NETWORK = "1"

which i assumed would still work.  instead, i almost immediately got
this:

$ bitbake -c fetch core-image-minimal
Pseudo is not present but is required, building this first before the
main build
ERROR: ExpansionError during parsing
/home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
Failure expanding variable SRCPV, expression was
${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
Network access disabled through BB_NO_NETWORK but access requested
with command git ls-remote
git://arago-project.org/git/projects/u-boot-keystone.git
DEV.MCSDK-03.00.00.06 (for url None)
ERROR: Command execution failed: Exited with 1

  that's not even the version of u-boot that's going to be used, as
"bitbake -s" shows:

u-boot  :2009.11+r68+gitr5f16b8551b125f16cd8d58f278cb25b94272fd9f-r68

so i'm guessing that what's happening here is that even though the
u-boot recipe file u-boot_2013.01.bb will contribute nothing to this
build, its parsing alone requires network access, which makes the
usage of BB_NO_NETWORK = "1" somewhat useless in this context.

  am i misreading something?  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


