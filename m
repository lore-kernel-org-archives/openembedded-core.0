Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBAuY-0002sG-Sp for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 22:48:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AKaII5003435;
	Mon, 10 Sep 2012 21:36:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01387-10; Mon, 10 Sep 2012 21:36:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AKaBR3003420
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 10 Sep 2012 21:36:12 +0100
Message-ID: <1347309373.31154.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 10 Sep 2012 21:36:13 +0100
In-Reply-To: <1347297632-16529-3-git-send-email-ross.burton@intel.com>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
	<1347297632-16529-3-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libx11: don't split libX11-xcb out into a libx11-xcb package
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
X-List-Received-Date: Mon, 10 Sep 2012 20:48:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 18:20 +0100, Ross Burton wrote:
> As XCB is a hard requirement for libX11, and libX11-xcb.so is a deprecated 3KB
> .so, it's not worth splitting it into a separate package.

3kb is 3kb. If its deprecated, things will stop linking with it and
nothing will depend on it and everyone will be happy as it fades into
history.

What am I missing?

Cheers,

Richard



> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 +-
>  meta/recipes-graphics/xorg-lib/libx11.inc           |    3 ---
>  meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    2 +-
>  3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
> index 3d5a306..c39b859 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
> @@ -5,7 +5,7 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
>  LICENSE = "MIT & MIT-style & BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
>  
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
> index 592f116..bbbb29c 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -18,10 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
>  
>  EXTRA_OECONF += "--with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
>  
> -PACKAGES =+ "${PN}-xcb"
> -
>  FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
> -FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
>  FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
>  
>  do_compile_prepend() {
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> index a65ab1f..e78d707 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> @@ -1,7 +1,7 @@
>  require libx11.inc
>  inherit gettext
>  
> -PR = "r1"
> +PR = "r2"
>  
>  BBCLASSEXTEND = "native nativesdk"
>  




