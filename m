Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q5Og3-00062G-Of
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 22:41:13 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIX00H0TT4VUZB1@vms173009.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 14:36:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2CA0A14AF6C; Thu,
	31 Mar 2011 15:36:31 -0400 (EDT)
Date: Thu, 31 Mar 2011 15:36:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20110331193631.GG23178@denix.org>
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
	<1301340308.24596.9.camel@rex>
MIME-version: 1.0
In-reply-to: <1301340308.24596.9.camel@rex>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Thu, 31 Mar 2011 20:41:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 28, 2011 at 08:25:08PM +0100, Richard Purdie wrote:
> On Sun, 2011-03-27 at 13:44 +0200, Koen Kooi wrote:
> > What is the preferred way of 'importing' prebuilt toolchains into
> > OE-core? In oe.dev I can use this:
> > http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom toolchain built with 'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.
> 
> In theory, something like that recipe should also work against the
> output of OECore's "bitbake meta-toolchain" output.
> 
> I would however suggest looking at this for inspiration:
> http://git.openembedded.net/cgit.cgi/openembedded-core/tree/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> 
> as the:
> 
> GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
> inherit libc-package
> 
> might save duplicating half the libc packaging code. You also get the
> cross locale generation as an added bonus so no qemu! :)
> 
> There is a poky-external-toolchain recipe there too but its broken.
> Everything that did, sstate now does better so that should really be
> removed. Its advantage was not having to repackage the libc locales but
> it was so much hacky code to implement, wasn't multiple package manager
> safe and sstate replaces it much more neatly. If anyone does want to use
> external toolchains like that, I'd suggest the csl example above as the
> way to do it now.

Richard,

Those 2 lines indeed make the recipe much smaller and easier to read! I wish 
we had that support in OE when I worked on the original CSL and Angstrom 
external toolchain recipes... Although, they were inspired by and based on the 
old Poky recipes, but evolved quite a lot since then.

Anyway, I'll try to get some time to port the external recipes to oe-core 
using this new libc-package class. Thanks.

-- 
Denys


> > My actual use case is actually 2 use-cases:
> > 
> > 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while keeping the toolchain
> > 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror might be better.
> 
> sstate mirrors are the way I think things will work well in the future.
> They're being used heavily by the yocto development team internally,
> support in Yocto 1.0 is looking good for sstate and hence its looking
> good for OE-Core.
> 
> To use it simply share the sstate-cache directory over http or nfs or
> whatever and then set:
> 
> SSTATE_MIRRORS ?= "\
> file://.* http://someserver.tld/share/sstate/ \n \
> file://.* file:///some/local/dir/sstate/"
> 
> to point at wherever the files are...
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


