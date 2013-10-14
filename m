Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 888626BF59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:21:58 +0000 (UTC)
Received: from [173.34.6.101] (port=51748 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VVfHf-0003lN-Sj; Mon, 14 Oct 2013 06:21:55 -0400
Date: Mon, 14 Oct 2013 06:21:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <5784034.W1sd5RUuTd@helios>
Message-ID: <alpine.DEB.2.02.1310140603090.10846@oneiric>
References: <alpine.DEB.2.02.1310120713010.21588@oneiric>
	<alpine.DEB.2.02.1310120720030.21659@oneiric>
	<CABcZANmgG2Pv-XH+7t=Sd_KRRi=Qp=FXb7pnJLz4tp5aNGxRDA@mail.gmail.com>
	<5784034.W1sd5RUuTd@helios>
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
Cc: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: can one add a "packagegroup" simply by adding the recipe file for it?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 10:21:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Oct 2013, Paul Eggleton wrote:

> On Saturday 12 October 2013 07:46:02 Chris Larson wrote:

> > PACKAGE_GROUP_<some group that can be listed in IMAGE_FEATURES> =
> > "<a list of binary packages, just as you'd add to IMAGE_INSTALL or
> > CORE_IMAGE_EXTRA_INSTALL yourself>"
> >
> > That's all there is to it. packagegroup-core-nfs-server is a
> > binary package. PACKAGE_GROUP_nfs-server accepts lists of binary
> > packages, not lists of recipes.

  ah, that's a delightfully simple way to explain it, thanks, but
there are a few niggling details i want to clear up.

  first, this clearly requires all of the recipe files to be parsed
first, just so you know the list of possible binary packages and in
what recipe file they're defined. (that seems trivially obvious, but
i'm going to say it, anyway.)

  also, while there's an obvious visual pattern in core-image.bbclass
when defining some package groups such as:

PACKAGE_GROUP_x11 = "packagegroup-core-x11"
PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"

there's nothing magic about matching those names, is there? and
nothing magic about those packagegroup recipe files all starting with
the prefix "packagegroup-..." in the directory
oe-core/meta/recipes-core/packagegroups/, is there? if i wanted, could
i just as easily define something like:

PACKAGE_GROUP_fred = "barney"

where the binary package "barney" is defined in the recipe file
"wilma.bb"? silly, i know, but valid?

> > Things got a bit more confusing once tasks got renamed to
> > packagegroups, as the pure data driven package grouping mechanism
> > (PACKAGE_GROUP) already existed at that time.

  i've seen the boilerplate in several files for backward
compatibility:

# For backwards compatibility after rename
RPROVIDES_${PN} = "task-core-boot"
RREPLACES_${PN} = "task-core-boot"
RCONFLICTS_${PN} = "task-core-boot"

at some point, after suitable warning, i'd just toss all of that once
no one seems to be using it anymore.

> Now that PACKAGE_GROUP has finally made it into the manual (for 1.5)
> we've tried to explain that it's not the same thing as a
> packagegroup. Hopefully it will dispel some of the confusion.

  wait ... which manual? i'm currently working my way through all of
them but i have a long way to go. :-(

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

