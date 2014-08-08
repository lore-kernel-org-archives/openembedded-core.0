Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8409865DAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 14:08:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2014 07:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,825,1400050800"; d="scan'208";a="466509764"
Received: from colmmora-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.127])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2014 07:08:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 08 Aug 2014 15:08:06 +0100
Message-ID: <2818712.2hiaLxnVGE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1407506787-3692-1-git-send-email-Martin.Jansa@gmail.com>
References: <20140808102805.GD14848@jama>
	<1407506787-3692-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] libav: drop older 0.8.11 and use libav-9 by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Aug 2014 14:08:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 August 2014 16:06:27 Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 +--
>  meta/recipes-multimedia/libav/libav.inc            |  8 ++++++++
>  .../0001-configure-enable-pic-for-AArch64.patch    | 23
> ---------------------- meta/recipes-multimedia/libav/libav_0.8.11.bb      |
> 20 ------------------- meta/recipes-multimedia/libav/libav_9.13.bb        |
> 12 ----------- 5 files changed, 9 insertions(+), 57 deletions(-)
>  delete mode 100644
> meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.p
> atch delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.11.bb
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb index
> bd7b8ce..04c08cc 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -53,7 +53,7 @@ SRC_URI =
> "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
> file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
> file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
> file://0001-ffserver-set-oformat.patch \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'libav9',
> 'file://libav-9.patch', '', d)} \ +           file://libav-9.patch \
>  "
> 
>  SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
> @@ -80,7 +80,6 @@ EXTRA_OECONF = "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
>  PACKAGECONFIG ??= "external-libav"
>  PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"
>  PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
> -PACKAGECONFIG[libav9] = ",,,"
> 
>  FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
>  FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
> diff --git a/meta/recipes-multimedia/libav/libav.inc
> b/meta/recipes-multimedia/libav/libav.inc index 8b470c1..21c29fc 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -10,6 +10,13 @@ SECTION = "libs"
>  LICENSE = "GPLv2+"
>  LICENSE_FLAGS = "commercial"
> 
> +LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ +             
>       file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \ +        
>            file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \ +
>                   
> file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02" +
> +SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
> +
>  # Provides ffmpeg compat, see http://libav.org/about.html
>  PROVIDES = "ffmpeg"
> 
> @@ -86,6 +93,7 @@ do_install_append() {
>  }
> 
>  PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> +PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
> 
>  RSUGGESTS_${PN} = "mplayer"
>  FILES_${PN} = "${bindir}"
> diff --git
> a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64
> .patch
> b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64
> .patch deleted file mode 100644
> index d9b22b9..0000000
> ---
> a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64
> .patch +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
> -From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -Date: Thu, 10 Jan 2013 12:42:19 +0100
> -Subject: [PATCH] configure: enable pic for AArch64
> -
> -Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: Backport
> ----
> - configure |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- git.orig/configure
> -+++ git/configure
> -@@ -2393,7 +2393,7 @@ check_host_cflags -std=c99
> - check_host_cflags -Wall
> -
> - case "$arch" in
> --    alpha|ia64|mips|parisc|ppc|sparc)
> -+    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
> -         spic=$shared
> -     ;;
> -     x86)
> diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb
> b/meta/recipes-multimedia/libav/libav_0.8.11.bb deleted file mode 100644
> index 1344a2a..0000000
> --- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -require libav.inc
> -
> -SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
> -           file://0001-configure-enable-pic-for-AArch64.patch"
> -
> -SRC_URI[md5sum] = "cdc9b53c56a375baf73ea38cf7ade4f9"
> -SRC_URI[sha256sum] =
> "5934e4f0dbf6e0fc4987de86cdd079f1d11a1410ae275e9f46472af17f05155a" -
> -LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ -             
>       file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \ -        
>            file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \ -
>                   
> file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02" -
> -PROVIDES += "libpostproc"
> -
> -EXTRA_OECONF += " \
> -    --enable-postproc \
> -"
> -
> -PACKAGES_DYNAMIC +=
> "^lib(av(codec|device|filter|format|util)|postproc|swscale).*" diff --git
> a/meta/recipes-multimedia/libav/libav_9.13.bb
> b/meta/recipes-multimedia/libav/libav_9.13.bb index f9c413f..e922403 100644
> --- a/meta/recipes-multimedia/libav/libav_9.13.bb
> +++ b/meta/recipes-multimedia/libav/libav_9.13.bb
> @@ -1,16 +1,4 @@
>  require libav.inc
> 
> -LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ -             
>       file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \ -        
>            file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \ -
>                   
> file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02" -
> -SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
> -
>  SRC_URI[md5sum] = "23b9e34bffdaee366710fdf20157a570"
>  SRC_URI[sha256sum] =
> "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca" -
> -DEFAULT_PREFERENCE = "-1"
> -
> -# unlike 0.8.11 we don't provide libpostproc
> -PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"


If this works I'm definitely in favour of it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

