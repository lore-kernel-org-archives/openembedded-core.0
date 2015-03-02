Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id A6CCA737A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 02:11:15 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so44232804ieb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2015 18:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fJr/K4SmyEFxUj0q7iqNY21UDwe1ti5jLQdURrlIK4I=;
	b=WWgj0QlSOB4I1w2Wi0jp28wRIkSfBZWCTxp4Q+g/LoEW5pyvq2PLucUdVBoLzFv4bx
	1Bqnr/KPo8fgapyaqRVL0gAOuItmwQOz6puorbV7a8iFgeFmw/Uja3G54GYbebvLP7gR
	okF4/0Ihm75Dd0IuBCCVtCzOZfBs8sWRkKVaU7WIaOQiy12G3TgcB18DR59fkWEMhP+c
	0BHnN/vHa1PLabmuLeuxPEVMEiReSbNC4QPOrwYIsBALzYXbAeCF8OuF40x3MFoDoLPi
	4ZHRZLtWz6f6suRt3FQ9GrU0t+xY6MY/ryznKr82X/9DAZoFi6t6gBdLxuE2rziCLvPe
	kw3w==
X-Received: by 10.43.182.69 with SMTP id pl5mr28422823icc.55.1425262276550;
	Sun, 01 Mar 2015 18:11:16 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id t5sm6140315ign.12.2015.03.01.18.11.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Mar 2015 18:11:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 02:11:00 +0000
Message-Id: <1425262260-15211-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425262260-15211-1-git-send-email-raj.khem@gmail.com>
References: <1425262260-15211-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/4] gdb: Upgrade 7.8.1 -> 7.9
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
X-List-Received-Date: Mon, 02 Mar 2015 02:11:16 -0000

Refresh patches against new baseline

