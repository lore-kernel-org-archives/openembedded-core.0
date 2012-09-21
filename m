Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBmz-0005U0-AN
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:33:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2012 15:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="147735232"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2012 15:20:49 -0700
Message-ID: <505CE841.70107@linux.intel.com>
Date: Fri, 21 Sep 2012 15:20:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1348091852-16907-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1348091852-16907-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdb: Upgrade 7.4 -> 7.5
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
X-List-Received-Date: Fri, 21 Sep 2012 22:33:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 02:57 PM, Khem Raj wrote:
> This is a simple upgrade. Dropping the unneeded patches
> and adding --disable-werror to configure since thats is
> what one of the patch was doing which was dropped.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc           |   11 +-
>   ...canadian_7.4.1.bb => gdb-cross-canadian_7.5.bb} |    0
>   .../gdb/{gdb-cross_7.4.1.bb => gdb-cross_7.5.bb}   |    0
>   meta/recipes-devtools/gdb/gdb.inc                  |    1 -
>   meta/recipes-devtools/gdb/gdb/no-werror.patch      |   80 ----
>   .../gdb/gdb/renesas-sh-native-support.patch        |  194 +++++-----
>   meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 --------------------
>   .../gdb/{gdb_7.4.1.bb => gdb_7.5.bb}               |    0
>   8 files changed, 97 insertions(+), 592 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.4.1.bb => gdb-cross-canadian_7.5.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_7.4.1.bb => gdb-cross_7.5.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/gdb/gdb/no-werror.patch
>   delete mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
>   rename meta/recipes-devtools/gdb/{gdb_7.4.1.bb => gdb_7.5.bb} (100%)
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 348bdee..ea4098c 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -12,7 +12,7 @@ LTTNGUST_mips64 = ""
>   LTTNGUST_mips64el = ""
>   LTTNGUST_sh4 = ""
>
> -INC_PR = "r1"
> +INC_PR = "r0"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
> @@ -21,10 +21,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   inherit autotools
>
>   SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
> -           file://no-werror.patch"
> -
> -SRC_URI[md5sum] = "5fb7fca9ef7a9e3cfee0e2f2c0e52051"
> -SRC_URI[sha256sum] = "f99d2be831ead324712ae4f11868e07e545272f10aac4186060f1386f2629b38"
> +          "
> +SRC_URI[md5sum] = "c9f5ed81008194f8f667f131234f3ef0"
> +SRC_URI[sha256sum] = "8dcf38dd04f7f031b51d0672050d6b14626302ddc24d74e486b4666335de2df3"
>
>   export CC_FOR_BUILD = "${BUILD_CC}"
>   export CXX_FOR_BUILD = "${BUILD_CXX}"
> @@ -39,7 +38,7 @@ EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
>
>   EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
>
> -EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
> +EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
>                   --with-curses --disable-multilib --with-system-readline --disable-sim \
>                   ${GDBPROPREFIX} ${EXPAT} \
>                   ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_7.5.bb
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> index c1ad83a..a620eca 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -5,7 +5,6 @@ inherit gettext
>   SRC_URI += "file://kill_arm_map_symbols.patch \
>               file://gdbserver-cflags-last.diff;striplevel=0 \
>   	    file://renesas-sh-native-support.patch \
> -	    file://siginfo_t.patch \
>              "
>   #LDFLAGS_append = " -s"
>   #export CFLAGS_append=" -L${STAGING_LIBDIR}"
> diff --git a/meta/recipes-devtools/gdb/gdb/no-werror.patch b/meta/recipes-devtools/gdb/gdb/no-werror.patch
> deleted file mode 100644
> index 989e2c5..0000000
> --- a/meta/recipes-devtools/gdb/gdb/no-werror.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -Upstream-Status: Pending
> -
> ----
> - bfd/warning.m4   |    2 +-
> - configure.ac     |    2 +-
> - gdb/Makefile.in  |    4 ++--
> - gdb/configure.ac |    8 ++------
> - 4 files changed, 6 insertions(+), 10 deletions(-)
> -
> -Index: gdb-7.1/bfd/warning.m4
> -===================================================================
> ---- gdb-7.1.orig/bfd/warning.m4
> -+++ gdb-7.1/bfd/warning.m4
> -@@ -23,7 +23,7 @@ esac
> -
> - # Enable -Werror by default when using gcc
> - if test "${GCC}" = yes -a -z "${ERROR_ON_WARNING}" ; then
> --    ERROR_ON_WARNING=yes
> -+    ERROR_ON_WARNING=no
> - fi
> -
> - NO_WERROR=
> -Index: gdb-7.1/configure.ac
> -===================================================================
> ---- gdb-7.1.orig/configure.ac
> -+++ gdb-7.1/configure.ac
> -@@ -3371,7 +3371,7 @@ AC_SUBST(stage1_checking)
> - AC_ARG_ENABLE(werror,
> - [  --enable-werror         enable -Werror in bootstrap stage2 and later], [],
> - [if test -d ${srcdir}/gcc && test x"`cat $srcdir/gcc/DEV-PHASE`" = xexperimental; then
> --  enable_werror=yes
> -+  enable_werror=no
> - else
> -   enable_werror=no
> - fi])
> -Index: gdb-7.1/gdb/Makefile.in
> -===================================================================
> ---- gdb-7.1.orig/gdb/Makefile.in
> -+++ gdb-7.1/gdb/Makefile.in
> -@@ -151,9 +151,9 @@ READLINE_CFLAGS = @READLINE_CFLAGS@
> - LIBEXPAT = @LIBEXPAT@
> -
> - WARN_CFLAGS = @WARN_CFLAGS@
> --WERROR_CFLAGS = @WERROR_CFLAGS@
> -+WERROR_CFLAGS =
> - GDB_WARN_CFLAGS = $(WARN_CFLAGS)
> --GDB_WERROR_CFLAGS = $(WERROR_CFLAGS)
> -+GDB_WERROR_CFLAGS =
> -
> - GDB_WARN_CFLAGS_NO_FORMAT = `echo " $(GDB_WARN_CFLAGS) " | sed "s/ -Wformat-nonliteral / /g"`
> -
> -Index: gdb-7.1/gdb/configure.ac
> -===================================================================
> ---- gdb-7.1.orig/gdb/configure.ac
> -+++ gdb-7.1/gdb/configure.ac
> -@@ -1525,15 +1525,12 @@ GDB_AC_WITH_DIR(SYSTEM_GDBINIT, system-g
> - AC_ARG_ENABLE(werror,
> -   AS_HELP_STRING([--enable-werror], [treat compile warnings as errors]),
> -   [case "${enableval}" in
> --     yes | y) ERROR_ON_WARNING="yes" ;;
> -+     yes | y) ERROR_ON_WARNING="no" ;;
> -      no | n)  ERROR_ON_WARNING="no" ;;
> -      *) AC_MSG_ERROR(bad value ${enableval} for --enable-werror) ;;
> -    esac])
> -
> - WERROR_CFLAGS=""
> --if test "${ERROR_ON_WARNING}" = yes ; then
> --    WERROR_CFLAGS="-Werror"
> --fi
> -
> - # The entries after -Wno-pointer-sign are disabled warnings which may
> - # be enabled in the future, which can not currently be used to build
> -@@ -1587,7 +1584,6 @@ then
> -     # compiled with it enabled.
> -     for w in ${build_warnings}; do
> - 	case $w in
> --	-Werr*) WERROR_CFLAGS=-Werror ;;
> - 	*) # Check that GCC accepts it
> - 	    saved_CFLAGS="$CFLAGS"
> - 	    CFLAGS="$CFLAGS $w"
> diff --git a/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch b/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
> index 2b1ceb7..15ff620 100644
> --- a/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
> +++ b/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
> @@ -20,11 +20,11 @@ Last-Update: <2011-11-17>
>   Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: gdb-7.4/gdb/configure.host
> +Index: gdb-7.5/gdb/configure.host
>   ===================================================================
> ---- gdb-7.4.orig/gdb/configure.host	2012-04-24 07:06:35.085317177 -0700
> -+++ gdb-7.4/gdb/configure.host	2012-04-24 07:09:14.365324889 -0700
> -@@ -139,6 +139,7 @@
> +--- gdb-7.5.orig/gdb/configure.host	2012-05-30 12:41:34.000000000 -0700
> ++++ gdb-7.5/gdb/configure.host	2012-09-19 14:40:42.974609772 -0700
> +@@ -140,6 +140,7 @@
>
>    s390*-*-*)		gdb_host=s390 ;;
>
> @@ -32,11 +32,11 @@ Index: gdb-7.4/gdb/configure.host
>    sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
>    			gdb_host=nbsd ;;
>    sh*-*-openbsd*)		gdb_host=nbsd ;;
> -Index: gdb-7.4/gdb/Makefile.in
> +Index: gdb-7.5/gdb/Makefile.in
>   ===================================================================
> ---- gdb-7.4.orig/gdb/Makefile.in	2012-04-24 07:06:35.093317178 -0700
> -+++ gdb-7.4/gdb/Makefile.in	2012-04-24 07:09:14.369324886 -0700
> -@@ -1544,6 +1544,7 @@
> +--- gdb-7.5.orig/gdb/Makefile.in	2012-07-02 08:29:33.000000000 -0700
> ++++ gdb-7.5/gdb/Makefile.in	2012-09-19 14:40:42.974609772 -0700
> +@@ -1493,6 +1493,7 @@
>    	score-tdep.c \
>    	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
>    	sh-tdep.c sh64-tdep.c shnbsd-tdep.c shnbsd-nat.c \
> @@ -44,11 +44,11 @@ Index: gdb-7.4/gdb/Makefile.in
>    	sol2-tdep.c \
>    	solib-irix.c solib-svr4.c solib-sunos.c \
>    	sparc-linux-nat.c sparc-linux-tdep.c \
> -Index: gdb-7.4/gdb/sh-linux-tdep.c
> +Index: gdb-7.5/gdb/sh-linux-tdep.c
>   ===================================================================
> ---- gdb-7.4.orig/gdb/sh-linux-tdep.c	2012-04-24 07:06:35.073317177 -0700
> -+++ gdb-7.4/gdb/sh-linux-tdep.c	2012-04-24 07:09:14.369324886 -0700
> -@@ -18,11 +18,34 @@
> +--- gdb-7.5.orig/gdb/sh-linux-tdep.c	2012-05-07 06:17:29.000000000 -0700
> ++++ gdb-7.5/gdb/sh-linux-tdep.c	2012-09-19 14:46:50.610623784 -0700
> +@@ -18,14 +18,37 @@
>       along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
>
>    #include "defs.h"
> @@ -71,6 +71,9 @@ Index: gdb-7.4/gdb/sh-linux-tdep.c
>   +#include "command.h"
>   +#include "gdb_assert.h"
>
> + #include "trad-frame.h"
> + #include "tramp-frame.h"
> +
>   +#include <sys/ptrace.h>
>   +#include <sys/types.h>
>   +#include <sys/param.h>
> @@ -83,8 +86,8 @@ Index: gdb-7.4/gdb/sh-linux-tdep.c
>    #include "glibc-tdep.h"
>    #include "sh-tdep.h"
>    #include "linux-tdep.h"
> -@@ -70,9 +93,505 @@
> -   {-1 /* Terminator.  */, 0}
> +@@ -180,9 +203,505 @@
> +   sh_linux_rt_sigreturn_init
>    };
>
>   +/* Recognizing signal handler frames.  */
> @@ -589,10 +592,10 @@ Index: gdb-7.4/gdb/sh-linux-tdep.c
>      linux_init_abi (info, gdbarch);
>
>      /* GNU/Linux uses SVR4-style shared libraries.  */
> -Index: gdb-7.4/gdb/sh-tdep.h
> +Index: gdb-7.5/gdb/sh-tdep.h
>   ===================================================================
> ---- gdb-7.4.orig/gdb/sh-tdep.h	2012-04-24 07:06:35.101317178 -0700
> -+++ gdb-7.4/gdb/sh-tdep.h	2012-04-24 07:09:14.369324886 -0700
> +--- gdb-7.5.orig/gdb/sh-tdep.h	2012-03-01 15:55:40.000000000 -0800
> ++++ gdb-7.5/gdb/sh-tdep.h	2012-09-19 14:48:32.406627602 -0700
>   @@ -21,6 +21,12 @@
>
>    /* Contributed by Steve Chamberlain sac@cygnus.com.  */
> @@ -614,10 +617,10 @@ Index: gdb-7.4/gdb/sh-tdep.h
>        PC_REGNUM = 16,
>        PR_REGNUM = 17,
>        GBR_REGNUM = 18,
> -@@ -82,8 +89,26 @@
> +@@ -81,6 +88,24 @@
> +     FV0_REGNUM = 76,
>        FV_LAST_REGNUM = 79
>      };
> -
>   +#define SH_NUM_REGS 67
>   +
>   +struct sh_frame_cache
> @@ -635,13 +638,11 @@ Index: gdb-7.4/gdb/sh-tdep.h
>   +  CORE_ADDR saved_sp;
>   +};
>   +
> - extern gdbarch_init_ftype sh64_gdbarch_init;
> - extern void sh64_show_regs (struct frame_info *);
>   +extern struct sh_frame_cache *sh_frame_cache (struct frame_info *next_frame, void **this_cache);
>
>    /* This structure describes a register in a core-file.  */
>    struct sh_corefile_regmap
> -@@ -92,8 +117,32 @@
> +@@ -89,8 +114,32 @@
>      unsigned int offset;
>    };
>
> @@ -674,10 +675,10 @@ Index: gdb-7.4/gdb/sh-tdep.h
>      /* Non-NULL when debugging from a core file.  Provides the offset
>         where each general-purpose register is stored inside the associated
>         core file section.  */
> -Index: gdb-7.4/gdb/sh-linux-nat.c
> +Index: gdb-7.5/gdb/sh-linux-nat.c
>   ===================================================================
>   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gdb-7.4/gdb/sh-linux-nat.c	2012-04-24 07:09:28.557325573 -0700
> ++++ gdb-7.5/gdb/sh-linux-nat.c	2012-09-19 14:40:42.978609771 -0700
>   @@ -0,0 +1,269 @@
>   +/* Low level SH interface to ptrace, for GDB when running native.
>   +   Copyright (C) 2002, 2004 Free Software Foundation, Inc.
> @@ -948,10 +949,10 @@ Index: gdb-7.4/gdb/sh-linux-nat.c
>   +  /* Register the target.  */
>   +  linux_nat_add_target (t);
>   +}
> -Index: gdb-7.4/gdb/sh-tdep.c
> +Index: gdb-7.5/gdb/sh-tdep.c
>   ===================================================================
> ---- gdb-7.4.orig/gdb/sh-tdep.c	2012-04-24 07:06:35.109317179 -0700
> -+++ gdb-7.4/gdb/sh-tdep.c	2012-04-24 07:09:14.369324886 -0700
> +--- gdb-7.5.orig/gdb/sh-tdep.c	2012-06-08 07:24:57.000000000 -0700
> ++++ gdb-7.5/gdb/sh-tdep.c	2012-09-19 14:45:09.770619943 -0700
>   @@ -21,6 +21,9 @@
>       sac@cygnus.com.  */
>
> @@ -972,7 +973,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>    #include "reggroups.h"
>   @@ -69,23 +73,6 @@
>
> - static void (*sh_show_regs) (struct frame_info *);
> + static const char *sh_active_calling_convention = sh_cc_gcc;
>
>   -#define SH_NUM_REGS 67
>   -
> @@ -994,7 +995,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>    static int
>    sh_is_renesas_calling_convention (struct type *func_type)
>    {
> -@@ -1040,7 +1027,7 @@
> +@@ -1045,7 +1032,7 @@
>        return 0;
>      /* Otherwise if the type of that member is float, the whole type is
>         treated as float.  */
> @@ -1003,7 +1004,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>        return 1;
>      /* Otherwise it's not treated as float.  */
>      return 0;
> -@@ -1090,7 +1077,7 @@
> +@@ -1095,7 +1082,7 @@
>         in four registers available.  Loop thru args from first to last.  */
>      for (argnum = 0; argnum < nargs; argnum++)
>        {
> @@ -1012,7 +1013,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>          len = TYPE_LENGTH (type);
>          val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
>
> -@@ -2508,7 +2495,7 @@
> +@@ -1809,7 +1796,7 @@
>        reg->how = DWARF2_FRAME_REG_UNDEFINED;
>    }
>
> @@ -1021,7 +1022,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>    sh_alloc_frame_cache (void)
>    {
>      struct sh_frame_cache *cache;
> -@@ -2535,7 +2522,7 @@
> +@@ -1836,7 +1823,7 @@
>      return cache;
>    }
>
> @@ -1030,7 +1031,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>    sh_frame_cache (struct frame_info *this_frame, void **this_cache)
>    {
>      struct gdbarch *gdbarch = get_frame_arch (this_frame);
> -@@ -2593,9 +2580,9 @@
> +@@ -1903,9 +1890,9 @@
>      return cache;
>    }
>
> @@ -1043,7 +1044,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>    {
>      struct gdbarch *gdbarch = get_frame_arch (this_frame);
>      struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
> -@@ -2609,7 +2596,7 @@
> +@@ -1919,7 +1906,7 @@
>         the current frame.  Frob regnum so that we pull the value from
>         the correct place.  */
>      if (regnum == gdbarch_pc_regnum (gdbarch))
> @@ -1052,7 +1053,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>
>      if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
>        return frame_unwind_got_memory (this_frame, regnum,
> -@@ -2853,8 +2840,8 @@
> +@@ -2225,8 +2212,8 @@
>    static struct gdbarch *
>    sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
>    {
> @@ -1060,9 +1061,9 @@ Index: gdb-7.4/gdb/sh-tdep.c
>      struct gdbarch_tdep *tdep;
>   +  struct gdbarch *gdbarch;
>
> -   sh_show_regs = sh_generic_show_regs;
> -   switch (info.bfd_arch_info->mach)
> -@@ -2917,6 +2904,18 @@
> +   /* SH5 is handled entirely in sh64-tdep.c.  */
> +   if (info.bfd_arch_info->mach == bfd_mach_sh5)
> +@@ -2242,6 +2229,18 @@
>      tdep = XZALLOC (struct gdbarch_tdep);
>      gdbarch = gdbarch_alloc (&info, tdep);
>
> @@ -1081,7 +1082,7 @@ Index: gdb-7.4/gdb/sh-tdep.c
>      set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
>      set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
>      set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
> -@@ -3062,10 +3061,11 @@
> +@@ -2389,10 +2388,11 @@
>          break;
>        }
>
> @@ -1091,13 +1092,13 @@ Index: gdb-7.4/gdb/sh-tdep.c
>      gdbarch_init_osabi (info, gdbarch);
>
>   -  dwarf2_append_unwinders (gdbarch);
> +   frame_unwind_append_unwinder (gdbarch, &sh_stub_unwind);
>      frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
>
> -   return gdbarch;
> -Index: gdb-7.4/gdb/testsuite/gdb.asm/sh-linux.inc
> +Index: gdb-7.5/gdb/testsuite/gdb.asm/sh-linux.inc
>   ===================================================================
>   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gdb-7.4/gdb/testsuite/gdb.asm/sh-linux.inc	2012-04-24 07:09:14.369324886 -0700
> ++++ gdb-7.5/gdb/testsuite/gdb.asm/sh-linux.inc	2012-09-19 14:40:42.978609771 -0700
>   @@ -0,0 +1,78 @@
>   +# You'll find a bunch of nop opcodes in the below macros.  They are
>   +# there to keep the code correctly aligned.  Be careful to maintain
> @@ -1177,10 +1178,10 @@ Index: gdb-7.4/gdb/testsuite/gdb.asm/sh-linux.inc
>   +\name:
>   +	.long	\value
>   +	.endm
> -Index: gdb-7.4/gdb/testsuite/gdb.asm/sh.inc
> +Index: gdb-7.5/gdb/testsuite/gdb.asm/sh.inc
>   ===================================================================
> ---- gdb-7.4.orig/gdb/testsuite/gdb.asm/sh.inc	2012-04-24 07:06:35.001317175 -0700
> -+++ gdb-7.4/gdb/testsuite/gdb.asm/sh.inc	2012-04-24 07:09:14.369324886 -0700
> +--- gdb-7.5.orig/gdb/testsuite/gdb.asm/sh.inc	2012-04-16 01:02:09.000000000 -0700
> ++++ gdb-7.5/gdb/testsuite/gdb.asm/sh.inc	2012-09-19 14:40:42.978609771 -0700
>   @@ -40,9 +40,8 @@
>    	mov.l   .Lconst\@,r1
>    	bra	.Lafterconst\@
> @@ -1192,11 +1193,11 @@ Index: gdb-7.4/gdb/testsuite/gdb.asm/sh.inc
>    	.long	\subr
>    	.align	1
>    .Lafterconst\@:
> -Index: gdb-7.4/gdb/testsuite/gdb.asm/asm-source.exp
> +Index: gdb-7.5/gdb/testsuite/gdb.asm/asm-source.exp
>   ===================================================================
> ---- gdb-7.4.orig/gdb/testsuite/gdb.asm/asm-source.exp	2012-04-24 07:06:35.009317179 -0700
> -+++ gdb-7.4/gdb/testsuite/gdb.asm/asm-source.exp	2012-04-24 07:09:14.369324886 -0700
> -@@ -110,6 +110,11 @@
> +--- gdb-7.5.orig/gdb/testsuite/gdb.asm/asm-source.exp	2012-06-25 13:11:43.000000000 -0700
> ++++ gdb-7.5/gdb/testsuite/gdb.asm/asm-source.exp	2012-09-19 14:40:42.978609771 -0700
> +@@ -108,6 +108,11 @@
>                append link-flags " -m elf32ppc"
>            }
>        }
> @@ -1208,80 +1209,69 @@ Index: gdb-7.4/gdb/testsuite/gdb.asm/asm-source.exp
>        "sh*-*-*" {
>            set asm-arch sh
>    	set debug-flags "-gdwarf-2"
> -Index: gdb-7.4/gdb/testsuite/gdb.base/sigall.c
> +Index: gdb-7.5/gdb/testsuite/gdb.base/sigall.c
>   ===================================================================
> ---- gdb-7.4.orig/gdb/testsuite/gdb.base/sigall.c	2012-04-24 07:06:35.037317176 -0700
> -+++ gdb-7.4/gdb/testsuite/gdb.base/sigall.c	2012-04-24 07:09:14.369324886 -0700
> -@@ -1,9 +1,9 @@
> - #include <signal.h>
> - #include <unistd.h>
> -
> --#ifdef __sh__
> --#define signal(a,b)	/* Signals not supported on this target - make them go away */
> --#endif
> -+
> -+
> -+
> -
> +--- gdb-7.5.orig/gdb/testsuite/gdb.base/sigall.c	2012-02-28 02:24:15.000000000 -0800
> ++++ gdb-7.5/gdb/testsuite/gdb.base/sigall.c	2012-09-19 14:42:02.202612808 -0700
> +@@ -5,6 +5,10 @@
>    /* Signal handlers, we set breakpoints in them to make sure that the
>       signals really get delivered.  */
> -Index: gdb-7.4/gdb/testsuite/gdb.base/signals.c
> +
> ++#ifdef __sh__
> ++#define signal(a,b)    /* Signals not supported on this target - make them go away */
> ++#endif
> ++
> + #ifdef PROTOTYPES
> + void
> + handle_ABRT (int sig)
> +Index: gdb-7.5/gdb/testsuite/gdb.base/signals.c
>   ===================================================================
> ---- gdb-7.4.orig/gdb/testsuite/gdb.base/signals.c	2012-04-24 07:06:35.049317176 -0700
> -+++ gdb-7.4/gdb/testsuite/gdb.base/signals.c	2012-04-24 07:09:14.373324884 -0700
> -@@ -3,10 +3,10 @@
> +--- gdb-7.5.orig/gdb/testsuite/gdb.base/signals.c	2012-02-28 02:24:15.000000000 -0800
> ++++ gdb-7.5/gdb/testsuite/gdb.base/signals.c	2012-09-19 14:43:22.034615831 -0700
> +@@ -3,6 +3,10 @@
>    #include <signal.h>
>    #include <unistd.h>
>
> --#ifdef __sh__
> --#define signal(a,b)	/* Signals not supported on this target - make them go away */
> --#define alarm(a)	/* Ditto for alarm() */
> --#endif
> -+
> -+
> -+
> -+
> ++#ifdef __sh__
> ++#define signal(a,b)    /* Signals not supported on this target - make them go away */
> ++#define alarm(a)       /* Ditto for alarm() */
> ++#endif
>
>    static int count = 0;
>
> -Index: gdb-7.4/gdb/testsuite/gdb.base/annota1.c
> +Index: gdb-7.5/gdb/testsuite/gdb.base/annota1.c
>   ===================================================================
> ---- gdb-7.4.orig/gdb/testsuite/gdb.base/annota1.c	2012-04-24 07:06:35.021317172 -0700
> -+++ gdb-7.4/gdb/testsuite/gdb.base/annota1.c	2012-04-24 07:09:14.373324884 -0700
> -@@ -1,9 +1,9 @@
> +--- gdb-7.5.orig/gdb/testsuite/gdb.base/annota1.c	2012-02-28 14:40:48.000000000 -0800
> ++++ gdb-7.5/gdb/testsuite/gdb.base/annota1.c	2012-09-19 14:42:42.074614308 -0700
> +@@ -1,6 +1,9 @@
>    #include <stdio.h>
>    #include <signal.h>
>
> --#ifdef __sh__
> --#define signal(a,b)	/* Signals not supported on this target - make them go away */
> --#endif
> -+
> -+
> -+
> -
> ++#ifdef __sh__
> ++#define signal(a,b)    /* Signals not supported on this target - make them go away */
> ++#endif
>
>    #ifdef PROTOTYPES
> -Index: gdb-7.4/gdb/testsuite/gdb.base/annota3.c
> + void
> +Index: gdb-7.5/gdb/testsuite/gdb.base/annota3.c
>   ===================================================================
> ---- gdb-7.4.orig/gdb/testsuite/gdb.base/annota3.c	2012-04-24 07:06:35.029317176 -0700
> -+++ gdb-7.4/gdb/testsuite/gdb.base/annota3.c	2012-04-24 07:09:14.373324884 -0700
> -@@ -1,9 +1,9 @@
> +--- gdb-7.5.orig/gdb/testsuite/gdb.base/annota3.c	2012-02-28 14:40:48.000000000 -0800
> ++++ gdb-7.5/gdb/testsuite/gdb.base/annota3.c	2012-09-19 14:43:54.410617081 -0700
> +@@ -1,6 +1,10 @@
>    #include <stdio.h>
>    #include <signal.h>
>
> --#ifdef __sh__
> --#define signal(a,b)	/* Signals not supported on this target - make them go away */
> --#endif
> -+
> ++#ifdef __sh__
> ++#define signal(a,b)    /* Signals not supported on this target - make them go away */
> ++#endif
>   +
> -+
> -
>
>    #ifdef PROTOTYPES
> -Index: gdb-7.4/gdb/config/sh/xm-linux.h
> + void
> +Index: gdb-7.5/gdb/config/sh/xm-linux.h
>   ===================================================================
>   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gdb-7.4/gdb/config/sh/xm-linux.h	2012-04-24 07:09:14.373324884 -0700
> ++++ gdb-7.5/gdb/config/sh/xm-linux.h	2012-09-19 14:40:42.994609807 -0700
>   @@ -0,0 +1,32 @@
>   +/* Native support for GNU/Linux, for GDB, the GNU debugger.
>   +   Copyright (C) 2000 Free Software Foundation, Inc.
> @@ -1315,10 +1305,10 @@ Index: gdb-7.4/gdb/config/sh/xm-linux.h
>   +#include <unistd.h>
>   +
>   +#endif	/* #ifndef XM_LINUX_H */
> -Index: gdb-7.4/gdb/config/sh/nm-linux.h
> +Index: gdb-7.5/gdb/config/sh/nm-linux.h
>   ===================================================================
>   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gdb-7.4/gdb/config/sh/nm-linux.h	2012-04-24 07:09:14.373324884 -0700
> ++++ gdb-7.5/gdb/config/sh/nm-linux.h	2012-09-19 14:40:42.994609807 -0700
>   @@ -0,0 +1,54 @@
>   +/* Native-dependent definitions for SuperH running Linux, for GDB.
>   +   Copyright 2004 Free Software Foundation, Inc.
> @@ -1374,10 +1364,10 @@ Index: gdb-7.4/gdb/config/sh/nm-linux.h
>   +#define CANNOT_STORE_REGISTER(regno) cannot_store_register (regno)
>   +
>   +#endif /* NM_LINUX_H */
> -Index: gdb-7.4/gdb/config/sh/linux.mh
> +Index: gdb-7.5/gdb/config/sh/linux.mh
>   ===================================================================
>   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gdb-7.4/gdb/config/sh/linux.mh	2012-04-24 07:36:11.709403160 -0700
> ++++ gdb-7.5/gdb/config/sh/linux.mh	2012-09-19 14:40:42.994609807 -0700
>   @@ -0,0 +1,8 @@
>   +# Host: Renesas Super-H running GNU/Linux
>   +NAT_FILE= config/sh/nm-linux.h
> diff --git a/meta/recipes-devtools/gdb/gdb/siginfo_t.patch b/meta/recipes-devtools/gdb/gdb/siginfo_t.patch
> deleted file mode 100644
> index 465645d..0000000
> --- a/meta/recipes-devtools/gdb/gdb/siginfo_t.patch
> +++ /dev/null
> @@ -1,403 +0,0 @@
> -POSIX says you get "siginto_t" *not* "struct siginfo
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: gdb-7.4.1/gdb/alpha-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/alpha-linux-tdep.c	2012-01-05 20:43:04.000000000 -0800
> -+++ gdb-7.4.1/gdb/alpha-linux-tdep.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -114,7 +114,7 @@
> -   /* __NR_rt_sigreturn has a couple of structures on the stack.  This is:
> -
> - 	struct rt_sigframe {
> --	  struct siginfo info;
> -+	  siginfo_t info;
> - 	  struct ucontext uc;
> -         };
> -
> -Index: gdb-7.4.1/gdb/amd64-linux-nat.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/amd64-linux-nat.c	2012-01-05 20:43:04.000000000 -0800
> -+++ gdb-7.4.1/gdb/amd64-linux-nat.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -671,13 +671,13 @@
> -    INF.  */
> -
> - static int
> --amd64_linux_siginfo_fixup (struct siginfo *native, gdb_byte *inf, int direction)
> -+amd64_linux_siginfo_fixup (siginfo_t *native, gdb_byte *inf, int direction)
> - {
> -   /* Is the inferior 32-bit?  If so, then do fixup the siginfo
> -      object.  */
> -   if (gdbarch_addr_bit (get_frame_arch (get_current_frame ())) == 32)
> -     {
> --      gdb_assert (sizeof (struct siginfo) == sizeof (compat_siginfo_t));
> -+      gdb_assert (sizeof (siginfo_t) == sizeof (compat_siginfo_t));
> -
> -       if (direction == 0)
> - 	compat_siginfo_from_siginfo ((struct compat_siginfo *) inf, native);
> -Index: gdb-7.4.1/gdb/arm-linux-nat.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/arm-linux-nat.c	2012-01-05 20:43:04.000000000 -0800
> -+++ gdb-7.4.1/gdb/arm-linux-nat.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -1137,7 +1137,7 @@
> - static int
> - arm_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
> - {
> --  struct siginfo *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
> -+  siginfo_t *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
> -   int slot = siginfo_p->si_errno;
> -
> -   /* This must be a hardware breakpoint.  */
> -Index: gdb-7.4.1/gdb/arm-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/arm-linux-tdep.c	2012-01-05 20:43:04.000000000 -0800
> -+++ gdb-7.4.1/gdb/arm-linux-tdep.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -301,7 +301,7 @@
> -
> - /* There are three elements in an rt_sigframe before the ucontext:
> -    pinfo, puc, and info.  The first two are pointers and the third
> --   is a struct siginfo, with size 128 bytes.  We could follow puc
> -+   is a siginfo_t, with size 128 bytes.  We could follow puc
> -    to the ucontext, but it's simpler to skip the whole thing.  */
> - #define ARM_OLD_RT_SIGFRAME_SIGINFO 0x8
> - #define ARM_OLD_RT_SIGFRAME_UCONTEXT 0x88
> -Index: gdb-7.4.1/gdb/frv-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/frv-linux-tdep.c	2012-01-05 20:43:12.000000000 -0800
> -+++ gdb-7.4.1/gdb/frv-linux-tdep.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -94,9 +94,9 @@
> -       {
> - 	      void (*pretcode)(void);
> - 	      int sig;
> --	      struct siginfo *pinfo;
> -+	      siginfo_t *pinfo;
> - 	      void *puc;
> --	      struct siginfo info;
> -+	      siginfo_t info;
> - 	      struct ucontext uc;
> - 	      uint32_t retcode[2];
> -       };
> -Index: gdb-7.4.1/gdb/gdbserver/linux-arm-low.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/gdbserver/linux-arm-low.c	2012-01-05 20:43:37.000000000 -0800
> -+++ gdb-7.4.1/gdb/gdbserver/linux-arm-low.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -631,7 +631,7 @@
> - arm_stopped_by_watchpoint (void)
> - {
> -   struct lwp_info *lwp = get_thread_lwp (current_inferior);
> --  struct siginfo siginfo;
> -+  siginfo_t siginfo;
> -
> -   /* We must be able to set hardware watchpoints.  */
> -   if (arm_linux_get_hw_watchpoint_count () == 0)
> -Index: gdb-7.4.1/gdb/gdbserver/linux-low.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/gdbserver/linux-low.c	2012-01-05 20:43:37.000000000 -0800
> -+++ gdb-7.4.1/gdb/gdbserver/linux-low.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -4522,7 +4522,7 @@
> -    layout of the inferiors' architecture.  */
> -
> - static void
> --siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
> -+siginfo_fixup (siginfo_t *siginfo, void *inf_siginfo, int direction)
> - {
> -   int done = 0;
> -
> -@@ -4534,9 +4534,9 @@
> -   if (!done)
> -     {
> -       if (direction == 1)
> --	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
> -+	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
> -       else
> --	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
> -+	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
> -     }
> - }
> -
> -@@ -4545,8 +4545,8 @@
> - 		    unsigned const char *writebuf, CORE_ADDR offset, int len)
> - {
> -   int pid;
> --  struct siginfo siginfo;
> --  char inf_siginfo[sizeof (struct siginfo)];
> -+  siginfo_t siginfo;
> -+  char inf_siginfo[sizeof (siginfo_t)];
> -
> -   if (current_inferior == NULL)
> -     return -1;
> -Index: gdb-7.4.1/gdb/gdbserver/linux-low.h
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/gdbserver/linux-low.h	2012-01-05 20:43:37.000000000 -0800
> -+++ gdb-7.4.1/gdb/gdbserver/linux-low.h	2012-07-03 10:20:28.554250548 -0700
> -@@ -22,6 +22,7 @@
> - #endif
> -
> - #include "gdb_proc_service.h"
> -+#include <signal.h>
> -
> - #ifdef HAVE_LINUX_REGSETS
> - typedef void (*regset_fill_func) (struct regcache *, void *);
> -@@ -46,8 +47,6 @@
> - extern struct regset_info target_regsets[];
> - #endif
> -
> --struct siginfo;
> --
> - struct process_info_private
> - {
> -   /* Arch-specific additions.  */
> -@@ -103,7 +102,7 @@
> -      Returns true if any conversion was done; false otherwise.
> -      If DIRECTION is 1, then copy from INF to NATIVE.
> -      If DIRECTION is 0, copy from NATIVE to INF.  */
> --  int (*siginfo_fixup) (struct siginfo *native, void *inf, int direction);
> -+  int (*siginfo_fixup) (siginfo_t *native, void *inf, int direction);
> -
> -   /* Hook to call when a new process is created or attached to.
> -      If extra per-process architecture-specific data is needed,
> -Index: gdb-7.4.1/gdb/gdbserver/linux-x86-low.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/gdbserver/linux-x86-low.c	2012-01-05 20:43:37.000000000 -0800
> -+++ gdb-7.4.1/gdb/gdbserver/linux-x86-low.c	2012-07-03 10:12:30.154227388 -0700
> -@@ -906,13 +906,13 @@
> -    INF.  */
> -
> - static int
> --x86_siginfo_fixup (struct siginfo *native, void *inf, int direction)
> -+x86_siginfo_fixup (siginfo_t *native, void *inf, int direction)
> - {
> - #ifdef __x86_64__
> -   /* Is the inferior 32-bit?  If so, then fixup the siginfo object.  */
> -   if (register_size (0) == 4)
> -     {
> --      if (sizeof (struct siginfo) != sizeof (compat_siginfo_t))
> -+      if (sizeof (siginfo_t) != sizeof (compat_siginfo_t))
> - 	fatal ("unexpected difference in siginfo");
> -
> -       if (direction == 0)
> -Index: gdb-7.4.1/gdb/hppa-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/hppa-linux-tdep.c	2012-01-05 20:43:15.000000000 -0800
> -+++ gdb-7.4.1/gdb/hppa-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -181,10 +181,10 @@
> -     }
> -
> -   /* sp + sfoffs[try] points to a struct rt_sigframe, which contains
> --     a struct siginfo and a struct ucontext.  struct ucontext contains
> -+     a siginfo_t and a struct ucontext.  struct ucontext contains
> -      a struct sigcontext.  Return an offset to this sigcontext here.  Too
> -      bad we cannot include system specific headers :-(.
> --     sizeof(struct siginfo) == 128
> -+     sizeof(siginfo_t) == 128
> -      offsetof(struct ucontext, uc_mcontext) == 24.  */
> -   return sp + sfoffs[try] + 128 + 24;
> - }
> -Index: gdb-7.4.1/gdb/ia64-linux-nat.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/ia64-linux-nat.c	2012-01-05 20:43:16.000000000 -0800
> -+++ gdb-7.4.1/gdb/ia64-linux-nat.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -637,7 +637,7 @@
> - ia64_linux_stopped_data_address (struct target_ops *ops, CORE_ADDR *addr_p)
> - {
> -   CORE_ADDR psr;
> --  struct siginfo *siginfo_p;
> -+  siginfo_t *siginfo_p;
> -   struct regcache *regcache = get_current_regcache ();
> -
> -   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
> -Index: gdb-7.4.1/gdb/linux-nat.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/linux-nat.c	2012-01-05 20:43:19.000000000 -0800
> -+++ gdb-7.4.1/gdb/linux-nat.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -179,7 +179,7 @@
> - /* The method to call, if any, when the siginfo object needs to be
> -    converted between the layout returned by ptrace, and the layout in
> -    the architecture of the inferior.  */
> --static int (*linux_nat_siginfo_fixup) (struct siginfo *,
> -+static int (*linux_nat_siginfo_fixup) (siginfo_t *,
> - 				       gdb_byte *,
> - 				       int);
> -
> -@@ -4138,7 +4138,7 @@
> -    layout of the inferiors' architecture.  */
> -
> - static void
> --siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
> -+siginfo_fixup (siginfo_t *siginfo, gdb_byte *inf_siginfo, int direction)
> - {
> -   int done = 0;
> -
> -@@ -4150,9 +4150,9 @@
> -   if (!done)
> -     {
> -       if (direction == 1)
> --	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
> -+	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
> -       else
> --	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
> -+	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
> -     }
> - }
> -
> -@@ -4162,8 +4162,8 @@
> - 		    const gdb_byte *writebuf, ULONGEST offset, LONGEST len)
> - {
> -   int pid;
> --  struct siginfo siginfo;
> --  gdb_byte inf_siginfo[sizeof (struct siginfo)];
> -+  siginfo_t siginfo;
> -+  gdb_byte inf_siginfo[sizeof (siginfo_t)];
> -
> -   gdb_assert (object == TARGET_OBJECT_SIGNAL_INFO);
> -   gdb_assert (readbuf || writebuf);
> -@@ -5852,7 +5852,7 @@
> -    inferior.  */
> - void
> - linux_nat_set_siginfo_fixup (struct target_ops *t,
> --			     int (*siginfo_fixup) (struct siginfo *,
> -+			     int (*siginfo_fixup) (siginfo_t *,
> - 						   gdb_byte *,
> - 						   int))
> - {
> -@@ -5861,7 +5861,7 @@
> - }
> -
> - /* Return the saved siginfo associated with PTID.  */
> --struct siginfo *
> -+siginfo_t *
> - linux_nat_get_siginfo (ptid_t ptid)
> - {
> -   struct lwp_info *lp = find_lwp_pid (ptid);
> -Index: gdb-7.4.1/gdb/linux-nat.h
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/linux-nat.h	2012-01-05 20:43:19.000000000 -0800
> -+++ gdb-7.4.1/gdb/linux-nat.h	2012-07-03 10:12:30.158227388 -0700
> -@@ -76,7 +76,7 @@
> -
> -   /* Non-zero si_signo if this LWP stopped with a trap.  si_addr may
> -      be the address of a hardware watchpoint.  */
> --  struct siginfo siginfo;
> -+  siginfo_t siginfo;
> -
> -   /* STOPPED_BY_WATCHPOINT is non-zero if this LWP stopped with a data
> -      watchpoint trap.  */
> -@@ -171,7 +171,7 @@
> -    that ptrace returns, and the layout in the architecture of the
> -    inferior.  */
> - void linux_nat_set_siginfo_fixup (struct target_ops *,
> --				  int (*) (struct siginfo *,
> -+				  int (*) (siginfo_t *,
> - 					   gdb_byte *,
> - 					   int));
> -
> -@@ -180,7 +180,7 @@
> - void linux_nat_switch_fork (ptid_t new_ptid);
> -
> - /* Return the saved siginfo associated with PTID.  */
> --struct siginfo *linux_nat_get_siginfo (ptid_t ptid);
> -+siginfo_t *linux_nat_get_siginfo (ptid_t ptid);
> -
> - /* Compute and return the processor core of a given thread.  */
> - int linux_nat_core_of_thread_1 (ptid_t ptid);
> -Index: gdb-7.4.1/gdb/linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/linux-tdep.c	2012-01-05 20:43:19.000000000 -0800
> -+++ gdb-7.4.1/gdb/linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -150,7 +150,7 @@
> -   append_composite_type_field (type, "si_fd", int_type);
> -   append_composite_type_field (sifields_type, "_sigpoll", type);
> -
> --  /* struct siginfo */
> -+  /* siginfo_t */
> -   siginfo_type = arch_composite_type (gdbarch, NULL, TYPE_CODE_STRUCT);
> -   TYPE_NAME (siginfo_type) = xstrdup ("siginfo");
> -   append_composite_type_field (siginfo_type, "si_signo", int_type);
> -Index: gdb-7.4.1/gdb/mips-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/mips-linux-tdep.c	2012-01-05 20:43:20.000000000 -0800
> -+++ gdb-7.4.1/gdb/mips-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -905,7 +905,7 @@
> -    struct rt_sigframe {
> -      u32 rs_ass[4];            [argument save space for o32]
> -      u32 rs_code[2]            [signal trampoline or fill]
> --     struct siginfo rs_info;
> -+     siginfo_t rs_info;
> -      struct ucontext rs_uc;
> -    };
> -
> -@@ -1033,7 +1033,7 @@
> -   struct rt_sigframe_n32 {
> -     u32 rs_ass[4];                  [ argument save space for o32 ]
> -     u32 rs_code[2];                 [ signal trampoline or fill ]
> --    struct siginfo rs_info;
> -+    siginfo_t rs_info;
> -     struct ucontextn32 rs_uc;
> -   };
> -
> -@@ -1048,7 +1048,7 @@
> -   struct rt_sigframe {
> -     u32 rs_ass[4];                  [ argument save space for o32 ]
> -     u32 rs_code[2];                 [ signal trampoline ]
> --    struct siginfo rs_info;
> -+    siginfo_t rs_info;
> -     struct ucontext rs_uc;
> -   };
> -
> -Index: gdb-7.4.1/gdb/mn10300-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/mn10300-linux-tdep.c	2012-01-05 20:43:20.000000000 -0800
> -+++ gdb-7.4.1/gdb/mn10300-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -528,9 +528,9 @@
> - {
> - 	void (*pretcode)(void);
> - 	int sig;
> --	struct siginfo *pinfo;
> -+	siginfo_t *pinfo;
> - 	void *puc;
> --	struct siginfo info;
> -+	siginfo_t info;
> - 	struct ucontext uc;
> - 	struct fpucontext fpuctx;
> - 	char retcode[8];
> -Index: gdb-7.4.1/gdb/ppc-linux-nat.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/ppc-linux-nat.c	2012-01-05 20:43:22.000000000 -0800
> -+++ gdb-7.4.1/gdb/ppc-linux-nat.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -2213,7 +2213,7 @@
> - static int
> - ppc_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
> - {
> --  struct siginfo *siginfo_p;
> -+  siginfo_t *siginfo_p;
> -
> -   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
> -
> -Index: gdb-7.4.1/gdb/procfs.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/procfs.c	2012-01-05 20:43:25.000000000 -0800
> -+++ gdb-7.4.1/gdb/procfs.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -262,7 +262,7 @@
> - #ifdef HAVE_PR_SIGINFO64_T
> - typedef pr_siginfo64_t gdb_siginfo_t;
> - #else
> --typedef struct siginfo gdb_siginfo_t;
> -+typedef siginfo_t gdb_siginfo_t;
> - #endif
> -
> - /* On mips-irix, praddset and prdelset are defined in such a way that
> -Index: gdb-7.4.1/gdb/tic6x-linux-tdep.c
> -===================================================================
> ---- gdb-7.4.1.orig/gdb/tic6x-linux-tdep.c	2012-01-05 20:54:31.000000000 -0800
> -+++ gdb-7.4.1/gdb/tic6x-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
> -@@ -34,7 +34,7 @@
> -
> - /* The offset from rt_sigframe pointer to SP register.  */
> - #define TIC6X_SP_RT_SIGFRAME 8
> --/* Size of struct siginfo info.  */
> -+/* Size of siginfo_t info.  */
> - #define TIC6X_SIGINFO_SIZE 128
> - /* Size of type stack_t, which contains three fields of type void*, int, and
> -    size_t respectively.  */
> diff --git a/meta/recipes-devtools/gdb/gdb_7.4.1.bb b/meta/recipes-devtools/gdb/gdb_7.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_7.4.1.bb
> rename to meta/recipes-devtools/gdb/gdb_7.5.bb
>


