Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 056347318D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 20:13:13 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aHdPM-0003xb-EM; Fri, 08 Jan 2016 21:13:13 +0100
Message-ID: <1452283984.1933.15.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 08 Jan 2016 20:13:04 +0000
In-Reply-To: <CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 20:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-08 at 08:24 -0800, Andre McCurdy wrote:
> Maybe adding a generic "armv7" over-ride which can be enabled by all
> armv7 variants is a better option?

Maybe, but the time to consider that would be when we discover a
concrete place that it'd be useful. 

To be honest, having seen the existing overrides that you sent patches
for, there are very few cases where an override on _armv7a or any other
specific variant seems unambiguously like the right thing.  For example,
looking at the tree I happen to have lying around here:

- it seems that the valgrind ones have already been established as
spurious;

- the libav FULL_OPTIMIZATION thing also seems fairly spurious. 

- the overrides in gcc-configure-common are basically just trying to
translate TARGET_ARCH back into the appropriate -march flag for gcc, and
it seems faintly silly to require a separate override for every possible
arch setting.  It might be better for the tuning files to define a
specific variable with the -march string in, define CFLAGS in terms of
that, and then just teach gcc's configury to do --with-arch=${GCC_ARCH}
if it's defined.

- the ones in xf86-video-omapfb_git.bb seem to be using armv7a as a
proxy for "this is a particular omap chip" in order to trigger some or
other hack.  Since omapfb is fairly chip-specific anyway this is
probably ok, but it most likely doesn't want perpetuating.

Then there are things like the armv4/armv5 overrides in mailx which are
apparently workarounds for a bug in some or other version of gcc.  The
common thread through most of these seems to be that thumb1 support just
doesn't work very well in gcc and, given that thumb1 is something of a
minority interest nowadays, it's tempting to say that we should not even
try to support it any longer.  But if we did want to keep it around then
defining a specific "thumb1" override that would be set by all thumb1
arches seems like it would be the right short term fix.  In the long
term, clearly, the best plan would be for the folks who still care about
thumb1 to fix gcc.

So, overall, it rather seems to me that we should be trying to get rid
of the majority of these _armvNN overrides, rather than letting them
proliferate into armv7ve and whatever.

p.



