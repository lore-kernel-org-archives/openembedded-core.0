Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpzJ6-0001Gb-V8
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 12:10:37 +0200
Received: by eeit10 with SMTP id t10so589351eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 02:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=sqcmTyQO/bhlZgL2F8U0TV1yKNmqc2XcW24l//h2ebk=;
	b=Yts4o44eEGKud++e6hYKEUch4gpFmA2BrhqsCiNN4xiRXsfBKMbJepJEdTkyNHhurQ
	XUZrfAQG6/RaXDW2Vntq/Y3ZuwoHkDLZu5QCkhTvhLViR/x3ld7dMuyGufjaKGSnF9gj
	6KJEaq1rpKDYXp8O3J1irqccn/MOinEOU/So5t0ZcwauC+Q0ZU5GCIXN9KDrBDLuFjAN
	HZYE8wTD+RyJSbQ5IxWYW8Kr6AvORMO/R65rDgyQ1GNZ2aPIxzrgF/C7SFNzoPOf+u3c
	+Ap4QgwYeEUX+4OxQuq4gg2aOvSvS6PeNaa8NCgMwqwa34IT89gVvAYaXj56WYvZiL7F
	3/0Q==
Received: by 10.14.214.65 with SMTP id b41mr1544881eep.33.1342259961427;
	Sat, 14 Jul 2012 02:59:21 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id k48sm2832295een.10.2012.07.14.02.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jul 2012 02:59:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Jul 2012 11:59:15 +0200
Message-Id: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk201LUfHHUeT7EXxrkd5MOZDrX3SqwZ+kfBL1kIDa0vhhNIs/N5jfDZD8ptGxpVMYfiEzO
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Sat, 14 Jul 2012 10:10:37 -0000

The recipe is autotools based now, the COPYING file was replaced with the complete GPLv2 license text.
No more 'lspci' needed ad runtime, but zlib and libnl are needed nowadays.
Add 2 patches, one to fix cross builds and one from Linaro to fix C state parsing on !x86.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../stub_out_the_ncurses_calls_in_dump_mode.patch  |   33 ----
 ...csstoh-replace-with-a-simple-shell-script.patch |  182 ++++++++++++++++++++
 .../0002-fix-cpuidle-state-name-parsing.patch      |   29 ++++
 meta/recipes-kernel/powertop/powertop_1.13.bb      |   42 -----
 meta/recipes-kernel/powertop/powertop_2.0.bb       |   35 ++++
 5 files changed, 246 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-csstoh-replace-with-a-simple-shell-script.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0002-fix-cpuidle-state-name-parsing.patch
 delete mode 100644 meta/recipes-kernel/powertop/powertop_1.13.bb
 create mode 100644 meta/recipes-kernel/powertop/powertop_2.0.bb

