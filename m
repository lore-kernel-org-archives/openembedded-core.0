Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgZ6b-0001yr-Ae for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:18:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6C8g68G018690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 09:42:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18636-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 09:42:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6C8fuV3018684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 09:41:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <839342D0-8691-4528-8B7A-9515ED47B6C2@dominion.thruhere.net>
References: <1310399860.20015.980.camel@rex>
	<164DA52B-98AF-47AA-A42D-1DE7FA9A1200@dominion.thruhere.net>
	<1310402833.20015.986.camel@rex>
	<839342D0-8691-4528-8B7A-9515ED47B6C2@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 09:41:08 +0100
Message-ID: <1310460068.20015.1021.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 2/3] conf/machine: Overhaul tune include files
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
X-List-Received-Date: Tue, 12 Jul 2011 09:18:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 19:04 +0200, Koen Kooi wrote:
> Op 11 jul 2011, om 18:47 heeft Richard Purdie het volgende geschreven:
> >> Taking armv7a as an example with my angstrom hat on I need the following knobs:
> >> 
> >> 1) softp or hardfp calling conventions, resulting in a different package arch (e.g. armv7a vs armv7ahf) (link incompatible)
> >> 2) neon or not, resulting in a different packagearch (e.g armv7a vs armv7a-vfponly) (link compatible)
> >> 3) Thumb2 or arm mode, no direct need for different packagearch, they are compatible
> >> 4) use FPU fw or not (TARGET_PFU) (slightly different from 2.)
> >> 
> >> Do you have any examples on how the package arch will look with this patchset?
> > 
> > I added in code to differentiate between big and little endian. We can
> > add in code to add extra options, e.g. in the tune-armv7 case:
> > 
> > 
> > TARGET_CC_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hardfp", "-mfloat-abi=softfp" ,d)}"
> > 
> > PACKAGE_EXTRA_ARCHS = "${TUNE_ARCH}${SUFX2} armv4${ENDSUFX}${SUFX2} armv4t${ENDSUFX}${SUFX2} armv5te${ENDSUFX}${SUFX2} armv6${ENDSUFX}${SUFX2} armv7${ENDSUFX}${SUFX2}"
> 
> And SUFX2 being 'hf' or '', right? If so, the proposal looks good to me, but I need to digest it some more.

Correct.

An updated version of this with a few more pieces filled out is
available at:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/temp4&id=d2a0bf99fd573221f230bb5253b85166997fac69

Cheers,

Richard




