Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYPj-0006Ds-8B
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:06:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 08:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="192814171"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 08:53:53 -0700
Message-ID: <50535311.6010305@linux.intel.com>
Date: Fri, 14 Sep 2012 08:53:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347531032-3493-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347531032-3493-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libx11: update patch to a backport from upstream git
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
X-List-Received-Date: Fri, 14 Sep 2012 16:06:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 03:10 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../xorg-lib/libx11/keysymdef_include.patch        |   35 +++++++++-----------
>   1 file changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
> index ba65319..8c50bb7 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
> +++ b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
> @@ -1,7 +1,7 @@
> -From 547937d82084f2cce7e3f0849b5112a20c467146 Mon Sep 17 00:00:00 2001
> +From d45b3fc19fbe95c41afc4e51d768df6d42332010 Mon Sep 17 00:00:00 2001
>   From: Ross Burton <ross.burton@intel.com>
> -Date: Tue, 11 Sep 2012 17:39:12 +0100
> -Subject: [PATCH] Allow overriding location of keysymdef.h
> +Date: Wed, 12 Sep 2012 13:39:40 +0000
> +Subject: Allow overriding location of keysymdef.h
>
>   Currently keysymdef.h is found by using the includedir of xproto.  This doesn't
>   work when cross-compiling with a sysroot as that ends up being /usr/include/X11,
> @@ -12,36 +12,31 @@ and verify that the specified or found path exists.
>
>   (original patch by Martin Jansa <martin.jansa@gmail.com>, revised by myself)
>
> -Upstream-Status: Submitted [xorg-devel]
> +Upstream-Status: Backport
>   Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
> +Reviewed-by: Daniel Stone <daniel@fooishbar.org>
>   ---
> - configure.ac |   13 ++++++++++++-
> - 1 file changed, 12 insertions(+), 1 deletion(-)
> -
>   diff --git a/configure.ac b/configure.ac
> -index 48a0c8a..200db15 100644
> +index 48a0c8a..a45f9d9 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -306,7 +306,18 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
> +@@ -306,7 +306,15 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
>    # Find keysymdef.h
>    #
>    AC_MSG_CHECKING([keysym definitions])
>   -KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
> -+AC_ARG_WITH(keysymdefdir,
> -+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)]),
> -+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
> -+
> -+if test x$KEYSYMDEFDIR = x; then
> -+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
> -+fi
> ++AC_ARG_WITH([keysymdefdir],
> ++        [AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)])],
> ++        [KEYSYMDEFDIR=$withval],
> ++        [KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11])
>   +
> -+if test ! -d $KEYSYMDEFDIR; then
> ++if test ! -d "$KEYSYMDEFDIR"; then
>   +	AC_MSG_ERROR([$KEYSYMDEFDIR doesn't exist or isn't a directory])
>   +fi
>   +
>    FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
>    for i in $FILES; do
>        if test -f "$KEYSYMDEFDIR/$i"; then
> ---
> -1.7.10.4
> -
> +--
> +cgit v0.9.0.2-2-gbebe
>

Merged into OE-Core

Thanks
	Sau!



