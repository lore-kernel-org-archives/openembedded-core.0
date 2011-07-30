Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qn66v-00062z-5v
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 11:45:33 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qn62i-0004do-2s
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 11:41:12 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E331D50.1040004@windriver.com>
References: <20110729163912.GN15286@jama.jama.net>
	<1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
	<20110729171007.GO15286@jama.jama.net> <4E32F718.7060906@windriver.com>
	<1311971039.3141.33.camel@lenovo.internal.reciva.com>
	<4E331D50.1040004@windriver.com>
Date: Sat, 30 Jul 2011 10:41:04 +0100
Message-ID: <1312018864.3497.6.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sat, 30 Jul 2011 09:45:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-29 at 15:51 -0500, Mark Hatle wrote:
> Which set of users is still v4 (not interworking compatible)?  Are new
> processors being made that still require that capability? or (in oe-core) is it
> time to drop support?
> 
> Just because it's not in oe-core, doesn't mean it can't be in angstrom, or even
> meta-oe as unique tunings for those architectures..

FA5xx and FA6xx are both still current products and are v4 architecture.
The bulk of the users in OE today are StrongARM devices of one form or
another: those have obviously been discontinued for some time but there
still seem to be quite a lot of them around.  So, I think it would make
sense to retain v4 support in oe-core.

> > It's not entirely obvious to me that Thumb-ness is, in this sense,
> > sufficiently special to deserve a distinct package architecture.  After
> > all, one can already switch between -Os and -O99, or different -mtune
> > levels or no doubt many other things which influence code size and
> 
> I've always seen -O levels set at the distribution or recipe level, not
> dynamically changes as a user creates a system.  Yes it can be done, but
> practically speaking I don't see that.. (other then building say one recipe with
> -O0 to facilitate in additional debugging, but that's not usually distributed
> beyond the developer doing the individual work.)

Well, if your interest is in trading off size for speed, that's
precisely the distinction between -Os and -On.  Indeed it isn't all that
hard to imagine that -mthumb might become the default for gcc at -Os,
and -mno-thumb might be the default at -O3.  So, if you want a set of
"small" packages and a set of "fast" packages, it seems to me that the
most logical (and portable) way to do that is via -O level, rather than
tying it to ISA specifically. 

p.




