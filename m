Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3898.1591126043922363928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D87B40C2F;
	Tue,  2 Jun 2020 19:27:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekJoSBycdyyl; Tue,  2 Jun 2020 19:27:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1F0FC40A2D;
	Tue,  2 Jun 2020 19:27:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 62B2E173205; Tue,  2 Jun 2020 15:27:21 -0400 (EDT)
Date: Tue, 2 Jun 2020 15:27:21 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Gregor Zatko <gzatko@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Message-ID: <20200602192721.GU17660@denix.org>
References: <20200602190925.384853-1-gzatko@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200602190925.384853-1-gzatko@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 09:09:25PM +0200, Gregor Zatko wrote:
> In some cases there is a need for update-alternatives script which gets built
> within opkg-utils recipe into a standalone package. However, this causes to
> many unnecessary dependencies, including Python, bc, OpenSSL etc. to be built.
> 
> In this commit a standalone lightweight recipe for update-alternatives that
> shouldn't be dependent on nothing other than bash.

(R)Depending on bash doesn't make it lightweight anymore. This means you 
cannot do tiny bash-less images with alternatives?


> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8879
> 
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  .../conf/distro/include/default-providers.inc |  6 +--
>  meta/conf/layer.conf                          |  3 +-
>  .../packagegroups/packagegroup-self-hosted.bb |  1 +
>  .../opkg-utils/opkg-utils_0.4.2.bb            | 25 +---------
>  .../update-alternatives_0.4.2.bb              | 49 +++++++++++++++++++
>  5 files changed, 56 insertions(+), 28 deletions(-)
>  create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index ea88bd4876..035877af59 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -10,8 +10,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
>  PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
>  PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
> -PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
> -PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
> +PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives"
> +PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "update-alternatives-native"
>  PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
>  PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
>  PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
> @@ -21,7 +21,7 @@ PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
>  #
>  # Default virtual runtime providers
>  #
> -VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
> +VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives"
>  VIRTUAL-RUNTIME_apm ?= "apm"
>  VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
>  VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index da93d64e0a..85fb945f11 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -19,7 +19,6 @@ BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
>  # Set a variable to get to the top of the metadata location
>  COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
>  
> -# opkg-utils is for update-alternatives :(
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    sysvinit-inittab \
>    busybox-inittab \
> @@ -40,7 +39,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    shadow \
>    shadow-sysroot \
>    base-passwd \
> -  opkg-utils \
> +  update-alternatives \
>    gstreamer1.0-meta-base \
>    ca-certificates \
>    shared-mime-info \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 9a70b189a4..4a494f1578 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -166,6 +166,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
>      tcl \
>      texinfo \
>      unzip \
> +    update-alternatives \
>      usbutils \
>      watchdog \
>      wget \
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> index 9315240190..5ebe3d8e60 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> @@ -1,13 +1,11 @@
>  SUMMARY = "Additional utilities for the opkg package manager"
> -SUMMARY_update-alternatives-opkg = "Utility for managing the alternatives system"
>  SECTION = "base"
>  HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
> -PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
>  
> -SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
> +SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
>             file://fix-reproducibility.patch \
>  "
>  UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
> @@ -25,42 +23,23 @@ inherit perlnative
>  PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
>  PYTHONRDEPS_class-native = ""
>  
> -PACKAGECONFIG = "python update-alternatives"
> +PACKAGECONFIG = "python"
>  PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
> -PACKAGECONFIG[update-alternatives] = ",,,"
>  
>  do_install() {
>  	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> -	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
> -		rm -f "${D}${bindir}/update-alternatives"
> -	fi
>  }
>  
>  do_install_append_class-target() {
>  	if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
>  		grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
>  	fi
> -
> -	if [ -e "${D}${bindir}/update-alternatives" ]; then
> -		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
> -	fi
>  }
>  
>  # These are empty and will pull python3-dev into images where it wouldn't
>  # have been otherwise, so don't generate them.
>  PACKAGES_remove = "${PN}-dev ${PN}-staticdev"
>  
> -PACKAGES =+ "update-alternatives-opkg"
> -FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
> -RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cworth"
> -RREPLACES_update-alternatives-opkg = "update-alternatives-cworth"
> -RCONFLICTS_update-alternatives-opkg = "update-alternatives-cworth"
> -
> -pkg_postrm_update-alternatives-opkg() {
> -	rm -rf $D${nonarch_libdir}/opkg/alternatives
> -	rmdir $D${nonarch_libdir}/opkg || true
> -}
> -
>  BBCLASSEXTEND = "native nativesdk"
>  
>  CLEANBROKEN = "1"
> diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb b/meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb
> new file mode 100644
> index 0000000000..8cbf8c4889
> --- /dev/null
> +++ b/meta/recipes-devtools/update-alternatives/update-alternatives_0.4.2.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "Utility for managing the alternatives system"
> +DESCRIPTION = "This program was inspired by the Debian update-alternatives program which is Copyright (C) 1995 Ian Jackson. This version of update-alternatives is command-line compatible with Debian's for a subset of the options, (only --install, --remove, and --help)"
> +SECTION = "base"
> +HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +                    file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
> +
> +SRC_ARCHIVE_NAME = "opkg-utils"
> +SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${SRC_ARCHIVE_NAME}/snapshot/${SRC_ARCHIVE_NAME}-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
> +S = "${WORKDIR}/${SRC_ARCHIVE_NAME}-${PV}"
> +
> +SRC_URI[md5sum] = "cc210650644fcb9bba06ad5ec95a63ec"
> +SRC_URI[sha256sum] = "5929ad87d541789e0b82d626db01a1201ac48df6f49f2262fcfb86cf815e5d6c"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +RDEPENDS_${PN} += "bash"
> +
> +do_compile[noexec] = "1"
> +
> +do_install() {
> +
> +    install -D -m 755 ${S}/update-alternatives ${D}${bindir}/update-alternatives
> +}
> +
> +do_install_append_class-target() {
> +
> +    sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
> +}
> +
> +FILES_${PN} = "${bindir}/update-alternatives"
> +RPROVIDES_${PN} = "${PN} update-alternatives-cworth"
> +RREPLACES_${PN} = "update-alternatives-cworth"
> +RCONFLICTS_${PN} = "update-alternatives-cworth"
> +
> +PROVIDES_class-target += "virtual/update-alternatives"
> +RPROVIDES_${PN}_class-target += "update-alternatives"
> +PROVIDES_class-native += "virtual/update-alternatives-native"
> +RPROVIDES_${PN}_class-native += "update-alternatives-native"
> +
> +pkg_postrm_${PN}() {
> +
> +    rm -rf $D${nonarch_libdir}/opkg/alternatives
> +    rmdir $D${nonarch_libdir}/opkg || true
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.26.2
> 

> 

