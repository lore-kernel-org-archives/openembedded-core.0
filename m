Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C13006065F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 11:08:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2013 04:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,718,1367996400"; d="scan'208";a="374061492"
Received: from unknown (HELO helios.localnet) ([10.252.122.69])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2013 04:08:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 22 Jul 2013 12:08:06 +0100
Message-ID: <3148065.skdr24gULv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51ED09DD.7040008@dresearch-fe.de>
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51ED09DD.7040008@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SRC_URI and latest HEAD revision with git
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
X-List-Received-Date: Mon, 22 Jul 2013 11:08:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 22 July 2013 12:30:53 Steffen Sledz wrote:
> On 22.07.2013 11:51, Paul Eggleton wrote:
> > On Monday 22 July 2013 11:46:23 Steffen Sledz wrote:
> >> On 22.07.2013 11:01, Nicolas Dechesne wrote:
> >>> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.de
> >>> 
> >>> <mailto:sledz@dresearch-fe.de>> wrote:
> >>>> After being OE abstinent for some months i'd like to ask what is the
> >>>> current suggested method for recipes building from the HEAD revision of
> >>>> a git repository (we need this for continuous integration).
> >>>> 
> >>>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final
> >>>> decision, documentation and a good example.>
> >>> 
> >>> you can use ${AUTOREV} for this purpose. You can look at poky-bleeding
> >>> distro config for such an example.
> >>> 
> >>> e.g.
> >>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/dist
> >>> r
> >>> o/include/poky-floating-revisions.inc
> >> 
> >> Hmmmm? This doesn't seem the work.
> >> 
> >> Here's what i tried in my recipe:
> >> 
> >> ------------> snip <------------
> >> PR = "r3"
> >> 
> >> SRCREV="${AUTOREV}"
> >> PV = "gitr${SRCPV}"
> >> ------------> snip <------------
> >> 
> >> But i get package versions like
> >> 
> >>   gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3
> >> 
> >> where SRCPB is always 0. :(
> >> 
> >> A bit more description and/or a complete example would be very helpful.
> > 
> > If you want these to increment now AIUI you need to be using the PR
> > server:
> > 
> > https://wiki.yoctoproject.org/wiki/PR_Service
> 
> This seems to be the thing we need.
> 
> But the description is not very helpful from the view of a recipe
> maintainer. It describes mostly the server part.
> 
> * What do i have to write in my recipe?

Nothing special. If you used SRCPV in PV where you are using an SCM in 
SRC_URI, that should be enough. The integer at the start of SRCREV will be 
incremented automatically if the revision changes, and if it doesn't but other 
values within the recipe change then PR will automatically be incremented 
above the initial value set in the recipe.

> * What modifications in bitbake.conf, local.conf, ... are necessary?

I believe as described in the page I linked above you should only need to set 
PRSERV_HOST.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

