Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 440B566114
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 18:58:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2014 11:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1044,1389772800"; d="scan'208";a="539773252"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2014 11:57:43 -0700
Message-ID: <53726B27.1050609@linux.intel.com>
Date: Tue, 13 May 2014 11:57:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Drew Moseley <drew@moseleynet.net>, 
	openembedded-core@lists.openembedded.org
References: <1399924858-26946-1-git-send-email-drew@moseleynet.net>
In-Reply-To: <1399924858-26946-1-git-send-email-drew@moseleynet.net>
Subject: Re: [PATCH] glib-2.0: Do not use readlink to set target paths.
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
X-List-Received-Date: Tue, 13 May 2014 18:58:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2014 01:00 PM, Drew Moseley wrote:
> From: Drew Moseley <drew_moseley@mentor.com>
>
> Do not use readlink to set ABS_GLIB_RUNTIME_LIBDIR when cross
> compiling.  Doing so causes host paths to potentially pollute the
> target.  Unfortunately in this case we don't actually convert to
> an absolute path.
>
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>   ...c-Do-not-use-readlink-when-cross-compilin.patch |   31 ++++++++++++++++++++
>   meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |    1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
>

So we just updated to 2.40 version of glib-2.0, can you verify if this 
issue is fixed in 2.40 and of not, please rebase this patch against the 
newer version of glib-2.0.

Thanks
	Sau!

> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
> new file mode 100644
> index 0000000..0be3631
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
> @@ -0,0 +1,31 @@
> +commit 9b38d507ec37b3d7d4df6095fa7ed16b47d399f7
> +Author: Drew Moseley <drew_moseley@mentor.com>
> +Date:   Sat Mar 29 21:10:43 2014 -0400
> +
> +    configure.ac: Do not use readlink when cross compiling.
> +
> +    Do not use readlink to set ABS_GLIB_RUNTIME_LIBDIR when cross
> +    compiling.  Doing so causes host paths to potentially pollute
> +    the target.
> +
> +    Note that in this case the path is not converted to absolute if
> +    it contains any ".." references so it's not completely correct.
> +
> +    Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=727575]
> +    Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> +
> +diff -rub glib-2.38.2.orig/configure.ac glib-2.38.2/configure.ac
> +--- glib-2.38.2.orig/configure.ac	2014-04-03 20:17:13.035567143 -0400
> ++++ glib-2.38.2/configure.ac	2014-04-03 20:19:07.071566057 -0400
> +@@ -275,7 +275,11 @@
> +            [],
> + 	   [with_runtime_libdir=""])
> + GLIB_RUNTIME_LIBDIR="$with_runtime_libdir"
> ++AS_IF([ test $cross_compiling = yes ], [
> ++ABS_GLIB_RUNTIME_LIBDIR="$libdir/$with_runtime_libdir"
> ++], [
> + ABS_GLIB_RUNTIME_LIBDIR="`readlink -m $libdir/$with_runtime_libdir`"
> ++])
> + AC_SUBST(GLIB_RUNTIME_LIBDIR)
> + AC_SUBST(ABS_GLIB_RUNTIME_LIBDIR)
> + AM_CONDITIONAL(HAVE_GLIB_RUNTIME_LIBDIR, [test "x$with_runtime_libdir" != "x"])
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> index 4052950..1138dae 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> @@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://gtest-skip-fixes.patch \
>              file://gio-test-race.patch \
>              file://uclibc.patch \
> +           file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
>             "
>
>   SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>

