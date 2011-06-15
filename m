Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWn3W-0000tc-Vh for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 12:10:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FA7DrI025287
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:07:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25159-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:07:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FA780x025281
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:07:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 11:07:06 +0100
Message-ID: <1308132426.15712.387.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 10:10:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 23:32 +0200, Koen Kooi wrote:
> Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> meta/classes/allarch.bbclass |    5 +++--
> >> 1 files changed, 3 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> >> index e3ac392..b9ba28b 100644
> >> --- a/meta/classes/allarch.bbclass
> >> +++ b/meta/classes/allarch.bbclass
> >> @@ -2,9 +2,10 @@
> >> # This class is used for architecture independent recipes/data files (usally scripts)
> >> #
> >> 
> >> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
> >> +# before we reset it
> >> +FEED_ARCH := ${BASE_PACKAGE_ARCH}
> >> BASE_PACKAGE_ARCH = "all"
> >> -PACKAGE_ARCH = "all"
> >> -
> >> # No need for virtual/libc or a cross compiler
> >> INHIBIT_DEFAULT_DEPS = "1"
> > 
> > This is a *really* bad idea. An "all" package should have no need to set
> > architecture specific values into FEED_ARCH.
> > 
> > Just for those not following IRC, the problem is Angstrom adds FEED_ARCH
> > to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
> > classes like rm_work with "_all" in the function names.
> 
> So why don't we just set PACKAGE_ARCH = all in allarch.bbclass and not
> touch BASE_PACKAGE_ARCH and FEED_ARCH?

Because then FEED_ARCH and BASE_PACKAGE_ARCH contain machine specific
data, and the sstate packages become machine specific. When we're trying
to create architecture independent packages, this isn't desirable and
people complained about too much of the system rebuilding...

There is an underlying problem of why BASE_PACKAGE_ARCH and/or FEED_ARCH
is being used but it did seem like one way to fix several of the
problems people were seeing (not realising it would leak into OVERRIDES
too).

> > I'd suggest that various machines should start adding things like armv7a
> > to ${MACHINEOVERRIDES} which has a much more clearly defined scope and
> > that FEED_ARCH should quietly die ;-).
> 
> And that's what I've start calling a 'yocto' type of solution.

Was it really necessary to add that? ;-)

I'm tempted to write some definitions of my own but I'll refrain.

>  That just doesn't scale since it relies on fixing all the machines
> out there instead of levering the knowledge provided by OE already.
> I'd appreciate a solution is better thought out.

Well, I was trying to provide some hints as to how we might be able to
improve this situation, not write the whole roadmap. From what I
remember and the quick discussion we had offlist there are two things
FEED_ARCH tries to do:

a) Provide an addition to overrides that represents the
optimisation/tune profile being used (like armv7a).

b) Provide some info in BASE_PACKAGE_ARCH so that when PACKAGE_ARCH is
overwritten, you can still find out what it would have been set to.

For a), we could update the common include files for the omap/armv7a
platforms and append to MACHINEOVERRIDES there with the appropriate
entries. This would then specifically add a value to OVERRIDES making it
clear that the platform accepted those specific overrides. The variable
has one clear single purpose and intent.

For b), BASE_PACKAGE_ARCH is fine as a variable. Again, we have a
variable with a clear meaning and intent. It would be preferable to use
it rather than FEED_ARCH and phase out the use of FEED_ARCH over time as
that variable does not have a clear meaning or standardised use, its
being used for several different things.

The remaining question is then whether allarch.bbclass should set
BASE_PACKAGE_ARCH. I remain of the opinion that any "allarch" recipe
should not be seeing machine or architecture specific values. It
therefore shouldn't actually make any different whether its set or not,
or what its set to. "all" or "INVALID" are probably the best choices as
they protect people from themselves a little.

Cheers,

Richard



