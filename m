Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcXrh-0005m9-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 09:10:13 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	09:06:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 09:06:19 +0200
Message-ID: <0be9d4752691ca2ded01052f9b67a344475fc256.1309503939.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309503939.git.anders@chargestorm.se>
References: <cover.1309503939.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v4 6/8] modutils: remove modutils
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
X-List-Received-Date: Fri, 01 Jul 2011 07:10:13 -0000
Content-Type: text/plain

As 2.4 support is being phased out, remove modutils.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-kernel/modutils/files/armeb.patch     |   16 ----
 meta/recipes-kernel/modutils/files/configure.patch |   34 -------
 meta/recipes-kernel/modutils/files/gcc4.patch      |   93 --------------------
 meta/recipes-kernel/modutils/files/lex.l.diff      |   35 --------
 .../modutils/files/modutils-notest.patch           |   16 ----
 .../modutils/files/program_prefix.patch            |   71 ---------------
 .../recipes-kernel/modutils/modutils-collateral.bb |   21 -----
 .../modutils/modutils-cross/module.h.diff          |   35 --------
 .../modutils/modutils-cross_2.4.27.bb              |   20 ----
 meta/recipes-kernel/modutils/modutils_2.4.27.bb    |   93 --------------------
 10 files changed, 0 insertions(+), 434 deletions(-)
 delete mode 100644 meta/recipes-kernel/modutils/files/armeb.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/configure.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/gcc4.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/lex.l.diff
 delete mode 100644 meta/recipes-kernel/modutils/files/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/modutils-notest.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/program_prefix.patch
 delete mode 100644 meta/recipes-kernel/modutils/modutils-collateral.bb
 delete mode 100644 meta/recipes-kernel/modutils/modutils-cross/module.h.diff
 delete mode 100644 meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
 delete mode 100644 meta/recipes-kernel/modutils/modutils_2.4.27.bb

