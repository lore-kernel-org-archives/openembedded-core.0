Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 38A3A61863
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:24:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VHYbQ-0001yg-NJ; Thu, 05 Sep 2013 14:24:00 +0200
Message-ID: <1378383839.6940.83.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 05 Sep 2013 13:23:59 +0100
In-Reply-To: <1378383289.32427.63.camel@ted>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
	<CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
	<CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
	<1378383289.32427.63.camel@ted>
X-Mailer: Evolution 3.4.4-4+b1 
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
X-List-Received-Date: Thu, 05 Sep 2013 12:24:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 13:14 +0100, Richard Purdie wrote:
> * Figuring out any runtime issues with dlopen is the hardest part and we
> don't actually have real data on whether there are issues there or not.

Do we have any particular reason to believe that there would be issues
(and if so, what they might be)?  I guess it should be easy enough to
gather data if we know what we're looking for.

Right now the .la files go into the -dev packages anyway and hence
aren't usually going to be available at runtime for anything calling
dlopen() on the target.  Is it native packages you're concerned about?

> * We'd be deviating from the way the libtool authors suggest their tool
> should operate. This makes filing bug reports and interacting with
> upstream harder. 

This is true, though interacting with libtool upstream already seems to
be hard enough that I'm not sure this would make a material difference.

> * They are used in places, for example the darwin shlibs code currently
> uses them. It could be updated to use otool these days mind but I'd
> probably make the current code a fallback for unknown arches since it is
> guaranteed to work everywhere.

There's no reason in principle that folks on darwin (and/or
hitherto-undiscovered architectures) couldn't retain the .la files if
they wanted.  The original patch that I sent used a DISTRO_FEATURE to
control this and those people building for darwin could simply refrain
from setting it.  Alternatively we could make it explicitly conditional
on TARGET_OS or some such if there are reasons to believe that some
targets do genuinely require this stuff.

p.



