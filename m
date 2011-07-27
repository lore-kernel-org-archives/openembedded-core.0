Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm4Jh-00029U-Py for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 15:38:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RDYF25030117
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 14:34:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29338-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 14:34:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RDY7VP030111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 14:34:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311769062.30326.322.camel@phil-desktop>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
Date: Wed, 27 Jul 2011 14:33:57 +0100
Message-ID: <1311773637.2344.365.camel@rex>
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
X-List-Received-Date: Wed, 27 Jul 2011 13:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 13:17 +0100, Phil Blundell wrote:
> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> > +TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
> 
> This seems a bit backwards.  Shouldn't TARGET_FPU be the primary
> variable and then the package suffix be computed from that, rather than
> vice versa?

It's been "fun" to use the rather limited constructs we have in these
variables to construct the end result. I suspect this way around, it was
the easiest way to get the right variables in the right places.

> > +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
> > +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
> > +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t2", "", d)}"
> > +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"
> 
> This is wrong: ARMv6 doesn't imply Thumb-2.

Ah, yes. I'll fix this.

> > +# Whether to compile with code to allow interworking between the two
> > +# instruction sets. This allows thumb code to be executed on a primarily
> > +# arm system and vice versa. It is strongly recommended that DISTROs not
> > +# turn this off - the actual cost is very small.
> > +TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
> > +OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"
> 
> This is only relevant for v4t, I guess.  Interworking is basically
> always on for v5 and later and (CeSI aside) it's impossible on v4, so
> hardly anybody is going to be flipping this switch.  I'm not sure it
> really merits an OVERRIDE.

I'd be happy to remove this option if there are no objections. It was
left for compatibility with the existing tune-thumb file but as you say,
it likely doesn't make much sense.

> > --- a/meta/conf/machine/include/tune-xscale.inc
> > +++ b/meta/conf/machine/include/tune-xscale.inc
> > @@ -1,11 +1,17 @@
> > -require conf/machine/include/arm/arch-arm.inc
> > +DEFAULTTUNE ?= "xscale"
> >  
> > -INHERIT += "siteinfo"
> > +require conf/machine/include/arm/arch-armv5-dsp.inc
> >  
> > -TUNE_CCARGS = "-march=armv5te -mtune=xscale"
> > -TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
> > -TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> > -PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> > +TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
> > +
> > +AVAILTUNES += "xscale"
> > +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
> > +PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
> > +
> > +AVAILTUNES += "xscale-be"
> > +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5teb} xscale"
> > +PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
> 
> I guess that should be "_tune-xscale-be".

Yes, I'll fix, well spotted.

> All in all it seems as though there's an awful lot of expanded cross
> products in this set of patches and I can't help wondering whether a lot
> of this stuff would be better computed programmatically.  I wouldn't be
> at all surprised if there are other copy-and-paste errors like the
> xscale one lurking in that mass of overrides, but it's very hard to spot
> them by eye.  It seems particularly unfortunate that everything has to
> be written out twice, once for big-endian and once for little-endian,
> given that endianness is almost entirely orthogonal to all the other
> "tuning" parameters.

At least three of us have now done a pass over this so hopefully we've
spotted the major ones but I agree its less than ideal.

The alternative is to post process the variables somehow, or turn it all
into anonymous python (which from a .conf file is not as easy as it
sounds).

I do like the fact that it allows some standardisation of the options
available in a given tune file as whether or not big endian was even
possible was previously hit and miss.

So I think its an improvement but likely not the finished end result.

Cheers,

Richard




