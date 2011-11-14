Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQ0IB-0002xa-Pj for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 18:26:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEHJZHm014277
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:19:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13419-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:19:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEHJQZb014271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:19:27 GMT
Message-ID: <1321291170.26881.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 17:19:30 +0000
In-Reply-To: <1321283752.29435.39.camel@phil-desktop>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
	<8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
	<1321279039.26881.62.camel@ted>
	<1321283752.29435.39.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Mon, 14 Nov 2011 17:26:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 15:15 +0000, Phil Blundell wrote:
> On Mon, 2011-11-14 at 13:57 +0000, Richard Purdie wrote:
> > +pkg_postinst_${PN}-update () {
> > +#!/bin/sh
> > +if [ "x$D" != "x" ]; then
> > +	exit 0
> > +fi
> > +${sbindir}/update-passwd
> > +}
> 
> Not that it really matters, but (in the interests of not perpetuating
> unnecessary cruft) this "x" paradigm is unnecessary here.  If you quote
> the values then empty strings are permissible, so you could have
> written:
> 
> if [ "$D" != "" ]; then
>    ...
> fi
> 
> But, in fact, all reasonable implementations of /bin/sh support "test
> -n" (it's required by POSIX) so you can write it even more concisely:
> 
> if [ -n $D ]; then
>   ...
> fi

Right, I picked a bad example to copy :/.

> Of course, it sucks fairly badly that we need to have all this scar
> tissue in the installed postinsts at all.  For the opkg backend at
> least, it would be fairly straightforward to add support for an "offline
> postinst" as a separate script, which could be run by rootfs_ipk but
> never actually installed into the rootfs.  But I don't know what the
> impact on the other backends would be for that, which I guess might make
> it hard to deploy in practice.

Why can't opkg just wipe the postinst's its run off the disk? Its not
like it needs them any longer...

Cheers,

Richard



