Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm5GO-00080v-BF for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:39:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6REYs1j030452
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 15:34:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30197-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 15:34:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6REYkV9030446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 15:34:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E302051.1010308@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
Date: Wed, 27 Jul 2011 15:34:35 +0100
Message-ID: <1311777275.2344.381.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 14:39:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 09:27 -0500, Mark Hatle wrote:
> On 7/27/11 8:33 AM, Richard Purdie wrote:
> > On Wed, 2011-07-27 at 13:17 +0100, Phil Blundell wrote:
> >> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> >>> +TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
> >>
> >> This seems a bit backwards.  Shouldn't TARGET_FPU be the primary
> >> variable and then the package suffix be computed from that, rather than
> >> vice versa?
> > 
> > It's been "fun" to use the rather limited constructs we have in these
> > variables to construct the end result. I suspect this way around, it was
> > the easiest way to get the right variables in the right places.
> > 
> >>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
> >>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
> >>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t2", "", d)}"
> >>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"
> >>
> >> This is wrong: ARMv6 doesn't imply Thumb-2.
> > 
> > Ah, yes. I'll fix this.
> 
> Are you sure?  I thought ARMv6 -was- the first to support Thumb-2.  And armv5/4
> were thumb(1).  Note, not all ARMv6 processors contain thumb support.

I did quickly check up on this and I think Phil is right but I'll take
other evidence...

> >>> --- a/meta/conf/machine/include/tune-xscale.inc
> >>> +++ b/meta/conf/machine/include/tune-xscale.inc
> >>> @@ -1,11 +1,17 @@
> >>> -require conf/machine/include/arm/arch-arm.inc
> >>> +DEFAULTTUNE ?= "xscale"
> >>>  
> >>> -INHERIT += "siteinfo"
> >>> +require conf/machine/include/arm/arch-armv5-dsp.inc
> >>>  
> >>> -TUNE_CCARGS = "-march=armv5te -mtune=xscale"
> >>> -TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
> >>> -TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> >>> -PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> >>> +TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
> >>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
> >>> +
> >>> +AVAILTUNES += "xscale"
> >>> +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
> >>> +PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
> >>> +
> >>> +AVAILTUNES += "xscale-be"
> >>> +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5teb} xscale"
> >>> +PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
> >>
> >> I guess that should be "_tune-xscale-be".
> > 
> > Yes, I'll fix, well spotted.
> 
> In the original work I did it was just tune-xscale (no be).  AFAIK there is no
> little endian version of xscale.  (there was an iwmmxt that was similar to
> xscale, but was slightly different.)

You can put most ARM processors including XScale into big or little
endian mode as far as I know. The infamous OE example is the NSLU2
(IXP4xx) which is xscale based and runs in BE by default. This is why
the original tune file supports both endians.

Cheers,

Richard



