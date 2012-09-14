Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYP2-0006BE-6P
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:06:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2012 08:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="192814071"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 08:53:23 -0700
Message-ID: <505352F3.6030202@linux.intel.com>
Date: Fri, 14 Sep 2012 08:53:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1347524805-13231-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1347524805-13231-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libffi upgrade to 3.0.11
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
X-List-Received-Date: Fri, 14 Sep 2012 16:06:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 01:26 AM, Andrei Dinu wrote:
> Changes :
>
> - Added ax_append_flags.m4 and ax_check_compile_flag.m4 to the m4 directory.
>    The files were missing and aclocal.m4 was generated without those two macros.
>
> - Added a new license md5 checksum to the recipe because the old LICENSE file
>    differs from the new one here :
>
>          OLD : libffi - Copyright (c) 1996-2011
>
>          NEW : libffi - Copyright (c) 1996-2012
>
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>   .../libffi/0001-libffi-update-for-3.0.11.patch     |  171 ++++++++++++++++++++
>   .../libffi/{libffi_3.0.10.bb => libffi_3.0.11.bb}  |    9 +-
>   2 files changed, 176 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch
>   rename meta/recipes-gnome/libffi/{libffi_3.0.10.bb => libffi_3.0.11.bb} (72%)
>
Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch b/meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch
> new file mode 100644
> index 0000000..9592048
> --- /dev/null
> +++ b/meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch
> @@ -0,0 +1,171 @@
> +From 936ab07cec90243a6a336c5aa6205f4edbeb00d5 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Wed, 12 Sep 2012 17:42:29 +0300
> +Subject: [PATCH] libffi update for 3.0.11
> +
> +Upstream status : Pending
> +
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + m4/ax_append_flag.m4        |   69 +++++++++++++++++++++++++++++++++++++++++
> + m4/ax_check_compile_flag.m4 |   72 +++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 141 insertions(+)
> + create mode 100644 m4/ax_append_flag.m4
> + create mode 100644 m4/ax_check_compile_flag.m4
> +
> +diff --git a/m4/ax_append_flag.m4 b/m4/ax_append_flag.m4
> +new file mode 100644
> +index 0000000..1d38b76
> +--- /dev/null
> ++++ b/m4/ax_append_flag.m4
> +@@ -0,0 +1,69 @@
> ++# ===========================================================================
> ++#      http://www.gnu.org/software/autoconf-archive/ax_append_flag.html
> ++# ===========================================================================
> ++#
> ++# SYNOPSIS
> ++#
> ++#   AX_APPEND_FLAG(FLAG, [FLAGS-VARIABLE])
> ++#
> ++# DESCRIPTION
> ++#
> ++#   FLAG is appended to the FLAGS-VARIABLE shell variable, with a space
> ++#   added in between.
> ++#
> ++#   If FLAGS-VARIABLE is not specified, the current language's flags (e.g.
> ++#   CFLAGS) is used.  FLAGS-VARIABLE is not changed if it already contains
> ++#   FLAG.  If FLAGS-VARIABLE is unset in the shell, it is set to exactly
> ++#   FLAG.
> ++#
> ++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION.
> ++#
> ++# LICENSE
> ++#
> ++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
> ++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
> ++#
> ++#   This program is free software: you can redistribute it and/or modify it
> ++#   under the terms of the GNU General Public License as published by the
> ++#   Free Software Foundation, either version 3 of the License, or (at your
> ++#   option) any later version.
> ++#
> ++#   This program is distributed in the hope that it will be useful, but
> ++#   WITHOUT ANY WARRANTY; without even the implied warranty of
> ++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
> ++#   Public License for more details.
> ++#
> ++#   You should have received a copy of the GNU General Public License along
> ++#   with this program. If not, see <http://www.gnu.org/licenses/>.
> ++#
> ++#   As a special exception, the respective Autoconf Macro's copyright owner
> ++#   gives unlimited permission to copy, distribute and modify the configure
> ++#   scripts that are the output of Autoconf when processing the Macro. You
> ++#   need not follow the terms of the GNU General Public License when using
> ++#   or distributing such scripts, even though portions of the text of the
> ++#   Macro appear in them. The GNU General Public License (GPL) does govern
> ++#   all other use of the material that constitutes the Autoconf Macro.
> ++#
> ++#   This special exception to the GPL applies to versions of the Autoconf
> ++#   Macro released by the Autoconf Archive. When you make and distribute a
> ++#   modified version of the Autoconf Macro, you may extend this special
> ++#   exception to the GPL to apply to your modified version as well.
> ++
> ++#serial 2
> ++
> ++AC_DEFUN([AX_APPEND_FLAG],
> ++[AC_PREREQ(2.59)dnl for _AC_LANG_PREFIX
> ++AS_VAR_PUSHDEF([FLAGS], [m4_default($2,_AC_LANG_PREFIX[FLAGS])])dnl
> ++AS_VAR_SET_IF(FLAGS,
> ++  [case " AS_VAR_GET(FLAGS) " in
> ++    *" $1 "*)
> ++      AC_RUN_LOG([: FLAGS already contains $1])
> ++      ;;
> ++    *)
> ++      AC_RUN_LOG([: FLAGS="$FLAGS $1"])
> ++      AS_VAR_SET(FLAGS, ["AS_VAR_GET(FLAGS) $1"])
> ++      ;;
> ++   esac],
> ++  [AS_VAR_SET(FLAGS,["$1"])])
> ++AS_VAR_POPDEF([FLAGS])dnl
> ++])dnl AX_APPEND_FLAG
> +diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
> +new file mode 100644
> +index 0000000..c3a8d69
> +--- /dev/null
> ++++ b/m4/ax_check_compile_flag.m4
> +@@ -0,0 +1,72 @@
> ++# ===========================================================================
> ++#   http://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
> ++# ===========================================================================
> ++#
> ++# SYNOPSIS
> ++#
> ++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS])
> ++#
> ++# DESCRIPTION
> ++#
> ++#   Check whether the given FLAG works with the current language's compiler
> ++#   or gives an error.  (Warnings, however, are ignored)
> ++#
> ++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
> ++#   success/failure.
> ++#
> ++#   If EXTRA-FLAGS is defined, it is added to the current language's default
> ++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
> ++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
> ++#   force the compiler to issue an error when a bad flag is given.
> ++#
> ++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
> ++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
> ++#
> ++# LICENSE
> ++#
> ++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
> ++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
> ++#
> ++#   This program is free software: you can redistribute it and/or modify it
> ++#   under the terms of the GNU General Public License as published by the
> ++#   Free Software Foundation, either version 3 of the License, or (at your
> ++#   option) any later version.
> ++#
> ++#   This program is distributed in the hope that it will be useful, but
> ++#   WITHOUT ANY WARRANTY; without even the implied warranty of
> ++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
> ++#   Public License for more details.
> ++#
> ++#   You should have received a copy of the GNU General Public License along
> ++#   with this program. If not, see <http://www.gnu.org/licenses/>.
> ++#
> ++#   As a special exception, the respective Autoconf Macro's copyright owner
> ++#   gives unlimited permission to copy, distribute and modify the configure
> ++#   scripts that are the output of Autoconf when processing the Macro. You
> ++#   need not follow the terms of the GNU General Public License when using
> ++#   or distributing such scripts, even though portions of the text of the
> ++#   Macro appear in them. The GNU General Public License (GPL) does govern
> ++#   all other use of the material that constitutes the Autoconf Macro.
> ++#
> ++#   This special exception to the GPL applies to versions of the Autoconf
> ++#   Macro released by the Autoconf Archive. When you make and distribute a
> ++#   modified version of the Autoconf Macro, you may extend this special
> ++#   exception to the GPL to apply to your modified version as well.
> ++
> ++#serial 2
> ++
> ++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
> ++[AC_PREREQ(2.59)dnl for _AC_LANG_PREFIX
> ++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
> ++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
> ++  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
> ++  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
> ++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM()],
> ++    [AS_VAR_SET(CACHEVAR,[yes])],
> ++    [AS_VAR_SET(CACHEVAR,[no])])
> ++  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
> ++AS_IF([test x"AS_VAR_GET(CACHEVAR)" = xyes],
> ++  [m4_default([$2], :)],
> ++  [m4_default([$3], :)])
> ++AS_VAR_POPDEF([CACHEVAR])dnl
> ++])dnl AX_CHECK_COMPILE_FLAGS
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-gnome/libffi/libffi_3.0.10.bb b/meta/recipes-gnome/libffi/libffi_3.0.11.bb
> similarity index 72%
> rename from meta/recipes-gnome/libffi/libffi_3.0.10.bb
> rename to meta/recipes-gnome/libffi/libffi_3.0.11.bb
> index c06b80c..e674fd3 100644
> --- a/meta/recipes-gnome/libffi/libffi_3.0.10.bb
> +++ b/meta/recipes-gnome/libffi/libffi_3.0.11.bb
> @@ -7,14 +7,15 @@ library really only provides the lowest, machine dependent layer of a fully feat
>   A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
>
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=0caa055e49a3fb6c57780595e995e2ab"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e54c573c49435ccbbd3f6dc9e49a065e"
>
>   PR = "r0"
>
> -SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
> +SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz \
> +           file://0001-libffi-update-for-3.0.11.patch"
>
> -SRC_URI[md5sum] = "79390673f5d07a8fb342bc09b5055b6f"
> -SRC_URI[sha256sum] = "f01eb9027e9eb56aeaeef636649877756d475d714ef8b47f627f65bc5f3b492f"
> +SRC_URI[md5sum] = "f69b9693227d976835b4857b1ba7d0e3"
> +SRC_URI[sha256sum] = "70bfb01356360089aa97d3e71e3edf05d195599fd822e922e50d46a0055a6283"
>
>   EXTRA_OECONF += "--disable-builddir"
>
>


