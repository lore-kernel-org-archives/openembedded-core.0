Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGFQS-0008Tj-1g
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:38:44 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGFE5-0004nf-Vi; Mon, 24 Sep 2012 22:25:58 +0200
Message-ID: <1348518219.4444.262.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2012 21:23:39 +0100
In-Reply-To: <CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
References: <1348487376.31293.31.camel@phil-desktop>
	<CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 24 Sep 2012 20:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 11:28 -0700, Khem Raj wrote:
> On Mon, Sep 24, 2012 at 4:49 AM, Phil Blundell <philb@gnu.org> wrote:
> >
> > -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
> > +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'
> 
> I wonder if this expression should be removed completely now that mips is added
> we dont have any supported arch left.

There are at least a few Linux architectures not in that list: alpha and
sparc are the obvious two, but there are a few more obscure ones as
well.  I don't think alpha has ever really been supported in oe-core,
but there are at least some sparc bits in there and, of course, it is
possible for an external layer to add support for new architectures.
Plus, of course, there is the OS side: if you were targetting mingw32
for example then kexec-tools would clearly not work.

However, all that said, I tend to agree that the COMPATIBLE_HOST check
isn't buying much in this recipe.  The original intent of
COMPATIBLE_MACHINE (and later COMPATIBLE_HOST) was to prevent bitbake
from selecting inappropriate providers to satisfy a virtual dependency:
in particular, the idea was that it would stop you picking up a kernel
recipe for some completely unrelated hardware.  In the case of
kexec-tools there are no alternative providers available and it isn't
totally obvious that having the recipe skip itself on a host that it
thinks is "unsupported" is really any better than letting it try and
fail to build.  So I would be happy to see that check removed.

p.




