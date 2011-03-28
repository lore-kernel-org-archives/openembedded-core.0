Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4IY9-0006xB-US for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 21:56:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SJPJpl001567
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:25:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01141-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:25:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SJPBfR001555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:25:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
Date: Mon, 28 Mar 2011 20:25:08 +0100
Message-ID: <1301340308.24596.9.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Mon, 28 Mar 2011 19:56:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-03-27 at 13:44 +0200, Koen Kooi wrote:
> What is the preferred way of 'importing' prebuilt toolchains into
> OE-core? In oe.dev I can use this:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom toolchain built with 'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.

In theory, something like that recipe should also work against the
output of OECore's "bitbake meta-toolchain" output.

I would however suggest looking at this for inspiration:
http://git.openembedded.net/cgit.cgi/openembedded-core/tree/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb

as the:

GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
inherit libc-package

might save duplicating half the libc packaging code. You also get the
cross locale generation as an added bonus so no qemu! :)

There is a poky-external-toolchain recipe there too but its broken.
Everything that did, sstate now does better so that should really be
removed. Its advantage was not having to repackage the libc locales but
it was so much hacky code to implement, wasn't multiple package manager
safe and sstate replaces it much more neatly. If anyone does want to use
external toolchains like that, I'd suggest the csl example above as the
way to do it now.

> My actual use case is actually 2 use-cases:
> 
> 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while keeping the toolchain
> 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror might be better.

sstate mirrors are the way I think things will work well in the future.
They're being used heavily by the yocto development team internally,
support in Yocto 1.0 is looking good for sstate and hence its looking
good for OE-Core.

To use it simply share the sstate-cache directory over http or nfs or
whatever and then set:

SSTATE_MIRRORS ?= "\
file://.* http://someserver.tld/share/sstate/ \n \
file://.* file:///some/local/dir/sstate/"

to point at wherever the files are...

Cheers,

Richard



