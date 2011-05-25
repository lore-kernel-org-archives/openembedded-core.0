Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPM1x-0005Fa-V7 for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 23:54:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PLpCWf005463;
	Wed, 25 May 2011 22:51:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05258-03; Wed, 25 May 2011 22:51:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PLp7vG005457
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2011 22:51:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
References: <4DDBDE9D.5000709@linux.intel.com> <1306338695.27470.41.camel@rex>
	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
Date: Wed, 25 May 2011 22:51:05 +0100
Message-ID: <1306360265.27470.71.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 21:54:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 09:36 -0700, Khem Raj wrote:
> On Wed, May 25, 2011 at 8:51 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I did a little research and I'd like to try and help us move forward.
> >
> > The "problem" at the moment is both oe-core and meta-ti have u-boot
> > recipes. If Yocto were to merge in the meta-ti recipe to meta-yocto it
> > would overshadow the oe-core recipe. I believe Yocto wants to encourage
> > sharing a core on codebases like u-boot which are receptive and working
> > to facilitate collaboration (not unlike Yocto itself).
> >
> > Valid questions are therefore:
> >
> > a) What can we do to the u-boot recipe in core to make it customisable
> > from layers like meta-ti
> >
> > b) Is it possible for the u-boot recipe in meta-ti to be a .bbappend
> > rather than a recipe which overwrites the default.
> >
> > For a), I know Darren has some patches which drop the COMPATIBLE_MACHINE
> > usage for example and instead raise the skip parsing exception when
> > UBOOT_MACHINE isn't set which is a step in the right direction. If we
> > find other issues, lets fix them.
> >
> > For b), I talked to Koen and he's going to see how feasible this is
> > although as always with this kind of issue there are various
> > complicating factors.
> >
> > Hopefully if we work both sides of the problem we can get this resolved.
> > Darren, if you could send out some of your patches so far (e.g. for
> > COMPATIBLE_MACHINE) that might be helpful.
> >
> > If the ultimate answer is that no, meta-ti has so many changes or
> > specific requirements that mean it needs to stay a .bb file then lets
> > cross that bridge if we come to it but I think this discussion makes
> > sense before reaching that conclusion. Its possible the last release of
> > u-boot has sufficient beagle support for yocto's needs and we could use
> > that instead.
> >
> > Just on a more general note, the agreement on resolving the beagleboard
> > issue stands as is. The plan is to make beagleboard support in
> > meta-yocto as near a copy of the meta-ti pieces as possible with the
> > exception of the kernel where linux-yocto will import the needed patches
> > to demo the kernel tooling functionality. The layer tooling under
> > development will automate the process of syncing those pieces. I think
> > everyone is happy with the agreement and we just need to address some
> > corner cases like u-boot.
> >
> 
> so is it just a question of beagleboard support or a broader support
> for all machines ?

I'm hoping there are some machines out there which have merged support
into the upstream so simply setting UBOOT_MACHINE = "xxx" in the machine
config file is enough to get them working.

Basing the system on the premise that every bootloader needs to be
custom isn't really where we want to be :/.

> I know various boards use very different versions
> of u-boot so is oe-core going to bring that support
> to u-boot in oe-core and maintain that ?

No, the idea would be to make it easy to add missing pieces in
a .bbappend though.

> IMO keeping oe-core relatively free of machine dependent stuff would be better.

I'm still in agreement with this.

Cheers,

Richard



