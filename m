Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qbvec-00070M-0k for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:22:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TEIS22004975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:18:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04893-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:18:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TEIMuG004969
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:18:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8ef199fe606464ce6bdfef2329607c037ecdbc61.1309305731.git.sgw@linux.intel.com>
References: <cover.1309305731.git.sgw@linux.intel.com>
	<8ef199fe606464ce6bdfef2329607c037ecdbc61.1309305731.git.sgw@linux.intel.com>
Date: Wed, 29 Jun 2011 15:18:05 +0100
Message-ID: <1309357085.20015.399.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Wed, 29 Jun 2011 14:22:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

I'm still not 100% sure this patch is the right way to go or not. Let me
ask some specific questions below.

On Tue, 2011-06-28 at 17:07 -0700, Saul Wold wrote:
> This commit adds a new base package ${PN}-staticdev to
> bitbake.conf which pulls in the static *.a libraries as
> a seperate package, it filters out the nonshared.a
> libraries where appropriate.
> 
> Additional this commit adds a new libdev.bbclass which provides
> a set of macros and variables to convert ${PN} to lib${PN},
> which a number of recipes where then converted to use.
> 
> PR bumps all around
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/lib_package.bbclass                   |   10 ++++-
>  meta/classes/libdev.bbclass                        |   44 ++++++++++++++++++++
>  meta/conf/bitbake.conf                             |    8 +++-
>  meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++-
>  .../wireless-tools/wireless-tools_29.bb            |    9 +++-
>  meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
>  meta/recipes-core/eglibc/eglibc-package.inc        |    9 +++-
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++----
>  meta/recipes-core/glibc/glibc-package.inc          |    9 +++-
>  .../meta/external-csl-toolchain_2008q3-72.bb       |    8 ++-
>  meta/recipes-core/uclibc/uclibc.inc                |    9 +++-
>  meta/recipes-core/udev/udev-new.inc                |   14 ++++--
>  meta/recipes-core/udev/udev_164.bb                 |    2 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   11 ++++-
>  meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
>  .../binutils/binutils-cross-canadian_2.21.bb       |    2 +-
>  meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +
>  .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
>  .../binutils/binutils-crosssdk_2.21.bb             |    2 +-
>  meta/recipes-devtools/binutils/binutils.inc        |    9 +---
>  meta/recipes-devtools/binutils/binutils_2.21.bb    |    2 +-
>  meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   25 ++++++++---
>  meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
>  meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 ++-
>  meta/recipes-devtools/opkg/opkg_svn.bb             |    8 ++-
>  meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 ++++----
>  meta/recipes-extended/augeas/augeas.inc            |    7 +--
>  meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
>  meta/recipes-extended/gamin/gamin_0.1.10.bb        |   13 +-----
>  .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++-
>  meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 ++--
>  meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +--
>  meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +-
>  meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
>  meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
>  meta/recipes-support/attr/ea-acl.inc               |   16 +-------
>  meta/recipes-support/curl/curl_7.21.6.bb           |   17 +++-----
>  meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    5 +-
>  meta/recipes-support/sqlite/sqlite3.inc            |   10 +----
>  meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
>  41 files changed, 203 insertions(+), 146 deletions(-)
>  create mode 100644 meta/classes/libdev.bbclass
> 
> diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
> index 5ce8727..e8cbc25 100644
> --- a/meta/classes/lib_package.bbclass
> +++ b/meta/classes/lib_package.bbclass
> @@ -5,6 +5,12 @@ FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
>  	    ${base_libdir}/*${SOLIBS} \
>  	    ${datadir}/${PN} ${libdir}/${PN}"
>  FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -		${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
> -		${datadir}/aclocal ${bindir}/*-config"
> +            ${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
> +            ${datadir}/aclocal ${bindir}/*-config \
> +            ${libdir}/*_nonshared.a"
>  FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
> +
> +staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
> +FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"

As Phil says, I'm not sure this works and since the nonshared.a thing is
a *libc thing its probably not worth adding this complexity to the core
but just work putting it in the *libc packaging code.

> diff --git a/meta/classes/libdev.bbclass b/meta/classes/libdev.bbclass
> new file mode 100644
> index 0000000..d0aac2f
> --- /dev/null
> +++ b/meta/classes/libdev.bbclass
> @@ -0,0 +1,44 @@
> +#
> +# This bbclass it a common case for lib${PN}*.a static libraries
> +#
> +
> +SUMMARY_lib${PN}-dbg ?= "${SUMMARY} - Debugging files"
> +DESCRIPTION_lib${PN}-dbg ?= "${DESCRIPTION}  \
> +This package contains ELF symbols and related sources for debugging purposes."
> +
> +SUMMARY_lib${PN}-dev ?= "${SUMMARY} - Development files"
> +DESCRIPTION_lib${PN}-dev ?= "${DESCRIPTION}  \
> +This package contains symbolic links, header files, and \
> +related items necessary for software development."
> +
> +SUMMARY_lib${PN}-doc ?= "${SUMMARY} - Documentation files"
> +DESCRIPTION_lib${PN}-doc ?= "${DESCRIPTION} This package contains documentation."
> +
> +SUMMARY_lib${PN}-staticdev ?= "${SUMMARY} - Development files (Static Libraries)"
> +DESCRIPTION_lib${PN}-staticdev?= "${DESCRIPTION}  \
> +This package contains static libraries for software development."
> +
> +PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc lib${PN}-staticdev"
> +
> +FILES_lib${PN} = "${base_libdir}/lib*.so.* ${libdir}/lib*.so.*"
> +RDEPENDS_lib${PN} = "${PN}"
> +
> +FILES_lib${PN}-dev = "${includedir} \
> +                      ${libdir}/lib*.so \
> +                      ${libdir}/lib*_nonshared.a \
> +                      ${libdir}/lib*.la \
> +                      ${libdir}/pkgconfig \
> +                      ${base_libdir}/lib*.so \
> +                      ${base_libdir}/lib*_nonshared.a \
> +                      ${base_libdir}/lib*.la"
> +
> +
> +FILES_lib${PN}-doc = "${mandir}/man2 \
> +                      ${mandir}/man3"
> +
> +lib_staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
> +FILES_lib${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${lib_staticdev_libs}', d)}"
> +
> +
> +SECTION_lib${PN}-staticdev = "devel"
> +RDEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"

This file is doing *way* more than just some static lib packaging.

I'm totally in favour of splitting out libraries where it makes sense
but do we have strong usecases for standalone -doc, -dev, -dbg or
-staticdev packaging?

Also, how does this compare to the the other lib_package.bbclass or
whatever its called?


> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index ff2a912..53106c8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -252,12 +252,16 @@ SECTION_${PN}-doc = "doc"
>  
>  FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
>                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
> -                ${datadir}/aclocal ${base_libdir}/*.o"
> +                ${datadir}/aclocal ${base_libdir}/*.o \
> +                ${libdir}/lib*_nonshared.a ${base_libdir}/lib*_nonshared.a"
> +		

Adding libc* specifics into the core? :/

>  SECTION_${PN}-dev = "devel"
>  ALLOW_EMPTY_${PN}-dev = "1"
>  RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>  
> -FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a"
> +staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
> +FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"
> +
>  SECTION_${PN}-staticdev = "devel"
>  RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
>  
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
> index 4e6d4e1..439719a 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  DEPENDS = "zlib"
>  RDEPENDS_${PN} = "${PN}-ids"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
>             file://configure.patch \
> @@ -49,9 +49,12 @@ do_install () {
>  	ln -s ../sbin/lspci ${D}${bindir}/lspci
>  }
>  
> -PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg"
> +PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg libpci-staticdev"

When would you need a libpci-staticdev instead of pciutils-staticdev?


>  FILES_pciutils-ids = "${datadir}/pci.ids*"
>  FILES_libpci = "${libdir}/libpci.so.*"
>  FILES_libpci-dbg = "${libdir}/.debug"
>  FILES_libpci-dev = "${libdir}/libpci.a ${libdir}/libpci.la ${libdir}/libpci.so \
>                      ${includedir}/pci ${libdir}/pkgconfig"
> +FILES_libpci-staticdev = "${libdir}/libpci.a"
> +RDEPENDS_libpci-staticdev = "libpci-dev (= ${EXTENDPKGV})"
> +
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> index 3f9f8f0..26ec667 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  SECTION = "base"
>  PRIORITY = "optional"
>  PE = "1"
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
>             file://man.patch;apply=yes \
> @@ -42,14 +42,17 @@ do_install() {
>  }
>  
>  PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
> -libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
> +libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc ifrename ${PN} ${PN}-doc"
>  
>  FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
>  FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
>  FILES_libiw = "${libdir}/*.so.*"
> -FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
> +FILES_libiw-dev = "${libdir}/*.so ${includedir}"
>  FILES_libiw-doc = "${mandir}/man7"
> +FILES_libiw-staticdev = "${libdir}/*.a"
> +RDEPENDS_libiw-staticdev = "libiw-dev (= ${EXTENDPKGV})"
>  FILES_ifrename = "${sbindir}/ifrename"
>  FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
>  FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
>  FILES_${PN}-doc = "${mandir}"
> +
> diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
> index a36011a..d71c5ed 100644
> --- a/meta/recipes-core/eglibc/eglibc-common.inc
> +++ b/meta/recipes-core/eglibc/eglibc-common.inc
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
>  SECTION = "libs"
>  PRIORITY = "required"
>  LICENSE = "LGPL"
> -INC_PR = "r11"
> +INC_PR = "r12"
>  LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
>        file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
>        file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 8228484..c57b455 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -20,7 +20,7 @@ USE_LDCONFIG ?= "1"
>  PKGSUFFIX = ""
>  PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
>  
> -PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile libsotruss${PKGSUFFIX}"
> +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev ${PN}-staticdev eglibc-doc libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile libsotruss${PKGSUFFIX}"
>  
>  # Create a eglibc-binaries
>  ALLOW_EMPTY_${PN}-binaries = "1"
> @@ -50,6 +50,7 @@ RPROVIDES_eglibc-doc = "glibc-doc"
>  RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
>  RPROVIDES_eglibc-thread-db = "glibc-thread-db"
>  RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
> +RPROVIDES_eglibc-staticdev = "glibc-staticdev"
>  RPROVIDES_eglibc-dbg = "glibc-dbg"
>  libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>  
> @@ -62,8 +63,10 @@ FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
>  FILES_sln = "/sbin/sln"
>  FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
>  FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
> -FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
> -	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> +FILES_eglibc-dev_append = "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal ${libdir}/lib*_nonshared.a"
> +libc_staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
> +FILES_eglibc-staticdev_append = "${@oe_filter_out('lib.*_nonshared.a', '${libc_staticdev_libs}', d)}"
> +RDEPENDS_eglibc-staticdev = "eglibc-dev (= ${EXTENDPKGV})"

Just to be clear on the trick to use here, you need to put the package
containing lib.*_nonshared.a aghead of ${PN}-staticdev in PACKAGES. If
you do that I suspect a lot of your problems with this code will go away
and things will become simpler. Files go into the first matching package
in PACKAGES.

Cheers,

Richard



