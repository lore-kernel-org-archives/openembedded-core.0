Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R9Ls9-0003b0-1S
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 21:02:17 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R9Lmt-0002rp-3G
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:56:51 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1srO6v3DFRT-JN=FZ8riMo3hyWk8cDjtwYt-tiAYOXhf-A@mail.gmail.com>
References: <CAMKF1spia2JSMq_jQwUUKJWUzjNC+pD-qKTiBAaSDujHuB3iPg@mail.gmail.com>
	<1317151788.3120.7.camel@lenovo.internal.reciva.com>
	<CAMKF1srO6v3DFRT-JN=FZ8riMo3hyWk8cDjtwYt-tiAYOXhf-A@mail.gmail.com>
Date: Thu, 29 Sep 2011 15:08:26 +0100
Message-ID: <1317305306.3304.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Selectable linker (ld or gold) per recipe
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
X-List-Received-Date: Thu, 29 Sep 2011 19:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-27 at 18:10 -0700, Khem Raj wrote:
> I have thought of that and we know about kernel and eglibc but we
> don't know about rest of apps
> that we build. I don't know if gold has been deployed distro wide
> thats why the approach was to have gold replace parts where it really matters
> then we might have packages where they use linker directly and or have
> own linker
> scripts which are tuned to ld and may yield something different with
> gold of-course
> those problems should be fixed but having something in place to make package
> wise choice sounded better to me.

I think I would rather wait until such issues actually arise before
trying to fix them.  Adding per-recipe linker selection seems like quite
a lot of mechanism, with associated potential fragility, to solve a
problem that might not even exist in reality.

Also, thinking about this more, I am not convinced that wrapping ld
directly is going to work reliably.  If I remember right, gcc inspects
some attributes of the target linker (plugin support being the most
obvious one) during configure and adapts itself accordingly.
Subsequently swapping out the linker under its feet at runtime seems
like it would be a bad idea.  If it does turn out that there are
packages which simply must be built with BFD ld, I think we should
either:

a) just declare them incompatible with the ld-is-gold DISTRO_FEATURE,
and say that the programs in question aren't supported by such DISTROs
(which might or might not be a defensible position, depending on the
extent to which such programs are a fringe interest); or

b) fix the programs and/or gold to make them compatible, or if that's
really intractable; or

c) work with upstream gcc to figurd 

c) build a parallel toolchain which uses BFD ld and has its own copy of
gcc which is appropriately configured, and arrange for the recipes in
question to find that toolchain in their $PATH.

p.