Change-Id: I34c5a284c12f669ff3539a363e5eded15eeeeb23
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdb/{gdb-7.8.1.inc => gdb-7.9.inc}             |   4 +-
 ...canadian_7.8.1.bb => gdb-cross-canadian_7.9.bb} |   0
 .../gdb/{gdb-cross_7.8.1.bb => gdb-cross_7.9.bb}   |   0
 .../gdb/gdb/gdbserver-cflags-last.diff             |  14 +-
 .../gdb/gdb/renesas-sh-native-support.patch        | 155 ++++++++++-----------
 .../gdb/{gdb_7.8.1.bb => gdb_7.9.bb}               |   0
 6 files changed, 85 insertions(+), 88 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.8.1.inc => gdb-7.9.inc} (68%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.8.1.bb => gdb-cross-canadian_7.9.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.8.1.bb => gdb-cross_7.9.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.8.1.bb => gdb_7.9.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.8.1.inc b/meta/recipes-devtools/gdb/gdb-7.9.inc
similarity index 68%
rename from meta/recipes-devtools/gdb/gdb-7.8.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.9.inc
index 510ea18..6d5eecb 100644
--- a/meta/recipes-devtools/gdb/gdb-7.8.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.9.inc
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
-SRC_URI[md5sum] = "997492cc3475c96f35ecc8775248c9b1"
-SRC_URI[sha256sum] = "d7a923d876ecfa1cec4c1c79c014c9d8e58783a25855a95cf260275f61990647"
+SRC_URI[md5sum] = "8f8ced422fe462a00e0135a643544f17"
+SRC_URI[sha256sum] = "d282508cb7df0cb8b2cf659032ce1bede7b5725796e3ac90f3cd9d65844a65f2"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.8.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.9.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.8.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.9.bb
diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
index 4dfc419..16a3aa9 100644
--- a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
+++ b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
@@ -4,22 +4,20 @@ Upstream-Status: Pending
  gdb/gdbserver/Makefile.in |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+Index: gdb/gdbserver/Makefile.in
+===================================================================
 --- gdb/gdbserver/Makefile.in.orig
 +++ gdb/gdbserver/Makefile.in
-@@ -118,14 +118,14 @@ WARN_CFLAGS_NO_FORMAT = `echo " $(WARN_C
- # CFLAGS is specifically reserved for setting from the command line
- # when running make.  I.E.  "make CFLAGS=-Wmissing-prototypes".
- CFLAGS = @CFLAGS@
+@@ -131,10 +131,10 @@ CFLAGS = @CFLAGS@
+ CPPFLAGS = @CPPFLAGS@
  
  # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
 -INTERNAL_CFLAGS_BASE =  ${CFLAGS} ${GLOBAL_CFLAGS} \
-+INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
- 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
++INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
+ 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS}
  INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
 -INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
 +INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS} -DGDBSERVER
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
- LDFLAGS = @LDFLAGS@
- INTERNAL_LDFLAGS = $(LDFLAGS) @RDYNAMIC@
diff --git a/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch b/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
index 15ff620..2259c6f 100644
--- a/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
+++ b/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
@@ -20,34 +20,34 @@ Last-Update: <2011-11-17>
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: gdb-7.5/gdb/configure.host
+Index: gdb-7.9/gdb/configure.host
 ===================================================================
---- gdb-7.5.orig/gdb/configure.host	2012-05-30 12:41:34.000000000 -0700
-+++ gdb-7.5/gdb/configure.host	2012-09-19 14:40:42.974609772 -0700
-@@ -140,6 +140,7 @@
+--- gdb-7.9.orig/gdb/configure.host
++++ gdb-7.9/gdb/configure.host
+@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
  
- s390*-*-*)		gdb_host=s390 ;;
+ s390*-*-linux*)		gdb_host=linux ;;
  
 +sh*-*-linux*)		gdb_host=linux ;;
  sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
-Index: gdb-7.5/gdb/Makefile.in
+Index: gdb-7.9/gdb/Makefile.in
 ===================================================================
---- gdb-7.5.orig/gdb/Makefile.in	2012-07-02 08:29:33.000000000 -0700
-+++ gdb-7.5/gdb/Makefile.in	2012-09-19 14:40:42.974609772 -0700
-@@ -1493,6 +1493,7 @@
+--- gdb-7.9.orig/gdb/Makefile.in
++++ gdb-7.9/gdb/Makefile.in
+@@ -1707,6 +1707,7 @@ ALLDEPFILES = \
  	score-tdep.c \
  	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
  	sh-tdep.c sh64-tdep.c shnbsd-tdep.c shnbsd-nat.c \
 +	sh-linux-tdep.c sh-linux-nat.c \
  	sol2-tdep.c \
- 	solib-irix.c solib-svr4.c solib-sunos.c \
+ 	solib-svr4.c \
  	sparc-linux-nat.c sparc-linux-tdep.c \
-Index: gdb-7.5/gdb/sh-linux-tdep.c
+Index: gdb-7.9/gdb/sh-linux-tdep.c
 ===================================================================
---- gdb-7.5.orig/gdb/sh-linux-tdep.c	2012-05-07 06:17:29.000000000 -0700
-+++ gdb-7.5/gdb/sh-linux-tdep.c	2012-09-19 14:46:50.610623784 -0700
+--- gdb-7.9.orig/gdb/sh-linux-tdep.c
++++ gdb-7.9/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
  
@@ -86,7 +86,7 @@ Index: gdb-7.5/gdb/sh-linux-tdep.c
  #include "glibc-tdep.h"
  #include "sh-tdep.h"
  #include "linux-tdep.h"
-@@ -180,9 +203,505 @@
+@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_si
    sh_linux_rt_sigreturn_init
  };
  
@@ -592,10 +592,10 @@ Index: gdb-7.5/gdb/sh-linux-tdep.c
    linux_init_abi (info, gdbarch);
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
-Index: gdb-7.5/gdb/sh-tdep.h
+Index: gdb-7.9/gdb/sh-tdep.h
 ===================================================================
---- gdb-7.5.orig/gdb/sh-tdep.h	2012-03-01 15:55:40.000000000 -0800
-+++ gdb-7.5/gdb/sh-tdep.h	2012-09-19 14:48:32.406627602 -0700
+--- gdb-7.9.orig/gdb/sh-tdep.h
++++ gdb-7.9/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
  
  /* Contributed by Steve Chamberlain sac@cygnus.com.  */
@@ -609,7 +609,7 @@ Index: gdb-7.5/gdb/sh-tdep.h
  /* Registers for all SH variants.  Used also by sh3-rom.c.  */
  enum
    {
-@@ -29,6 +35,7 @@
+@@ -29,6 +35,7 @@ enum
      ARG0_REGNUM = 4,
      ARGLAST_REGNUM = 7,
      FP_REGNUM = 14,
@@ -617,7 +617,7 @@ Index: gdb-7.5/gdb/sh-tdep.h
      PC_REGNUM = 16,
      PR_REGNUM = 17,
      GBR_REGNUM = 18,
-@@ -81,6 +88,24 @@
+@@ -81,6 +88,24 @@ enum
      FV0_REGNUM = 76,
      FV_LAST_REGNUM = 79
    };
@@ -642,7 +642,7 @@ Index: gdb-7.5/gdb/sh-tdep.h
  
  /* This structure describes a register in a core-file.  */
  struct sh_corefile_regmap
-@@ -89,8 +114,32 @@
+@@ -89,8 +114,32 @@ struct sh_corefile_regmap
    unsigned int offset;
  };
  
@@ -675,10 +675,10 @@ Index: gdb-7.5/gdb/sh-tdep.h
    /* Non-NULL when debugging from a core file.  Provides the offset
       where each general-purpose register is stored inside the associated
       core file section.  */
-Index: gdb-7.5/gdb/sh-linux-nat.c
+Index: gdb-7.9/gdb/sh-linux-nat.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gdb-7.5/gdb/sh-linux-nat.c	2012-09-19 14:40:42.978609771 -0700
+--- /dev/null
++++ gdb-7.9/gdb/sh-linux-nat.c
 @@ -0,0 +1,269 @@
 +/* Low level SH interface to ptrace, for GDB when running native.
 +   Copyright (C) 2002, 2004 Free Software Foundation, Inc.
@@ -949,10 +949,10 @@ Index: gdb-7.5/gdb/sh-linux-nat.c
 +  /* Register the target.  */
 +  linux_nat_add_target (t);
 +}
-Index: gdb-7.5/gdb/sh-tdep.c
+Index: gdb-7.9/gdb/sh-tdep.c
 ===================================================================
---- gdb-7.5.orig/gdb/sh-tdep.c	2012-06-08 07:24:57.000000000 -0700
-+++ gdb-7.5/gdb/sh-tdep.c	2012-09-19 14:45:09.770619943 -0700
+--- gdb-7.9.orig/gdb/sh-tdep.c
++++ gdb-7.9/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
     sac@cygnus.com.  */
  
@@ -963,7 +963,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  #include "frame.h"
  #include "frame-base.h"
  #include "frame-unwind.h"
-@@ -37,6 +40,7 @@
+@@ -35,6 +38,7 @@
  #include "arch-utils.h"
  #include "floatformat.h"
  #include "regcache.h"
@@ -971,7 +971,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  #include "doublest.h"
  #include "osabi.h"
  #include "reggroups.h"
-@@ -69,23 +73,6 @@
+@@ -67,23 +71,6 @@ static const char *const sh_cc_enum[] =
  
  static const char *sh_active_calling_convention = sh_cc_gcc;
  
@@ -995,7 +995,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  static int
  sh_is_renesas_calling_convention (struct type *func_type)
  {
-@@ -1045,7 +1032,7 @@
+@@ -1043,7 +1030,7 @@ sh_treat_as_flt_p (struct type *type)
      return 0;
    /* Otherwise if the type of that member is float, the whole type is
       treated as float.  */
@@ -1004,7 +1004,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
      return 1;
    /* Otherwise it's not treated as float.  */
    return 0;
-@@ -1095,7 +1082,7 @@
+@@ -1093,7 +1080,7 @@ sh_push_dummy_call_fpu (struct gdbarch *
       in four registers available.  Loop thru args from first to last.  */
    for (argnum = 0; argnum < nargs; argnum++)
      {
@@ -1013,7 +1013,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1809,7 +1796,7 @@
+@@ -1821,7 +1808,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -1022,7 +1022,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1836,7 +1823,7 @@
+@@ -1848,7 +1835,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -1031,7 +1031,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1903,9 +1890,9 @@
+@@ -1915,9 +1902,9 @@ sh_frame_cache (struct frame_info *this_
    return cache;
  }
  
@@ -1044,7 +1044,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1919,7 +1906,7 @@
+@@ -1931,7 +1918,7 @@ sh_frame_prev_register (struct frame_inf
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -1053,7 +1053,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2225,8 +2212,8 @@
+@@ -2237,8 +2224,8 @@ sh_return_in_first_hidden_param_p (struc
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -1063,8 +1063,8 @@ Index: gdb-7.5/gdb/sh-tdep.c
  
    /* SH5 is handled entirely in sh64-tdep.c.  */
    if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2242,6 +2229,18 @@
-   tdep = XZALLOC (struct gdbarch_tdep);
+@@ -2254,6 +2241,18 @@ sh_gdbarch_init (struct gdbarch_info inf
+   tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
 +  /* General-purpose registers.  */
@@ -1082,7 +1082,7 @@ Index: gdb-7.5/gdb/sh-tdep.c
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2389,10 +2388,11 @@
+@@ -2404,10 +2403,11 @@ sh_gdbarch_init (struct gdbarch_info inf
        break;
      }
  
@@ -1095,10 +1095,10 @@ Index: gdb-7.5/gdb/sh-tdep.c
    frame_unwind_append_unwinder (gdbarch, &sh_stub_unwind);
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
-Index: gdb-7.5/gdb/testsuite/gdb.asm/sh-linux.inc
+Index: gdb-7.9/gdb/testsuite/gdb.asm/sh-linux.inc
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gdb-7.5/gdb/testsuite/gdb.asm/sh-linux.inc	2012-09-19 14:40:42.978609771 -0700
+--- /dev/null
++++ gdb-7.9/gdb/testsuite/gdb.asm/sh-linux.inc
 @@ -0,0 +1,78 @@
 +# You'll find a bunch of nop opcodes in the below macros.  They are
 +# there to keep the code correctly aligned.  Be careful to maintain
@@ -1178,10 +1178,10 @@ Index: gdb-7.5/gdb/testsuite/gdb.asm/sh-linux.inc
 +\name:
 +	.long	\value
 +	.endm
-Index: gdb-7.5/gdb/testsuite/gdb.asm/sh.inc
+Index: gdb-7.9/gdb/testsuite/gdb.asm/sh.inc
 ===================================================================
---- gdb-7.5.orig/gdb/testsuite/gdb.asm/sh.inc	2012-04-16 01:02:09.000000000 -0700
-+++ gdb-7.5/gdb/testsuite/gdb.asm/sh.inc	2012-09-19 14:40:42.978609771 -0700
+--- gdb-7.9.orig/gdb/testsuite/gdb.asm/sh.inc
++++ gdb-7.9/gdb/testsuite/gdb.asm/sh.inc
 @@ -40,9 +40,8 @@
  	mov.l   .Lconst\@,r1
  	bra	.Lafterconst\@
@@ -1193,11 +1193,11 @@ Index: gdb-7.5/gdb/testsuite/gdb.asm/sh.inc
  	.long	\subr
  	.align	1
  .Lafterconst\@:
-Index: gdb-7.5/gdb/testsuite/gdb.asm/asm-source.exp
+Index: gdb-7.9/gdb/testsuite/gdb.asm/asm-source.exp
 ===================================================================
---- gdb-7.5.orig/gdb/testsuite/gdb.asm/asm-source.exp	2012-06-25 13:11:43.000000000 -0700
-+++ gdb-7.5/gdb/testsuite/gdb.asm/asm-source.exp	2012-09-19 14:40:42.978609771 -0700
-@@ -108,6 +108,11 @@
+--- gdb-7.9.orig/gdb/testsuite/gdb.asm/asm-source.exp
++++ gdb-7.9/gdb/testsuite/gdb.asm/asm-source.exp
+@@ -113,6 +113,11 @@ switch -glob -- [istarget] {
              append link-flags " -m elf32ppc"
          }
      }
@@ -1209,25 +1209,24 @@ Index: gdb-7.5/gdb/testsuite/gdb.asm/asm-source.exp
      "sh*-*-*" {
          set asm-arch sh
  	set debug-flags "-gdwarf-2"
-Index: gdb-7.5/gdb/testsuite/gdb.base/sigall.c
+Index: gdb-7.9/gdb/testsuite/gdb.base/sigall.c
 ===================================================================
---- gdb-7.5.orig/gdb/testsuite/gdb.base/sigall.c	2012-02-28 02:24:15.000000000 -0800
-+++ gdb-7.5/gdb/testsuite/gdb.base/sigall.c	2012-09-19 14:42:02.202612808 -0700
-@@ -5,6 +5,10 @@
- /* Signal handlers, we set breakpoints in them to make sure that the
-    signals really get delivered.  */
+--- gdb-7.9.orig/gdb/testsuite/gdb.base/sigall.c
++++ gdb-7.9/gdb/testsuite/gdb.base/sigall.c
+@@ -1,6 +1,9 @@
+ #include <signal.h>
+ #include <unistd.h>
  
 +#ifdef __sh__
 +#define signal(a,b)    /* Signals not supported on this target - make them go away */
 +#endif
-+
- #ifdef PROTOTYPES
- void
- handle_ABRT (int sig)
-Index: gdb-7.5/gdb/testsuite/gdb.base/signals.c
+ 
+ /* Signal handlers, we set breakpoints in them to make sure that the
+    signals really get delivered.  */
+Index: gdb-7.9/gdb/testsuite/gdb.base/signals.c
 ===================================================================
---- gdb-7.5.orig/gdb/testsuite/gdb.base/signals.c	2012-02-28 02:24:15.000000000 -0800
-+++ gdb-7.5/gdb/testsuite/gdb.base/signals.c	2012-09-19 14:43:22.034615831 -0700
+--- gdb-7.9.orig/gdb/testsuite/gdb.base/signals.c
++++ gdb-7.9/gdb/testsuite/gdb.base/signals.c
 @@ -3,6 +3,10 @@
  #include <signal.h>
  #include <unistd.h>
@@ -1239,10 +1238,10 @@ Index: gdb-7.5/gdb/testsuite/gdb.base/signals.c
  
  static int count = 0;
  
-Index: gdb-7.5/gdb/testsuite/gdb.base/annota1.c
+Index: gdb-7.9/gdb/testsuite/gdb.base/annota1.c
 ===================================================================
---- gdb-7.5.orig/gdb/testsuite/gdb.base/annota1.c	2012-02-28 14:40:48.000000000 -0800
-+++ gdb-7.5/gdb/testsuite/gdb.base/annota1.c	2012-09-19 14:42:42.074614308 -0700
+--- gdb-7.9.orig/gdb/testsuite/gdb.base/annota1.c
++++ gdb-7.9/gdb/testsuite/gdb.base/annota1.c
 @@ -1,6 +1,9 @@
  #include <stdio.h>
  #include <signal.h>
@@ -1251,12 +1250,12 @@ Index: gdb-7.5/gdb/testsuite/gdb.base/annota1.c
 +#define signal(a,b)    /* Signals not supported on this target - make them go away */
 +#endif
  
- #ifdef PROTOTYPES
  void
-Index: gdb-7.5/gdb/testsuite/gdb.base/annota3.c
+ handle_USR1 (int sig)
+Index: gdb-7.9/gdb/testsuite/gdb.base/annota3.c
 ===================================================================
---- gdb-7.5.orig/gdb/testsuite/gdb.base/annota3.c	2012-02-28 14:40:48.000000000 -0800
-+++ gdb-7.5/gdb/testsuite/gdb.base/annota3.c	2012-09-19 14:43:54.410617081 -0700
+--- gdb-7.9.orig/gdb/testsuite/gdb.base/annota3.c
++++ gdb-7.9/gdb/testsuite/gdb.base/annota3.c
 @@ -1,6 +1,10 @@
  #include <stdio.h>
  #include <signal.h>
@@ -1266,12 +1265,12 @@ Index: gdb-7.5/gdb/testsuite/gdb.base/annota3.c
 +#endif
 +
  
- #ifdef PROTOTYPES
  void
-Index: gdb-7.5/gdb/config/sh/xm-linux.h
+ handle_USR1 (int sig)
+Index: gdb-7.9/gdb/config/sh/xm-linux.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gdb-7.5/gdb/config/sh/xm-linux.h	2012-09-19 14:40:42.994609807 -0700
+--- /dev/null
++++ gdb-7.9/gdb/config/sh/xm-linux.h
 @@ -0,0 +1,32 @@
 +/* Native support for GNU/Linux, for GDB, the GNU debugger.
 +   Copyright (C) 2000 Free Software Foundation, Inc.
@@ -1305,10 +1304,10 @@ Index: gdb-7.5/gdb/config/sh/xm-linux.h
 +#include <unistd.h>
 +
 +#endif	/* #ifndef XM_LINUX_H */
-Index: gdb-7.5/gdb/config/sh/nm-linux.h
+Index: gdb-7.9/gdb/config/sh/nm-linux.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gdb-7.5/gdb/config/sh/nm-linux.h	2012-09-19 14:40:42.994609807 -0700
+--- /dev/null
++++ gdb-7.9/gdb/config/sh/nm-linux.h
 @@ -0,0 +1,54 @@
 +/* Native-dependent definitions for SuperH running Linux, for GDB.
 +   Copyright 2004 Free Software Foundation, Inc.
@@ -1364,10 +1363,10 @@ Index: gdb-7.5/gdb/config/sh/nm-linux.h
 +#define CANNOT_STORE_REGISTER(regno) cannot_store_register (regno)
 +
 +#endif /* NM_LINUX_H */
-Index: gdb-7.5/gdb/config/sh/linux.mh
+Index: gdb-7.9/gdb/config/sh/linux.mh
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gdb-7.5/gdb/config/sh/linux.mh	2012-09-19 14:40:42.994609807 -0700
+--- /dev/null
++++ gdb-7.9/gdb/config/sh/linux.mh
 @@ -0,0 +1,8 @@
 +# Host: Renesas Super-H running GNU/Linux
 +NAT_FILE= config/sh/nm-linux.h
diff --git a/meta/recipes-devtools/gdb/gdb_7.8.1.bb b/meta/recipes-devtools/gdb/gdb_7.9.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.8.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.9.bb
-- 
2.1.4


