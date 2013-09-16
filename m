Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48B276C889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:03:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8G8wWFf027887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Sep 2013 01:58:32 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 16 Sep 2013 01:58:30 -0700
Message-ID: <5236C833.30002@windriver.com>
Date: Mon, 16 Sep 2013 16:58:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] transfig-native: remove, nothing depends on it
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
X-List-Received-Date: Mon, 16 Sep 2013 09:03:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

Is there a specify reason that we need to remove it ? transfig
provides fig2dev which is used for building the documentation,
for example, gstreamer and libtheora may use fig2dev.

// Robert

On 09/16/2013 04:26 PM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../transfig/transfig-native_3.2.5d.bb             |   39 --------------------
>   .../packagegroups/packagegroup-toolset-native.bb   |    1 -
>   2 files changed, 40 deletions(-)
>   delete mode 100644 meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
>
> diff --git a/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb b/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
> deleted file mode 100644
> index c20a243..0000000
> --- a/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "Utilities for converting XFig figure files"
> -DESCRIPTION = "This package contains utilities (mainly fig2dev) to \
> -handle XFig (Facility for Interactive Generation of figures) files."
> -HOMEPAGE = "http://www-epb.lbl.gov/xfig/"
> -SECTION = "console/utils"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://fig2dev/fig2dev.c;endline=16;md5=6bab01e017409cf9ab21d3e953b793f7"
> -PR = "r1"
> -
> -DEPENDS = "imake-native xorg-cf-files-native zlib-native jpeg-native libpng-native libxpm-native"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/mcj/transfig.${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "f9eac7f265668ecbfda6aaf7581989ad"
> -SRC_URI[sha256sum] = "ae81214177fb05f91f6e43b0b42633b6e0024570cbc6591a3858e12100ce8aaa"
> -
> -S = "${WORKDIR}/transfig.${PV}"
> -
> -EXTRA_OEMAKE = "-I${S}"
> -
> -inherit native
> -
> -do_configure() {
> -	xmkmf
> -	make Makefiles
> -
> -	# Fix hardcoded references to host build locations
> -	sed -i -e "s|SYSTEMUSRLIBDIR = /usr/lib64|SYSTEMUSRLIBDIR = ${libdir}|g" fig2dev/Makefile
> -	sed -i -e "s|SYSTEMUSRINCDIR = /usr/include|SYSTEMUSRINCDIR = ${includedir}|g" fig2dev/Makefile
> -	sed -i -e "s|XPMINC = -I/usr/include/X11|XPMINC = -I${includedir}/X11|g" fig2dev/Makefile
> -	sed -i -e "s|/usr/lib64|/usr/lib|g" fig2dev/Makefile || true
> -	sed -i -e "s|/usr/lib64|/usr/lib|g" fig2dev/dev/Makefile || true
> -	sed -i -e "s|/usr/local/lib|${libdir}|g" fig2dev/Makefile
> -	sed -i -e "s|/usr/local/lib|${libdir}|g" fig2dev/dev/Makefile
> -}
> -
> -do_install() {
> -	oe_runmake install DESTDIR=${D}
> -}
> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
> index 82ee820..934b1be 100644
> --- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
> +++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
> @@ -213,7 +213,6 @@ DEPENDS = "\
>       tcl-native \
>       texinfo-native \
>       tiff-native \
> -    transfig-native \
>       tzcode-native \
>       u-boot-mkimage-native \
>       unfs-server-native \
>

