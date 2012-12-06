Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgTsu-0001hm-Li
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 06:20:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 21:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,228,1355126400"; d="scan'208";a="259739908"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2012 21:06:06 -0800
Message-ID: <50C027BE.2020501@linux.intel.com>
Date: Wed, 05 Dec 2012 21:06:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<4f0221babbdf3b316dbb0a23dd84ac0e6eeaa658.1354641032.git.mark.hatle@windriver.com>
In-Reply-To: <4f0221babbdf3b316dbb0a23dd84ac0e6eeaa658.1354641032.git.mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/22] pseudo: Rework target, native and nativesdk pseudo intergration
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
X-List-Received-Date: Thu, 06 Dec 2012 05:20:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2012 09:14 AM, Mark Hatle wrote:
> Pseudo was not building and installing properly for systems where baselib
> was not 'lib'.  This change reworks the three scenerios to work properly.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/recipes-devtools/pseudo/pseudo.inc      |   58 ++++++++++++-------------
>   meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    2 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb   |    2 +-
>   3 files changed, 30 insertions(+), 32 deletions(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index 98f706c..8dc7d72 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -13,34 +13,28 @@ SRC_URI_append_class-nativesdk = " file://symver.patch"
>
>   SRC_URI_append_class-native = " file://symver.patch"
>
> -FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
> -FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
> +FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
> +FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
>   PROVIDES += "virtual/fakeroot"
>
>   MAKEOPTS = ""
>
>   inherit siteinfo
>
> -do_configure () {
> -	:
> -}
> -
> -NO32LIBS ??= "1"
> -
> -# Compile for the local machine arch...
> -do_compile () {
> +do_configure_class-target () {
>   	if [ "${SITEINFO_BITS}" = "64" ]; then
> -	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
> +		mylibdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS}
>   	else
> -	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
> +		mylibdir=${prefix}/lib/pseudo/lib
>   	fi
> -	oe_runmake ${MAKEOPTS}
> +	${S}/configure --prefix=${prefix} --libdir=$mylibdir --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath

You seem to have dropped the --with-sqlite and now it does not find 
sqlite3.h for the target build as can be seen in the build appliance 
failure.

http://autobuilder.yoctoproject.org:8010/builders/build-appliance/builds/154/steps/shell_46/logs/stdio

Sau!

>   }
>
> -# Two below are the same
> +NO32LIBS ??= "1"
> +
>   # If necessary compile for the alternative machine arch.  This is only
>   # necessary in a native build.
> -do_compile_prepend_class-native () {
> +do_compile_native() {
>   	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>   		# We need the 32-bit libpseudo on a 64-bit machine...
>                   # ... and we really, really, hope that the native host is
> @@ -56,18 +50,20 @@ do_compile_prepend_class-native () {
>   		# prevent it from removing the lib, but remove everything else
>   		make 'LIB=foo' ${MAKEOPTS} distclean
>   	fi
> +	if [ "${SITEINFO_BITS}" = "64" ]; then
> +	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
> +	else
> +	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
> +	fi
> +	oe_runmake ${MAKEOPTS}
>   }
>
> -do_compile_prepend_class-nativesdk () {
> -	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
> -		# We need the 32-bit libpseudo on a 64-bit machine...
> -                # ... and we really, really, hope that the native host is
> -                # x86, or else --bits may not work.
> -		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
> -		oe_runmake ${MAKEOPTS} libpseudo
> -		# prevent it from removing the lib, but remove everything else
> -		make 'LIB=foo' ${MAKEOPTS} distclean
> -	fi
> +do_compile_class-native () {
> +	do_compile_native
> +}
> +
> +do_compile_class-nativesdk () {
> +	do_compile_native
>   }
>
>   do_install () {
> @@ -77,18 +73,20 @@ do_install () {
>   # Two below are the same
>   # If necessary install for the alternative machine arch.  This is only
>   # necessary in a native build.
> -do_install_append_class-native () {
> +do_install_native () {
>   	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>   		mkdir -p ${D}${prefix}/lib/pseudo/lib
>   		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
>   	fi
> +	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 'LIB=lib/pseudo/lib$(MARK64)' install
> +}
> +
> +do_install_class-native () {
> +	do_install_native
>   }
>
>   do_install_append_class-nativesdk () {
> -	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
> -		mkdir -p ${D}${prefix}/lib/pseudo/lib
> -		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
> -	fi
> +	do_install_native
>   }
>
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
> index 70fe9c0..8367a34 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
> @@ -1,6 +1,6 @@
>   require pseudo.inc
>
> -PR = "r13"
> +PR = "r14"
>
>   SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index e394ffb..c8ec5ad 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -2,7 +2,7 @@ require pseudo.inc
>
>   SRCREV = "398a264490713c912b4ce465251a8a82a7905f45"
>   PV = "1.4.1+git${SRCPV}"
> -PR = "r28"
> +PR = "r29"
>
>   DEFAULT_PREFERENCE = "-1"
>
>


