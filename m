Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYf-0008UB-UQ
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:05:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580335"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:08 -0700
Message-Id: <51bb9ab5c92b37b64dabf4a89906cbf8ac36447b.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (Updated) 06/15] gdb: Update to 7.3
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
X-List-Received-Date: Sun, 07 Aug 2011 05:05:58 -0000

This has one upstream patch removed and a couple rebased

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc           |    8 +++-
 ...s-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} |    2 +-
 .../gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb}     |    2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    2 +-
 .../fix_for_build_error_internal_error_call.patch  |   20 -----------
 .../gdb/gdb/gdbserver-cflags-last.diff             |   16 +++++----
 .../gdb/gdb/kill_arm_map_symbols.patch             |   36 ++++++++++----------
 .../gdb/{gdb_7.2.bb => gdb_7.3.bb}                 |    4 +--
 8 files changed, 37 insertions(+), 53 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} (87%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb} (83%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
 rename meta/recipes-devtools/gdb/{gdb_7.2.bb => gdb_7.3.bb} (68%)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 8ec3735..df6c70f 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,9 @@ DESCRIPTION = "gdb - GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE="GPLv3+"
 SECTION = "devel"
-DEPENDS = "ncurses readline elfutils"
+DEPENDS = "ncurses readline elfutils lttng-ust"
+
+INC_PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -13,6 +15,9 @@ inherit autotools
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
            file://no-werror.patch"
 
+SRC_URI[md5sum] = "1d6b4e469270433583ef62a906c02fa8"
+SRC_URI[sha256sum] = "d1791d1f9d6c21ec265f4f74dadc15bc35698158a1b836d1626b9a69b818f5c5"
+
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
 export CPP_FOR_BUILD = "${BUILD_CPP}"
@@ -29,7 +34,6 @@ EXPAT = "--without-expat"
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
                 ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \
-                --without-ust \
                "
 
 GDBPROPREFIX = "--program-prefix=''"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb
similarity index 87%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb
index ca44b3c..58c20c4 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.2.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.2.bb b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
similarity index 83%
rename from meta/recipes-devtools/gdb/gdb-cross_7.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.3.bb
index b5a8bea..9c2ed07 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.2.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
@@ -3,4 +3,4 @@ require gdb-cross.inc
 SRC_URI += "file://sim-install-6.6.patch;patch=1"
 EXPAT = "--with-expat"
 
-PR = "r0"
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index efa3cbf..9f5f34f 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -4,7 +4,7 @@ inherit gettext
 
 SRC_URI += "file://kill_arm_map_symbols.patch \
             file://gdbserver-cflags-last.diff;striplevel=0 \
-            file://fix_for_build_error_internal_error_call.patch "
+           "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
 
diff --git a/meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch b/meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
deleted file mode 100644
index afb1783..0000000
--- a/meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-The prototype of function internall_error has changed. And one place in the code was not synced up with the new prototype, causing build error. This patche fixes that.
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-2010/11/12
-
-Index: gdb-7.2/gdb/gdbserver/linux-i386-ipa.c
-===================================================================
---- gdb-7.2.orig/gdb/gdbserver/linux-i386-ipa.c
-+++ gdb-7.2/gdb/gdbserver/linux-i386-ipa.c
-@@ -178,7 +178,7 @@ supply_static_tracepoint_registers (stru
- 	    }
- 	    break;
- 	  default:
--	    internal_error ("unhandled register size: %d",
-+	    internal_error (__FILE__, __LINE__, "unhandled register size: %d",
- 			    i386_st_collect_regmap[i].size);
- 	  }
-       }
diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
index 0475a42..8256f17 100644
--- a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
+++ b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
@@ -2,16 +2,18 @@ Upstream-Status: Pending
 
 Index: gdb/gdbserver/Makefile.in
 ===================================================================
---- gdb/gdbserver/Makefile.in.orig
-+++ gdb/gdbserver/Makefile.in
-@@ -89,8 +89,8 @@ WARN_CFLAGS = -Wall
+--- gdb/gdbserver/Makefile.in.orig	2011-03-09 23:32:02.000000000 -0800
++++ gdb/gdbserver/Makefile.in	2011-08-05 21:16:43.592202579 -0700
+@@ -94,10 +94,10 @@
  CFLAGS = @CFLAGS@
  
  # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
