Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RPyMO-0006pH-HO
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 16:22:12 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RPyGG-0004ep-Ub
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 16:15:53 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 15:15:52 +0000
In-Reply-To: <1321279039.26881.62.camel@ted>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
	<8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
	<1321279039.26881.62.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321283752.29435.39.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] base-passwd: Move update-passwd into a separate package
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
X-List-Received-Date: Mon, 14 Nov 2011 15:22:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 13:57 +0000, Richard Purdie wrote:
> +pkg_postinst_${PN}-update () {
> +#!/bin/sh
> +if [ "x$D" != "x" ]; then
> +	exit 0
> +fi
> +${sbindir}/update-passwd
> +}

Not that it really matters, but (in the interests of not perpetuating
unnecessary cruft) this "x" paradigm is unnecessary here.  If you quote
the values then empty strings are permissible, so you could have
written:

if [ "$D" != "" ]; then
   ...
fi

But, in fact, all reasonable implementations of /bin/sh support "test
-n" (it's required by POSIX) so you can write it even more concisely:

if [ -n $D ]; then
  ...
fi

Of course, it sucks fairly badly that we need to have all this scar
tissue in the installed postinsts at all.  For the opkg backend at
least, it would be fairly straightforward to add support for an "offline
postinst" as a separate script, which could be run by rootfs_ipk but
never actually installed into the rootfs.  But I don't know what the
impact on the other backends would be for that, which I guess might make
it hard to deploy in practice.

p.




