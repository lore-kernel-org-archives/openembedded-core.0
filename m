Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0uCS-0008V0-I4
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 14:29:08 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:59143 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0txH-0004LI-5g; Thu, 31 Jan 2013 08:13:27 -0500
Date: Thu, 31 Jan 2013 08:13:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130131123847.GC2102@jama.dyndns-home.com>
Message-ID: <alpine.DEB.2.02.1301310744400.7188@oneiric>
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
X-List-Received-Date: Thu, 31 Jan 2013 13:29:08 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2053181064-1359638006=:7188"

--8323329-2053181064-1359638006=:7188
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 31 Jan 2013, Martin Jansa wrote:

> On Thu, Jan 31, 2013 at 07:19:20AM -0500, Robert P. J. Day wrote:
> > On Thu, 31 Jan 2013, Eric Bénard wrote:
> >
> > > Hi Robert,
> > >
> > > Le Thu, 31 Jan 2013 05:37:59 -0500 (EST),
> > > "Robert P. J. Day" <rpjday@crashcourse.ca> a écrit :
> > > >   ok, what have i done wrong?  i thought the whole point of
> > > > BB_SRCREV_POLICY was to make the above possible.
> > > >
> > > no idea if that the solution but did you do a cleansstate and removed
> > > the initaly downloaded sources to fetch again the sources ?
> >
> >   i did not ... that's necessary?  that's kind of important to know.
> > let me describe the situation i have to see if BB_SRCREV_POLICY is
> > actually going to do me any good.
> >
> >   here's my global site.conf file:
> >
> > SCONF_VERSION = "1"
> > SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
> > INHERIT += "own-mirrors"
> > BB_GENERATE_MIRROR_TARBALLS = "1"
> > # BB_NO_NETWORK = "1"
> >
> > so, as you can see, whenever i end up fetching any new source, it ends
> > up as a tarball and i copy it into my long-lived own-mirrors
> > "tarballs" directory.  obviously saves me buckets of time.
> >
> >   now say i've started a new build and i've done all the fetching
> > without involving BB_SRCREV_POLICY.  i suddenly realize i need to move
> > to somewhere without network access, so i quickly add
> >
> >   BB_SRCREV_POLICY = "1"
>
> BB_SRCREV_POLICY = "cache"
>
> right?

  ok, typing this in real-time, started with empty build dir and

# BB_SRCREV_POLICY := "cache"
# BB_NO_NETWORK = "1"

  then ran:

$ bitbake -c fetchall core-image-minimal

which, predictably, worked just fine as it always has.  now to verify
that lack of network access will cause grief, set to:

BB_NO_NETWORK = "1"

and, sure enough:

$ bitbake -c fetchall core-image-minimal
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

  now, restore network and cache:

BB_SRCREV_POLICY := "cache"
# BB_NO_NETWORK = "1"

at which point the fetchall (predictably) works fine (but is there a
way to verify the srcrev caching?  where would it have suddenly ended
up in my tmp directory?)

finally, if the SRCREV caching worked, i should now be able to:

BB_NO_NETWORK = "1"

and ... huh, it works:

ah, i see ... in my first test, once i had cached the SRCREV content,
i reset:

# BB_SRCREV_POLICY := "cache"

since i thought i didn't need it anymore.  obviously, the above
setting not only directs the caching to take place *initially*, it
subsequently orders it to be *consulted*.  i didn't realize that.
this really needs to be written up somewhere (if it isn't already).
:-)


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



--8323329-2053181064-1359638006=:7188--
