Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE017866B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 11:29:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 03:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; 
   d="scan'208";a="4986936"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Nov 2017 03:29:43 -0800
Date: Thu, 23 Nov 2017 13:28:31 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20171123112830.GA27281@mbabyjoh-desk.ger.corp.intel.com>
References: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
	<20171122163233.10292-6-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171122163233.10292-6-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] neon: remove the recipe
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
X-List-Received-Date: Thu, 23 Nov 2017 11:29:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It will be good to remove references of neon from 'distro_alias.inc' and 'maintainers.inc' as well.

Acked-by: Maxin B. John <maxin.john@intel.com>

On Wed, Nov 22, 2017 at 06:32:33PM +0200, Alexander Kanavin wrote:
> For these reasons:
> 1) Upstream website has been dead for quite a while now;
> 2) Nothing is actually using neon in oe-core, except one gstreamer plugin in gst-plugins-bad
> (and I couldn't find evidence of that plugin being used anywhere)

generally, neonhttpsrc can be replaced by souphttpsrc or giosrc. 

> However, the recipe is still required by libmusicbrainz in meta-oe and so it will be moved there
> (with the tarball taken from debian).
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../packagegroups/packagegroup-self-hosted.bb      |  1 -
>  .../packagegroups/packagegroup-core-lsb.bb         |  1 -
>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
>  meta/recipes-support/neon/neon/pkgconfig.patch     | 15 ---------
>  meta/recipes-support/neon/neon_0.30.2.bb           | 38 ----------------------
>  5 files changed, 1 insertion(+), 56 deletions(-)
>  delete mode 100644 meta/recipes-support/neon/neon/pkgconfig.patch
>  delete mode 100644 meta/recipes-support/neon/neon_0.30.2.bb
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index ff42866e327..adb0c56c3a5 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -136,7 +136,6 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
>      mtools \
>      ncurses \
>      ncurses-terminfo-base \
> -    neon \
>      nfs-utils \
>      nfs-utils-client \
>      openssl \
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 5baaf351e18..e1f34d5af11 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -68,7 +68,6 @@ RDEPENDS_packagegroup-core-sys-extended = "\
>      mc-helpers-perl \
>      mdadm \
>      minicom \
> -    neon \
>      parted \
>      quota \
>      screen \
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index 7be15d99731..ca2ea9e963a 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -22,7 +22,7 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
> -    bz2 curl dash dtls hls neon rsvg sbc smoothstreaming sndfile uvch264 webp \
> +    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile uvch264 webp \
>  "
>  
>  PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
> diff --git a/meta/recipes-support/neon/neon/pkgconfig.patch b/meta/recipes-support/neon/neon/pkgconfig.patch
> deleted file mode 100644
> index 239dba8e255..00000000000
> --- a/meta/recipes-support/neon/neon/pkgconfig.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ----
> - neon.pc.in |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- neon-0.30.1.orig/neon.pc.in
> -+++ neon-0.30.1/neon.pc.in
> -@@ -7,5 +7,5 @@ Name: neon
> - Description: HTTP/WebDAV client library
> - Version: @NEON_VERSION@
> - Libs: -L${libdir} -lneon @NEON_PC_LIBS@
> --Libs.private: @NEON_LIBS@
> -+Libs.private: -L${libdir} -lz -lgcrypt -lgpg-error -lexpat -lgnutls
> - Cflags: -I${includedir}/neon @NEON_CFLAGS@
> diff --git a/meta/recipes-support/neon/neon_0.30.2.bb b/meta/recipes-support/neon/neon_0.30.2.bb
> deleted file mode 100644
> index 5792c56f3aa..00000000000
> --- a/meta/recipes-support/neon/neon_0.30.2.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -SUMMARY = "An HTTP and WebDAV client library with a C interface"
> -HOMEPAGE = "http://www.webdav.org/neon/"
> -SECTION = "libs"
> -LICENSE = "LGPLv2+"
> -LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
> -                    file://src/ne_utils.h;beginline=1;endline=20;md5=2caca609538eddaa6f6adf120a218037"
> -
> -SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
> -           file://pkgconfig.patch \
> -          "
> -
> -SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
> -SRC_URI[sha256sum] = "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca"
> -
> -inherit autotools binconfig-disabled lib_package pkgconfig
> -
> -# Enable gnutls or openssl, not both
> -PACKAGECONFIG ?= "expat gnutls libproxy webdav zlib"
> -PACKAGECONFIG_class-native = "expat gnutls webdav zlib"
> -
> -PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
> -PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
> -PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
> -PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
> -PACKAGECONFIG[libxml2] = "--with-libxml2,--without-libxml2,libxml2"
> -PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
> -PACKAGECONFIG[webdav] = "--enable-webdav,--disable-webdav,"
> -PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> -
> -EXTRA_OECONF += "--enable-shared"
> -
> -do_compile_append() {
> -	oe_runmake -C test
> -}
> -
> -BINCONFIG = "${bindir}/neon-config"
> -
> -BBCLASSEXTEND = "native"
> -- 
> 2.15.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

