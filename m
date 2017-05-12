Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 71C2171A3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 18:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C704D20B86;
	Fri, 12 May 2017 18:00:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LKw5Vr1a2AEx; Fri, 12 May 2017 18:00:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 981CE20069;
	Fri, 12 May 2017 18:00:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 261341624C1; Fri, 12 May 2017 14:00:18 -0400 (EDT)
Date: Fri, 12 May 2017 14:00:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marc Ferland <ferlandm@amotus.ca>
Message-ID: <20170512180018.GI28053@denix.org>
References: <1494610960-32690-1-git-send-email-ferlandm@amotus.ca>
MIME-Version: 1.0
In-Reply-To: <1494610960-32690-1-git-send-email-ferlandm@amotus.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] pciutils: upgrade 3.5.2 -> 3.5.4
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
X-List-Received-Date: Fri, 12 May 2017 18:00:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Can this be generated as a diff between versions? You may need to use "git mv" 
and/or pass -M to "git format-patch"...


On Fri, May 12, 2017 at 01:42:39PM -0400, Marc Ferland wrote:
> Upgrade to 3.5.4 and fix libkmod detection (was missing pkgconfig
> bbclass).
> 
> Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.5.2.bb | 60 -----------------------------
>  meta/recipes-bsp/pciutils/pciutils_3.5.4.bb | 60 +++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 60 deletions(-)
>  delete mode 100644 meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
>  create mode 100644 meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
> 
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
> deleted file mode 100644
> index 9a7297e..0000000
> --- a/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -SUMMARY = "PCI utilities"
> -DESCRIPTION = 'The PCI Utilities package contains a library for portable access \
> -to PCI bus configuration space and several utilities based on this library.'
> -HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
> -SECTION = "console/utils"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -DEPENDS = "zlib kmod"
> -
> -SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
> -           file://configure.patch \
> -           file://guess-fix.patch \
> -           file://makefile.patch"
> -
> -SRC_URI[md5sum] = "1bf5b068bd9f7512e8c68b060b25a1b2"
> -SRC_URI[sha256sum] = "3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc"
> -
> -inherit multilib_header
> -
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
> -PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
> -
> -PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
> -
> -# see configure.patch
> -do_configure () {
> -	(
> -	  cd lib && \
> -	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
> -	  # so we put it before ./configure
> -	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
> -	)
> -}
> -
> -export PREFIX = "${prefix}"
> -export SBINDIR = "${sbindir}"
> -export SHAREDIR = "${datadir}"
> -export MANDIR = "${mandir}"
> -
> -EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
> -
> -# The configure script breaks if the HOST variable is set
> -HOST[unexport] = "1"
> -
> -do_install () {
> -	oe_runmake DESTDIR=${D} install install-lib
> -
> -	install -d ${D}${bindir}
> -	ln -s ../sbin/lspci ${D}${bindir}/lspci
> -
> -	oe_multilib_header pci/config.h
> -}
> -
> -PACKAGES =+ "${PN}-ids libpci"
> -FILES_${PN}-ids = "${datadir}/pci.ids*"
> -FILES_libpci = "${libdir}/libpci.so.*"
> -SUMMARY_${PN}-ids = "PCI utilities - device ID database"
> -DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
> -RDEPENDS_${PN} += "${PN}-ids"
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
> new file mode 100644
> index 0000000..0faa501
> --- /dev/null
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
> @@ -0,0 +1,60 @@
> +SUMMARY = "PCI utilities"
> +DESCRIPTION = "The PCI Utilities package contains a library for portable access \
> +to PCI bus configuration space and several utilities based on this library."
> +HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
> +SECTION = "console/utils"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +DEPENDS = "zlib kmod"
> +
> +SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
> +           file://configure.patch \
> +           file://guess-fix.patch \
> +           file://makefile.patch"
> +
> +SRC_URI[md5sum] = "e82537cd2194111c45fa7e684b52252e"
> +SRC_URI[sha256sum] = "64293c6ab9318c40ef262b76d87bd9097531759752bac556e50979b1e63cfe66"
> +
> +inherit multilib_header pkgconfig
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
> +PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
> +
> +PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
> +
> +# see configure.patch
> +do_configure () {
> +	(
> +	  cd lib && \
> +	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
> +	  # so we put it before ./configure
> +	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
> +	)
> +}
> +
> +export PREFIX = "${prefix}"
> +export SBINDIR = "${sbindir}"
> +export SHAREDIR = "${datadir}"
> +export MANDIR = "${mandir}"
> +
> +EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
> +
> +# The configure script breaks if the HOST variable is set
> +HOST[unexport] = "1"
> +
> +do_install () {
> +	oe_runmake DESTDIR=${D} install install-lib
> +
> +	install -d ${D}${bindir}
> +	ln -s ../sbin/lspci ${D}${bindir}/lspci
> +
> +	oe_multilib_header pci/config.h
> +}
> +
> +PACKAGES =+ "${PN}-ids libpci"
> +FILES_${PN}-ids = "${datadir}/pci.ids*"
> +FILES_libpci = "${libdir}/libpci.so.*"
> +SUMMARY_${PN}-ids = "PCI utilities - device ID database"
> +DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
> +RDEPENDS_${PN} += "${PN}-ids"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

