Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcLG-0007ER-Qh
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:00:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 May 2012 10:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148038869"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 10:50:42 -0700
Message-ID: <4FBE74F1.8020207@linux.intel.com>
Date: Thu, 24 May 2012 10:50:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFCv3] glib-2.0: upgrade to 2.32.3
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
X-List-Received-Date: Thu, 24 May 2012 18:00:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2012 12:02 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   56 ++++++++++----------
>   .../{glib-2.0_2.32.2.bb =>  glib-2.0_2.32.3.bb}     |    7 ++-
>   2 files changed, 32 insertions(+), 31 deletions(-)
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.2.bb =>  glib-2.0_2.32.3.bb} (91%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> index e9b3b26..0149767 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> @@ -1,37 +1,37 @@
> -Ideally there would be configureation option for this but there is not. We
> -can't allow this code since it could detect the host system's libelf with
> -disasterous effects when cross compiling.
> +From 0040842024725c0e74f84c1719ead6c79ba94aba Mon Sep 17 00:00:00 2001
> +From: Martin Jansa<Martin.Jansa@gmail.com>
> +Date: Wed, 16 May 2012 20:03:34 +0200
> +Subject: [PATCH] configure: add option to disable libelf support
>
> -RP 2012/5/7
> +Upstream-Status: Pending
>
> -Upstream-Status: Pending (would need to be made a configure option to disabe)
> +Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> +---
> + configure.ac |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
>
> -Index: glib-2.32.2/configure.ac
> -===================================================================
> ---- glib-2.32.2.orig/configure.ac	2012-05-07 08:30:04.481149925 +0000
> -+++ glib-2.32.2/configure.ac	2012-05-07 08:31:02.185148588 +0000
> -@@ -1816,23 +1816,7 @@
> +diff --git a/configure.ac b/configure.ac
> +index aa65648..1bb49bf 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1815,6 +1815,9 @@ AC_SUBST(XATTR_LIBS)
> + dnl ************************
>    dnl *** check for libelf ***
>    dnl ************************
> ++AC_ARG_ENABLE(libelf,
> ++              AC_HELP_STRING([--disable-libelf], [build without libelf support]))
> ++if test "x$enable_libelf" != "xno"; then
> +
> + PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
>
> --PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
> --
> --if test $have_libelf = maybe; then
> --  AC_CHECK_LIB([elf], [elf_begin], , [have_libelf=no])
> --  AC_CHECK_LIB([elf], [elf_getshdrstrndx], , [have_libelf=no])
> --  AC_CHECK_LIB([elf], [elf_getshdrnum], , [have_libelf=no])
> --  AC_CHECK_HEADER([libelf.h], , [have_libelf=no])
> --
> --  if test $have_libelf != no; then
> --    LIBELF_LIBS=-lelf
> --    have_libelf = yes
> --  fi
> --fi
> --
> --if test $have_libelf = yes; then
> --  AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
> --fi
> -+have_libelf=no
> +@@ -1835,6 +1838,7 @@ fi
> + if test $have_libelf = yes; then
> +   AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
> + fi
> ++fi
>
>    dnl ****************************************
>    dnl *** platform dependent source checks ***
> +--
> +1.7.8.6
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> similarity index 91%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> index b9b3356..c453941 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> @@ -1,7 +1,6 @@
>   require glib.inc
>
>   PE = "1"
> -PR = "r1"
>
>   DEPENDS += "libffi python-argparse-native zlib"
>   DEPENDS_virtclass-native += "libffi-native python-argparse-native"
> @@ -16,12 +15,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://nodbus.patch \
>              file://nolibelf.patch \
>             "
> -SRC_URI[md5sum] = "5bfdb6197afb90e4dbc7b1bb98f0eae0"
> -SRC_URI[sha256sum] = "b1764abf00bac96e0e93e29fb9715ce75f3583579acac40648e18771d43d6136"
> +SRC_URI[md5sum] = "9bd3ac535c24b6c162be13b2c43c5adc"
> +SRC_URI[sha256sum] = "b65ceb462807e4a2f91c95e4293ce6bbefca308cb44a1407bcfdd9e40363ff4d"
>
>   SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
>   BBCLASSEXTEND = "native nativesdk"
>
> +EXTRA_OECONF = "--disable-libelf"
> +
>   PERLPATH = "${bindir}/env perl"
>   PERLPATH_virtclass-native = "/usr/bin/env perl"
>   PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"

Merged into OE-Core

Thanks
	Sau!


