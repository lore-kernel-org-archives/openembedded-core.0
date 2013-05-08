Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ua7WZ-0004sj-LA
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 18:47:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 May 2013 09:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="299476772"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by azsmga001.ch.intel.com with ESMTP; 08 May 2013 09:29:22 -0700
Message-ID: <518A7D62.6050606@linux.intel.com>
Date: Wed, 08 May 2013 09:29:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1367931613-25770-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1367931613-25770-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gmp: updated to 5.1.1
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
X-List-Received-Date: Wed, 08 May 2013 16:47:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2013 06:00 AM, Bogdan Marinescu wrote:
> A number of patches are now part of the upstream.
> Tested by compiling and running core-image-minimal/qemux86.
>

This patch is not applying cleaning, please verify it. see below


> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   .../gmp/gmp-5.1.0/187b7b1646ee.patch               |   44 --------------------
>   .../gmp/gmp-5.1.0/obsolete_automake_macros.patch   |   13 ------
>   .../gmp/{gmp-5.1.0 => gmp-5.1.1}/configure.patch   |    6 +--
>   meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   41 ------------------
>   meta/recipes-support/gmp/gmp_5.1.0.bb              |   15 -------
>   meta/recipes-support/gmp/gmp_5.1.1.bb              |   10 +++++
>   6 files changed, 13 insertions(+), 116 deletions(-)
>   delete mode 100644 meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
>   delete mode 100644 meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch
>   rename meta/recipes-support/gmp/{gmp-5.1.0 => gmp-5.1.1}/configure.patch (97%)
>   delete mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
>   delete mode 100644 meta/recipes-support/gmp/gmp_5.1.0.bb
>   create mode 100644 meta/recipes-support/gmp/gmp_5.1.1.bb
>
> diff --git a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch b/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
> deleted file mode 100644
> index 486f8c5..0000000
> --- a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Upstream-status: Backport
> -
> -# HG changeset patch
> -# User Torbjorn Granlund <tege@gmplib.org>
> -# Date 1357413121 -3600
> -# Node ID 187b7b1646ee0ace782768bb36117b62c8408bb6
> -# Parent  87a24013e9ee2cabf74e32282c18584a2c669009
> -(aarch64): Make add_ssaaaa and sub_ddmmss actually work.
> -
> -diff -r 87a24013e9ee -r 187b7b1646ee longlong.h
> ---- a/longlong.h	Fri Jan 04 16:32:01 2013 +0100
> -+++ b/longlong.h	Sat Jan 05 20:12:01 2013 +0100
> -@@ -530,23 +530,16 @@
> - #endif /* __arm__ */
> -
> - #if defined (__aarch64__) && W_TYPE_SIZE == 64
> -+/* FIXME: Extend the immediate range for the low word by using both
> -+   ADDS and SUBS, since they set carry in the same way.  */
> - #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
> --  __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"			\
> -+  __asm__ ("adds\t%1, %x4, %5\n\tadc\t%0, %x2, %x3"			\
> - 	   : "=r" (sh), "=&r" (sl)					\
> --	   : "r" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
> -+	   : "rZ" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
> - #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
> --  do {									\
> --    if (__builtin_constant_p (bl))					\
> --      {									\
> --	__asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
> --		 : "=r" (sh), "=&r" (sl)				\
> --		 : "r" (ah), "r" (bh), "r" (al), "rI" (bl) __CLOBBER_CC); \
> --      }									\
> --    else /* only bh might be a constant */				\
> --      __asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
> --	       : "=r" (sh), "=&r" (sl)					\
> --	       : "r" (ah), "rZ" (bh), "r" (al), "rI" (bl) __CLOBBER_CC);\
> --    } while (0)
> -+  __asm__ ("subs\t%1, %x4, %5\n\tsbc\t%0, %x2, %x3"			\
> -+	   : "=r,r" (sh), "=&r,&r" (sl)					\
> -+	   : "rZ,rZ" (ah), "rZ,rZ" (bh), "r,Z" (al), "rI,r" (bl) __CLOBBER_CC)
> - #define umul_ppmm(ph, pl, m0, m1) \
> -   do {									\
> -     UDItype __m0 = (m0), __m1 = (m1);					\
> -
> diff --git a/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch b/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch
> deleted file mode 100644
> index adff6ca..0000000
> --- a/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Accepted
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd gmp-5.1.0/configure.in gmp-5.1.0/configure.in
> ---- gmp-5.1.0/configure.in	2012-12-18 21:05:09.000000000 +0200
> -+++ gmp-5.1.0/configure.in	2013-01-02 06:00:41.552958778 +0200
> -@@ -67,7 +67,7 @@
> - dnl  so update there too if changing anything.
> - dnl
> - AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
> --AM_CONFIG_HEADER(config.h:config.in)
> -+AC_CONFIG_HEADERS(config.h:config.in)
> - AM_MAINTAINER_MODE
> diff --git a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch b/meta/recipes-support/gmp/gmp-5.1.1/configure.patch
> similarity index 97%
> rename from meta/recipes-support/gmp/gmp-5.1.0/configure.patch
> rename to meta/recipes-support/gmp/gmp-5.1.1/configure.patch
> index fb5435c..591ea79 100644
> --- a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch
> +++ b/meta/recipes-support/gmp/gmp-5.1.1/configure.patch
> @@ -115,9 +115,9 @@ diff -Nurd gmp-5.1.0/acinclude.m4 gmp-5.1.0/acinclude.m4
>    ])
>
>
> -diff -Nurd gmp-5.1.0/configure.in gmp-5.1.0/configure.in
> ---- gmp-5.1.0/configure.in	2012-12-18 21:05:09.000000000 +0200
> -+++ gmp-5.1.0/configure.in	2013-01-02 05:19:26.977013073 +0200
> +diff -Nurd gmp-5.1.0/configure.ac gmp-5.1.0/configure.ac
> +--- gmp-5.1.0/configure.ac	2012-12-18 21:05:09.000000000 +0200
> ++++ gmp-5.1.0/configure.ac	2013-01-02 05:19:26.977013073 +0200
>   @@ -29,13 +29,6 @@
>    AC_PREREQ(2.59)
>    AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see http://gmplib.org/manual/Reporting-Bugs.html], gmp)
> diff --git a/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch b/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
> deleted file mode 100644
> index 76d3a00..0000000
> --- a/meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Upstream-Status: Pending
> -
> -Add X32 support in gmp configure.
> -
> -Patch Originator: H J Lu @ Intel
> -Patch modified for Yocto by Nitin Kamble
> -Signed Off By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/11/21
> -
> ---- gmp-4.3.2/configure.in.x32	2011-08-12 15:03:06.143548291 -0700
> -+++ gmp-4.3.2/configure.in	2011-08-12 15:06:20.580595316 -0700
> -@@ -1499,6 +1499,21 @@ case $host in
> - 	    path_64="x86_64/atom x86_64"
> - 	    ;;
> - 	esac
> -+
> -+	# X32 support.
> -+	case x"$path_64" in
> -+	  xx86_64*)
> -+	    abilist="x32 64 32"
> -+	    path_x32="$path_64"
> -+	    limb_x32=longlong
> -+	    cclist_x32="gcc"
> -+	    gcc_x32_cflags="-O2 -mx32"
> -+	    any_x32_testlist="sizeof-long-4"
> -+	    CALLING_CONVENTIONS_OBJS_x32='amd64call.lo amd64check$U.lo'
> -+	    SPEED_CYCLECOUNTER_OBJ_x32=x86_64.lo
> -+	    cyclecounter_size_x32=2
> -+	    ;;
> -+	esac
> - 	;;
> -     esac
> -     ;;
> -@@ -3039,7 +3058,7 @@ if test "$gmp_asm_syntax_testing" != no;
> - 	      GMP_INCLUDE_MPN(x86/darwin.m4) ;;
> - 	  esac
> -           ;;
> --        64)
> -+        64|x32)
> -           GMP_INCLUDE_MPN(x86_64/x86_64-defs.m4)
> - 	  case $host in
> - 	    *-*-darwin*)
> diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support/gmp/gmp_5.1.0.bb
> deleted file mode 100644
> index 6591ebe..0000000
> --- a/meta/recipes-support/gmp/gmp_5.1.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require gmp.inc
> -LICENSE="LGPLv3&GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
> -
> -PR = "r1"
> -
> -SRC_URI_append = " file://use-includedir.patch \
> -                   file://gmp_fix_for_x32.patch \
> -                   file://187b7b1646ee.patch \
> -                   file://obsolete_automake_macros.patch \
> -                   "
> -
> -SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
> -SRC_URI[sha256sum] = "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a3181164ad2fad5eefc796"

These checksums are different that what's in OE-Core!

PR = "r2"

SRC_URI[md5sum] = "cf6d7cb5915f29ce0fc41d042205c080"
SRC_URI[sha256sum] = 
"ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb05ca9bccd990794dc"

Are you using a current master?

Sau!

> diff --git a/meta/recipes-support/gmp/gmp_5.1.1.bb b/meta/recipes-support/gmp/gmp_5.1.1.bb
> new file mode 100644
> index 0000000..d6dcb97
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp_5.1.1.bb
> @@ -0,0 +1,10 @@
> +require gmp.inc
> +LICENSE="LGPLv3&GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
> +
> +SRC_URI_append = " file://use-includedir.patch \
> +                   "
> +
> +SRC_URI[md5sum] = "2fa018a7cd193c78494525f236d02dd6"
> +SRC_URI[sha256sum] = "a0d4779f48b36519dfaceb5f987a7c76fcac223258bebea3bb2244310970afad"
>


