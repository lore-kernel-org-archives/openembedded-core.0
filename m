Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D11D36CD18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:34:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 14 Oct 2013 03:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,491,1378882800"; d="scan'208";a="410559995"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2013 03:34:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Oct 2013 11:34:01 +0100
Message-ID: <1531159.CIBVSo265B@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1310140603090.10846@oneiric>
References: <alpine.DEB.2.02.1310120713010.21588@oneiric>
	<5784034.W1sd5RUuTd@helios>
	<alpine.DEB.2.02.1310140603090.10846@oneiric>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 14 Oct 2013 10:34:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Monday 14 October 2013 06:21:44 Robert P. J. Day wrote:
> On Mon, 14 Oct 2013, Paul Eggleton wrote:
> > On Saturday 12 October 2013 07:46:02 Chris Larson wrote:
> > > PACKAGE_GROUP_<some group that can be listed in IMAGE_FEATURES> =
> > > "<a list of binary packages, just as you'd add to IMAGE_INSTALL or
> > > CORE_IMAGE_EXTRA_INSTALL yourself>"
> > > 
> > > That's all there is to it. packagegroup-core-nfs-server is a
> > > binary package. PACKAGE_GROUP_nfs-server accepts lists of binary
> > > packages, not lists of recipes.
> 
>   ah, that's a delightfully simple way to explain it, thanks, but
> there are a few niggling details i want to clear up.
> 
>   first, this clearly requires all of the recipe files to be parsed
> first, just so you know the list of possible binary packages and in
> what recipe file they're defined. (that seems trivially obvious, but
> i'm going to say it, anyway.)

Well, at that point you know most of the possible binary packages that
will be produced (actually you know what each recipe claims it will
produce; some of those packages will end up empty and thus not produced
in the absence of ALLOW_EMPTY_packagename = "1"; in the case of
dynamically packaged modules/plugins we may have an idea of the packages
that will be produced via PACKAGES_DYNAMIC but we don't know for sure
until the recipe's do_package actually executes.) This kind of thing applies
to all package references within recipes / configuration; the system only
knows about the packages that have been defined up-front by recipes.
 
>   also, while there's an obvious visual pattern in core-image.bbclass
> when defining some package groups such as:
> 
> PACKAGE_GROUP_x11 = "packagegroup-core-x11"
> PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
> PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
> 
> there's nothing magic about matching those names, is there? and
> nothing magic about those packagegroup recipe files all starting with
> the prefix "packagegroup-..." in the directory
> oe-core/meta/recipes-core/packagegroups/, is there? if i wanted, could
> i just as easily define something like:
> 
> PACKAGE_GROUP_fred = "barney"
> 
> where the binary package "barney" is defined in the recipe file
> "wilma.bb"? silly, i know, but valid?

Yep, nothing magic about the names at all. In fact we do this in a few places
e.g. from image.bbclass:

SPLASH ?= "psplash"
PACKAGE_GROUP_splash = "${SPLASH}"

> # For backwards compatibility after rename
> RPROVIDES_${PN} = "task-core-boot"
> RREPLACES_${PN} = "task-core-boot"
> RCONFLICTS_${PN} = "task-core-boot"
> 
> at some point, after suitable warning, i'd just toss all of that once
> no one seems to be using it anymore.

Richard has expressed a desire to have these removed in future, I'm not
sure when that will happen though.

> > Now that PACKAGE_GROUP has finally made it into the manual (for 1.5)
> > we've tried to explain that it's not the same thing as a
> > packagegroup. Hopefully it will dispel some of the confusion.
> 
>   wait ... which manual? i'm currently working my way through all of
> them but i have a long way to go. :-(

The 1.5 reference manual.

http://www.yoctoproject.org/docs/1.5/ref-manual/ref-manual.html#var-PACKAGE_GROUP

(You won't find this in "current" until 1.5 gets released.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

