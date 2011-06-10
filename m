Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QV9QN-0006cE-Kb for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 23:39:28 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QV9NA-0000Te-Du; Fri, 10 Jun 2011 23:36:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4DF2642E.5070706@linux.intel.com>
References: <cover.1307686598.git.sgw@linux.intel.com>
	<79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>
	<1307697909.2529.4983.camel@phil-desktop>
	<4DF2642E.5070706@linux.intel.com>
Date: Fri, 10 Jun 2011 22:36:00 +0100
Message-ID: <1307741760.3307.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 4/4] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 21:39:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-10 at 11:36 -0700, Saul Wold wrote:
> >> +FILES_eglibc-dev_append += "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal"
> >> +FILES_eglibc-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
> >
> > You need to make sure that libc_nonshared.a goes into -dev rather than
> > -staticdev somehow.  I didn't immediately spot any mechanism which would
> > do this, though I haven't tested the package to find out what happens.
> >
> >> +FILES_uclibc-staticdev_append = "\
> >> +        ${libdir}/*_nonshared.a \
> >> +        ${libdir}/lib*.a \
> >
> > In similar vein, this doesn't look right.
> >
> I think I should be able to remove nonshared from a list.

I'm not entirely sure I understand what you said there.  Just to be
totally clear, for eglibc and glibc at least (and I imagine uclibc too),
libc_nonshared.a needs to go into the -dev package and not -staticdev.
So I don't think it should ever be appearing in a FILES...staticdev
list.

> > This one is a bit odd: it seems to just be dropping the .a files
> > altogether without introducing a -staticdev package for them.
> >
> I thought that maybe the default rule provided in bitbake.conf should 
> accomplish this since it is FILES_${PN}-staticdev = "${libdir}/*.a 
> ${base_libdir}/*.a"

Ah yes, right.

> >> +#FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la "
> >> +#FILES_${PN}-staticdev = " ${libdir}/liba52.a "
> >
> > This is a bit weird.  What's going on here?
> >
> As above, trying to ensure that the default bitbake.conf rules would work.

Okay, fair enough.  But in that case please don't leave the old bits
commented out.

> > All in all I think this patch needs a bit more work.  It was quite a big
> > diff so I only skimmed it rather than reviewing it thoroughly but I
> > don't think it is quite ready to go in yet.  Also, can't a lot of this
> > be done in bitbake.conf without quite so much recipe patching?
> >
> Most of it is done there, I was looking at adding a staticdev.bbclass 
> that would handle the lib${PN} case generically, as a second phase of this.

Can the RDEPENDS_${PN}-staticdev not go in bitbake.conf?  That would
avoid all these cut and paste errors that seem to be plaguing that
particular area.

p.




