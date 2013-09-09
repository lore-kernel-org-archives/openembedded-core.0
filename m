Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1436BE35
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 15:40:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 09 Sep 2013 08:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,866,1371106800"; d="scan'208";a="393108726"
Received: from unknown (HELO [10.255.15.38]) ([10.255.15.38])
	by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2013 08:40:46 -0700
Message-ID: <522DEBFE.6030401@linux.intel.com>
Date: Mon, 09 Sep 2013 08:40:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
References: <CAFyqS9q=_k6rH6zbUng6SOuqBrkj6O=C922+cpDHK33MYrP0-w@mail.gmail.com>
	<CAFyqS9pmYDs6DW0MtgTo9W89xGxxhiw2QXysyuy+iB4Pw+AUaQ@mail.gmail.com>
In-Reply-To: <CAFyqS9pmYDs6DW0MtgTo9W89xGxxhiw2QXysyuy+iB4Pw+AUaQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool: fix resolve of variable lt_sysroot
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
X-List-Received-Date: Mon, 09 Sep 2013 15:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/09/2013 03:18 AM, Hans Beckérus wrote:
> This patch updates libtool.m4 (and its output) to correct a problem
> with variable 'lt_sysroot' not being properly resolved if the option
> '--with[-libtool]-sysroot' is not provided when running the 'configure'
> script for a package.
>
> According to the help text ouput from 'configure':
>   --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>                         (or the compiler's sysrooot if not specified).
>
> Due to mixed up cases in a switch statement, when checking if the option
> was specified or not, wrong actions were taken resulting in an
> incorrect sysroot and failures to properly locate e.g. .la files.
>
> For current upstream status see:
> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>
> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> ---
>   meta/recipes-devtools/libtool/
> libtool-2.4.2.inc    |   1 +
>   .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 266 +++++++++++++++++++++
>   2 files changed, 267 insertions(+)

The patch file seems to be corrupted, did not apply correctly.  Also why 
are you patching the configure file since we generate those from the 
configure.ac which will be correct when the .m4 file is patched and 
autoconf does it's thing.

Thanks

Sau!

>   create mode 100644
> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index bb4ddf0..92e4949 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>      file://respect-fstack-protector.patch \
>              file://norm-rpath.patch \
>              file://dont-depend-on-help2man.patch \
> +           file://fix-resolve-lt-sysroot.patch \
>             "
>
>   SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
> diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> new file mode 100644
> index 0000000..8a4fde1
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> @@ -0,0 +1,266 @@
> +
> +Upstream-Status: Pending
> +
> +This patch updates libtool.m4 (and its output) to correct a problem
> +with variable 'lt_sysroot' not being properly resolved if the option
> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
> +script for a package.
> +
> +I have also reported the problem to libtool here
> +
> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
> +
> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> +---
> +diff -ur libtool-2.4.2.orig/configure libtool-2.4.2/configure
> +--- libtool-2.4.2.orig/configure 2013-09-05 10:37:50.982677000 +0200
> ++++ libtool-2.4.2/configure 2013-09-05 10:12:24.551681000 +0200
> +@@ -6814,7 +6814,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -6822,7 +6822,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/libltdl/configure libtool-2.4.2/libltdl/configure
> +--- libtool-2.4.2.orig/libltdl/configure 2013-09-05 10:37:24.738048000 +0200
> ++++ libtool-2.4.2/libltdl/configure 2013-09-05 10:38:44.540026000 +0200
> +@@ -6027,7 +6027,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -6035,7 +6035,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
> libtool-2.4.2/libltdl/m4/libtool.m4
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4 2013-09-05
> 10:37:24.690013000 +0200
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05 12:05:51.560281000 +0200
> +@@ -1234,7 +1234,7 @@
> + dnl in case the user passed a directory name.
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -1242,7 +1242,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    AC_MSG_RESULT([${with_libtool_sysroot}])
> +diff -ur libtool-2.4.2.orig/tests/cdemo/configure
> libtool-2.4.2/tests/cdemo/configure
> +--- libtool-2.4.2.orig/tests/cdemo/configure 2013-09-05
> 10:37:24.793021000 +0200
> ++++ libtool-2.4.2/tests/cdemo/configure 2013-09-05 10:39:01.039463000 +0200
> +@@ -5907,7 +5907,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -5915,7 +5915,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/demo/configure
> libtool-2.4.2/tests/demo/configure
> +--- libtool-2.4.2.orig/tests/demo/configure 2013-09-05 10:37:24.878048000 +0200
> ++++ libtool-2.4.2/tests/demo/configure 2013-09-05 10:39:15.357833000 +0200
> +@@ -5905,7 +5905,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -5913,7 +5913,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/depdemo/configure
> libtool-2.4.2/tests/depdemo/configure
> +--- libtool-2.4.2.orig/tests/depdemo/configure 2013-09-05
> 10:37:25.003086000 +0200
> ++++ libtool-2.4.2/tests/depdemo/configure 2013-09-05 10:39:33.424217000 +0200
> +@@ -5902,7 +5902,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -5910,7 +5910,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/f77demo/configure
> libtool-2.4.2/tests/f77demo/configure
> +--- libtool-2.4.2.orig/tests/f77demo/configure 2013-09-05
> 10:37:25.232029000 +0200
> ++++ libtool-2.4.2/tests/f77demo/configure 2013-09-05 12:02:54.749911000 +0200
> +@@ -6887,7 +6887,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -6895,7 +6895,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/fcdemo/configure
> libtool-2.4.2/tests/fcdemo/configure
> +--- libtool-2.4.2.orig/tests/fcdemo/configure 2013-09-05
> 10:37:25.320032000 +0200
> ++++ libtool-2.4.2/tests/fcdemo/configure 2013-09-05 12:03:34.350859000 +0200
> +@@ -6986,7 +6986,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -6994,7 +6994,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/mdemo/configure
> libtool-2.4.2/tests/mdemo/configure
> +--- libtool-2.4.2.orig/tests/mdemo/configure 2013-09-05
> 10:37:25.458028000 +0200
> ++++ libtool-2.4.2/tests/mdemo/configure 2013-09-05 12:04:04.233622000 +0200
> +@@ -5934,7 +5934,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -5942,7 +5942,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/mdemo2/configure
> libtool-2.4.2/tests/mdemo2/configure
> +--- libtool-2.4.2.orig/tests/mdemo2/configure 2013-09-05
> 10:37:25.564096000 +0200
> ++++ libtool-2.4.2/tests/mdemo2/configure 2013-09-05 12:04:36.688447000 +0200
> +@@ -5907,7 +5907,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -5915,7 +5915,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/pdemo/configure
> libtool-2.4.2/tests/pdemo/configure
> +--- libtool-2.4.2.orig/tests/pdemo/configure 2013-09-05
> 10:37:25.619085000 +0200
> ++++ libtool-2.4.2/tests/pdemo/configure 2013-09-05 12:04:50.578801000 +0200
> +@@ -5910,7 +5910,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -5918,7 +5918,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
> +diff -ur libtool-2.4.2.orig/tests/tagdemo/configure
> libtool-2.4.2/tests/tagdemo/configure
> +--- libtool-2.4.2.orig/tests/tagdemo/configure 2013-09-05
> 10:37:25.727040000 +0200
> ++++ libtool-2.4.2/tests/tagdemo/configure 2013-09-05 12:05:11.896353000 +0200
> +@@ -6926,7 +6926,7 @@
> +
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> +    fi
> +@@ -6934,7 +6934,7 @@
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> ++ yes|'')
> +    ;; #(
> +  *)
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> ${with_libtool_sysroot}" >&5
>
> --
> 1.8.3.3
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

