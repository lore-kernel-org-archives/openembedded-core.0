Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 65E0A602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 17:51:35 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAKHpVuS028105
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Wed, 20 Nov 2019 11:51:32 -0600
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20191120161941.13360-1-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <5ff9a9ed-a8c2-e259-cbae-b327baf187ea@kernel.crashing.org>
Date: Wed, 20 Nov 2019 11:51:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120161941.13360-1-ross.burton@intel.com>
Subject: Re: [PATCH] rpm: use libgcrypt instead of NSS for cryptography
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2019 17:51:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Just as an ack.. Please get rid of NSS/NSPR ASAP, and move to libgcrypt.  Long
term it's a much much better solution.

--Mark

On 11/20/19 10:19 AM, Ross Burton wrote:
> RPM 4.15 by default will use libgcrypt instead of NSS for cryptography
> functions, but as we didn't have libgcrypt in DEPENDS it kept using NSS.
> 
> As RPM is the sole user of NSS/NSPR in oe-core, moving to libgcrypt can make a
> noticable difference to build time.  For example, building rpm (and packaging it
> as RPMs) from scratch is five minutes faster with libgcrypt.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../rpm/files/gcrypt-use-pkgconfig.patch      | 51 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  5 +-
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch b/meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch
> new file mode 100644
> index 00000000000..8c72d2310b6
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch
> @@ -0,0 +1,51 @@
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/942]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 3f6cda568853bf7878df704adc75d4a78d75346c Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Wed, 20 Nov 2019 13:06:51 +0000
> +Subject: [PATCH] configure.ac: prefer pkg-config to find libgcrypt
> +
> +libgcrypt from 1.8.5 provides a pkg-config file as well as the traditional
> +libgcrypt-config script.  As pkg-config is more resiliant in the face of
> +complicated build environments (for example cross-compilation and sysroots)
> +prefer the pkg-config file, falling back to libgcrypt-config if that doesn't
> +exist.
> +---
> + configure.ac | 23 +++++++++++++++--------
> + 1 file changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0a3a9bbf4..6a3ea3615 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -395,14 +395,21 @@ AC_SUBST(WITH_OPENSSL_LIB)
> + WITH_LIBGCRYPT_INCLUDE=
> + WITH_LIBGCRYPT_LIB=
> + if test "$with_crypto" = libgcrypt ; then
> +-AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
> +-if test notfound != "$LIBGCRYPT_CONFIG" ; then
> +-WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
> +-WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
> +-fi
> +-if test -z "$WITH_LIBGCRYPT_LIB" ; then
> +-AC_MSG_ERROR([libgcrypt not found])
> +-fi
> ++  # libgcrypt 1.8.5 onwards ships a pkg-config file so prefer that
> ++  PKG_CHECK_MODULES([LIBGCRYPT], [libgcrypt], [have_libgcrypt=yes], [have_libgcrypt=no])
> ++  if test "$have_libgcrypt" = "yes"; then
> ++    WITH_LIBGCRYPT_INCLUDE="$LIBGCRYPT_CFLAGS"
> ++    WITH_LIBGCRYPT_LIB="$LIBGCRYPT_LIBS"
> ++  else
> ++    AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
> ++      if test notfound != "$LIBGCRYPT_CONFIG" ; then
> ++        WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
> ++        WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
> ++     fi
> ++     if test -z "$WITH_LIBGCRYPT_LIB" ; then
> ++       AC_MSG_ERROR([libgcrypt not found])
> ++    fi
> ++  fi
> + fi
> + 
> + AM_CONDITIONAL([WITH_LIBGCRYPT],[test "$with_crypto" = libgcrypt])
> diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> index 4fa2d764fb9..f033cf33144 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> @@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
>             file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
>             file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
>             file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
> +           file://gcrypt-use-pkgconfig.patch \
>             "
>  
>  PE = "1"
> @@ -45,7 +46,7 @@ SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
>  
>  S = "${WORKDIR}/git"
>  
> -DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
> +DEPENDS = "libarchive libgcrypt db file popt xz bzip2 dbus elfutils python3"
>  DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
>  
>  inherit autotools gettext pkgconfig python3native
> @@ -54,7 +55,7 @@ export PYTHON_ABI
>  # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
>  EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
>  
> -EXTRA_OECONF_append = " --without-lua --enable-python"
> +EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=libgcrypt"
>  EXTRA_OECONF_append_libc-musl = " --disable-nls"
>  
>  # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
> 

