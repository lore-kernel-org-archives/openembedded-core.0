Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCrI9-00056H-OA for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:43:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2SBYqK5019206
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 12:34:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19096-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 12:34:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2SBYhBK019200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 12:34:43 +0100
Message-ID: <1332934483.28414.200.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 12:34:43 +0100
In-Reply-To: <20120328105837.GB4004@jama.jama.net>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
	<20120328105837.GB4004@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] virtual/libgl: switch back to mesa-xlib for qemuarm/qemumips
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
X-List-Received-Date: Wed, 28 Mar 2012 11:43:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-28 at 12:58 +0200, Martin Jansa wrote:
> On Wed, Mar 28, 2012 at 06:10:26PM +0800, edwin.zhai@intel.com wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> 
> I don't think I've ever sent something like this.
> Actually I've sent patch:
> default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
> * to match default virtual/xserver
> 
> And this just reverts it + adds suspicious COMPATIBLE_MACHINE..
> 
> Cheers,
> 
> > Still need mesa-xlib for emulation of GLX interface on qemuarm/qemumips, where
> > mesa-dri doesn't work for pure qemu emulator.
> > 
> > [YOCTO #2066] fixed.
> > ---
> >  meta/conf/distro/include/default-providers.inc |    2 +-
> >  meta/recipes-graphics/mesa/mesa-xlib.inc       |    2 ++
> >  2 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> > index 54c90d3..3850a2f 100644
> > --- a/meta/conf/distro/include/default-providers.inc
> > +++ b/meta/conf/distro/include/default-providers.inc
> > @@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
> >  PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
> >  PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> >  PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
> > -PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
> > +PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
> >  PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
> >  PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
> >  PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
> > diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
> > index b720e14..c431eab 100644
> > --- a/meta/recipes-graphics/mesa/mesa-xlib.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
> > @@ -1 +1,3 @@
> >  EXTRA_OECONF += " --with-driver=xlib --without-gallium-drivers"
> > +
> > +COMPATIBLE_MACHINE = "(qemuarm|qemumips|qemuppc)"


I agree this COMPATIBLE_MACHINE is wrong.

I'd suggest we need to change both xserver-org to xserver-xorg-lite and
libgl to meta-xlib and then this might work better and address Martin's
concerns too.

I'd like to understand why dri can't work under qemu too though.

Cheers,

Richard



