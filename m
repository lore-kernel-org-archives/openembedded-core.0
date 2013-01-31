Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0ufL-0002Uw-3U
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 14:59:08 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:59615 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0uQ9-00065S-Kc; Thu, 31 Jan 2013 08:43:17 -0500
Date: Thu, 31 Jan 2013 08:43:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130131123847.GC2102@jama.dyndns-home.com>
Message-ID: <alpine.DEB.2.02.1301310834500.31170@oneiric>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
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
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 13:59:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 31 Jan 2013, Martin Jansa wrote:

  ok, there's still an issue here that crops up during the *build*.
after i did all the SRCREV caching, i could "fetchall" without network
access so that part works fine.  then i started the build -- again,
without network access since, theoretically, i don't need it, right?
however:

ERROR: Function failed: Network access disabled through BB_NO_NETWORK
but access requested with command git ls-remote
git://arago-project.org/git/projects/linux-davinci.git
v2.6.37_DAVINCIPSP_03.21.00.04 (for url None)
ERROR: Logfile of failure stored in:
/home/rpjday/oe/builds/ti/am1808/tmp-eglibc/work/am180x_evm-oe-linux-gnueabi/linux-omapl138-psp/2.6.37-r0/temp/log.do_unpack.20808
ERROR: Task 631
(/home/rpjday/oe/dist/layers/meta-ti/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb,
do_unpack) failed with exit code '1'

  here's the relevant excerpt from that meta-ti recipe file:

=== start

BRANCH = "03.21.00.03"
SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"

COMPATIBLE_MACHINE = "(omapl138)"

SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
        file://defconfig"

=== end

  i thought my combination of SRCREV_POLICY and "fetchall" should have
guaranteed that i had all necessary source for my build locally.  why
is bitbake trying to access the network again?  the only thing that
strikes me as unusual about that recipe is it's the only one i recall
that uses a non-master branch, could that possibly have any effect?

  am i just misunderstanding something?  i'm after whatever it takes
to absolutely guarantee that i have all source required for a build
locally so that i can disconnect the network before starting the
build.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