diff --git a/meta/recipes-kernel/modutils/files/armeb.patch b/meta/recipes-kernel/modutils/files/armeb.patch
deleted file mode 100644
index 3198553..0000000
--- a/meta/recipes-kernel/modutils/files/armeb.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
---- modutils-2.4.27/include/elf_arm.h.orig	2004-09-21 18:37:00.000000000 -0400
-+++ modutils-2.4.27/include/elf_arm.h	2004-09-21 18:38:18.000000000 -0400
-@@ -1,7 +1,11 @@
- /* Machine-specific elf macros for ARM.  */
- 
- #define ELFCLASSM	ELFCLASS32
-+#ifdef __ARMEB__
-+#define ELFDATAM	ELFDATA2MSB
-+#else
- #define ELFDATAM	ELFDATA2LSB
-+#endif
- 
- #define MATCH_MACHINE(x)  (x == EM_ARM)
- 
diff --git a/meta/recipes-kernel/modutils/files/configure.patch b/meta/recipes-kernel/modutils/files/configure.patch
deleted file mode 100644
index 63e80d7..0000000
--- a/meta/recipes-kernel/modutils/files/configure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- modutils-2.4.25/./configure.in~configure
-+++ modutils-2.4.25/./configure.in
-@@ -1,4 +1,5 @@
--AC_INIT(insmod/insmod.c)
-+AC_INIT
-+AC_CONFIG_SRCDIR([insmod/insmod.c])
- AC_PREFIX_DEFAULT(/usr)
- 
- # Canonical system uses CC_FOR_BUILD while Linux may use BUILDCC
-@@ -15,7 +16,7 @@
- BUILDCC="$CC_FOR_BUILD"
- export CC_FOR_BUILD
- 
--AC_CANONICAL_SYSTEM
-+AC_CANONICAL_TARGET([])
- 
- # Handle target_cpu for compatibility.
- if test "$host_cpu" != "$target_cpu"; then
-@@ -350,6 +351,7 @@
-   fi
- fi
- 
--AC_OUTPUT(Makefile Makefile.common depmod/Makefile genksyms/Makefile
-+AC_CONFIG_FILES([Makefile Makefile.common depmod/Makefile genksyms/Makefile
- 	  insmod/Makefile $kerneld_Makefiles obj/Makefile util/Makefile
--	  man/Makefile)
-+	  man/Makefile])
-+AC_OUTPUT
diff --git a/meta/recipes-kernel/modutils/files/gcc4.patch b/meta/recipes-kernel/modutils/files/gcc4.patch
deleted file mode 100644
index 4507b03..0000000
--- a/meta/recipes-kernel/modutils/files/gcc4.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-Upstream-Status: Pending
-
-Index: modutils-2.4.27/depmod/depmod.c
-===================================================================
---- modutils-2.4.27.orig/depmod/depmod.c
-+++ modutils-2.4.27/depmod/depmod.c
-@@ -1133,7 +1133,7 @@ static int addksyms(char *file_syms)
- 
- 		for (ksym = ksyms; so_far < nksyms; ++so_far, ksym++) {
- 			if (strncmp((char *)ksym->name, "GPLONLY_", 8) == 0)
--				((char *)ksym->name) += 8;
-+				ksym->name += 8;
- 			assert(n_syms < MAX_MAP_SYM);
- 			symtab[n_syms++] = addsym((char *)ksym->name, mod, SYM_DEFINED, 0);
- 		}
-Index: modutils-2.4.27/genksyms/genksyms.c
-===================================================================
---- modutils-2.4.27.orig/genksyms/genksyms.c
-+++ modutils-2.4.27/genksyms/genksyms.c
-@@ -45,7 +45,7 @@ char *cur_filename, *output_directory;
- int flag_debug, flag_dump_defs, flag_warnings;
- int checksum_version = 1, kernel_version = version(2,0,0);
- 
--static int errors;
-+int errors;
- static int nsyms;
- 
- static struct symbol *expansion_trail;
-Index: modutils-2.4.27/insmod/insmod.c
-===================================================================
---- modutils-2.4.27.orig/insmod/insmod.c
-+++ modutils-2.4.27/insmod/insmod.c
-@@ -275,7 +275,7 @@ static int add_symbols_from(struct obj_f
- 		if (strncmp((char *)s->name, "GPLONLY_", 8) == 0) {
- 			gplonly_seen = 1;
- 			if (gpl)
--				((char *)s->name) += 8;
-+				s->name += 8;
- 			else
- 				continue;
- 		}
-Index: modutils-2.4.27/obj/obj_kallsyms.c
-===================================================================
---- modutils-2.4.27.orig/obj/obj_kallsyms.c
-+++ modutils-2.4.27/obj/obj_kallsyms.c
-@@ -200,7 +200,7 @@ obj_kallsyms (struct obj_file *fin, stru
- 
-     /* Initial contents, header + one entry per input section.  No strings. */
-     osec->header.sh_size = sizeof(*a_hdr) + loaded*sizeof(*a_sec);
--    a_hdr = (struct kallsyms_header *) osec->contents =
-+    a_hdr = osec->contents =
-     	xmalloc(osec->header.sh_size);
-     memset(osec->contents, 0, osec->header.sh_size);
-     a_hdr->size = sizeof(*a_hdr);
-@@ -275,7 +275,7 @@ obj_kallsyms (struct obj_file *fin, stru
- 	a_hdr->symbol_off +
- 	a_hdr->symbols*a_hdr->symbol_size +
- 	strings_size - strings_left;
--    a_hdr = (struct kallsyms_header *) osec->contents =
-+    a_hdr = osec->contents =
- 	xrealloc(a_hdr, a_hdr->total_size);
-     p = (char *)a_hdr + a_hdr->symbol_off;
-     memcpy(p, symbols, a_hdr->symbols*a_hdr->symbol_size);
-Index: modutils-2.4.27/obj/obj_mips.c
-===================================================================
---- modutils-2.4.27.orig/obj/obj_mips.c
-+++ modutils-2.4.27/obj/obj_mips.c
-@@ -244,7 +244,9 @@ arch_archdata (struct obj_file *f, struc
-   archdata_sec->header.sh_size = 0;
-   sec = obj_find_section(f, "__dbe_table");
-   if (sec) {
--    ad = (struct archdata *) (archdata_sec->contents) = xmalloc(sizeof(*ad));
-+/*    ad = (struct archdata *) (archdata_sec->contents) = xmalloc(sizeof(*ad));*/
-+    archdata_sec->contents = xmalloc(sizeof(*ad));
-+    ad = (struct archdata *) (archdata_sec->contents);
-     memset(ad, 0, sizeof(*ad));
-     archdata_sec->header.sh_size = sizeof(*ad);
-     ad->__start___dbe_table = sec->header.sh_addr;
-Index: modutils-2.4.27/obj/obj_ppc.c
-===================================================================
---- modutils-2.4.27.orig/obj/obj_ppc.c
-+++ modutils-2.4.27/obj/obj_ppc.c
-@@ -255,7 +255,9 @@ arch_archdata (struct obj_file *f, struc
-   archdata_sec->header.sh_size = 0;
-   sec = obj_find_section(f, "__ftr_fixup");
-   if (sec) {
--    ad = (struct archdata *) (archdata_sec->contents) = xmalloc(sizeof(*ad));
-+    /* ad = (struct archdata *) (archdata_sec->contents) = xmalloc(sizeof(*ad)); */
-+    archdata_sec->contents = xmalloc(sizeof(*ad));
-+    ad = (struct archdata *) (archdata_sec->contents);
-     memset(ad, 0, sizeof(*ad));
-     archdata_sec->header.sh_size = sizeof(*ad);
-     ad->__start___ftr_fixup = sec->header.sh_addr;
diff --git a/meta/recipes-kernel/modutils/files/lex.l.diff b/meta/recipes-kernel/modutils/files/lex.l.diff
deleted file mode 100644
index b2419a4..0000000
--- a/meta/recipes-kernel/modutils/files/lex.l.diff
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
---- modutils-2.4.26.orig/genksyms/lex.l
-+++ modutils-2.4.26/genksyms/lex.l
-@@ -130,6 +130,7 @@
- 
-   static int suppress_type_lookup, dont_want_brace_phrase;
-   static struct string_list *next_node;
-+  static int next_token = 0;
- 
-   int token, count = 0;
-   struct string_list *cur_node;
-@@ -144,7 +145,12 @@
-     }
- 
- repeat:
--  token = yylex1();
-+  if (next_token != 0) {
-+    token = next_token;
-+    next_token = 0;
-+  }
-+  else
-+    token = yylex1();
- 
-   if (token == 0)
-     return 0;
-@@ -425,7 +431,7 @@
- 	    {
- 	      /* Put back the token we just read so's we can find it again
- 		 after registering the expression.  */
--	      unput(token);
-+	      next_token = token;
- 
- 	      lexstate = ST_NORMAL;
- 	      token = EXPRESSION_PHRASE;
diff --git a/meta/recipes-kernel/modutils/files/modules b/meta/recipes-kernel/modutils/files/modules
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-kernel/modutils/files/modules.conf b/meta/recipes-kernel/modutils/files/modules.conf
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-kernel/modutils/files/modutils-notest.patch b/meta/recipes-kernel/modutils/files/modutils-notest.patch
deleted file mode 100644
index ab100f2..0000000
--- a/meta/recipes-kernel/modutils/files/modutils-notest.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-This test disables the annoying
-   Note: /etc/modules.conf is more recent than /lib/modules/2.4.19-rmk6-pxa1/modules.dep
-message.
-
-Upstream-Status: Inappropriate [disable feature]
-
---- modutils-2.4.6/insmod/modprobe.c~notest	Mon Feb 26 02:07:17 2001
-+++ modutils-2.4.6/insmod/modprobe.c	Wed Feb 19 14:31:52 2003
-@@ -785,7 +785,6 @@
- 		return -1;
- 	}
- 
--#define EXTREMELY_CAUTIOUS
- #ifdef EXTREMELY_CAUTIOUS
- 	if (fstat(fileno(fin), &statbuf) != 0)
- 		error("Could not stat %s", depfile);
diff --git a/meta/recipes-kernel/modutils/files/program_prefix.patch b/meta/recipes-kernel/modutils/files/program_prefix.patch
deleted file mode 100644
index 973705e..0000000
--- a/meta/recipes-kernel/modutils/files/program_prefix.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream-Status: Pending
-
---- modutils-2.4.25/Makefile.common.in	Sun Nov 24 21:23:35 2002
-+++ modutils-2.4.25/Makefile.common.in	Thu Jan 29 17:16:30 2004
-@@ -7,6 +7,7 @@
- mandir		= @mandir@
- prefix		= @prefix@
- sbindir		= @sbindir@
-+transform	= @program_transform_name@
- 
- AR		= @AR@
- ARCH		= @ARCH@
---- modutils-2.4.25/configure.in	Thu Jan 29 17:24:10 2004
-+++ modutils-2.4.25/configure.in	Thu Jan 29 17:13:59 2004
-@@ -17,6 +17,7 @@
- export CC_FOR_BUILD
- 
- AC_CANONICAL_TARGET([])
-+AC_ARG_PROGRAM
- 
- # Handle target_cpu for compatibility.
- if test "$host_cpu" != "$target_cpu"; then
---- modutils-2.4.25/depmod/Makefile.in	Fri Mar 28 17:54:20 2003
-+++ modutils-2.4.25/depmod/Makefile.in	Thu Jan 29 17:16:41 2004
-@@ -60,7 +60,7 @@
- 
- install install-bin: all
- 	$(MKDIR) $(DESTDIR)$(sbindir)
--	$(INSTALL) $(STRIP) depmod $(DESTDIR)$(sbindir)
-+	$(INSTALL) $(STRIP) depmod $(DESTDIR)$(sbindir)/`echo depmod | sed -e'$(transform)'`
- 
- dep depend .depend: depmod.c
- 	$(CC) -M $(CFLAGS) $(DEFSNOARCH) $(DEFS) $^ > .depend
---- modutils-2.4.25/genksyms/Makefile.in	Sun Nov 24 21:23:35 2002
-+++ modutils-2.4.25/genksyms/Makefile.in	Thu Jan 29 17:17:07 2004
-@@ -62,7 +62,7 @@
- 
- install install-bin: all
- 	$(MKDIR) $(DESTDIR)$(sbindir)
--	$(INSTALL) $(STRIP) genksyms $(DESTDIR)$(sbindir)
-+	$(INSTALL) $(STRIP) genksyms $(DESTDIR)$(sbindir)/`echo genksyms | sed -e'$(transform)'`
- 
- # auto-generated dependancies are almost redundant once we add all the
- # rules to get the generated files built first.
---- modutils-2.4.25/insmod/Makefile.in	Fri Mar 28 17:54:20 2003
-+++ modutils-2.4.25/insmod/Makefile.in	Thu Jan 29 17:21:10 2004
-@@ -120,16 +120,19 @@
- 	@set -ex;\
- 	for i in $(TARGETS_REAL); do \
- 	$(MKDIR) $(DESTDIR)$(sbindir); \
--	$(INSTALL) $(STRIP) $$i $(DESTDIR)$(sbindir); done;
-+	f=`echo $$i|sed -e'$(transform)'`; \
-+	$(INSTALL) $(STRIP) $$i $(DESTDIR)$(sbindir)/$$f; done;
- 	set -e; \
--	for i in $(srcdir)/insmod_ksymoops_clean $(srcdir)/kernelversion; do \
-+	for i in insmod_ksymoops_clean kernelversion; do \
- 	$(MKDIR) $(DESTDIR)$(sbindir); \
--	$(INSTALL) $$i $(DESTDIR)$(sbindir); done;
-+	f=`echo $$i|sed -e'$(transform)'`; \
-+	$(INSTALL) $$i $(DESTDIR)$(sbindir)/$$f; done;
- 	set -e; \
- 	for i in $(COMB); do \
--	ln -sf insmod $(DESTDIR)$(sbindir)/$$i; \
-+	f=`echo $$i|sed -e'$(transform)'`; \
-+	ln -sf `echo insmod|sed -e'$(transform)'` $(DESTDIR)$(sbindir)/$$f; \
- 	(test "$(insmod_static)" = yes && \
--		ln -sf insmod.static $(DESTDIR)$(sbindir)/$$i.static) || true; \
-+		ln -sf `echo insmod.static|sed -e'$(transform)'`  $(DESTDIR)$(sbindir)/$$f.static) || true; \
- 	done
- 
- clean:
diff --git a/meta/recipes-kernel/modutils/modutils-collateral.bb b/meta/recipes-kernel/modutils/modutils-collateral.bb
deleted file mode 100644
index 919b86f..0000000
--- a/meta/recipes-kernel/modutils/modutils-collateral.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SECTION = "base"
-DESCRIPTION = "modutils configuration files"
-PR = "r3"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-SRC_URI = "file://modules \
-	   file://modules.conf" 
-
-do_compile () {
-}
-
-do_install () {
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/modules ${D}${sysconfdir}/modules
-        if [ ${MAJOR_KERNEL_VERSION}=2.6 ]; then
-  	 install -d ${D}${sysconfdir}/modprobe.d         
-        else
- 	 install -m 0644 ${WORKDIR}/modules.conf ${D}${sysconfdir}/modules.conf
-        fi
-
-}
diff --git a/meta/recipes-kernel/modutils/modutils-cross/module.h.diff b/meta/recipes-kernel/modutils/modutils-cross/module.h.diff
deleted file mode 100644
index e9f1224..0000000
--- a/meta/recipes-kernel/modutils/modutils-cross/module.h.diff
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN modutils-2.4.27.orig/include/module.h modutils-2.4.27/include/module.h
---- modutils-2.4.27.orig/include/module.h	2003-01-27 11:22:02.000000000 -0500
-+++ modutils-2.4.27/include/module.h	2004-08-23 19:52:34.756772712 -0400
-@@ -88,6 +88,20 @@
- /* For sizeof() which are related to the module platform and not to the
-    environment isnmod is running in, use sizeof_xx instead of sizeof(xx).  */
- 
-+/* Additional test for OE, set tgt_blah correct for the target arch, *not* the
-+   native arch. If int isn't 32bit on the native machine we're in trouble. */
-+
-+#ifdef ARCH_arm
-+#define tgt_sizeof_char		sizeof(char)
-+#define tgt_sizeof_short	sizeof(short)
-+#define tgt_sizeof_int		sizeof(int)
-+#define tgt_sizeof_long		4
-+#define tgt_sizeof_char_p	4
-+#define tgt_sizeof_void_p	4
-+#define tgt_long		int
-+#define tgt_long_fmt		"l"
-+#define tgt_strtoul		strtoul
-+#else
- #define tgt_sizeof_char		sizeof(char)
- #define tgt_sizeof_short	sizeof(short)
- #define tgt_sizeof_int		sizeof(int)
-@@ -97,7 +111,7 @@
- #define tgt_long		long
- #define tgt_long_fmt		"l"
- #define tgt_strtoul		strtoul
--
-+#endif
- /* This assumes that long long on a 32 bit system is equivalent to long on the
-  * equivalent 64 bit system.  Also that void and char pointers are 8 bytes on
-  * all 64 bit systems.  Add per system tweaks if it ever becomes necessary.
diff --git a/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb b/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
deleted file mode 100644
index f7c68bb..0000000
--- a/meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require modutils_${PV}.bb
-PR = "r10"
-inherit cross
-DEPENDS = ""
-PACKAGES = ""
-PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.4"
-DEFAULT_PREFERENCE = "1"
-
-SRC_URI +=  "file://modutils-cross/module.h.diff;patch=1"
-
-sbindir = "${prefix}/bin"
-
-EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX}"
-
-CFLAGS_prepend_mipsel = "-D__MIPSEL__"
-CFLAGS_prepend_mipseb = "-D__MIPSEB__"
-
-do_install_append () {
-        mv ${D}${sbindir}/${TARGET_PREFIX}depmod ${D}${sbindir}/${TARGET_PREFIX}depmod-2.4
-}
diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
deleted file mode 100644
index 9f2add3..0000000
--- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
+++ /dev/null
@@ -1,93 +0,0 @@
-SECTION = "base"
-SUMMARY = "Kernel module utilities"
-DESCRIPTION = "These utilities are intended to make a Linux modular kernel \
-manageable for all users, administrators and distribution maintainers."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-DEPENDS = "bison-native"
-PR = "r10"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.bz2 \
-           file://lex.l.diff;patch=1 \
-           file://modutils-notest.patch;patch=1 \
-           file://configure.patch;patch=1 \
-           file://program_prefix.patch;patch=1 \
-           file://armeb.patch;patch=1 \
-	   file://gcc4.patch;patch=1"
-
-SRC_URI[md5sum] = "bac989c74ed10f3bf86177fc5b4b89b6"
-SRC_URI[sha256sum] = "ab4c9191645f9ffb455ae7c014d8c45339c13a1d0f6914817cfbf30a0bc56bf0"
-
-inherit autotools
-
-# modutils go in /sbin
-sbindir = "/sbin"
-EXTRA_OECONF = "--disable-strip"
-export BUILDCC = "${BUILD_CC}"
-export BUILDCFLAGS = "${BUILD_CFLAGS}"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	install -d ${D}${sysconfdir}
-	rm ${D}${base_sbindir}/lsmod
-	install -d ${D}${base_bindir}/
-	ln -s ../sbin/insmod ${D}${base_bindir}/lsmod
-        for f in bin/lsmod sbin/insmod sbin/rmmod sbin/modprobe sbin/modinfo sbin/depmod; do                mv ${D}/$f ${D}/$f.24
-        done
-}
-
-pkg_postinst_modutils () {
-#!/bin/sh
-for f in sbin/insmod sbin/modprobe sbin/rmmod bin/lsmod; do
-	bn=`basename $f`
-	update-alternatives --install /$f $bn /$f.24 10
-done
-if test -n "$D"; then
-	D="-r $D"
-	if test -n "`which ${TARGET_PREFIX}depmod-2.4`"; then
-		for kerneldir in `ls -p $D/lib/modules|grep /`; do
-			kernelver=`basename $kerneldir`
-			${TARGET_PREFIX}depmod-2.4 -a -b $D -C ${IMAGE_ROOTFS}/${sysconfdir}/modules.conf -r $kernelver
-		done
-	fi
-fi
-update-rc.d $D modutils.sh start 20 S .
-}
-
-pkg_prerm_modutils () {
-#!/bin/sh
-for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/depmod sbin/modinfo bin/lsmod; do
-bn=`basename $f`
-	update-alternatives --remove $bn /$f.24
-done
-if test -n "$D"; then
-	D="-r $D"
-fi
-update-rc.d $D modutils.sh remove
-}
-
-pkg_postinst_modutils-depmod() {
-#!/bin/sh
-update-alternatives --install /sbin/depmod depmod /sbin/depmod.24 10
-}
-
-pkg_postinst_modutils-modinfo() {
-#!/bin/sh
-update-alternatives --install /sbin/modinfo modinfo /sbin/modinfo.24 10
-}
-
-pkg_prerm_modutils-depmod() {
-#!/bin/sh
-update-alternatives --remove depmod /sbin/depmod.24
-}
-
-pkg_prerm_modutils-modinfo() {
-#!/bin/sh
-update-alternatives --remove modinfo /sbin/modinfo.24
-}
-
-PACKAGES = "${PN}-dbg modutils-depmod modutils-modinfo modutils-doc modutils"
-
-FILES_modutils-depmod = "sbin/depmod.24"
-FILES_modutils-modinfo = "sbin/modinfo.24"
-RDEPENDS_modutils = "modutils-depmod"
-- 
1.7.4.1



