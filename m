Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QrUSj-0006xv-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 14:34:13 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrUON-0006Nu-Qj
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 14:29:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 13:29:38 +0100
In-Reply-To: <1313064502.14274.418.camel@rex>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313061918.6733.120.camel@phil-desktop>
	<1313064502.14274.418.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313065783.6733.132.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
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
X-List-Received-Date: Thu, 11 Aug 2011 12:34:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 13:08 +0100, Richard Purdie wrote:
> On Thu, 2011-08-11 at 12:25 +0100, Phil Blundell wrote:
> > On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> > > +# MIPS Architecture definition
> > > +# 12 defined ABIs, all combinations of:
> > > +# *) Big/Little Endian
> > > +# *) Hardware/Software Floating Point
> > > +# *) o32, n32, n64 ABI
> > > +
> > > +DEFAULTTUNE ?= "mips"
> > > +
> > > +# Endianess
> > > +TUNEVALID[bigendian] = "Enable big-endian mode"
> > > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel", d
> > 
> > I've just been trying to do a mips build for the first time since these
> > patches were landed and I'm a little bit unclear about what the "right"
> > way to declare endianness is nowadays.
> > 
> > The new tuning system has introduced the idea of endianness as an ABI
> > tune parameter and, by implication, if I don't have "bigendian" in
> > TUNE_FEATURES then presumably this is meant to mean little-endian.
> > However, there seem to be at least some places in OE which are still
> > expecting endianness to be encoded into TARGET_ARCH, i.e. a
> > little-endian system would be TARGET_ARCH=mipsel rather than mips. 
> > 
> > Right now, building a little-endian MIPS32 doesn't seem to work either
> > way around.  If I set TARGET_ARCH=mips and exclude bigendian from
> > TUNE_FEATURES then (among other issues) uclibc-config.inc decides that
> > my system is bigendian and sticks -Wl,-EB back into LDFLAGS.
> > Conversely, if I set TARGET_ARCH=mipsel then I don't get "mips" in
> > OVERRIDES and I end up with the wrong uClibc.machine and associated
> > -mips1 lossage.
> > 
> > That latter failure is at least relatively easy to work around and so
> > that's what I'm doing at the moment.  But I don't know whether this is
> > the "right" way to proceed or whether TARGET_ARCH is expected to be
> > endian-agnostic in this newly tuned-up world.
> 
> You sound like you're doing this backwards. Pick a tune that either sets
> TUNE_FEATURES to either contain or not contain "bigendian". TARGET_ARCH
> then should get set appropriately and things that look at TARGET_ARCH
> should work as before.
> 
> Ultimately we might want to consider if things like siteconfig should
> use TUNE_FEATURES rather than TARGET_ARCH but it should work as things
> stand now...

Okay.  So, if I let arch-mips.inc set TARGET_ARCH for itself then it
picks "mipsel", which is the second case I mentioned above and leads to
the -mips1 failure.  I guess this means that either uclibc's usage of
overrides needs fixing, or arch-mips ought to be putting "mips" into
${OVERRIDES}.

More generally, it seems as though having TARGET_ARCH in ${OVERRIDES} is
probably going to be fairly useless if that value now includes all the
decorations for ABI features, since it is going to be hard/impossible to
get it to match reliably.

Does the new tune model provide any variable which represents the
underlying CPU architecture ("arm", "mips")?  That seems to be what's
really wanted in almost all the cases where TARGET_ARCH is being used as
an OVERRIDE.

p.




