Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0BC61642
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:32:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85FjQv9019103; Thu, 5 Sep 2013 16:45:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8tYQtcD3kPg5; Thu,  5 Sep 2013 16:45:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85FjKFY019094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 16:45:21 +0100
Message-ID: <1378395125.32427.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 05 Sep 2013 16:32:05 +0100
In-Reply-To: <1378383839.6940.83.camel@phil-desktop.brightsign>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
	<CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
	<CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
	<1378383289.32427.63.camel@ted>
	<1378383839.6940.83.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 15:32:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 13:23 +0100, Phil Blundell wrote:
> On Thu, 2013-09-05 at 13:14 +0100, Richard Purdie wrote:
> > * Figuring out any runtime issues with dlopen is the hardest part and we
> > don't actually have real data on whether there are issues there or not.
> 
> Do we have any particular reason to believe that there would be issues
> (and if so, what they might be)?  I guess it should be easy enough to
> gather data if we know what we're looking for.
> 
> Right now the .la files go into the -dev packages anyway and hence
> aren't usually going to be available at runtime for anything calling
> dlopen() on the target.  Is it native packages you're concerned about?

The -dev package argument is a good one, we seem to be surviving without
those and that probably addresses the concern I was thinking of. I'm
also thinking of ltdl and its dlopen wrapping, not dlopen itself which
is a much smaller subset of recipes.

> > * We'd be deviating from the way the libtool authors suggest their tool
> > should operate. This makes filing bug reports and interacting with
> > upstream harder. 
> 
> This is true, though interacting with libtool upstream already seems to
> be hard enough that I'm not sure this would make a material difference.

It does seem somewhat tricky, agreed.

> > * They are used in places, for example the darwin shlibs code currently
> > uses them. It could be updated to use otool these days mind but I'd
> > probably make the current code a fallback for unknown arches since it is
> > guaranteed to work everywhere.
> 
> There's no reason in principle that folks on darwin (and/or
> hitherto-undiscovered architectures) couldn't retain the .la files if
> they wanted.  The original patch that I sent used a DISTRO_FEATURE to
> control this and those people building for darwin could simply refrain
> from setting it.  Alternatively we could make it explicitly conditional
> on TARGET_OS or some such if there are reasons to believe that some
> targets do genuinely require this stuff.

There are ways to avoid problems for darwin. Using otool instead of
the .la files would be nice, equally mangling DISTRO_FEATURES based on
an SDK override is possible, albeit ugly. The la handling code will
likely bitrot as soon as its disabled by default and metadata starts
getting dropped which is probably a bigger concern. The number of SDK
darwin builds is currently a tiny portion of the usercase and codebase.

I guess the .la files just don't seem to be a big issue that some people
seem to paint them as. Why do we need to remove them and deviate from
the upstream?

Anyhow, if someone can show some world builds with and without the .la
files and see what build history shows we'd be closer to taking a patch
to turning them off. If we do it, we'll have to do it everywhere for
everything since the remaining code will bitrot badly IMO otherwise.

Cheers,

Richard





