Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tpey6-0003AX-Dx
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 13:59:55 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:44675 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tpejb-0001Fq-Ni; Mon, 31 Dec 2012 07:44:51 -0500
Date: Mon, 31 Dec 2012 07:44:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <50E18137.9090009@mlbassoc.com>
Message-ID: <alpine.DEB.2.02.1212310737070.22859@oneiric>
References: <alpine.DEB.2.02.1212301442200.16593@oneiric>
	<50E18137.9090009@mlbassoc.com>
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
Subject: Re: any objection to my cleaning up some packagegroup files in oe-core?
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
X-List-Received-Date: Mon, 31 Dec 2012 12:59:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 31 Dec 2012, Gary Thomas wrote:

> On 2012-12-30 12:44, Robert P. J. Day wrote:
> >
> >    specifically, in cases like this in packagegroup-core-sdk.bb:
> >
> > RDEPENDS_packagegroup-core-sdk
> >
> > could more cleanly be expressed as:
> >
> > RDEPENDS_${PN}
> >
> > could it not?  there are quite a few of those unnecessarily verbose
> > constructs, anyone mind if i submit a patch to make that change?
>
> Why stop there?  It seems that recipe could use more changes:
>   RPROVIDES_packagegroup-core-sdk = "task-core-sdk"
>   RREPLACES_packagegroup-core-sdk = "task-core-sdk"
>   RCONFLICTS_packagegroup-core-sdk = "task-core-sdk"
>
>   RDEPENDS_packagegroup-core-sdk = "\
>
> All of these should use _${PN}
>
> Also, most of the recipes in meta/recipes-core/packagegroups/* could
> use similar changes to make them more readable and maintainable.

  i just wanted to make sure there was nothing subtle happening that
would prevent something like that, although i'd do it a chunk (one
recipes-* directory?) at a time since some packagegroups don't lend
themselves to that sort of cleanup.

  consider recipes-extended/packagegroups/packagegroup-core-basic.bb.
it starts off so well, with the convenient "packagegroup-core-basic"
prefix for additional packages:

PACKAGES = "\
    packagegroup-core-basic \
    packagegroup-core-basic-libs \
    packagegroup-core-basic-utils \
    packagegroup-core-basic-extended \

then suddenly:

    packagegroup-core-dev-utils \
    packagegroup-core-multiuser \
    packagegroup-core-initscripts \
    packagegroup-core-sys-services \
    "

  grrrr ... you lose the ability to use the ${PN} abbreviation for the
second half of that list.  in cases like that, i'd just leave it alone
for now since abbreviating half the list would look like crap.

  i'll whip up a patch or two later today for the simpler stuff.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



