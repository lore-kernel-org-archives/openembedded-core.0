Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UIAiP-0004zD-Io
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 05:33:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2013 21:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,876,1355126400"; d="scan'208";a="305622460"
Received: from unknown (HELO [10.255.13.175]) ([10.255.13.175])
	by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2013 21:16:37 -0700
Message-ID: <51493825.5050802@linux.intel.com>
Date: Tue, 19 Mar 2013 21:16:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <1363172107-11549-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1363172107-11549-1-git-send-email-marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] elfutils: split libraries into separate packages
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
X-List-Received-Date: Wed, 20 Mar 2013 04:33:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2013 03:55 AM, Marcin Juszkiewicz wrote:
> Elfutils contains libraries which are often used by other
> applications/libraries. But sometimes there are also conflicting
> packages needed - for example libdw-dev conflicts with libdwarf-dev
> because both provide /usr/include/dwarf.h header file.
>
> This change makes it more in line with Debian based systems. It also
> allows to have libdwarf-dev installed in image without having to go into
> ugly hacks or rewriting 3rdparty software.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-devtools/elfutils/elfutils_0.148.bb | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>

There have been some other changes taken in for elfutils, can you please 
look at rebasing this patch please.

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> index 45931b0..8bd32f8 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
>                       file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
>   DEPENDS = "libtool bzip2 zlib virtual/libintl"
>
> -PR = "r9"
> +PR = "r10"
>
>   SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
>
> @@ -66,7 +66,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
>   BBCLASSEXTEND = "native nativesdk"
>
>   # Package utilities separately
> -PACKAGES =+ "${PN}-binutils"
> +PACKAGES =+ "${PN}-binutils libelf libasm libdw libdw-dev libasm-dev libelf-dev"
>   FILES_${PN}-binutils = "\
>       ${bindir}/eu-addr2line \
>       ${bindir}/eu-ld \
> @@ -75,11 +75,16 @@ FILES_${PN}-binutils = "\
>       ${bindir}/eu-size \
>       ${bindir}/eu-strip"
>
> +FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
> +FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
> +FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
> +FILES_libelf-dev = "${libdir}/libelf.so ${includedir}"
> +FILES_libasm-dev = "${libdir}/libasm.so ${includedir}/elfutils/libasm.h"
> +FILES_libdw-dev  = "${libdir}/libdw.so  ${includedir}/dwarf.h ${includedir}/elfutils/libdw*.h"
>   # Some packages have the version preceeding the .so instead properly
>   # versioned .so.<version>, so we need to reorder and repackage.
> -FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
> -FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
> +#FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
> +#FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
>
>   # The package contains symlinks that trip up insane
> -INSANE_SKIP_${PN} = "dev-so"
> -
> +INSANE_SKIP_libdw = "dev-so"
>


