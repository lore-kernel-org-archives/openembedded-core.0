Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXeVB-00016x-BC for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 23:23:58 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXeDu-0007wZ-Fr; Wed, 01 May 2013 23:05:58 +0200
Message-ID: <1367442335.25055.23.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 01 May 2013 22:05:35 +0100
In-Reply-To: <51816817.7080101@linux.intel.com>
References: <1367244122.14512.124.camel@phil-desktop.brightsign>
	<51816817.7080101@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Don't include source files for "other" architectures in the sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 21:24:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-01 at 12:08 -0700, Darren Hart wrote:
> You've stated that this successfully removes code on mips, have you also
> tested that basic module building still works? For example, does
> hello-mod still build?

I didn't try hello-mod, but the two (proprietary) out-of-tree modules
that we routinely build into our own images do still compile and work.

> Have you confirmed this on any other architectures? I'd like to see a
> test at least on the core emulated BSPs (or maybe at least 2 of them)
> before we pull this in as we have spent quite a bit of effort getting
> modules building to date, I'd hate to break that due to a lack of testing.

I've tested on arm and mips.  I guess I can set up a build tree for a
qemu target on some other architecture if you like.

> >  	make -C $kerneldir _mrproper_scripts
> >  	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
> > +	rm -rf $(find $kerneldir/arch -maxdepth 1 -not -path $kerneldir/arch/$ARCH -not -path $kerneldir/arch/Kconfig -not -path $kerneldir/arch/. -not -path $kerneldir/arch)
> 
> Any particular reason for not using "-exec rm" like the other code
> removal commands here?

No, just force of habit.  Using xargs is more performant in general, but
"find -exec ..." is safer and I guess that's probably what we should do
here too.

p.




