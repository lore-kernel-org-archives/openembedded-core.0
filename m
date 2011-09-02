Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1QzRa8-0008Af-AD
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 13:06:44 +0200
Received: by wwe32 with SMTP id 32so2258863wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2011 04:01:47 -0700 (PDT)
Received: by 10.216.136.89 with SMTP id v67mr974336wei.18.1314961307709;
	Fri, 02 Sep 2011 04:01:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ft2sm1291625wbb.18.2011.09.02.04.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Sep 2011 04:01:46 -0700 (PDT)
From: Koen Kooi <koen@beagleboard.org>
Date: Fri, 2 Sep 2011 13:01:44 +0200
Message-Id: <79EAF6DF-304E-43B7-B97B-1FA6FFEBB91C@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: [RFC] Layer rework proposal
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
X-List-Received-Date: Fri, 02 Sep 2011 11:06:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

This has come up in the past, but no one has had time to site down and =
write a proposal yet.

Problem description: The OE-core layer has both too much in it and not =
enough.

Currently OE-core is basically a relabeling of the poky fork of OE. Due =
to that heritage is has bits in it that aren't considered 'core', but =
serve as a testbed for the proper core metadata. The prime example of =
this is the sato suite. To address this we will need to come up with =
guidelines what goes into OE-core and what people expect to get out of =
it. Here's a start:

Highlevel goals:

	1) Have a high quality set of "core" metadata
	2) OE-core needs to be useful on its own
	3) OE-core needs to be testable on its own

Concrete rootfs goals:

	a) be able to build for the 4 blessed architectures: arm, mips, =
powerpc, x86
	b) have multilib support
	c) be able to build a rootfs that has:
		o package management (rpm/deb/opkg)
		o networking support (ifupdown/connman/dnsmasq)
		o have remote access (dropbear/openssh)
		o have user management (shadow/pam)

I think it's safe to say that we all agree on that minimum set of goals. =
 The tricky thing is where to put multimedia and GUI stuff. Qt and GTK =
are important enough to get put in core, but where do we draw the line? =
Where do we stop splitting things in recipes-* and start splitting them =
into layers and should those layers live in seperate repositories?

My list of non-BSP, non-distro layers is:

BBLAYERS =3D " \
  ${TOPDIR}/sources/meta-openembedded/meta-oe \
  ${TOPDIR}/sources/meta-openembedded/meta-efl \
  ${TOPDIR}/sources/meta-openembedded/meta-gpe \
  ${TOPDIR}/sources/meta-openembedded/meta-gnome \
  ${TOPDIR}/sources/meta-openembedded/meta-xfce \
  ${TOPDIR}/sources/openembedded-core/meta \
  "

The gpe, gnome and xfce layers need things like glib-2.0 and gtk, but =
there's a larger overlay between the 3, so gpe and xfce end up depending =
on the gnome layer. Meta-oe is the place where people put things they =
don't want to maintain in a seperate layer, which isn't going to scale =
longterm.

My not-so-fully-formed idea is:

core - implements above goals
x11 - base xorg libs, headers, apps. Has bbappends for core recipes to =
add x11 support via DISTRO_FEATURES
gtk - base gtk things, libs, themes, icons, modules
qt - base qt things + qwt

efl - depends on core,x11
gnome - depends on core,x11,gtk
gpe - depends on core,x11,gtk
opie - depends on core,qt
sato - depends on core,x11,gtk
xfce - depends on core,x11,gtk, gnome

and finally:

oe - leftovers

With this layer structure as starting point can we start a discussion on =
how people would like to set it split? I'd like to leave the question of =
which layer goes into what repository for later.

regards,

Koen=


