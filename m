Return-Path: <pb@pbcl.net>
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id B6B467BEDF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 12:06:17 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iZZbj-00057K-Em; Tue, 26 Nov 2019 13:06:15 +0100
Date: Tue, 26 Nov 2019 13:06:15 +0100
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191126120615.kknhw4cwolwfadnf@pbcl.net>
References: <20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
	<fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
	<20191121135942.h776ktsg6jwow4sj@pbcl.net>
	<32d99e6a-b196-6d1d-dac2-a0e1ccfa2c75@intel.com>
	<20191126115954.f4mlttmrp2ieahax@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <20191126115954.f4mlttmrp2ieahax@pbcl.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Tue, 26 Nov 2019 12:06:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2019 at 12:59:54PM +0100, Phil Blundell wrote:
> On Mon, Nov 25, 2019 at 12:07:25PM +0000, Ross Burton wrote:
> > If you can send a patch sooner rather than later for lrzsz to fix the build
> > with modern gettext then that would be *awesome*, as this recipe is the sole
> > blocker.
>
> This works for me and should resolve your immediate issue.  We can think about
> a better long-term solution separately.

Incidentally, "gettextize -f" would have taken care of the majority of this.  In
autotools.bbclass we have:

		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
			# We'd call gettextize here if it wasn't so broken...

and we then proceed to do a slightly half-baked partial version of what
gettextize would have done.  This results in using the Makefile.in.in from
the version of gettext that's in the sysroot, but without any of the other
bits that gettextize would have copied and this is arguably the worst of
all possible outcomes.  Actually running gettextize is indeed problematic
because it has a tendency to require you to press RETURN on the terminal
(and it reads from /dev/tty to avoid any attempt to subvert this check
by redirecting stdin!) but I think one could argue that if we can't/won't
run the full gettextize then we oughtn't to be messing around with any
of the files that it installs and we should rely on the ones that the
upstream package shipped.  That may not always work either, but I have at
least half a suspicion that the current autotools.bbclass behaviour is
creating as many problems as it solves.

p.

