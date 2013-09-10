Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEE16BE49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 21:33:40 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2013 14:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,880,1371106800"; d="scan'208";a="293250649"
Received: from unknown (HELO [10.255.14.204]) ([10.255.14.204])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Sep 2013 14:33:36 -0700
Message-ID: <522F9030.3020804@linux.intel.com>
Date: Tue, 10 Sep 2013 14:33:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: hans.beckerus@gmail.com
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
In-Reply-To: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 21:33:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2013 07:56 AM, hans.beckerus@gmail.com wrote:
> From: Hans Beckerus <hans.beckerus at gmail.com>
>
> This patch updates libtool.m4 (and its output) to resolve a problem
> with variable 'lt_sysroot' not being properly updated if the option
> '--with[-libtool]-sysroot' is not provided when running the 'configure'
> script for a package.
>
> According to the help text ouput from 'configure':
> --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>                         (or the compiler's sysrooot if not specified).
>
> Due to swapped cases in a switch statement, when checking if the option
> was specified or not, wrong actions were taken resulting in an
> incorrect sysroot and failures to properly locate e.g. .la files.
>
What kind of testing have you done with this?  Have you tried a full 
world build?  This kind of change scares me a little as what issues we 
might have patched around or behavior built into software.

I just completed a world build locally and have failures in file-native 
guile-native, and gtk+3, not sure if we need to invalidate sstate, I am 
starting a clean build.

I have not dug too deeply into this yet.

Sau!



> For current upstream status see:
> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>
> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> ---
>   meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>   .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35 ++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index bb4ddf0..92e4949 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>   	   file://respect-fstack-protector.patch \
>              file://norm-rpath.patch \
>              file://dont-depend-on-help2man.patch \
> +           file://fix-resolve-lt-sysroot.patch \
>             "
>
>   SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
> diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> new file mode 100644
> index 0000000..5a6335b
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> @@ -0,0 +1,35 @@
> +
> +Upstream-Status: Pending
> +
> +This patch updates libtool.m4 (and its output) to resolve a problem
> +with variable 'lt_sysroot' not being properly updated if the option
> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
> +script for a package.
> +
> +I have also reported the problem to libtool here
> +
> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
> +
> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> +---
> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2013-09-05 10:37:24.690013000 +0200
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4	2013-09-05 12:05:51.560281000 +0200
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
>

