Received: from host46-141-dynamic.2-87-r.retail.telecomitalia.it
	([87.2.141.46] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gnutoo@no-log.org>) id 1TYHR5-00023w-Ml
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:25:55 +0100
Received: from [192.168.1.121] (helo=gnutoo-desktop)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.76) (envelope-from <gnutoo@no-log.org>)
	id 1TYHCg-00027B-D7; Tue, 13 Nov 2012 15:11:02 +0100
Date: Tue, 13 Nov 2012 15:11:34 +0100
From: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121113151134.3407091b@gnutoo-desktop>
In-Reply-To: <0793c2728cde3530f6d21c865aa017bb00007de5.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<0793c2728cde3530f6d21c865aa017bb00007de5.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: Claws Mail 3.7.9 (GTK+ 2.24.6; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 13 Nov 2012 14:25:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Nov 2012 14:18:29 +0200
Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:

> Other changes:
>  * changed the recipe's SRC_URI to track the new (maintained) repo;
>  * removed all old patches as the latest driver's structure has
> changed drastically;
>  * license file changed quite a bit: MIT -> GPLv2 (needs to be
> reviewed by somebody with a better understanding of these things
> though);
>  * xf86-video-omapfb changed its name to xf86-video-omap: change the
>    recipe name and config files accordingly;
>  * add dependency of libdrm-omap;
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta-yocto-bsp/conf/machine/beagleboard.conf       |    2 +-
>  ...-video-omapfb_git.bb => xf86-video-omap_git.bb} |   23
> ++++++++------------ .../target/arch/arm/conf/machine/{{=machine}}.conf
> |    2 +- 3 files changed, 11 insertions(+), 16 deletions(-)
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb
> => xf86-video-omap_git.bb} (43%)
> 
> diff --git a/meta-yocto-bsp/conf/machine/beagleboard.conf
> b/meta-yocto-bsp/conf/machine/beagleboard.conf index 6633880..204be95
> 100644 --- a/meta-yocto-bsp/conf/machine/beagleboard.conf
> +++ b/meta-yocto-bsp/conf/machine/beagleboard.conf
> @@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>  XSERVER ?= "xserver-xorg \
>             xf86-input-evdev \
>             xf86-input-mouse \
> -           xf86-video-omapfb \
> +           xf86-video-omap \
>             xf86-input-keyboard"
Since xf86-video-omap is a totally different driver and depend on:
* omap DRM video driver that is in staging only in recent kernels.
* enabling the omap DRM in the board file(providing you don't use
  device tree), which is not straingtforward(there are tricks required).
* omap enabled in libdrm.

Could you instead make a new xf86-video-omap recipe instead of
modifying the xf86-video-omapfb one?

Note that xf86-video-omap should support rotation(xrandr -o 1) for
omap4 (from #xorg-devel ) :
Oct 22 00:52:32 <robclark>      it supports rotation, but only on
omap4..

(I know all that because I tried to make it work on the GTA04 machine,
to have rotation but at the end I discovered that the rotation was
only for omap4(because the rotation is based on tiler), so I
abandoned.).

Denis.


