Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm5PQ-0008Hd-9x
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:48:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5LM-00029M-3h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:44:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 15:44:15 +0100
In-Reply-To: <4E302051.1010308@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311777856.30326.356.camel@phil-desktop>
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
X-List-Received-Date: Wed, 27 Jul 2011 14:48:28 -0000
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

It is true that all ARMv4T and ARMv5T processors are only Thumb-1.  It's
also true that Thumb-2 was first implemented in ARM1156, which is an
ARMv6 core.  But ARM1136, ARM1176 and ARM11MPCore are also ARMv6 cores
and all three of those are Thumb-1 only.  Given that nobody is likely to
target ARM1156 with OE, it's probably a reasonable approximation to say
that Thumb-2 correlates with ARMv7 and later.

Also, since there are no v5, v6 or v7 cores which don't support Thumb,
the "t" suffix serves no useful purpose here and might as well just be
omitted.  That is, there is no CPU which can run "armv6" packages which
wouldn't also be able to run "armv6t".

> In the original work I did it was just tune-xscale (no be).  AFAIK there is no
> little endian version of xscale.

No, that's incorrect.  The PXA25x series and IXP420, at least, are
bi-endian (and I suspect most of the other XScales are too) and there
are certainly folks running them in little endian configurations.

p.



