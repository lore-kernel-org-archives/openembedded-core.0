Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0tM9-0003Os-99
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:35:06 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58074 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0t6y-0001t4-29; Thu, 31 Jan 2013 07:19:24 -0500
Date: Thu, 31 Jan 2013 07:19:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: =?ISO-8859-15?Q?Eric_B=E9nard?= <eric@eukrea.com>
In-Reply-To: <20130131131021.6d5ffccd@e6520eb>
Message-ID: <alpine.DEB.2.02.1301310711320.6796@oneiric>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
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
X-List-Received-Date: Thu, 31 Jan 2013 12:35:10 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1999097671-1359634763=:6796"

--8323329-1999097671-1359634763=:6796
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 31 Jan 2013, Eric Bénard wrote:

> Hi Robert,
>
> Le Thu, 31 Jan 2013 05:37:59 -0500 (EST),
> "Robert P. J. Day" <rpjday@crashcourse.ca> a écrit :
> >   ok, what have i done wrong?  i thought the whole point of
> > BB_SRCREV_POLICY was to make the above possible.
> >
> no idea if that the solution but did you do a cleansstate and removed
> the initaly downloaded sources to fetch again the sources ?

  i did not ... that's necessary?  that's kind of important to know.
let me describe the situation i have to see if BB_SRCREV_POLICY is
actually going to do me any good.

  here's my global site.conf file:

SCONF_VERSION = "1"
SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
INHERIT += "own-mirrors"
BB_GENERATE_MIRROR_TARBALLS = "1"
# BB_NO_NETWORK = "1"

so, as you can see, whenever i end up fetching any new source, it ends
up as a tarball and i copy it into my long-lived own-mirrors
"tarballs" directory.  obviously saves me buckets of time.

  now say i've started a new build and i've done all the fetching
without involving BB_SRCREV_POLICY.  i suddenly realize i need to move
to somewhere without network access, so i quickly add

  BB_SRCREV_POLICY = "1"

and do another fetchall to cache all the SRCREV stuff.  it *appears*
that that does nothing for me since all my fetching had been done.

  you're saying i need to cleansstate first, then do the fetchall
*again*?  i might be misunderstanding this but, at this point,
BB_SRCREV_POLICY is starting to look like more trouble than it's worth
since it requires planning, *knowing* that you'll be without a network
later and, worst of all, if you start a fresh build, it does you no
good since all that cached SRCREV content is in the other build
directory's tmp directory.

  given that all of this can be avoided by just avoiding tag names,
i'm liking that option more and more. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-1999097671-1359634763=:6796--
