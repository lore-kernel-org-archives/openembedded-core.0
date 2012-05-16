Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUjC0-0002kw-Ri
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:43:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2012 11:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="144804558"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2012 11:33:21 -0700
Message-ID: <4FB3F2F0.10201@linux.intel.com>
Date: Wed, 16 May 2012 21:33:20 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337191798.git.nitin.a.kamble@intel.com>
	<95a4d7c127f39cac6fc7d60e8b4081ae774cd745.1337191798.git.nitin.a.kamble@intel.com>
In-Reply-To: <95a4d7c127f39cac6fc7d60e8b4081ae774cd745.1337191798.git.nitin.a.kamble@intel.com>
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
X-List-Received-Date: Wed, 16 May 2012 18:43:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2012 09:11 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> eglibc-mtrace: add dependency into task-core-tools-debug
>
> now eglibc-mtrace gets included in an sdk image and not in a non-sdk image.
>
> This fixes bug: [YOCTO# 2374]
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
>   meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
>   meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
>   meta/recipes-core/tasks/task-core-tools-debug.bb |    1 +
>   4 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 7d97567..fd136bd 100644
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
> @@ -48,11 +49,13 @@ FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
>   	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
>   FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
>   FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
> +FILES_${PN}-mtrace = "${bindir}/mtrace"
>   FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
>   FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>   FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
>   RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
>   RDEPENDS_${PN}-utils += "bash"
> +RDEPENDS_${PN}-mtrace += "perl"
>   FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
>   FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
>   RPROVIDES_${PN}-dev += "libc-dev"
> @@ -68,6 +71,8 @@ SUMMARY_ldd = "print shared library dependencies"
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
> index 340ec99..bb60b57 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "17386"
>
>   DEPENDS += "gperf-native"
> -PR = "r10"
> +PR = "r11"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_15"
> diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb b/meta/recipes-core/tasks/task-core-tools-debug.bb
> index 3c92f3f..64b976a 100644
> --- a/meta/recipes-core/tasks/task-core-tools-debug.bb
> +++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
> @@ -23,4 +23,5 @@ RDEPENDS_${PN} = "\
>       tcf-agent \
>       rsync \
>       strace \
> +    eglibc-mtrace \
>       "
Nitin,

What's going to happen when someone builds with uclibc?  This won't work 
and an unmet dependency will occur.  I thought we talked about how to do 
something.

Sau!


