Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C293E75745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 11:12:52 +0000 (UTC)
Received: by wgez8 with SMTP id z8so30910570wge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mo/vsZFDMsp5Us8dymvAdbVOWIqNq18d+3OBhbaD3Cc=;
	b=d8G6CFoz9CWE7zWA0h9GKqvDZe4HZUR8PDDVRWeCUWcUHQzyQLXfZLSbj2xEdwa519
	iCobwfYBrnXPpTOTp0O2RUAys7UQOnrN0bhZfeN2quAxVnlU60Vhnm0OYp2broExxeyv
	WgXdS8Q8lXp2JbggphlgOqm1aCfNI/P7/EO+nUrBff6a1UXP+dsKP6EH/ucjjkoH5Ji/
	/oBGv5lU5ZP30HIDRdM2EV6kveYwRMc7XjVr2x0yidijpfYjfvgGi5rMcMUXUB8Rf2Om
	8IAUyBr/W2BVcZZEgCFTTJu8q+2+j3fQ2pZQKBBVZXE9wWWJxOkYqka+OheeA4B8WIbt
	ehqw==
X-Received: by 10.194.87.1 with SMTP id t1mr71651377wjz.24.1433416372964;
	Thu, 04 Jun 2015 04:12:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id h1sm30744104wiz.6.2015.06.04.04.12.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 04:12:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 13:13:13 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20150604111313.GH2376@jama>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
	<81bc54c716d05c3d0c28fe7858738a1b8d3fe1d9.1433414236.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <81bc54c716d05c3d0c28fe7858738a1b8d3fe1d9.1433414236.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] xf86-video-omap: Upgrade to 0.4.3
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
X-List-Received-Date: Thu, 04 Jun 2015 11:12:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2015 at 01:44:20PM +0300, Jussi Kukkonen wrote:
> Use last release instead of slightly older git revision, drop the
> upstreamed patch.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../xorg-driver/xf86-video-omap/configure.patch    | 74 ----------------------
>  ...-video-omap_git.bb => xf86-video-omap_0.4.3.bb} | 11 +---
>  2 files changed, 3 insertions(+), 82 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_git.bb => xf86-video-omap_0.4.3.bb} (85%)
> 
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
> deleted file mode 100644
> index d298d5d..0000000
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57386]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From fc7b6045aaec583c7e29021bd23c20a877b20546 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Wed, 21 Nov 2012 23:39:18 +0000
> -Subject: [PATCH] build: rationalise DRI checks
> -
> -The existing logic around DRI was complicated and defined a number of variables
> -that were not used, when in reality DRI is required.
> -
> -Move the glproto check to the main pkg-config check, and remove everything else.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - configure.ac |   33 +--------------------------------
> - 1 file changed, 1 insertion(+), 32 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 11238b1..c321b98 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -44,47 +44,16 @@ XORG_DRIVER_CHECK_EXT(XV, videoproto)
> - XORG_DRIVER_CHECK_EXT(DPMSExtension, xextproto)
> - 
> - # Checks for pkg-config packages
> --PKG_CHECK_MODULES(XORG, [xorg-server >= 1.3] xproto fontsproto [libdrm >= 2.4.36] libdrm_omap xf86driproto $REQUIRED_MODULES)
> --sdkdir=$(pkg-config --variable=sdkdir xorg-server)
> -+PKG_CHECK_MODULES(XORG, [xorg-server >= 1.3] xproto fontsproto [libdrm >= 2.4.36] libdrm_omap xf86driproto glproto $REQUIRED_MODULES)
> - 
> - # Checks for header files.
> - AC_HEADER_STDC
> - 
> --save_CFLAGS="$CFLAGS"
> --CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
> --CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
> --AC_MSG_CHECKING([whether to include DRI support])
> --if test x$DRI != xno; then
> --        AC_CHECK_FILE([${sdkdir}/dri.h],
> --                      [have_dri_h="yes"], [have_dri_h="no"])
> --        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> --                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
> --fi
> --AC_MSG_CHECKING([whether to include DRI support])
> --if test x$DRI = xauto; then
> --        if test "$have_dri_h" = yes -a \
> --                "$have_dristruct_h" = yes; then
> --                DRI="yes"
> --        else
> --                DRI="no"
> --        fi
> --fi
> --AC_MSG_RESULT([$DRI])
> --CFLAGS="$save_CFLAGS $DEBUGFLAGS"
> --
> --AM_CONDITIONAL(DRI, test x$DRI = xyes)
> --if test "$DRI" = yes; then
> --        PKG_CHECK_MODULES(DRI, [xf86driproto glproto])
> --        AC_DEFINE(XF86DRI,1,[Enable DRI driver support])
> --        AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
> --fi
> --
> - AM_CONDITIONAL(VIDEO_DEBUG, test x$VIDEO_DEBUG = xyes)
> - if test "$VIDEO_DEBUG" = yes; then
> - 	AC_DEFINE(VIDEO_DEBUG,1,[Enable debug support])
> - fi
> - 
> --AC_SUBST([DRI_CFLAGS])
> - 
> - DRIVER_NAME=omap
> - AC_SUBST([DRIVER_NAME])
> --- 
> -1.7.10.4
> -
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
> similarity index 85%
> rename from meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
> index 454d0a1..95de4ba 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
> @@ -24,15 +24,10 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
>  DEPENDS += "virtual/libx11 libdrm xf86driproto"
>  
> -SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
> -PR = "${INC_PR}.3"
> -PV = "0.4.2+gitr${SRCPV}"
> -
> -SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap \
> -           file://configure.patch \
> -"
> +SRC_URI[md5sum] = "be35daf6fa4b75092cc4a8978c437bc5"
> +SRC_URI[sha256sum] = "db1e0e69fd4c4c8fdca5ef2cb0447bccd7518a718495876a6904bef57b39986d"
>  
> -S = "${WORKDIR}/git"
> +PR = "${INC_PR}.3"

Drop PR when PV is incremented.

>  
>  CFLAGS += " -I${STAGING_INCDIR}/xorg "
>  
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

