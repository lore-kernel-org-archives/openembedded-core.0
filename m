Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SaNIC-000367-H7 for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 10:33:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q518Mmuk010135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 09:22:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09207-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2012 09:22:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q518MdH4010128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 09:22:40 +0100
Message-ID: <1338538957.20169.264.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 01 Jun 2012 09:22:37 +0100
In-Reply-To: <4FC66D5B.7090201@mlbassoc.com>
References: <cover.1338368508.git.edwin.zhai@intel.com>
	<2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
	<1338396045.20169.162.camel@ted> <4FC66D5B.7090201@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] webkit-gtk: Use glib as unicode backend to avoid browser crash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 08:33:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 12:56 -0600, Gary Thomas wrote:
> On 2012-05-30 10:40, Richard Purdie wrote:
> > On Wed, 2012-05-30 at 17:08 +0800, edwin.zhai@intel.com wrote:
> >> From: Zhai Edwin<edwin.zhai@intel.com>
> >>
> >> webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
> >> target system owns different endian. ICU's community is not responsive to make
> >> a patch for this, so glib is used as work around here.
> >>
> >> [YOCTO #1570] got fixed
> >>
> >> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> >> ---
> >>   meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
> >>   1 files changed, 9 insertions(+), 1 deletions(-)
> >
> > I've merged this however I'm not 100% happy with this as the final fix.
> > I'd ask that:
> >
> > a) The bug remains open (re-prioritised appropriately) about the
> > remaining issues that still exist in ICU
> > b) We add something to the ICU recipe which stops it building when the
> > endianess isn't correct (host matches target) so nobody can built it and
> > have it not work.
> 
> Why not accept my patch that provides a working dataset?  I doubt
> that you're ever going to get the ICU folks interested to the point
> of fixing this correctly and this solves the problem without the
> [IMO undesirable] side effect of using different libraries on
> different architectures (for webkit-gtk).

The issue here is that starting to distribute binary blobs gets us into
potentially troubled waters. It also means that for every new tune or
target (say mips BE), we'd need another blob. Add something like uclibc
and the problem gets worse.

So I can see the attraction of the solution and it works well for
particular cases but it isn't something I think can be made to work in
OE-Core in the general case :(.

I did wonder whether we could post process the binary to correct the
endianess of the data in the file?

Cheers,

Richard




