Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QrWec-0000tK-DR
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:54:38 +0200
Received: by yia28 with SMTP id 28so1371291yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=brQZX9FYiT2JCdkgdPEdW0AHn/XE3zNfookIo9jSk/E=;
	b=iWsKcVuvJfz528QXD7GYY9YCOXbHLj9jhJWhjwZm6b3IQTHpEPi9955o6QXT6T8aCg
	GEj8cZzpryiEpooi2kvdGeEmfbiCUAgpWKqAJmjKInrpkQ7vRICUuT/w3nEukkwvLfet
	GX02hxsG0p/ULWOuld85QE4HDGC61ouRjwuTc=
Received: by 10.42.133.134 with SMTP id h6mr6749840ict.364.1313074206139;
	Thu, 11 Aug 2011 07:50:06 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b6sm1550894ibg.65.2011.08.11.07.50.02
	(version=SSLv3 cipher=OTHER); Thu, 11 Aug 2011 07:50:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 07:49:56 -0700
Message-ID: <1403530.aczy7koY2H@perseus>
Organization: Sakrah Inc.
User-Agent: KMail/4.7.0  (Linux/3.0.0-8-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1313065783.6733.132.camel@phil-desktop>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313064502.14274.418.camel@rex>
	<1313065783.6733.132.camel@phil-desktop>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 11 Aug 2011 14:54:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 11, 2011 01:29:38 PM Phil Blundell wrote:
> On Thu, 2011-08-11 at 13:08 +0100, Richard Purdie wrote:
> > On Thu, 2011-08-11 at 12:25 +0100, Phil Blundell wrote:
> > > On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> > > > +# MIPS Architecture definition
> > > > +# 12 defined ABIs, all combinations of:
> > > > +# *) Big/Little Endian
> > > > +# *) Hardware/Software Floating Point
> > > > +# *) o32, n32, n64 ABI
> > > > +
> > > > +DEFAULTTUNE ?= "mips"
> > > > +
> > > > +# Endianess
> > > > +TUNEVALID[bigendian] = "Enable big-endian mode"
> > > > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES",
> > > > "bigendian", "-meb", "-mel", d> > 
> > > I've just been trying to do a mips build for the first time since
> > > these
> > > patches were landed and I'm a little bit unclear about what the
> > > "right"
> > > way to declare endianness is nowadays.
> > > 
> > > The new tuning system has introduced the idea of endianness as an
> > > ABI
> > > tune parameter and, by implication, if I don't have "bigendian" in
> > > TUNE_FEATURES then presumably this is meant to mean little-endian.
> > > However, there seem to be at least some places in OE which are still
> > > expecting endianness to be encoded into TARGET_ARCH, i.e. a
> > > little-endian system would be TARGET_ARCH=mipsel rather than mips.
> > > 
> > > Right now, building a little-endian MIPS32 doesn't seem to work
> > > either
> > > way around.  If I set TARGET_ARCH=mips and exclude bigendian from
> > > TUNE_FEATURES then (among other issues) uclibc-config.inc decides
> > > that
> > > my system is bigendian and sticks -Wl,-EB back into LDFLAGS.
> > > Conversely, if I set TARGET_ARCH=mipsel then I don't get "mips" in
> > > OVERRIDES and I end up with the wrong uClibc.machine and associated
> > > -mips1 lossage.
> > > 
> > > That latter failure is at least relatively easy to work around and
> > > so
> > > that's what I'm doing at the moment.  But I don't know whether this
> > > is
> > > the "right" way to proceed or whether TARGET_ARCH is expected to be
> > > endian-agnostic in this newly tuned-up world.
> > 
> > You sound like you're doing this backwards. Pick a tune that either sets
> > TUNE_FEATURES to either contain or not contain "bigendian". TARGET_ARCH
> > then should get set appropriately and things that look at TARGET_ARCH
> > should work as before.
> > 
> > Ultimately we might want to consider if things like siteconfig should
> > use TUNE_FEATURES rather than TARGET_ARCH but it should work as things
> > stand now...
> 
> Okay.  So, if I let arch-mips.inc set TARGET_ARCH for itself then it
> picks "mipsel", which is the second case I mentioned above and leads to
> the -mips1 failure.  I guess this means that either uclibc's usage of
> overrides needs fixing, or arch-mips ought to be putting "mips" into
> ${OVERRIDES}.

uclibc's configuration can now be simplified a bit with new tune files
right now it uses target arch heavily.

> 
> More generally, it seems as though having TARGET_ARCH in ${OVERRIDES} is
> probably going to be fairly useless if that value now includes all the
> decorations for ABI features, since it is going to be hard/impossible to
> get it to match reliably.
> 
> Does the new tune model provide any variable which represents the
> underlying CPU architecture ("arm", "mips")?  That seems to be what's
> really wanted in almost all the cases where TARGET_ARCH is being used as
> an OVERRIDE.

yeah I think major cpu architecture would be nice to have in overrides
e.g. mips for mipseb and mipsel. We dont need endianness info since we
can deduce that from tune features in todays setup.

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


