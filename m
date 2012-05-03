Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SQ3NO-0002z0-Vl
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 23:15:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2012 14:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="136750966"
Received: from unknown (HELO envy.home) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2012 14:06:04 -0700
Message-ID: <4FA2F31E.2030707@linux.intel.com>
Date: Thu, 03 May 2012 14:05:34 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<e03556364318f69ce5914cc5375bfdf51b9c27d4.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <e03556364318f69ce5914cc5375bfdf51b9c27d4.1328510188.git.raj.khem@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 07/20] kmod: Add recipes
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
X-List-Received-Date: Thu, 03 May 2012 21:15:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2012 10:40 PM, Khem Raj wrote:
> kmod is replacement for module-init-tools
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/kmod/kmod-native_git.bb      |   14 +++++
>  meta/recipes-kernel/kmod/kmod.inc                |   31 +++++++++++
>  meta/recipes-kernel/kmod/kmod/depmod-search.conf |    6 ++
>  meta/recipes-kernel/kmod/kmod_git.bb             |   62 ++++++++++++++++++++++
>  4 files changed, 113 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
>  create mode 100644 meta/recipes-kernel/kmod/kmod.inc
>  create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
>  create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
> 
> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
> new file mode 100644
> index 0000000..96de8b8
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -0,0 +1,14 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +require kmod.inc
> +inherit native
> +
> +PR = "${INC_PR}.0"
> +
> +do_install_append (){
> +	for tool in depmod insmod lsmod modinfo modprobe rmmod
> +	do
> +		ln -s kmod ${D}${bindir}/$tool
> +	done

Do we have to ensure to disable module tools in busybox to avoid
conflict here?

I had a few other questions, but managed to resolve them by the time I
finished reading. It looks good with only the one concern above.

Reviewed-by: Darren Hart <dvhart@liunx.intel.com>

> +}
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
> new file mode 100644
> index 0000000..ea0247e
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
> +insert, remove, list, check properties, resolve dependencies and aliases."
> +HOMEPAGE = "http://packages.profusion.mobi/kmod/"
> +LICENSE = "GPL-2.0+ & LGPL-2.1+"
> +LICENSE_libkmod = "LGPL-2.1+"
> +SECTION = "base"
> +PV = "4+gitr${SRCREV}"
> +INC_PR = "r0"
> +DEPENDS += "gnome-doc-utils-native"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> +                    file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> +                   "
> +inherit autotools
> +
> +SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
> +           file://depmod-search.conf \
> +          "
> +
> +SRCREV = "a2c7d3e8b058a2013aa8da5986d1d11fa13d6fd7"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_AUTORECONF += "--install --symlink"
> +EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools"
> +
> +do_configure_prepend () {
> +        gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
> +}
> diff --git a/meta/recipes-kernel/kmod/kmod/depmod-search.conf b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
> new file mode 100644
> index 0000000..527c0bb
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
> @@ -0,0 +1,6 @@
> +#
> +# /etc/depmod.d/depmod.conf
> +#
> +
> +search updates extramodules built-in
> +
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> new file mode 100644
> index 0000000..eaab47b
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -0,0 +1,62 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +require kmod.inc
> +
> +PR = "${INC_PR}.0"
> +
> +PROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
> +RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
> +CONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
> +
> +# autotools set prefix to /usr, however we want them in /bin and /sbin
> +bindir = "${base_bindir}"
> +sbindir = "${base_sbindir}"
> +libdir = "${base_libdir}"
> +
> +SRC_URI += " \
> +            file://depmod-search.conf \
> +           "
> +
> +do_install_append () {
> +        install -dm755 ${D}${base_bindir}
> +        install -dm755 ${D}${base_sbindir}
> +        # add symlinks to kmod
> +        ln -s ..${base_bindir}/kmod ${D}${base_bindir}/lsmod.kmod
> +        for tool in {ins,rm,dep}mod mod{info,probe}; do
> +                ln -s ..${base_bindir}/kmod ${D}${base_sbindir}/${tool}.kmod
> +        done
> +        # configuration directories
> +        install -dm755 ${D}${base_libdir}/depmod.d
> +        install -dm755 ${D}${base_libdir}/modprobe.d
> +        install -dm755 ${D}${sysconfdir}/depmod.d
> +        install -dm755 ${D}${sysconfdir}/modprobe.d
> +
> +        # install depmod.d file for search/ dir
> +        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
> +}
> +
> +pkg_postinst_kmod() {
> +        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
> +                bn=`basename $f`
> +                update-alternatives --install /$f $bn /$f.kmod 60
> +        done
> +        update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmod.kmod 60
> +        update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.kmod 60
> +        update-alternatives --install /sbin/depmod depmod /sbin/depmod.kmod 60
> +}
> +
> +pkg_prerm_kmod() {
> +        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
> +                bn=`basename $f`
> +                update-alternatives --remove $bn /$f.kmod
> +        done
> +        update-alternatives --remove bin-lsmod /bin/lsmod.kmod
> +        update-alternatives --remove lsmod /bin/lsmod.kmod
> +        update-alternatives --remove depmod /sbin/depmod.kmod
> +}
> +
> +PACKAGES =+ "libkmod"
> +
> +FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS}"
> +FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


