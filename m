Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm37a-0002zD-Ug
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 14:21:57 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm33W-000267-Hg
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 14:17:42 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 13:17:41 +0100
In-Reply-To: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311769062.30326.322.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 27 Jul 2011 12:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> +TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"

This seems a bit backwards.  Shouldn't TARGET_FPU be the primary
variable and then the package suffix be computed from that, rather than
vice versa?

> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t2", "", d)}"
> +ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"

This is wrong: ARMv6 doesn't imply Thumb-2.

> +# Whether to compile with code to allow interworking between the two
> +# instruction sets. This allows thumb code to be executed on a primarily
> +# arm system and vice versa. It is strongly recommended that DISTROs not
> +# turn this off - the actual cost is very small.
> +TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
> +OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"

This is only relevant for v4t, I guess.  Interworking is basically
always on for v5 and later and (CeSI aside) it's impossible on v4, so
hardly anybody is going to be flipping this switch.  I'm not sure it
really merits an OVERRIDE.

> --- a/meta/conf/machine/include/tune-xscale.inc
> +++ b/meta/conf/machine/include/tune-xscale.inc
> @@ -1,11 +1,17 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?= "xscale"
>  
> -INHERIT += "siteinfo"
> +require conf/machine/include/arm/arch-armv5-dsp.inc
>  
> -TUNE_CCARGS = "-march=armv5te -mtune=xscale"
> -TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
> -TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> -PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> +TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
> +
> +AVAILTUNES += "xscale"
> +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
> +PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
> +
> +AVAILTUNES += "xscale-be"
> +TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5teb} xscale"
> +PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"

I guess that should be "_tune-xscale-be".

All in all it seems as though there's an awful lot of expanded cross
products in this set of patches and I can't help wondering whether a lot
of this stuff would be better computed programmatically.  I wouldn't be
at all surprised if there are other copy-and-paste errors like the
xscale one lurking in that mass of overrides, but it's very hard to spot
them by eye.  It seems particularly unfortunate that everything has to
be written out twice, once for big-endian and once for little-endian,
given that endianness is almost entirely orthogonal to all the other
"tuning" parameters.

p.




