Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbReu-0003dT-O2 for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 08:57:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAM7h9kU024106;
	Thu, 22 Nov 2012 07:43:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23752-01; Thu, 22 Nov 2012 07:43:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAM7gvvj024100
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 22 Nov 2012 07:42:59 GMT
Message-ID: <1353570175.10459.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Nov 2012 07:42:55 +0000
In-Reply-To: <20121121094815.GI12637@jama.jama.net>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<0793c2728cde3530f6d21c865aa017bb00007de5.1352808309.git.laurentiu.palcu@intel.com>
	<20121113151134.3407091b@gnutoo-desktop>
	<20121121094815.GI12637@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/12] xf86-video-omapfb: upgrade to 0.4.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 07:57:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-21 at 10:48 +0100, Martin Jansa wrote:
> On Tue, Nov 13, 2012 at 03:11:34PM +0100, Denis 'GNUtoo' Carikli wrote:
> > On Tue, 13 Nov 2012 14:18:29 +0200
> > Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> > 
> > > Other changes:
> > >  * changed the recipe's SRC_URI to track the new (maintained) repo;
> > >  * removed all old patches as the latest driver's structure has
> > > changed drastically;
> > >  * license file changed quite a bit: MIT -> GPLv2 (needs to be
> > > reviewed by somebody with a better understanding of these things
> > > though);
> > >  * xf86-video-omapfb changed its name to xf86-video-omap: change the
> > >    recipe name and config files accordingly;
> > >  * add dependency of libdrm-omap;
> > > 
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > > ---
> > >  meta-yocto-bsp/conf/machine/beagleboard.conf       |    2 +-
> > >  ...-video-omapfb_git.bb => xf86-video-omap_git.bb} |   23
> > > ++++++++------------ .../target/arch/arm/conf/machine/{{=machine}}.conf
> > > |    2 +- 3 files changed, 11 insertions(+), 16 deletions(-)
> > >  rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb
> > > => xf86-video-omap_git.bb} (43%)
> > > 
> > > diff --git a/meta-yocto-bsp/conf/machine/beagleboard.conf
> > > b/meta-yocto-bsp/conf/machine/beagleboard.conf index 6633880..204be95
> > > 100644 --- a/meta-yocto-bsp/conf/machine/beagleboard.conf
> > > +++ b/meta-yocto-bsp/conf/machine/beagleboard.conf
> > > @@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> > >  XSERVER ?= "xserver-xorg \
> > >             xf86-input-evdev \
> > >             xf86-input-mouse \
> > > -           xf86-video-omapfb \
> > > +           xf86-video-omap \
> > >             xf86-input-keyboard"
> > Since xf86-video-omap is a totally different driver and depend on:
> > * omap DRM video driver that is in staging only in recent kernels.
> > * enabling the omap DRM in the board file(providing you don't use
> >   device tree), which is not straingtforward(there are tricks required).
> > * omap enabled in libdrm.
> > 
> > Could you instead make a new xf86-video-omap recipe instead of
> > modifying the xf86-video-omapfb one?
> 
> Btw xf86-video-omapfb does not support xserver-1.13 video API.
> 
> Someone needs to port
> http://cgit.freedesktop.org/xorg/driver/xf86-video-omap/commit/?id=0615ee8cd73068332879695cbdf662cf5b9b597c
> to xf86-video-omapfb or merge missing functionality from omapfb to omap
> driver.
> 
> I've similar patch to fix xf86-video-glamo in meta-oe, but cannot test
> it in runtime until we fix SIGILL in systemd dbus on armv4t
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/042298.html

Watching things starting to break on the autobuilder due to this is
extremely depressing/frustrating, not least as once you start to see
bits of red which are "known", you start to ignore that build entry all
the time and start missing other bugs.

We really need to have a zero tolerance of build breakage like this,
particularly when there is nobody stepping up and saying "I will fix
this in X timeframe". 

Based on that I've removed the omapfb driver. If someone steps up and
fixes it, I don't mind it coming back but until then, I don't want the
build failures, or to confuse users with recipes that don't work.

Cheers,

Richard







