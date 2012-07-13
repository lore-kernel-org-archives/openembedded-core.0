Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SpY5z-0006D9-BC
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 07:07:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2012 21:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176785857"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2012 21:56:00 -0700
Message-ID: <4FFFAA5F.6070700@linux.intel.com>
Date: Thu, 12 Jul 2012 21:55:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341936749-3209-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341936749-3209-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v4 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Fri, 13 Jul 2012 05:07:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 09:12 AM, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
>   meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    7 +++++++
>   meta/recipes-devtools/gcc/gcc-package-runtime.inc   |   14 +++++++++++++-
>   3 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index c7dbc3c..be142a1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r3"
> +PR = "r4"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> index 095d6c1..d40383c 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> @@ -8,6 +8,8 @@ EXTRA_OECONF_PATHS = " \
>       --with-build-sysroot=${STAGING_DIR_TARGET}"
>
>   RUNTIMETARGET = "libssp libstdc++-v3"
> +RUNTIMETARGET_append_powerpc = " libgomp"
> +RUNTIMETARGET_append_powerpc64 = " libgomp"
>   #  ?
>   # libiberty
>   # libmudflap
> @@ -41,6 +43,11 @@ do_install () {
>   	for d in ${RUNTIMETARGET}; do
>   		cd ${B}/$target/$d/
>   		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
> +		if [ "$d" = "libgomp" ]; then
> +			rm -rf ${D}${datadir}/info/libgomp.info ${D}${datadir}/info/dir
> +			rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
> +			rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
> +		fi
>   	done
>   	chown -R root:root ${D}
>   }
> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
> index e0cb51b..a81e3b7 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
> @@ -13,6 +13,9 @@ PACKAGES = "\
>     libgfortran-dev \
>     libmudflap \
>     libmudflap-dev \
> +  libgomp \
> +  libgomp-dev \
> +  libgomp-staticdev \
>   "
>   # The base package doesn't exist, so we clear the recommends.
>   RRECOMMENDS_${PN}-dbg = ""
> @@ -61,7 +64,16 @@ FILES_libmudflap-dev = "\
>     ${libdir}/libmudflap*.a \
>     ${libdir}/libmudflap*.la"
>
> +FILES_libgomp-dev = "\
> +  ${libdir}/libgomp*.so \
> +  ${libdir}/libgomp*.la \
> +  ${libdir}/libgomp.spec \
> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
> +  "
This was already merged into OE-Core, but I just found a packaging issue 
with it.

The above .so should be libgomp*${SOLIBDEV} and libgomp*${SOLIB}

ERROR: QA Issue: gcc-runtime: Files/directories were installed but not 
shipped
   /usr/lib/libgomp.so.1.0.0
   /usr/lib/libgomp.so.1

Sorry I did not catch this earlier

Sau!

> +FILES_libgomp-staticdev = "\
> +  ${libdir}/libgomp*.a \
> +  "
> +
>   do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
>   do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
>   do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
> -
>



