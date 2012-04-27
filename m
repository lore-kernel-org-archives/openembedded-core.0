Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNnMm-0002Oh-Lb
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 17:45:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2012 08:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93879179"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 08:36:12 -0700
Message-ID: <4F9ABCEC.60403@linux.intel.com>
Date: Fri, 27 Apr 2012 08:36:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
	<385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
In-Reply-To: <385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/2] eglibc: package mtrace separately
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
X-List-Received-Date: Fri, 27 Apr 2012 15:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2012 03:53 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> And install it only for nativesdk images
>
I think this needs to be in the -sdk images also, not just nativesdk.

Sau!

> This fixes bug: [YOCTO# 2374]
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-core/eglibc/eglibc-package.inc |    8 +++++++-
>   meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>   meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
>   3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 0db221f..e199901 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -20,11 +20,12 @@ USE_LDCONFIG ?= "1"
>   PKGSUFFIX = ""
>   PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
>
> -PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
> +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
>
>   # The ld.so in this eglibc supports the GNU_HASH
>   RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
>   RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
> +RPROVIDES_${PN}-mtrace = "glibc${PKGSUFFIX}-mtrace"
>   RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
>   RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
>   RPROVIDES_${PN}-staticdev = "glibc${PKGSUFFIX}-staticdev"
> @@ -48,11 +49,14 @@ FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
>   	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
>   FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
>   FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
> +FILES_${PN}-mtrace = "${bindir}/mtrace"
>   FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
>   FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>   FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
>   RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
>   RDEPENDS_${PN}-utils += "bash"
> +RDEPENDS_${PN}-utils_virtclass-nativesdk += "${PN}-mtrace"
> +RDEPENDS_${PN}-mtrace += "perl"
>   FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
>   FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
>   RPROVIDES_${PN}-dev += "libc-dev"
> @@ -68,6 +72,8 @@ SUMMARY_ldd = "print shared library dependencies"
>   DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
>   SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
>   DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
> +SUMMARY_${PN}-mtrace = "mtrace utility provided by eglibc"
> +DESCRIPTION_${PN}-mtrace = "mtrace utility provided by eglibc"
>   DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
>
>   inherit libc-common multilib_header
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
> index d8a41dc..73cd0aa 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "15508"
>
>   DEPENDS += "gperf-native"
> -PR = "r26"
> +PR = "r27"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_13"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
> index 713efc3..f5219d1 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "17386"
>
>   DEPENDS += "gperf-native"
> -PR = "r6"
> +PR = "r7"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_15"