--INTERNAL_CFLAGS =  $(WARN_CFLAGS) ${CFLAGS} ${GLOBAL_CFLAGS} \
--	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
-+INTERNAL_CFLAGS =  $(WARN_CFLAGS) ${GLOBAL_CFLAGS} \
-+	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CFLAGS}
+-INTERNAL_CFLAGS_BASE =  ${CFLAGS} ${GLOBAL_CFLAGS} \
++INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
+ 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
+ INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
+-INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS)
++INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS}
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
diff --git a/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch b/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
index c1756f7..9fc45b9 100644
--- a/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
+++ b/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
@@ -1,26 +1,26 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: gdb-6.3/gdb/arm-tdep.c
+Index: gdb-7.3/gdb/arm-tdep.c
 ===================================================================
---- gdb-6.3.orig/gdb/arm-tdep.c	2004-08-03 02:02:20.000000000 +0000
-+++ gdb-6.3/gdb/arm-tdep.c	2005-11-09 15:13:29.000000000 +0000
-@@ -2491,6 +2491,19 @@
+--- gdb-7.3.orig/gdb/arm-tdep.c	2011-05-17 14:27:01.000000000 -0700
++++ gdb-7.3/gdb/arm-tdep.c	2011-08-05 22:29:58.784201850 -0700
+@@ -7806,6 +7806,19 @@
  static void
  arm_elf_make_msymbol_special(asymbol *sym, struct minimal_symbol *msym)
  {
 +
-+   /* FIXME: We want gdb to ignore the ARM ELF mapping symbols when
-+      displaying disassembly so we use this horrible hack here to
-+      artifically set their address to the highest possible value.
-+      This is wrong of course, and it prevents the symbols from being
-+      used for their intended purpose - to distinguish between ARM
-+      and THUMB code.  So we ought to find a better way to do this.  */
-+  if (bfd_asymbol_name (sym)
-+       && bfd_asymbol_name (sym)[0] == '$'
-+       && bfd_asymbol_name (sym)[1] != 0
-+       && bfd_asymbol_name (sym)[2] == 0)
-+     SYMBOL_VALUE_ADDRESS(msym) = (CORE_ADDR) 0x7ffffffc;
++    /* FIXME: We want gdb to ignore the ARM ELF mapping symbols when
++	displaying disassembly so we use this horrible hack here to
++	artifically set their address to the highest possible value.
++	This is wrong of course, and it prevents the symbols from being
++	used for their intended purpose - to distinguish between ARM
++	and THUMB code.  So we ought to find a better way to do this.  */
++    if (bfd_asymbol_name (sym)
++	&& bfd_asymbol_name (sym)[0] == '$'
++	&& bfd_asymbol_name (sym)[1] != 0
++	&& bfd_asymbol_name (sym)[2] == 0)
++      SYMBOL_VALUE_ADDRESS(msym) = (CORE_ADDR) 0x7ffffffc;
 +
-   /* Thumb symbols are of type STT_LOPROC, (synonymous with
-      STT_ARM_TFUNC).  */
-   if (ELF_ST_TYPE (((elf_symbol_type *)sym)->internal_elf_sym.st_info)
+   if (ARM_SYM_BRANCH_TYPE (&((elf_symbol_type *)sym)->internal_elf_sym)
+       == ST_BRANCH_TO_THUMB)
+     MSYMBOL_SET_SPECIAL (msym);
diff --git a/meta/recipes-devtools/gdb/gdb_7.2.bb b/meta/recipes-devtools/gdb/gdb_7.3.bb
similarity index 68%
rename from meta/recipes-devtools/gdb/gdb_7.2.bb
rename to meta/recipes-devtools/gdb/gdb_7.3.bb
index 501efb4..5e21858 100644
--- a/meta/recipes-devtools/gdb/gdb_7.2.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.3.bb
@@ -4,7 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-PR = "r0"
+PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "950b766466bee748e554765c86b8b495"
-SRC_URI[sha256sum] = "34919cb51334c8149ae36ed086f35e79fe3fa2b2a85b568d7c0edad20cd972d4"
-- 
1.7.3.4



