Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm9vD-0000Jg-Bd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 21:37:35 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm9r8-0002MU-QI
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 21:33:22 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E30489A.100@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop> <4E30489A.100@windriver.com>
Date: Wed, 27 Jul 2011 20:31:01 +0100
Message-ID: <1311795061.3398.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 19:37:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 12:19 -0500, Mark Hatle wrote:
> On 7/27/11 10:25 AM, Phil Blundell wrote:
> > On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
> >> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
> >> means I was thumb instructions.
> >>
> >> So armv5 and armv5t are distinct in the contents of the tunings.
> > 
> > Ah, I see.  Does that go for v4t too?  I can imagine cases where you
> > would want to say "select the v4T ISA but generate ARM code not Thumb".
> 
> Yes, for all of them, the TUNENAME selects the features that you want to use to
> compile, and suggests the other information like compatible architectures.
> 
> In the case where you want to build primarily one, and optionally the other the
> tunename makes it easy..
> 
> Say you want all of your system thumb, except for a few specific programs..
> 
> TUNENAME = "armv4t"
> 
> TUNENAME_pn-mysql = "armv4"
> 
> In the opposite case, where you want everything ARM, except for a few thumb:
> 
> TUNENAME = "armv7"
> TUNENAME_pn-bash = "armv7t"

I'm not quite sure that this answers the question I was trying to ask.

The thing about v4/v4T is that, unlike later versions of the
architecture, plain v4 doesn't include the BX instruction.  So, if you
want your code to be interworking-capable without requiring linker
shims, you need to specify -march=armv4t (and -mthumb-interwork) even
for CUs that you want to compile as ARM code.

If the architecture name implies the execution state then it doesn't
appear as though there is going to be any way to select -march=armv4t
without also selecting -mthumb, which would make it impossible to build
interworking-capable ARM-state code for v4T.

> So then the question is.. with OE-core and core based distros.. are there enough
> armv5 (w/ or w/o e) left to justify having both?  If not.. then we select the
> one with the 'e' since it's more common.

I'm not aware of anybody using a non-e ARMv5 with OE at all.  The two
most common v5-class implementations, by some margin I think, are the
ARM9x6 family and Xscale, and all of those are at least v5TE. 

p.



