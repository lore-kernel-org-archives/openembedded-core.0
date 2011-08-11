Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrU8m-0006gT-0s for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 14:13:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BC94x2030424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 13:09:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28539-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 13:09:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BC8wPr030417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 13:08:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1313061918.6733.120.camel@phil-desktop>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313061918.6733.120.camel@phil-desktop>
Date: Thu, 11 Aug 2011 13:08:22 +0100
Message-ID: <1313064502.14274.418.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 11 Aug 2011 12:13:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 12:25 +0100, Phil Blundell wrote:
> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
> > +# MIPS Architecture definition
> > +# 12 defined ABIs, all combinations of:
> > +# *) Big/Little Endian
> > +# *) Hardware/Software Floating Point
> > +# *) o32, n32, n64 ABI
> > +
> > +DEFAULTTUNE ?= "mips"
> > +
> > +# Endianess
> > +TUNEVALID[bigendian] = "Enable big-endian mode"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel", d
> 
> I've just been trying to do a mips build for the first time since these
> patches were landed and I'm a little bit unclear about what the "right"
> way to declare endianness is nowadays.
> 
> The new tuning system has introduced the idea of endianness as an ABI
> tune parameter and, by implication, if I don't have "bigendian" in
> TUNE_FEATURES then presumably this is meant to mean little-endian.
> However, there seem to be at least some places in OE which are still
> expecting endianness to be encoded into TARGET_ARCH, i.e. a
> little-endian system would be TARGET_ARCH=mipsel rather than mips. 
> 
> Right now, building a little-endian MIPS32 doesn't seem to work either
> way around.  If I set TARGET_ARCH=mips and exclude bigendian from
> TUNE_FEATURES then (among other issues) uclibc-config.inc decides that
> my system is bigendian and sticks -Wl,-EB back into LDFLAGS.
> Conversely, if I set TARGET_ARCH=mipsel then I don't get "mips" in
> OVERRIDES and I end up with the wrong uClibc.machine and associated
> -mips1 lossage.
> 
> That latter failure is at least relatively easy to work around and so
> that's what I'm doing at the moment.  But I don't know whether this is
> the "right" way to proceed or whether TARGET_ARCH is expected to be
> endian-agnostic in this newly tuned-up world.

You sound like you're doing this backwards. Pick a tune that either sets
TUNE_FEATURES to either contain or not contain "bigendian". TARGET_ARCH
then should get set appropriately and things that look at TARGET_ARCH
should work as before.

Ultimately we might want to consider if things like siteconfig should
use TUNE_FEATURES rather than TARGET_ARCH but it should work as things
stand now...

Cheers,

Richard



