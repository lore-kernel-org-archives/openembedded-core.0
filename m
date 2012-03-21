Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAKU4-0001z7-Of for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:17:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LC8pHr001410
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:08:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00980-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:08:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LC8fiD001404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:08:42 GMT
Message-ID: <1332331723.9740.142.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 12:08:43 +0000
In-Reply-To: <4F69B2B5.1010607@slimlogic.co.uk>
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
	<101A2F63-917B-40EA-809F-E42FF0C1DE14@dominion.thruhere.net>
	<4F69B2B5.1010607@slimlogic.co.uk>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
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
X-List-Received-Date: Wed, 21 Mar 2012 12:17:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 10:51 +0000, Graeme Gregory wrote:
> On 21/03/2012 10:46, Koen Kooi wrote:
> > Op 21 mrt. 2012, om 11:28 heeft Robert P. J. Day het volgende geschreven:
> >
> >> On Wed, 21 Mar 2012, Robert P. J. Day wrote:
> >>
> >>>  still perusing the very basics of oe-core and grepping madly, came
> >>> across the following oddity:
> >>>
> >>> $ grep -r SRC_URI_append *
> >>> ... snip ...
> >>> bitbake/doc/manual/usermanual.xml:SRC_URI_append_1.0.7+ = "file://some_patch_which_the_new_versions_need.patch;patch=1"</screen></para>
> >>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
> >>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = " file://croco.patch;apply=yes "
> >>> ... snip ...
> >>>
> >>>  AIUI, there are two (common) variations for extending SRC_URI.  the
> >>> straightforward unconditional way:
> >>>
> >>>  SRC_URI += ... blah blah ...
> >>>
> >>> or if you need to make it conditional, then there's
> >>>
> >>>  SRC_URI_append_thingy = "whatever"
> >>>
> >>> so what's with the latter two entries above?
> >>>
> >>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
> >>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = " file://croco.patch;apply=yes "
> >>>
> >>>  is there some subtlety i'm missing here?  why would one ever use
> >>> either of:
> >>>
> >>>  SRC_URI_append += "..."               (looks redundant)
> >>>  SRC_URI_append = "..."                (why not just SRC_URI +=?)
> >>>
> >>> can i just assume those are typoes?
> >>  following up on my own post, i decided to scan the entire oe-core
> >> tree:
> >>
> >> $ grep -r "_append +=" *
> >> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
> >> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
> >> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
> >> meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
> >> $
> >>
> >>  and i thought i'd look for another pattern as well:
> >>
> >> $ grep -r "_append_.*+=" *
> >> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemumips += " file://32bitBE-support.patch"
> >> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemuppc += " file://32bitBE-support.patch"
> >> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
> >> $
> >>
> >>  of course, if all of the above is perfectly valid, i'm going to be
> >> embarrassed.
> >
> > AFAICT '_append +=' is completely bogus.
> >
> 
> I beleive its valid to do
> 
> BLAH_append = "spanner"
> BLAH_append += "toolbox"
> 
> then final result is BLAH_append variable is "spanner toolbox" then the
> overrides happen.

However you will get the same result with:

BLAH_append = "spanner"
BLAH_append = "toolbox"

since _append values do stack. Also, it would be "spannertoolbox", just
to be really correct :).

So the += is confusing but harmless.

I'd also point out that:

BLAH_append_qemumips = "spanner"
BLAH_append_qemumips += "toolbox"

is different to:

BLAH_append_qemumips = "spanner"
BLAH_append_qemumips = "toolbox"

since the above will not stack, only raw _append values do.

Cheers,

Richard






