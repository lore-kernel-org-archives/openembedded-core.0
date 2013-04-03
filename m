Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNQEI-0005Vd-3k
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:08:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Apr 2013 08:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="222393912"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Apr 2013 08:50:29 -0700
Message-ID: <515C4FC5.70808@linux.intel.com>
Date: Wed, 03 Apr 2013 08:50:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <51493825.5050802@linux.intel.com>
	<1363770696-2908-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1363770696-2908-1-git-send-email-marcin.juszkiewicz@linaro.org>
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
X-List-Received-Date: Wed, 03 Apr 2013 16:08:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/20/2013 02:11 AM, Marcin Juszkiewicz wrote:
> Elfutils contains libraries which are often used by other
> applications/libraries. But sometimes there are also conflicting
> packages needed - for example libdw-dev conflicts with libdwarf-dev
> because both provide /usr/include/dwarf.h header file.
>
> This change makes it more in line with Debian based systems. It also
> allows to have libdwarf-dev installed in image without having to go into
> ugly hacks or rewriting 3rdparty software.
>

This change seems to cause some issues with multilib build with lib32 on 
x86-64:
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_parisc.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_arm.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_ia64.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_ppc64.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_alpha.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_i386.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_mips.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_s390.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_sparc.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_x86_64.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_m68k.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_sh.so'
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: lib32-libdw path '/work/x86-pokymllib32-linux/lib32-elfutils/0.148-r11/packages-split/lib32-libdw/usr/lib/elfutils/libebl_ppc.so'

If you could resolve that then we can take this change.

Thanks
	Sau!


> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-devtools/elfutils/elfutils_0.148.bb | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> index e8d58fb..dfed235 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> @@ -68,7 +68,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
>   BBCLASSEXTEND = "native nativesdk"
>
>   # Package utilities separately
> -PACKAGES =+ "${PN}-binutils"
> +PACKAGES =+ "${PN}-binutils libelf libasm libdw libdw-dev libasm-dev libelf-dev"
>   FILES_${PN}-binutils = "\
>       ${bindir}/eu-addr2line \
>       ${bindir}/eu-ld \
> @@ -77,11 +77,16 @@ FILES_${PN}-binutils = "\
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


