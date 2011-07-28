Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmMpD-0002ZY-Hr
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 11:24:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmMl8-0002zf-Hk
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 11:20:02 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 10:20:01 +0100
In-Reply-To: <6A2BE4E7-D30E-4BE1-8EAC-4200EC3A48A5@dominion.thruhere.net>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E30FD0C.7040503@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B1A8AF9A65@shsmsx502.ccr.corp.intel.com>
	<201107280947.42048.paul.eggleton@linux.intel.com>
	<6A2BE4E7-D30E-4BE1-8EAC-4200EC3A48A5@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311844802.30326.407.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 09:24:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 10:57 +0200, Koen Kooi wrote:
> Op 28 jul. 2011, om 10:47 heeft Paul Eggleton het volgende geschreven:
> 
> > On Thursday 28 July 2011 08:48:43 Cui, Dexuan wrote:
> >> Saul Wold wrote on 2011-07-28:
> >>> On 07/27/2011 10:25 PM, Kumar Gala wrote:
> >>>> For some reason when I get to do_rootfs for core-image-sato when using
> >>>> rpms I run into an issue in that:
> >>>> 
> >>>> ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
> >>>> 
> >>>> Isn't expanding or taking the assignment in
> >>>> meta/conf/machine/include/tune-ppcFOO.inc but just using what it
> >>>> found in meta/conf/bitbake.conf
> >>> 
> >>> I believe that I am seeing this also with an atom-pc build, where the
> >>> PACKAGE_EXTRA_ARCHS seems OK, but ends up just being i586 instead of a
> >>> list of ARCHS that includes core2 (which atom-pc should be).
> >> 
> >> Hi, I'm suffering from the exactly same issue... :-(
> >> I don't know why PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} isn't expending
> >> yet.
> > 
> > It seems to me that ??= gets confused because the variable name needs 
> > expanding. If you change the ${DEFAULTTUNE} reference to core2 in 
> > PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}" it all works. I 
> > don't know if that indicates a BitBake bug or whether we should try to work 
> > around it.
> 
> I think it has to do with when the anonymous python runs. Try comparing 'bitbake -e' and and 'bitbake -e some-image':
> 
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ bitbake -e | grep PACKAGE_EXTRA_ARCHS\=
> # PACKAGE_EXTRA_ARCHS=${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
> PACKAGE_EXTRA_ARCHS="arm armv4 armv4t armv5 armv5t armv5-vfp armv5t-vfp armv5e armv5te armv5e-vfp armv5te-vfp armv6-vfp armv6t-vfp armv7-vfp armv7t2-vfp armv7a-vfp armv7at2-vfp armv7a-vfp-neon armv7at2-vfp-neon"
> 
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ bitbake -e efl-nodm-image | grep PACKAGE_EXTRA_ARCHS\=
> # PACKAGE_EXTRA_ARCHS=${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
> PACKAGE_EXTRA_ARCHS="arm"

No, I think Paul is right about the cause (though I don't agree with him
that it is a bug exactly).  The timing of anonymous python oughtn't to
be different in those two cases so I don't think that will be making a
difference.

That assignment to PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} in
bitbake.conf is just fundamentally bogus.  As far as the bitbake parser
is concerned, PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} and
PACKAGE_EXTRA_ARCHS_tune-arm926ejs are different variables (assuming
DEFAULTTUNE=arm926ejs for the sake of an example) and it will create
both of them.  Then, later, when the lvalues get expanded the latter
will be overwritten by the former which seems like it is exactly the
opposite to the effect that's wanted here.

This is long-standing bitbake behaviour and I'm not sure it would be
practical to change.  I think the metadata just needs to be written to
work with the semantics that we have.

p.




