Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CAE4672D18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 11:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4ABV3xb027824 for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 12:31:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ezstOIRUIxeb
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 12:31:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4ABUnXF027819
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 12:31:01 +0100
Message-ID: <1431257449.30971.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 12:30:49 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] insserv: Remove
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
X-List-Received-Date: Sun, 10 May 2015 11:31:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Remove insserv from OE-Core. It did have uses but we've optimised the sysvinit
scripts as needed and there are other directions init systems are moving now.
It no longer belongs in the core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insserv.bbclass b/meta/classes/insserv.bbclass
deleted file mode 100644
index 14290a7..0000000
--- a/meta/classes/insserv.bbclass
+++ /dev/null
@@ -1,5 +0,0 @@
-do_rootfs[depends] += "insserv-native:do_populate_sysroot"
-run_insserv () {
-            insserv -p ${IMAGE_ROOTFS}/etc/init.d -c ${STAGING_ETCDIR_NATIVE}/insserv.conf
-}
-ROOTFS_POSTPROCESS_COMMAND += " run_insserv ; "
diff --git a/meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch b/meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch
deleted file mode 100644
index 6ee9532..0000000
--- a/meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending
-
-insserv (1.14.0-5.1) UNRELEASED; urgency=low
-
-  * Non-maintainer upload.
-  * moving definition of "extension" in listing.h outside of 
-    an if loop with condition related to __STDC_VERSION__.
-  * I observed that this gets build with gcc-4.9.2, as for gcc 
-    __STDC_VERSION__ is not defined.
-  * I got these error while using clang to build this package.
-  * I tested it with clang-3.5(__STDC_VERSION__ 199901L) and
-    clang 3.7(__STDC_VERSION__ 201112L) and getting same error 
-    described in in Bug #777914.
-
- -- Mohit Bhakkad <mohit.bhakkad@gmail.com>  Sat, 04 Apr 2015 19:14:48 +0000
-
- insserv (1.14.0-5) unstable; urgency=low
- 
-   * Add +mountall-bootclean to $local_fs virtual facility definition in
-Index: insserv-1.14.0/listing.h
-===================================================================
---- insserv-1.14.0.orig/listing.h
-+++ insserv-1.14.0/listing.h
-@@ -47,9 +47,9 @@ typedef unsigned int uint;
- # ifndef  asm
- #  define asm			__asm__
- # endif
--# ifndef  extension
--#  define extension		__extension__
--# endif
-+#endif
-+#ifndef  extension
-+# define extension             __extension__
- #endif
- #ifndef  attribute
- # define attribute(attr)	__attribute__(attr)
diff --git a/meta/recipes-devtools/insserv/files/disable_runtests.patch b/meta/recipes-devtools/insserv/files/disable_runtests.patch
deleted file mode 100644
index 15a7dd8..0000000
--- a/meta/recipes-devtools/insserv/files/disable_runtests.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Disable the make check runtime tests, which cannot be run when
-cross-compiled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN insserv-1.14.0.orig//Makefile insserv-1.14.0/Makefile
---- insserv-1.14.0.orig//Makefile	2010-11-28 17:12:01.715597293 -0800
-+++ insserv-1.14.0/Makefile	2010-11-28 17:16:33.837780660 -0800
-@@ -119,8 +119,8 @@
- ifeq ($(ISSUSE),-DSUSE)
- 	issuse=true tests/common
- #	issuse=true tests/suse
--else
--	tests/common
-+#else
-+#	tests/common
- endif
- 
- install:	$(TODO) check
diff --git a/meta/recipes-devtools/insserv/files/insserv.conf b/meta/recipes-devtools/insserv/files/insserv.conf
deleted file mode 100644
index 4858f85..0000000
--- a/meta/recipes-devtools/insserv/files/insserv.conf
+++ /dev/null
@@ -1,41 +0,0 @@
-#
-# All local filesystems are mounted (done during boot phase)
-#
-$local_fs	mountall
-
-#
-# Low level networking (ethernet card)
-#
-$network	networking +pcmcia +hotplug
-
-#
-# Named is operational
-#
-$named		+named +dnsmasq +lwresd $network
-
-#
-# All remote filesystems are mounted (note in some cases /usr may
-# be remote. Most applications that care will probably require
-# both $local_fs and $remote_fs)
-#
-$remote_fs	$local_fs +mountnfs
-
-#
-# System logger is operational
-#
-$syslog		sysklogd
-
-#
-# SunRPC portmapper available
-#
-$portmap	portmap
-
-#
-# The system time has been set correctly
-#
-$time		hwclock
-
-#
-# Services which need to be interactive
-#
-<interactive>   hostname udev
diff --git a/meta/recipes-devtools/insserv/files/makefile.patch b/meta/recipes-devtools/insserv/files/makefile.patch
deleted file mode 100644
index 5a248b6..0000000
--- a/meta/recipes-devtools/insserv/files/makefile.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Enable debug options and modify the use of CLFAGS (carried over
-from the previous version's patch).
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN insserv-1.14.0.orig//Makefile insserv-1.14.0//Makefile
---- insserv-1.14.0.orig//Makefile	2010-04-29 03:33:40.000000000 -0700
-+++ insserv-1.14.0//Makefile	2010-11-28 17:09:20.537996190 -0800
-@@ -8,27 +8,16 @@
- INITDIR  =	/etc/init.d
- INSCONF  =	/etc/insserv.conf
- #DESTDIR =	/tmp/root
--#DEBUG	 =	-DDEBUG=1 -Wpacked
-+DEBUG	 =	-DDEBUG=1 -Wpacked
- DEBUG	 =
--ISSUSE	 =	-DSUSE
-+#ISSUSE	 =	-DSUSE
- DESTDIR	 =
- VERSION	 =	1.14.0
- DATE	 =	$(shell date +'%d%b%y' | tr '[:lower:]' '[:upper:]')
- 
--#
--# Architecture
--#
--ifdef RPM_OPT_FLAGS
--	  COPTS = -g $(RPM_OPT_FLAGS)
--else
--	   ARCH = $(shell uname -i)
--ifeq ($(ARCH),i386)
--	  COPTS = -g -O3 -mcpu=i586 -mtune=i686
--else
--	  COPTS = -g -O2
--endif
--endif
--	 CFLAGS = -W -Wall $(COPTS) $(DEBUG) $(LOOPS) -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
-+COPTS = -O2 -g
-+
-+	 MY_CFLAGS = $(CFLAGS) -W -Wall $(COPTS) $(DEBUG) $(LOOPS) -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
- 		  $(ISSUSE) -DINITDIR=\"$(INITDIR)\" -DINSCONF=\"$(INSCONF)\" -pipe
- 	  CLOOP = -falign-loops=0
- 	LDFLAGS = -Wl,-O,3,--relax
-@@ -75,13 +64,13 @@
- all:		$(TODO)
- 
- insserv:	insserv.o listing.o
--	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(MY_CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- listing.o:	listing.c listing.h config.h .system
--	$(CC) $(CFLAGS) $(CLOOP) -c $<
-+	$(CC) $(MY_CFLAGS) $(CLOOP) -c $<
- 
- insserv.o:	insserv.c listing.h config.h .system
--	$(CC) $(CFLAGS) $(CLOOP) -c $<
-+	$(CC) $(MY_CFLAGS) $(CLOOP) -c $<
- 
- listing.h:	.system
- 
-@@ -119,10 +108,10 @@
- -include	.depend.listing .depend.insserv
- 
- .depend.listing::	listing.c listing.h
--	@$(CC) $(CFLAGS) -M listing.c >$@ 2>/dev/null
-+	@$(CC) $(MY_CFLAGS) -M listing.c >$@ 2>/dev/null
- 
- .depend.insserv::	insserv.c listing.h
--	@$(CC) $(CFLAGS) -M insserv.c >$@ 2>/dev/null
-+	@$(CC) $(MY_CFLAGS) -M insserv.c >$@ 2>/dev/null
- 
- endif
- 
diff --git a/meta/recipes-devtools/insserv/files/run-ptest b/meta/recipes-devtools/insserv/files/run-ptest
deleted file mode 100644
index 4a6da30..0000000
--- a/meta/recipes-devtools/insserv/files/run-ptest
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-
-basedir=$(dirname $0)
-. $basedir/common
-
-output() {
-  if [ $? -eq 0 ]; \
-    then echo "PASS: $i"; \
-    else echo "FAIL: $i"; \
-  fi;
-}
-
-for i in test_simple_sequence test_undetected_loop; \
-  do $i >/dev/null 2>&1; output; \
-done
-
-rm -rf ${tmpdir}
diff --git a/meta/recipes-devtools/insserv/insserv_1.14.0.bb b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
deleted file mode 100644
index b66e98b..0000000
--- a/meta/recipes-devtools/insserv/insserv_1.14.0.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "Boot sequence organizer using LSB init.d dependencies"
-DESCRIPTION = "This utility reorders the init.d boot scripts based on dependencies given in scripts' LSB comment \
-headers, or in override files included in this package or added in /etc/insserv."
-# There is no known home page for insserv
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.suse.com/pub/projects/init/${BPN}-${PV}.tar.bz2 \
-           file://makefile.patch \
-           file://disable_runtests.patch \
-           file://161_bts777914_fix_undeclared_identifier.patch \
-           file://insserv.conf \
-           file://run-ptest \
-"
-
-SRC_URI[md5sum] = "4a97d900855148842b1aa8f33b988b47"
-SRC_URI[sha256sum] = "89a0a093b1cf3d802ad40568e64b496b493f51ff9825905c8bd12738b374ca47"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	install -m0644 ${WORKDIR}/insserv.conf ${D}${sysconfdir}/insserv.conf
-}
-
-do_install_class-native () {
-    oe_runmake 'DESTDIR=${D}/${STAGING_DIR_NATIVE}' install
-    install -m0644 ${WORKDIR}/insserv.conf ${D}${sysconfdir}/insserv.conf
-}
-
-BBCLASSEXTEND = "native"
-
-inherit ptest
-
-do_install_ptest() {
-	for i in common suite; do cp ${S}/tests/$i ${D}${PTEST_PATH}; done
-	sed -e 's|${\PWD}/insserv|insserv|;/trap/d' -i ${D}${PTEST_PATH}/suite
-	sed -e '/test_simple_sequence$/d;/test_undetected_loop$/d' -i ${D}${PTEST_PATH}/common
-}
-
-RDEPENDS_${PN}-ptest += "bash"



