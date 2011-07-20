Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjaZA-000601-AI
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:28:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2011 10:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="30306600"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 10:24:04 -0700
Message-ID: <4E270F33.6010108@linux.intel.com>
Date: Wed, 20 Jul 2011 10:24:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311091299.30326.38.camel@phil-desktop>
In-Reply-To: <1311091299.30326.38.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] uclibc: improve packaging granularity
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
X-List-Received-Date: Wed, 20 Jul 2011 17:28:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 09:01 AM, Phil Blundell wrote:
> Put each of the libraries into its own package rather than dumping them
> all into libc0.  This saves ~300kB on the installed size of an i586 micro-base-image
> and avoids the need to set the hated LEAD_SONAME.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-core/uclibc/uclibc.inc |   31 ++++++++++++++++---------------
>   1 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 23a8ecb..222c34f 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -13,7 +13,7 @@ SECTION = "libs"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>   		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
>   file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
> -INC_PR = "r2"
> +INC_PR = "r4"
>
>   require uclibc-config.inc
>   STAGINGCC = "gcc-cross-intermediate"
> @@ -49,27 +49,28 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
>   INHIBIT_DEFAULT_DEPS = "1"
>
>   PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
> -
> -LEAD_SONAME = "libc.so"
> +PACKAGES =+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm"
> +PACKAGES =+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
> +
> +FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
> +FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
> +FILES_uclibc-libnsl = "${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so"
> +FILES_uclibc-libresolv = "${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so"
> +FILES_uclibc-libm = "${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so"
> +FILES_uclibc-libdl = "${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so"
> +FILES_uclibc-libutil = "${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so"
> +FILES_uclibc-libpthread = "${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so"
> +FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
>
>   # The last line (gdb and lib1) is for uclinux-uclibc builds
> -uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
> -                   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
> -                   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
> -                   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
> -                   ${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
> +uclibc_baselibs = "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
>                      ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
> -                   ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
> -                   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
> -                   ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
> -                   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
> -                   ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
>                      ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
>                     "
>   FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
>                  ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
>   FILES_ldd = "${bindir}/ldd"
> -FILES_uclibc-dev_append = "\
> +FILES_${PN}-dev_append = "\
>           ${libdir}/lib*.so \
>           ${libdir}/*_nonshared.a \
>           ${libdir}/[S]*crt[1in].o \
> @@ -84,7 +85,7 @@ FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
>   FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
>   FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
>
> -RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>   # uclibc does not really have libsegfault but then using the one from glibc is also not
>   # going to work. So we pretend that we have it to make bitbake not pull other recipes
>   # to satisfy this dependency for the images/tasks

Merged into OE-Core

Thanks
	Sau!


