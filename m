Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0vDZ-0005gG-Mr
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 15:34:22 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:59805 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0uyN-0007zI-SJ; Thu, 31 Jan 2013 09:18:40 -0500
Date: Thu, 31 Jan 2013 09:18:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130131135020.GD2102@jama.dyndns-home.com>
Message-ID: <alpine.DEB.2.02.1301310856270.26528@oneiric>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310834500.31170@oneiric>
	<20130131135020.GD2102@jama.dyndns-home.com>
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
X-List-Received-Date: Thu, 31 Jan 2013 14:34:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 31 Jan 2013, Martin Jansa wrote:

> On Thu, Jan 31, 2013 at 08:43:13AM -0500, Robert P. J. Day wrote:
> > On Thu, 31 Jan 2013, Martin Jansa wrote:
> >
> >   ok, there's still an issue here that crops up during the *build*.
> > after i did all the SRCREV caching, i could "fetchall" without network
> > access so that part works fine.  then i started the build -- again,
> > without network access since, theoretically, i don't need it, right?
> > however:
> >
> > ERROR: Function failed: Network access disabled through BB_NO_NETWORK
> > but access requested with command git ls-remote
> > git://arago-project.org/git/projects/linux-davinci.git
> > v2.6.37_DAVINCIPSP_03.21.00.04 (for url None)
> > ERROR: Logfile of failure stored in:
> > /home/rpjday/oe/builds/ti/am1808/tmp-eglibc/work/am180x_evm-oe-linux-gnueabi/linux-omapl138-psp/2.6.37-r0/temp/log.do_unpack.20808
> > ERROR: Task 631
> > (/home/rpjday/oe/dist/layers/meta-ti/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb,
> > do_unpack) failed with exit code '1'
>
> Have you tried to set
> BB_FETCH_PREMIRRORONLY
> ?

  no, but before i randomly try that, why should it make a difference?
currently, i'm using the own-mirrors bbclass which defines:

PREMIRRORS() {
cvs://.*/.*     ${SOURCE_MIRROR_URL}
svn://.*/.*     ${SOURCE_MIRROR_URL}
git://.*/.*     ${SOURCE_MIRROR_URL}
hg://.*/.*      ${SOURCE_MIRROR_URL}
bzr://.*/.*     ${SOURCE_MIRROR_URL}
svk://.*/.*     ${SOURCE_MIRROR_URL}
p4://.*/.*      ${SOURCE_MIRROR_URL}
osc://.*/.*     ${SOURCE_MIRROR_URL}
https?$://.*/.* ${SOURCE_MIRROR_URL}
ftp://.*/.*     ${SOURCE_MIRROR_URL}
}

so shouldn't i be using premirrors *automatically* for every type of
fetch?  i just verified that i have the tarball:

git2_arago-project.org.git.projects.linux-davinci.git.tar.gz

in my tarballs directory, which should correspond to what should be
downloaded for that recipe.  so, ok, i set BB_FETCH_PREMIRRORONLY and
run:

$ bitbake core-image-minimal
ERROR: ExpansionError during parsing
/home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
Failure expanding variable SRCPV, expression was
${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
Network access disabled through BB_NO_NETWORK but access requested
with command git ls-remote
git://arago-project.org/git/projects/u-boot-keystone.git
DEV.MCSDK-03.00.00.07 (for url None)
ERROR: Command execution failed: Exited with 1
$

  so i open up net access, do a fetchall *and* SRCREV cache, shut down
net access, and (with BB_FETCH_PREMIRRORONLY still set to "1"):

$ bitbake core-image-minimal
... snip ...
ERROR: Function failed: Network access disabled through BB_NO_NETWORK
but access requested with command git ls-remote
git://arago-project.org/git/projects/linux-davinci.git
v2.6.37_DAVINCIPSP_03.21.00.04 (for url None)
ERROR: Logfile of failure stored in:
/home/rpjday/oe/builds/ti/am1808/tmp-eglibc/work/am180x_evm-oe-linux-gnueabi/linux-omapl138-psp/2.6.37-r0/temp/log.do_unpack.6626
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| ERROR: Function failed: Network access disabled through
BB_NO_NETWORK but access requested with command git ls-remote
git://arago-project.org/git/projects/linux-davinci.git
v2.6.37_DAVINCIPSP_03.21.00.04 (for url None)
ERROR: Task 631
(/home/rpjday/oe/dist/layers/meta-ti/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb,
do_unpack) failed with exit code '1'
$

  i'm confused.  am i just being an idiot about something?  to recap,
i want the ability to define a new build, do whatever it takes to
"fetchall" ***everything*** that will be eventually required by this
build (with, ideally, most of it coming from my own-mirrors tarballs
directory, which i've been doing for, like, months) then be able to
build with no further for net access.  so far, no luck, and it's a
small number of meta-ti recipes that are causing grief.

  two points:

  1) as i mentioned, the offending meta-ti recipe appears to be the
only one that specifies a non-master branch.  could that *possibly* be
causing grief with SRCREV caching?

  2) i've already mentioned that extending an image using
EXTRA_IMAGEDEPENDS doesn't cause that to be fetched by fetchall -- i
consider that kind of a bug, especially since numerous recipes use
EXTRA_IMAGEDEPENDS to pull in u-boot.

  apologies for dragging this out but, surely, this shouldn't be that
hard to resolve.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


