Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SD4Ir-00007E-Bf
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 03:37:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 18:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="126342929"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.17])
	by orsmga002.jf.intel.com with SMTP; 28 Mar 2012 18:28:19 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Thu, 29 Mar 2012 09:31:28 +0800
Date: Thu, 29 Mar 2012 09:31:28 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329013128.GD1450@edwin-gen>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
	<20120328105837.GB4004@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120328105837.GB4004@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 29 Mar 2012 01:37:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 12:58:37PM +0200, Martin Jansa wrote:
> On Wed, Mar 28, 2012 at 06:10:26PM +0800, edwin.zhai@intel.com wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> 
> I don't think I've ever sent something like this.
> Actually I've sent patch:
> default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
> * to match default virtual/xserver

Yes, this is just a revert to fix the GL failure. Sorry, I don't notice that git 
keep the original author when you revert:(

Could you pls. explain why mesa-xlib doesn't match xserver-xorg?

Thanks,
Edwin

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
> > -- 
> > 1.7.5.4
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
best rgds,
edwin


