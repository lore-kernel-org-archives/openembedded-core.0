Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ToGEu-0004bL-Sv
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 17:23:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Dec 2012 08:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,363,1355126400"; d="scan'208";a="270394065"
Received: from unknown (HELO [10.255.14.22]) ([10.255.14.22])
	by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2012 08:08:28 -0800
Message-ID: <50DC727B.5000103@linux.intel.com>
Date: Thu, 27 Dec 2012 08:08:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1356606431-31942-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1356606431-31942-1-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gettext: update to upstream version 0.18.2
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
X-List-Received-Date: Thu, 27 Dec 2012 16:23:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2012 03:07 AM, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 --------------------
Why are we removing this patch, it's important to note this in the 
commit message, did the upstream take this patch or change the code??

Sau!

>   .../gnulib-uclibc-sched_param-def.patch            |    0
>   .../parallel.patch                                 |    0
>   .../wchar-uclibc.patch                             |    0
>   .../{gettext_0.18.1.1.bb => gettext_0.18.2.bb}     |    7 +--
>   5 files changed, 3 insertions(+), 62 deletions(-)
>   delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
>   rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/gnulib-uclibc-sched_param-def.patch (100%)
>   rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/parallel.patch (100%)
>   rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/wchar-uclibc.patch (100%)
>   rename meta/recipes-core/gettext/{gettext_0.18.1.1.bb => gettext_0.18.2.bb} (96%)
>
> diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
> deleted file mode 100644
> index 3d3c400..0000000
> --- a/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -eglibc 2.16 has removed gets so we need to check for it
> -being there before using it.
> -
> -
> -From glibc stdio.h
> -
> -The function has been officially removed in ISO C11.  This opportunity
> -   is used to also remove it from the GNU feature list.  It is now only
> -   available when explicitly using an old ISO C, Unix, or POSIX standard.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h
> -===================================================================
> ---- gettext-0.18.1.1.orig/gettext-runtime/gnulib-lib/stdio.in.h	2010-05-17 12:56:12.000000000 -0700
> -+++ gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h	2012-07-02 22:42:21.292223316 -0700
> -@@ -140,8 +140,10 @@
> - /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> -+#if defined gets
> - #undef gets
> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> -+#endif
> -
> - #if @GNULIB_FOPEN@
> - # if @REPLACE_FOPEN@
> -Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h
> -===================================================================
> ---- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/stdio.in.h	2010-05-24 02:42:46.000000000 -0700
> -+++ gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h	2012-07-02 23:02:33.476281979 -0700
> -@@ -140,8 +140,10 @@
> - /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> -+#if defined gets
> - #undef gets
> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> -+#endif
> -
> - #if @GNULIB_FOPEN@
> - # if @REPLACE_FOPEN@
> -Index: gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h
> -===================================================================
> ---- gettext-0.18.1.1.orig/gettext-tools/libgettextpo/stdio.in.h	2010-05-17 12:58:03.000000000 -0700
> -+++ gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h	2012-07-02 23:01:57.440280253 -0700
> -@@ -140,8 +140,10 @@
> - /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> -+#if defined gets
> - #undef gets
> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> -+#endif
> -
> - #if @GNULIB_FOPEN@
> - # if @REPLACE_FOPEN@
> diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch b/meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
> rename to meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.18.2/parallel.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
> rename to meta/recipes-core/gettext/gettext-0.18.2/parallel.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch b/meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch
> rename to meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.2.bb
> similarity index 96%
> rename from meta/recipes-core/gettext/gettext_0.18.1.1.bb
> rename to meta/recipes-core/gettext/gettext_0.18.2.bb
> index 4639481..3e93089 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.2.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>   LICENSE = "GPLv3+ & LGPL-2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -PR = "r19"
> +PR = "r0"
>   DEPENDS = "gettext-native virtual/libiconv ncurses expat"
>   DEPENDS_class-native = "gettext-minimal-native"
>   PROVIDES = "virtual/libintl virtual/gettext"
> @@ -13,7 +13,6 @@ PROVIDES_class-native = "virtual/gettext-native"
>   RCONFLICTS_${PN} = "proxy-libintl"
>   SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>   	   file://parallel.patch \
> -	   file://remove_gets.patch \
>             "
>
>   SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
> @@ -21,8 +20,8 @@ SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
>                                "
>   LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
>
> -SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
> -SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
> +SRC_URI[md5sum] = "0c86e5af70c195ab8bd651d17d783928"
> +SRC_URI[sha256sum] = "516a6370b3b3f46e2fc5a5e222ff5ecd76f3089bc956a7587a6e4f89de17714c"
>
>   inherit autotools
>
>


