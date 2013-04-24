Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUurn-0004BW-CE for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 10:15:52 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUuah-0001fW-Fk; Wed, 24 Apr 2013 09:58:11 +0200
Message-ID: <1366790283.9140.30.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 24 Apr 2013 08:58:03 +0100
In-Reply-To: <1366753502.23738.69.camel@ted>
References: <1366735483.5732.18.camel@phil-desktop.brightsign>
	<1366753502.23738.69.camel@ted>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Add gettext-native to DEPENDS
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
X-List-Received-Date: Wed, 24 Apr 2013 08:15:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-23 at 22:45 +0100, Richard Purdie wrote:
> On Tue, 2013-04-23 at 17:44 +0100, Phil Blundell wrote:
> >  # nptl needs unwind support in gcc, which can't be built without glibc.
> > -DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
> > +DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial gettext-native"
> >  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
> >  #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> >  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> 
> This will have a significant adverse affect on build speed due to build
> dependency bottlenecks :(
> 
> Are there any good options for avoiding this?

Well, obviously folks who do have it in the host environment can set
ASSUME_PROVIDED.  I assume most people do have that installed, otherwise
this would be failing all the time.

Other than that, I think your options are:

1. figure out a way to defer catalog building to later, e.g. put it in
eglibc-locale instead.  This would probably involve some hacking of the
eglibc makefiles but I don't think it would be especially hard.

2. find a way to disable catalog generation entirely for folks who don't
want it.  That might involve inventing DISTRO_FEATURES="l10n" or
something and patching (albeit trivial) to both configure.in and the
makefiles.  I imagine that change would be upstreamable in eglibc.

3. reimplement msgcat as a python script or something else that doesn't
need compiling, or pull out msgcat.c into its own recipe that just
builds this single file (avoiding the autotools overhead that
gettext-native has).

I can't think of any other obvious choices offhand but I'm sure there
are more.

The thing that does seem a bit puzzling is that this problem didn't use
to happen with older versions of oe-core (in particular, I never saw it
with my previous snapshot which used eglibc 2.16).  I'm not quite sure
what changed to make it suddenly become an issue.

p.




