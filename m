Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoEgR-0000rv-HA
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:06:55 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QoEcG-0002Qk-Hw
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:02:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 02 Aug 2011 14:02:35 +0100
In-Reply-To: <4E36D800.1050906@mentor.com>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
	<1312209045.30326.515.camel@phil-desktop>
	<4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
	<1312214835.30326.528.camel@phil-desktop> <4E36D800.1050906@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312290156.4325.19.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Tue, 02 Aug 2011 13:06:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 09:44 -0700, Tom Rini wrote:
> On 08/01/2011 09:07 AM, Phil Blundell wrote:
> > On Mon, 2011-08-01 at 09:37 -0500, Kumar Gala wrote:
> >> Not sure I understand the statement about disambiguate the resulting compilers, on PPC where I intend to utilize this we'd have the toolchains already named something like:
> > 
> > The thing about disambiguating was that, if you're going to modify the
> > configure opts for gcc-cross based (indirectly) on ${MACHINE} you need
> > to consider what happens if you have a single build directory that's
> > being used for multiple MACHINEs.
> 
> What, I think, Kumar is driving at is why are you saying MACHINE when
> it's a per core tune he's doing.  eg, every e5500 would do --with-cpu=e5500

I said MACHINE because, in general, it's the MACHINE which selects the
tune.  If it's the case that (for powerpc at least) all the tunes end up
setting a distinct PACKAGE_ARCH then this probably is a non-issue there,
but that isn't true in the general case.  (For example, the arm926ejs
tune file sets PACKAGE_ARCH=armv5te or something, so it wouldn't be
sensible for it to be configuring gcc --with-cpu=arm926ej-s.)

Likewise for gcc-cross, if you're going to let this apply there then you
need to make sure that the TARGET_ARCH value in the triplet is at least
as specific as the tuning you ask for, otherwise you will end up with
multiple different compilers all called armv5te-oe-linux-gcc or
whatever.

p.




