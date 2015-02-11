Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B8DC4732A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 13:38:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2015 05:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,558,1418112000"; d="scan'208";a="676329043"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2015 05:38:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Feb 2015 13:38:43 +0000
Message-ID: <2303631.cvGGEx5voH@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAJTo0LYJpt2XpPL6SYtY+2sT9oR4DuBKdjoCtMZR7CHqygSF0Q@mail.gmail.com>
References: <1423613857-19514-1-git-send-email-paul.gortmaker@windriver.com>
	<CAJTo0LYJpt2XpPL6SYtY+2sT9oR4DuBKdjoCtMZR7CHqygSF0Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: fix do_rootfs failure due to version skew
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
X-List-Received-Date: Wed, 11 Feb 2015 13:38:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 February 2015 12:25:06 Burton, Ross wrote:
> On 11 February 2015 at 00:17, Paul Gortmaker <paul.gortmaker@windriver.com>
> wrote:
> > -RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (=
> > ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
> > +RDEPENDS_${PN}-dev = "avahi-daemon (>= ${PKGV}-${INC_PR}) libavahi-core
> > (>= ${PKGV}-${INC_PR}) libavahi-client (>= ${PKGV}-${INC_PR})"
> 
> But this then breaks the hard dependencies for the avahi package.
> 
> Basically the problem is that you can't just include complex recipes in
> other recipes and expect it to work without lots of hackery.  In this case,
> the amount of hackery required to fix this and various other problems (I've
> an abandoned branch that sorts out other problems) is arguably more
> complicated that throwing all of this away and starting again.
> 
> Personally, I don't see why we have avahi and avahi-ui.  Enabling the GTK+
> tools should be a PACKAGECONFIG option that is controlled by default by
> DISTRO_FEATURES, and all the hackery deleted.

A bit short on details, but here's the bug that triggered splitting it in the 
first place:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=1492

We already had what you're proposing before the split was done. Given that 
avahi is somewhat a core component (if one needs zeroconf), if we go back to 
one recipe, there still needs to be a packaging split between the parts that 
need gtk and those that don't.

(I honestly have to wonder why something like avahi needs its own UI, 
especially in an embedded context, but anyway...)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

