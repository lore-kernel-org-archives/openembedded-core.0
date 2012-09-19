Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEOOS-0003B5-5y
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:49:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2012 10:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,450,1344236400"; d="scan'208";a="194943855"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 10:36:17 -0700
Message-ID: <505A0291.3030007@linux.intel.com>
Date: Wed, 19 Sep 2012 10:36:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1347616107-26809-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1347616107-26809-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grub: disable lzma, device-mapper, zfs and nvpair
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
X-List-Received-Date: Wed, 19 Sep 2012 17:49:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2012 02:48 AM, Constantin Musca wrote:
> check-if-liblzma-is-disabled.patch: added
> 	- add support for the --enable_liblzma option
>
> [YOCTO #2750]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../grub/files/check-if-liblzma-is-disabled.patch  |   33 ++++++++++++++++++++
>   meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |    6 ++--
>   meta/recipes-bsp/grub/grub_2.00.bb                 |    6 ++--
>   3 files changed, 41 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
>

Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch b/meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
> new file mode 100644
> index 0000000..0eece08
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
> @@ -0,0 +1,33 @@
> +Disable liblzma if --enable-liblzma=no
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1029,10 +1029,20 @@ fi
> +
> + AC_SUBST([LIBGEOM])
> +
> +-AC_CHECK_LIB([lzma], [lzma_code],
> +-             [LIBLZMA="-llzma"
> +-              AC_DEFINE([HAVE_LIBLZMA], [1],
> +-                        [Define to 1 if you have the LZMA library.])],)
> ++AC_ARG_ENABLE([liblzma],
> ++              [AS_HELP_STRING([--enable-liblzma],
> ++                              [enable liblzma integration (default=guessed)])])
> ++if test x"$enable_liblzma" = xno ; then
> ++  liblzma_excuse="explicitly disabled"
> ++fi
> ++
> ++if test x"$liblzma_excuse" = x ; then
> ++  AC_CHECK_LIB([lzma], [lzma_code],
> ++               [LIBLZMA="-llzma"
> ++                AC_DEFINE([HAVE_LIBLZMA], [1],
> ++                          [Define to 1 if you have the LZMA library.])],)
> ++fi
> ++
> + AC_SUBST([LIBLZMA])
> +
> + AC_ARG_ENABLE([libzfs],
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> index 776bf23..14ab9ea 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   # FIXME: We should be able to optionally drop freetype as a dependency
>   DEPENDS = "autogen-native"
>   RDEPENDS_${PN} = "diffutils freetype"
> -PR = "r0"
> +PR = "r1"
>
>   # Native packages do not normally rebuild when the target changes.
>   # Ensure this is built once per HOST-TARGET pair.
> @@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>              file://grub-2.00-fpmath-sse-387-fix.patch \
>   	   file://grub-2.00-fix-enable_execute_stack-check.patch \
>              file://grub-2.00-disable-help2man.patch \
> +           file://check-if-liblzma-is-disabled.patch \
>   	   file://grub-no-unused-result.patch \
>             "
>   SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
> @@ -59,7 +60,8 @@ inherit native
>   inherit deploy
>
>   EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
> -                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix=''"
> +                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix='' \
> +                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>
>   do_mkimage() {
>   	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
> index 821d9ff..8d22424 100644
> --- a/meta/recipes-bsp/grub/grub_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> @@ -13,12 +13,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   DEPENDS = "autogen-native flex-native"
>   RDEPENDS_${PN} = "diffutils freetype"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://grub-install.in.patch \
>             file://grub-2.00-fpmath-sse-387-fix.patch \
>             file://remove-gets.patch \
> +          file://check-if-liblzma-is-disabled.patch \
>             file://40_custom"
>
>   SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
> @@ -32,7 +33,8 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
>   inherit autotools
>   inherit gettext
>
> -EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="""
> +EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
> +               --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>
>   do_install_append () {
>       install -d ${D}${sysconfdir}/grub.d
>