diff --git a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch b/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
deleted file mode 100644
index ae4cf5d..0000000
--- a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [this patch is 1.13 specific and 2.0 will be coming.]
-
-Running PowerTop in Poky in dump mode (with --dump) always ends with a
-segmentation fault.
-
-The cause is: in dump mode, setup_windows() is not invoked so the
-*_window variables, like cstate_window, are still NULL; later in
-main() -> show_cstates(), the functions, like wrefresh(), will trigger
-segfault.
-
-After discussing in PowerTop mailling list, I think the right solution is
-we should stub out the ncurses calls in dump mode.
-
-(The patch was also sent to upstream PowerTop mailling list.)
-
-Signed-off-by Dexuan Cui <dexuan.cui@intel.com>, 2010-08-20
-(this patch is licensed under GPLv2)
-
---- a/display.c
-+++ b/display.c
-@@ -44,6 +44,12 @@
- static WINDOW *status_bar_window;
- 
- #define print(win, y, x, fmt, args...) do { if (dump) printf(fmt, ## args); else mvwprintw(win, y, x, fmt, ## args); } while (0)
-+#define wattrset(win, c) do { if (!dump ) wattrset(win, c); } while (0)
-+#define wbkgd(win, c) do { if (!dump ) wbkgd(win, c); } while (0)
-+#define werase(win) do { if (!dump ) werase(win); } while (0)
-+#define wrefresh(win) do { if (!dump ) wrefresh(win); } while (0)
-+#define wattron(win, a) do { if (!dump ) wattron(win, a); } while (0)
-+#define wattroff(win, a) do { if (!dump ) wattroff(win, a); } while (0)
- 
- char status_bar_slots[10][40];
- 
diff --git a/meta/recipes-kernel/powertop/powertop/0001-csstoh-replace-with-a-simple-shell-script.patch b/meta/recipes-kernel/powertop/powertop/0001-csstoh-replace-with-a-simple-shell-script.patch
new file mode 100644
index 0000000..4fe7337
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-csstoh-replace-with-a-simple-shell-script.patch
@@ -0,0 +1,182 @@
+From af97815d18455f8ebdc65ee1dd925bfe06f9a6fc Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 1 Jun 2012 14:27:16 -0400
+Subject: [PATCH 1/2] csstoh: replace with a simple shell script
+
+Having a compiled program that runs during build time is a pita for
+cross-compiling.  Rather than make that work, convert it to a simple
+shell script since that's all this is really doing.  No need for C
+code here.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ .gitignore      |   12 +---------
+ src/Makefile.am |    5 ++--
+ src/csstoh      |   18 +++++++++++++++
+ src/csstoh.c    |   69 -------------------------------------------------------
+ 4 files changed, 21 insertions(+), 83 deletions(-)
+ create mode 100755 src/csstoh
+ delete mode 100644 src/csstoh.c
+
+diff --git a/.gitignore b/.gitignore
+index 5534072..1f6906f 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -4,6 +4,7 @@
+ *.html
+ *.csv
+ *.powertop
++.deps
+ ChangeLog
+ Makefile.in
+ aclocal.m4
+@@ -22,7 +23,6 @@ config.h
+ config.log
+ config.status
+ libtool
+-pevent/.deps/
+ pevent/Makefile
+ pevent/Makefile.in
+ po/Makefile
+@@ -39,18 +39,8 @@ po/*.gmo
+ po/stamp-po
+ src/powertop
+ src/css.h
+-src/csstoh
+ src/Makefile.in
+-src/.deps/
+ src/Makefile
+-src/calibrate/.deps/
+-src/cpu/.deps/
+-src/devices/.deps/
+-src/measurement/.deps/
+-src/parameters/.deps/
+-src/perf/.deps/
+-src/process/.deps/
+-src/tuning/.deps/
+ m4
+ *.dirstamp
+ *.lo
+diff --git a/src/Makefile.am b/src/Makefile.am
+index c77b2aa..e9d2a1e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,8 +1,7 @@
+ AUTOMAKE_OPTIONS = subdir-objects
+ ACLOCAL_AMFLAGS = -I ../m4 
+ 
+-noinst_PROGRAMS = csstoh
+-csstoh_SOURCES = csstoh.c 
++noinst_SCRIPTS = csstoh
+ 
+ sbin_PROGRAMS = powertop
+ nodist_powertop_SOURCES = css.h
+@@ -45,5 +44,5 @@ AM_LDFLAGS = $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(LIBZ_LIBS)
+ BUILT_SOURCES = css.h
+ CLEANFILES = css.h
+ css.h: csstoh powertop.css
+-	./csstoh powertop.css css.h
++	$(SHELL) $(srcdir)/csstoh powertop.css css.h
+ 
+diff --git a/src/csstoh b/src/csstoh
+new file mode 100755
+index 0000000..51d1ec1
+--- /dev/null
++++ b/src/csstoh
+@@ -0,0 +1,18 @@
++#!/bin/sh
++
++in=$1
++out=$2
++
++(
++cat <<EOF
++#ifndef __INCLUDE_GUARD_CCS_H
++#define __INCLUDE_GUARD_CCS_H
++
++const char css[] =
++EOF
++sed -e 's:^:\t":' -e 's:$:\\n":' "${in}"
++cat <<EOF
++;
++#endif
++EOF
++) > "${out}"
+diff --git a/src/csstoh.c b/src/csstoh.c
+deleted file mode 100644
+index e6b1dcf..0000000
+--- a/src/csstoh.c
++++ /dev/null
+@@ -1,69 +0,0 @@
+-/*
+- * Copyright 2010, Intel Corporation
+- *
+- * This file is part of PowerTOP
+- *
+- * This program file is free software; you can redistribute it and/or modify it
+- * under the terms of the GNU General Public License as published by the
+- * Free Software Foundation; version 2 of the License.
+- *
+- * This program is distributed in the hope that it will be useful, but WITHOUT
+- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+- * for more details.
+- *
+- * You should have received a copy of the GNU General Public License
+- * along with this program in a file named COPYING; if not, write to the
+- * Free Software Foundation, Inc,
+- * 51 Franklin Street, Fifth Floor,
+- * Boston, MA 02110-1301 USA
+- * or just google for it.
+- *
+- * Authors:
+- *	Arjan van de Ven <arjan@linux.intel.com>
+- */
+-
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <errno.h>
+-#include <string.h>
+-
+-int main(int argc, char **argv)
+-{
+-	FILE *in, *out;
+-	char line[4096];
+-
+-	if (argc < 2) {
+-		printf("Usage:  csstoh cssfile header.h \n");
+-		exit(0);
+-	}
+-	in = fopen(argv[1], "rm");
+-	if (!in) {
+-		printf("Failed to open input file %s (%s) \n", argv[1], strerror(errno));
+-		exit(0);
+-	}
+-	out = fopen(argv[2], "wm");
+-	if (!out) {
+-		printf("Failed to open output file %s (%s) \n", argv[1], strerror(errno));
+-		exit(0);
+-	}
+-
+-	fprintf(out, "#ifndef __INCLUDE_GUARD_CCS_H\n");
+-	fprintf(out, "#define __INCLUDE_GUARD_CCS_H\n");
+-	fprintf(out, "\n");
+-	fprintf(out, "const char css[] = \n");
+-
+-	while (!feof(in)) {
+-		char *c;
+-		if (fgets(line, 4095, in) == NULL)
+-			break;
+-		c = strchr(line, '\n');
+-		if (c) *c = 0;
+-		fprintf(out, "\t\"%s\\n\"\n", line);
+-	}	
+-	fprintf(out, ";\n");	
+-	fprintf(out, "#endif\n");
+-	fclose(out);
+-	fclose(in);
+-	return EXIT_SUCCESS;
+-}
+-- 
+1.7.10
+
diff --git a/meta/recipes-kernel/powertop/powertop/0002-fix-cpuidle-state-name-parsing.patch b/meta/recipes-kernel/powertop/powertop/0002-fix-cpuidle-state-name-parsing.patch
new file mode 100644
index 0000000..4a26b6f
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0002-fix-cpuidle-state-name-parsing.patch
@@ -0,0 +1,29 @@
+From 8ab3bbf6b4c099075fe179bc4512c80a1ffac2c3 Mon Sep 17 00:00:00 2001
+From: Rajagopal Venkat <rajagopal.venkat@linaro.org>
+Date: Mon, 18 Jun 2012 11:06:25 +0530
+Subject: [PATCH 2/2] fix cpuidle state name parsing
+
+parse cpuidle C state based on sysfs file entry(stateX)
+instead of state name/description
+
+Signed-off-by: Rajagopal Venkat <rajagopal.venkat@linaro.org>
+---
+ src/cpu/abstract_cpu.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
+index cd4eba0..72969fc 100644
+--- a/src/cpu/abstract_cpu.cpp
++++ b/src/cpu/abstract_cpu.cpp
+@@ -147,7 +147,7 @@ void abstract_cpu::insert_cstate(const char *linux_name, const char *human_name,
+ 	strcpy(state->linux_name, linux_name);
+ 	strcpy(state->human_name, human_name);
+ 
+-	c = human_name;
++	c = linux_name;
+ 	while (*c) {
+ 		if (strcmp(linux_name, "active")==0) {
+ 			state->line_level = LEVEL_C0;
+-- 
+1.7.10
+
diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
deleted file mode 100644
index b4f45dd..0000000
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "Power usage tool"
-DESCRIPTION = "PowerTOP, a tool that helps you find what software is using the most power."
-HOMEPAGE = "http://www.lesswatts.org/"
-BUGTRACKER = "http://bugzilla.lesswatts.org/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "virtual/libintl ncurses"
-
-# powertop 1.13 needs lspci
-RDEPENDS_${PN} = "pciutils"
-
-PR = "r3"
-
-SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
-           file://stub_out_the_ncurses_calls_in_dump_mode.patch \
-          "
-
-SRC_URI[md5sum] = "78aa17c8f55178004223bf236654298e"
-SRC_URI[sha256sum] = "2bc866089496877dd26d2d316ad5763ab8ecb5e28aefba44bc5d355dcdc58d98"
-
-CFLAGS += "${LDFLAGS}"
-EXTRA_OEMAKE = "VERSION=\"${PV}\" EXTRA_LIBS=${EXTRA_LIBS}"
-
-EXTRA_LIBS_libc-uclibc = "-lintl"
-
-inherit update-alternatives
-ALTERNATIVE_NAME = "powertop"
-ALTERNATIVE_PATH = "${bindir}/powertop"
-ALTERNATIVE_LINK = "${base_bindir}/powertop"
-ALTERNATIVE_PRIORITY = "100"
-
-do_configure() {
-	# We do not build ncurses with wide char support
-	sed -i -e 's:lncursesw:lncurses ${EXTRA_LIBS}:g' ${S}/Makefile
-}
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
-
diff --git a/meta/recipes-kernel/powertop/powertop_2.0.bb b/meta/recipes-kernel/powertop/powertop_2.0.bb
new file mode 100644
index 0000000..44befbb
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop_2.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Power usage tool"
+DESCRIPTION = "PowerTOP, a tool that helps you find what software is using the most power."
+HOMEPAGE = "https://01.org/powertop/"
+BUGTRACKER = "powertop@lists.01.org"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+DEPENDS = "virtual/libintl ncurses zlib pciutils libnl"
+
+inherit autotools gettext
+
+PV = "2.0+git"
+
+SRC_URI = "git://github.com/fenrus75/powertop.git \
+           file://0001-csstoh-replace-with-a-simple-shell-script.patch \
+           file://0002-fix-cpuidle-state-name-parsing.patch \
+          "
+SRCREV = "ccb84e2aaca18f3bca83288c48d9806fdf3fef4d"
+
+S = "${WORKDIR}/git"
+
+# Somehow pkg-config doesn't add the genl libs to LIBS, fix up manually
+do_configure_append() {
+	for i in $(find ${S} -name "Makefile") ; do
+		sed -i -e 's:-lnl:-lnl -lnl-genl:g' $i
+	done
+}
+
+inherit update-alternatives
+ALTERNATIVE_NAME = "powertop"
+ALTERNATIVE_PATH = "${bindir}/powertop"
+ALTERNATIVE_LINK = "${base_bindir}/powertop"
+ALTERNATIVE_PRIORITY = "100"
+
-- 
1.7.10



