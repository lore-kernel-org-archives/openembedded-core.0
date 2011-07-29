Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmtfZ-0002Gj-Sx
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 22:28:29 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmtbS-0004P5-VQ
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 22:24:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E32F718.7060906@windriver.com>
References: <20110729163912.GN15286@jama.jama.net>
	<1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
	<20110729171007.GO15286@jama.jama.net> <4E32F718.7060906@windriver.com>
Date: Fri, 29 Jul 2011 21:23:59 +0100
Message-ID: <1311971039.3141.33.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] feature-arm-thumb: respect ARM_INSTRUCTION_SET
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
X-List-Received-Date: Fri, 29 Jul 2011 20:28:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-29 at 13:08 -0500, Mark Hatle wrote:
> Sorry I was gone much of yesterday and not able to comment.  I'm going to break
> this down into the two problems that I see people having.
> 
> 1) "interworking".  I was recently told EABI requires interworking to be
> enabled, and in OE-core we only support EABI.  So we should always have the
> interworking enabled for the tunes that we support.
> 
> Is this correct, any objections?  If so, assume from this point forward
> interworking is always enabled and we only support (in oe-core) interworking
> capable ARM chips.

That's pretty much right though not 100% correct.  Although it is true
that the AAPCS (and by extension the EABI) effectively requires all
relocatable objects to be built with interworking on, there are special
provisions for translating BX to MOV during link edit and hence allowing
v4 CPUs to run executables which are non-interworking but otherwise
conformant with the EABI.  The effect of this is that, although v4 isn't
naturally an interworking-capable architecture, it is nonetheless
grandfathered into the EABI universe.  See the remarks in section 5.6 of
ARM IHI 0042D.

And, pragmatically, there is a small but significant base of OE users on
v4 (not v4t) platforms and I don't think we want to do anything that
would disenfranchise them in OE-core.

Neither the AAPCS nor the wider EABI makes any attempt to cater for
architectures earlier than v4 and I don't think OE-core needs to do so
either.  It's not totally unimaginable that someone might wish to target
OE-core at a v3 system but, if that ever happens, they can fill in the
missing bits in an overlay.

> The confusion continues that people are expecting a package arch of "armv5t" to
> be arbitrarily thumb or not thumb.. since the arch (to them) indicates that the
> CPU is compatible with both thumb and ARM code.  That was not the intent of this
> change.  Instead the _package architecture_ is designed to convey the ABI and
> instruction set used when building the software in the package.

It's worth pointing out, just in case it isn't already obvious, that an
individual package might contain a mixture of ARM and Thumb binaries,
and an individual binary might contain a mixture of ARM-state and
Thumb-state functions.  This is doubly true when static libraries are
involved, of course.  Some compilers may (although GCC doesn't, today)
even switch automatically between ARM-state and Thumb-state depending on
their view of which is going to give the best results.

So, the distinction between "arm" and "thumb" binaries is always going
to be a slightly blurry one and, although I can see the attraction of
being able to label a particular package as "arm" or "thumb", it's more
a question of picking points on a continuum than a binary switch.

> This not only helps with debugging what someone is using, but also helps with
> designing filesystems that may contain both arm and thumb code.  For example a
> developer is building a device.. they have the requirements of "higher"
> performance in there specific application, but maximum space savings everywhere
> else.  They want to start with a binary package feed, NOT the build system.  So
> they will mix and match the armv5 and armv5t packages by choosing the smaller
> packages for most things (usually thumb), and using the ARM instruction set
> where they need performance (usually armv5 packages).
> 
> ---
> 
> So having a single value that simply switches the instruction set, without
> changing the package arch violates the intent of the change.  An alternative
> would be something like:

It's not entirely obvious to me that Thumb-ness is, in this sense,
sufficiently special to deserve a distinct package architecture.  After
all, one can already switch between -Os and -O99, or different -mtune
levels or no doubt many other things which influence code size and
performance without the package architecture changing.  I guess some
DISTROs might want to offer a smorgasbord kind of approach where every
binary is compiled in N different ways and packaged separately, but I
get the general sense that most distros will probably not want to do
that and perhaps it oughtn't to be the default behaviour.

(And of course, on another pragmatic point, it isn't by any means
universally true that ARM-state has better performance than Thumb-state
on real world systems.  There are a significant number of cases where
you get higher performance in Thumb-state than ARM-state.)

p.



