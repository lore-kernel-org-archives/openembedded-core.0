Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzU5G-0005hM-Q3 for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 15:47:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82Dg4Y4026149
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 14:42:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25302-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 14:42:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82DfuDk026142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 14:41:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <79EAF6DF-304E-43B7-B97B-1FA6FFEBB91C@beagleboard.org>
References: <79EAF6DF-304E-43B7-B97B-1FA6FFEBB91C@beagleboard.org>
Date: Fri, 02 Sep 2011 14:41:37 +0100
Message-ID: <1314970897.5939.599.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Layer rework proposal
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
X-List-Received-Date: Fri, 02 Sep 2011 13:47:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Koen,

Thanks for writing things down.

On Fri, 2011-09-02 at 13:01 +0200, Koen Kooi wrote:
> This has come up in the past, but no one has had time to site down and
> write a proposal yet.
> 
> Problem description: The OE-core layer has both too much in it and not
> enough.
> 
> Currently OE-core is basically a relabeling of the poky fork of OE.
> Due to that heritage is has bits in it that aren't considered 'core',
> but serve as a testbed for the proper core metadata. The prime example
> of this is the sato suite. To address this we will need to come up
> with guidelines what goes into OE-core and what people expect to get
> out of it. Here's a start:
> 
> Highlevel goals:
> 
> 	1) Have a high quality set of "core" metadata
> 	2) OE-core needs to be useful on its own
> 	3) OE-core needs to be testable on its own
> 
> Concrete rootfs goals:
> 
> 	a) be able to build for the 4 blessed architectures: arm, mips,
> powerpc, x86
> 	b) have multilib support
> 	c) be able to build a rootfs that has:
> 		o package management (rpm/deb/opkg)
> 		o networking support (ifupdown/connman/dnsmasq)
> 		o have remote access (dropbear/openssh)
> 		o have user management (shadow/pam)
> 
> I think it's safe to say that we all agree on that minimum set of
> goals.  The tricky thing is where to put multimedia and GUI stuff. Qt
> and GTK are important enough to get put in core, but where do we draw
> the line? Where do we stop splitting things in recipes-* and start
> splitting them into layers and should those layers live in seperate
> repositories?
> 
> My list of non-BSP, non-distro layers is:
> 
> BBLAYERS = " \
>   ${TOPDIR}/sources/meta-openembedded/meta-oe \
>   ${TOPDIR}/sources/meta-openembedded/meta-efl \
>   ${TOPDIR}/sources/meta-openembedded/meta-gpe \
>   ${TOPDIR}/sources/meta-openembedded/meta-gnome \
>   ${TOPDIR}/sources/meta-openembedded/meta-xfce \
>   ${TOPDIR}/sources/openembedded-core/meta \
>   "
> 
> The gpe, gnome and xfce layers need things like glib-2.0 and gtk, but
> there's a larger overlay between the 3, so gpe and xfce end up
> depending on the gnome layer. Meta-oe is the place where people put
> things they don't want to maintain in a seperate layer, which isn't
> going to scale longterm.
> 
> My not-so-fully-formed idea is:
> 
> core - implements above goals

rootfs goals or highlevel ones? I'd argue it doesn't have enough
substance to reasonably test without something GUI like in there. Whilst
that still doesn't cover everything, I do feel happier that the general
system is sound when graphical pieces are working.

> x11 - base xorg libs, headers, apps. Has bbappends for core recipes to
> add x11 support via DISTRO_FEATURES
> gtk - base gtk things, libs, themes, icons, modules
> qt - base qt things + qwt

Very roughly the above are in OE-Core today. There has been at least
some effort to pull the different pieces apart into those very
categories too in the form of recipes directories rather than layers
(where graphics ~= x11).

I think a reasonable definition of the gtk layer (or gnome-core?) is
that its for the pieces that gpe/sato/xfce all reasonably depend upon.

I'm not sure whether x11 makes sense out on its own or it can be shared
with "graphics" components (e.g. directfb, libsdl and so on). There are
only a small number of other misc graphics pieces.

> efl - depends on core,x11
> gnome - depends on core,x11,gtk
> gpe - depends on core,x11,gtk
> opie - depends on core,qt
> sato - depends on core,x11,gtk

Obviously sato jumps out as something still in OE-Core today but the
intent has always been to make it into a layer (maybe still in the
OE-Core repo). Some matchbox components are more tricky there as where
should they go?

> xfce - depends on core,x11,gtk, gnome
> 
> and finally:
> 
> oe - leftovers
> 
> With this layer structure as starting point can we start a discussion
> on how people would like to set it split? I'd like to leave the
> question of which layer goes into what repository for later.

I believe its all kind of entwined...

Cheers,

Richard





