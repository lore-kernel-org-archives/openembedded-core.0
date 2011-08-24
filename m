Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QwFy1-0000cy-EZ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 18:06:13 +0200
Received: by ywa12 with SMTP id 12so935039ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=sq4M6ZY8e+FxKVFdA0ooSrsnhpqEvktDMFRNDB24XmM=;
	b=NSo6AtQcwQSARk8k8HCMR5q70NkjCrQAoFbat72yV0gzvA3i1h1EOVlPo5yHXCmbrc
	wJ8aE4KGdyWxxNHAJ13oRTa3hrIb6QVpA9YIIv4FoQTNLyNvPSAsn1a2A+aZNDLHJS/Y
	UwKj8Mf8oLX+YP9JRWfdRXU+TaOl4zA6I876k=
Received: by 10.91.210.15 with SMTP id m15mr2177269agq.126.1314201685655;
	Wed, 24 Aug 2011 09:01:25 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l14sm1007985anl.8.2011.08.24.09.01.20
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 09:01:22 -0700 (PDT)
Message-ID: <4E55204E.1030907@gmail.com>
Date: Wed, 24 Aug 2011 09:01:18 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1314162530-4606-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1314162530-4606-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH v2] gcc-4.6: Drop gcc-poison-parameters.patch as its not need
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
X-List-Received-Date: Wed, 24 Aug 2011 16:06:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/2011 10:08 PM, Kumar Gala wrote:
> The gcc-poison-parameters was added specifically to deal with an issue
> on ppc targets and a bug when we build with -Os -frename-registers.
>
> This bug below reports the issue and is fixed in gcc-4.6.x:
>
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44618

Someone IIRC reported that Os generated gcc-runtime and root file system 
did not boot even with gcc 4.6 thats why that patch was still in there. 
Can you confirm thats not the case anymore ?

>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
> * v2: add changse to recipe (forgot to git-add them ;)
>
>   meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
>   .../gcc/gcc-4.6/gcc-poison-parameters.patch        |   76 --------------------
>   2 files changed, 1 insertions(+), 78 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index 0a148b4..2f1ae81 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r7"
> +PR = "r8"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -62,7 +62,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
>   	   file://64bithack.patch \
>   	   file://optional_libstdc.patch \
>   	   file://disable_relax_pic_calls_flag.patch \
> -	   file://gcc-poison-parameters.patch \
>   	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
>   	   file://COLLECT_GCC_OPTIONS.patch \
>              file://volatile_access_backport.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch
> deleted file mode 100644
> index 58bf32f..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -Upstream-Status: Pending
> -
> -gcc: add poison parameters detection
> -
> -Add the logic that, if not configured with "--enable-target-optspace",
> -gcc will meet error when build target app with "-Os" option.
> -This could avoid potential binary crash.
> -
> -Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
> -
> -Index: gcc-4.6.0/gcc/config.in
> -===================================================================
> ---- gcc-4.6.0.orig/gcc/config.in
> -+++ gcc-4.6.0/gcc/config.in
> -@@ -150,6 +150,12 @@
> - #endif
> -
> -
> -+/* Define to enable target optspace support. */
> -+#ifndef USED_FOR_TARGET
> -+#undef ENABLE_TARGET_OPTSPACE
> -+#endif
> -+
> -+
> - /* Define if you want all operations on RTL (the basic data structure of the
> -    optimizer and back end) to be checked for dynamic type safety at runtime.
> -    This is quite expensive. */
> -Index: gcc-4.6.0/gcc/configure
> -===================================================================
> ---- gcc-4.6.0.orig/gcc/configure
> -+++ gcc-4.6.0/gcc/configure
> -@@ -26434,6 +26434,13 @@ $as_echo "#define ENABLE_LIBQUADMATH_SUP
> - fi
> -
> -
> -+if test x"$enable_target_optspace" != x; then :
> -+
> -+$as_echo "#define ENABLE_TARGET_OPTSPACE 1">>confdefs.h
> -+
> -+fi
> -+
> -+
> - # Configure the subdirectories
> - # AC_CONFIG_SUBDIRS($subdirs)
> -
> -Index: gcc-4.6.0/gcc/configure.ac
> -===================================================================
> ---- gcc-4.6.0.orig/gcc/configure.ac
> -+++ gcc-4.6.0/gcc/configure.ac
> -@@ -4907,6 +4907,11 @@ if test "${ENABLE_LIBQUADMATH_SUPPORT}"
> - fi
> -
> -
> -+AC_SUBST(enable_target_optspace)
> -+if test x"$enable_target_optspace" != x; then
> -+  AC_DEFINE(ENABLE_TARGET_OPTSPACE, 1, [Define to enable target optspace support.])
> -+fi
> -+
> - # Configure the subdirectories
> - # AC_CONFIG_SUBDIRS($subdirs)
> -
> -Index: gcc-4.6.0/gcc/opts.c
> -===================================================================
> ---- gcc-4.6.0.orig/gcc/opts.c
> -+++ gcc-4.6.0/gcc/opts.c
> -@@ -605,6 +605,10 @@ default_options_optimization (struct gcc
> -     maybe_set_param_value (PARAM_MIN_CROSSJUMP_INSNS,
> - 			   default_param_value (PARAM_MIN_CROSSJUMP_INSNS),
> - 			   opts->x_param_values, opts_set->x_param_values);
> -+#ifndef ENABLE_TARGET_OPTSPACE
> -+  if (optimize_size == 1)
> -+    error ("Do not use -Os option if --enable-target-optspace is not set.");
> -+#endif
> -
> -   /* Allow default optimizations to be specified on a per-machine basis.  */
> -   maybe_default_options (opts, opts_set,



