Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQjzO-0006Ye-AZ
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 21:18:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Oct 2012 12:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="208103435"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by azsmga001.ch.intel.com with ESMTP; 23 Oct 2012 12:04:34 -0700
Message-ID: <5086EA42.9040107@linux.intel.com>
Date: Tue, 23 Oct 2012 12:04:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1350894704-12289-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1350894704-12289-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xorg: remove XF86 BigFont extension
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
X-List-Received-Date: Tue, 23 Oct 2012 19:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2012 01:31 AM, Ross Burton wrote:
> This has been disabled by default upstream since 2007, nothing uses it.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-lib/libx11.inc            |    9 ++++-----
>   .../xorg-proto/xf86bigfontproto_1.2.0.bb             |   18 ------------------
>   meta/recipes-graphics/xorg-xserver/xserver-xorg.inc  |    2 +-
>   3 files changed, 5 insertions(+), 24 deletions(-)
>   delete mode 100644 meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
>
Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
> index 97bd1c2..71e74f7 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -11,7 +11,7 @@ inherit siteinfo
>   FILESPATH = "${FILE_DIRNAME}/libx11"
>
>   PE = "1"
> -INC_PR = "r9"
> +INC_PR = "r10"
>
>   PROVIDES = "virtual/libx11"
>
> @@ -22,14 +22,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
>   DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
>   DEPENDS += "xproto-native"
>
> -EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
> +EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
>   EXTRA_OEMAKE += 'CWARNFLAGS=""'
>
> -# Let people with incredibly archaic requirements enable Xcms and BigFont, but
> -# disable them by default.
> +# Let people with incredibly archaic requirements enable Xcms, but disable it by
> +# default.
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
> -PACKAGECONFIG[bigfont] = "--enable-xf86bigfont,--disable-xf86bigfont,xf86bigfontproto"
>
>   # src/util/makekeys needs to be compiled natively, so tell it what compiler to
>   # use.
> diff --git a/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb b/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
> deleted file mode 100644
> index 969fc91..0000000
> --- a/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require xorg-proto-common.inc
> -
> -SUMMARY = "XFree86-BIGFONT: XFree86 Big Font extension headers"
> -
> -DESCRIPTION = "This package provides the wire protocol for the XFree86 \
> -Big Font extension.  This extension makes larger font requests \
> -possible."
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
> -
> -PR = "r1"
> -PE = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI[md5sum] = "120e226ede5a4687b25dd357cc9b8efe"
> -SRC_URI[sha256sum] = "ba9220e2c4475f5ed2ddaa7287426b30089e4d29bd58d35fad57ba5ea43e1648"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 772fa52..b45cb44 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>
>   inherit autotools pkgconfig
>
> -PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
> +PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
>   LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
>   DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
>
>


