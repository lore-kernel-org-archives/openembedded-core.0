Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm63b-0003Z9-81
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:29:59 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm5zX-0002BA-0Z
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:25:47 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 16:25:41 +0100
In-Reply-To: <4E302785.9070705@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311780347.30326.376.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 27 Jul 2011 15:29:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
> means I was thumb instructions.
> 
> So armv5 and armv5t are distinct in the contents of the tunings.

Ah, I see.  Does that go for v4t too?  I can imagine cases where you
would want to say "select the v4T ISA but generate ARM code not Thumb".

> Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
> the "dsp" capabilities actually change any of the code or support generated.  If
> not then we can ignore it.

Yes.  PLD, for example, is only available in ARMv5E (not ARMv5) and this
will affect any code which uses __builtin_prefetch().  I don't think GCC
will ever open-code the saturating arithmetic instructions, but it does
expose the v5/v5e distinction through preprocessor macros and source
code might use that to select asm() statements which use those opcodes.

> For armv5 this gives us:
> 
> armv5, armv5t, armv5e, armv5te... add in their VFP variants and the hard float
> EABI...

Does anybody really want the hardfloat abi on armv5?  I guess it doesn't
hurt all that much to offer it, but anything that makes that monstrous
set of .inc files bigger seems like a bad thing.

p.



