Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1050A76FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:37:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5H3b1WB023805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 20:37:04 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 16 Jun 2016 20:36:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2016 11:36:47 +0800
Message-ID: <37ce8eaba328c8312072cc877cbbf04c595d12ca.1466134498.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466134497.git.Qi.Chen@windriver.com>
References: <cover.1466134497.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] util-linux: upgrade to 2.28
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
X-List-Received-Date: Fri, 17 Jun 2016 03:37:05 -0000
Content-Type: text/plain

ptest is disabled as the related codes are changed a lot, and the
related patches are removed.

util-linux-ng-2.16-mount_lock_path.patch is removed because there's
no _PATH_MOUNTED_LOCK in the latest codes.

util-linux-native.patch is removed because 2.28 version of util-linux
has taken mkostemp into consideration and provide fallback if mkostemp
fails.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc        | 31 +-------
 .../util-linux/avoid_parallel_tests.patch          | 19 -----
 .../util-linux/avoid_unsupported_grep_opts.patch   | 57 --------------
 .../util-linux/avoid_unsupported_sleep_param.patch | 20 -----
 .../util-linux/display_testname_for_subtest.patch  | 18 -----
 .../recipes-core/util-linux/util-linux/ptest.patch | 17 ----
 meta/recipes-core/util-linux/util-linux/run-ptest  | 25 ------
 .../util-linux/util-linux/util-linux-native.patch  | 57 --------------
 .../util-linux-ng-2.16-mount_lock_path.patch       | 27 -------
 .../util-linux/uuid-test-error-api.patch           | 92 ----------------------
 .../{util-linux_2.27.1.bb => util-linux_2.28.bb}   | 20 ++---
 11 files changed, 6 insertions(+), 377 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/ptest.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/run-ptest
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 rename meta/recipes-core/util-linux/{util-linux_2.27.1.bb => util-linux_2.28.bb} (44%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c0f2540..c2a5b63 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
-inherit autotools gettext pkgconfig systemd update-alternatives python3-dir ptest bash-completion
+inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
@@ -281,32 +281,3 @@ python populate_packages_prepend() {
                       description='util-linux lib%s',
                       extra_depends='', prepend=True, allow_links=True)
 }
-
-RDEPENDS_${PN}-ptest = "bash"
-
-do_compile_ptest() {
-    oe_runmake buildtest-TESTS
-}
-
-do_install_ptest() {
-    mkdir -p ${D}${PTEST_PATH}/tests/ts
-    find . -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
-    cp ${S}/tests/functions.sh ${D}${PTEST_PATH}/tests/
-    cp ${S}/tests/commands.sh ${D}${PTEST_PATH}/tests/
-    cp ${S}/tests/run.sh ${D}${PTEST_PATH}/tests/
-    cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
-
-    list="bitops build-sys cal col colrm column dmesg fsck hexdump hwclock ipcs isosize login look md5 misc more namei paths schedutils script swapon tailf"
-    # The following tests are not installed  yet:
-    # blkid scsi_debug module dependent
-    # cramfs gcc dependent
-    # eject gcc dependent
-    # fdisk scsi_debug module and gcc dependent
-    # lscpu gcc dependant
-    # libmount uuidgen dependent
-    # mount gcc dependant
-    # partx blkid dependant
-    for d in $list; do
-        cp -pR ${S}/tests/ts/$d ${D}${PTEST_PATH}/tests/ts/
-    done
-}
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
deleted file mode 100644
index 46d4d37..0000000
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Ptest needs buildtest-TESTS and runtest-TESTS targets.
-serial-tests is required to generate those targets.
-Revert run.sh script accordingly to serialize running tests 
-
-Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
-Upstream-Status: Inappropriate 
-
-diff -ruN a/configure.ac b/configure.ac
---- a/configure.ac	2014-05-27 12:37:42.119772658 +0200
-+++ b/configure.ac	2014-05-27 12:41:46.225573272 +0200
-@@ -10,7 +10,7 @@
- dnl AC_USE_SYSTEM_EXTENSIONS must be called before any macros that run
- dnl the compiler (like AC_PROG_LIBTOOL) to avoid autoconf errors.
- AC_USE_SYSTEM_EXTENSIONS
--AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax dist-bzip2 no-dist-gzip dist-xz -Wno-portability subdir-objects])
-+AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax dist-bzip2 no-dist-gzip dist-xz -Wno-portability subdir-objects serial-tests])
-
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
- 			    [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch b/meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
deleted file mode 100644
index a0d5efa..0000000
--- a/meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Avoid unsupported grep options
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-diff -ruN a/ts/ipcs/headers b/ts/ipcs/headers
---- a/tests/ts/ipcs/headers	2013-09-04 11:03:36.118613250 +0200
-+++ b/teste/ts/ipcs/headers	2013-09-04 11:03:27.906958437 +0200
-@@ -22,35 +22,35 @@
- ts_init "$*"
- 
- ts_log "test: shm headers"
--$TS_CMD_IPCS -m -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -m -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -m -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -m -t | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -m -p | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -m -c | grep -A 1 "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -m -l | grep "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -m -u | grep "^---"  >> $TS_OUTPUT
- echo >> $TS_OUTPUT
- 
- ts_log "test: mesg headers"
--$TS_CMD_IPCS -q -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -q -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -q -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -q -t | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -q -p | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -q -c | grep -A 1 "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -q -l | grep  "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -q -u | grep  "^---"  >> $TS_OUTPUT
- echo >> $TS_OUTPUT
- 
- ts_log "test: sem headers"
--$TS_CMD_IPCS -s -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -s -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -s -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -s -t | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -s -p | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -s -c | grep -A 1 "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -s -l | grep  "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -s -u | grep  "^---"  >> $TS_OUTPUT
- echo >> $TS_OUTPUT
- 
- ts_log "test: all headers"
--$TS_CMD_IPCS -a | grep --after-context=1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -a | grep -A 1 "^---"  >> $TS_OUTPUT
- 
--$TS_CMD_IPCS -a -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -a -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
--$TS_CMD_IPCS -a -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -a -t | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -a -p | grep -A 1 "^---"  >> $TS_OUTPUT
-+$TS_CMD_IPCS -a -c | grep -A 1 "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -a -l | grep "^---"  >> $TS_OUTPUT
- $TS_CMD_IPCS -a -u | grep "^---"  >> $TS_OUTPUT
- 
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch b/meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
deleted file mode 100644
index 7a63a4e..0000000
--- a/meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Avoid unsupported sleep parameter
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-diff -ruN a/simple b/simple
---- a/tests/ts/tailf/simple	2015-11-12 11:34:49.971817130 +0200
-+++ b/tests/ts/tailf/simple	2013-11-12 11:34:37.876325128 +0200
-@@ -27,9 +27,9 @@
- 
- $TS_CMD_TAILF $INPUT > $TS_OUTPUT 2>&1 &
- 
--sleep 0.5
-+sleep 1
- echo {0..9} >> $INPUT
--sleep 0.5
-+sleep 1
- 
- rm -f $INPUT
- 
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
deleted file mode 100644
index 0eb8810..0000000
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Display testname for subtest
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-diff -ruN a/functions.sh b/functions.sh
---- a/tests/functions.sh	2015-11-12 21:32:02.434542124 +0100
-+++ b/tests/functions.sh	2015-11-12 21:40:37.095317280 +0100
-@@ -297,7 +297,7 @@
- 	if [ "$TS_PARALLEL" == "yes" ]; then
- 		TS_TITLE=$(printf "%13s: %-30s ...\n%16s: %-27s ..." "$TS_COMPONENT" "$TS_DESC" "" "$TS_SUBNAME")
- 	else
--		TS_TITLE=$(printf "%16s: %-27s ..." "" "$TS_SUBNAME")
-+               TS_TITLE=$(printf "%13s: %-30s ..." "$TS_COMPONENT" "$TS_SUBNAME")
- 		echo -n "$TS_TITLE"
- 	fi
- }
-
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
deleted file mode 100644
index 837f189..0000000
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Define TESTS variable
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-diff -ruN a/Makefile.am b/Makefile.am
---- a/Makefile.am	2015-11-12 20:29:46.778396936 +0100
-+++ b/Makefile.am	2015-11-12 20:32:24.342450279 +0100
-@@ -48,7 +48,7 @@
- dist_bashcompletion_DATA =
- check_PROGRAMS =
- dist_check_SCRIPTS =
--TESTS =
-+TESTS = $(check_PROGRAMS)
- 
- PATHFILES =
-
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
deleted file mode 100644
index fbc2f9b..0000000
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-cd tests || exit 1                                                          
-
-comps=$(find ts/ -type f -perm -111 -regex ".*/[^\.~]*" |  sort)
-
-
-echo
-echo "-------------------- util-linux regression tests --------------------"
-echo
-echo "                    For development purpose only.                    "
-echo "                 Don't execute on production system!                 "
-echo
-
-res=0
-count=0
-for ts in $comps; 
-do 
-   $ts | sed '{        
-      s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
-      s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
-      s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
-   }' 
-done
-
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
deleted file mode 100644
index 1f496de..0000000
--- a/meta/recipes-core/util-linux/util-linux/util-linux-native.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Support older hosts with latest util-linux-native
-
-mkostemp is not defined on older machines.  So we detect this and
-provide a define that uses mkstemp instead.
-
-O_CLOEXEC is not defined on older machines.  It is however defined
-in the 'c.h' header.  Fix up the users to include 'c.h'.
-
-fdisks/fdisksunlabel.c was modified to use qsort_r, however
-this is not defined on older hosts.  Revert:
-  commit c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
-  fdisk: (sun): use ask API, remove global variable
-
-Upstream-Status: Inappropriate [other]
-Patches revert upstream changes in order to support older
-machines.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- configure.ac | 1 +
- include/c.h  | 7 +++++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index eb3680b..93e015f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -318,6 +318,7 @@ AC_CHECK_FUNCS([ \
- 	llseek \
- 	lseek64 \
- 	mempcpy \
-+	mkostemp \
- 	nanosleep \
- 	open_memstream \
- 	personality \
-diff --git a/include/c.h b/include/c.h
-index e423e8b..cf33b94 100644
---- a/include/c.h
-+++ b/include/c.h
-@@ -233,6 +233,13 @@ static inline int dirfd(DIR *d)
- #endif
- 
- /*
-+ * mkostemp replacement
-+ */
-+#ifndef HAVE_MKOSTEMP
-+#define mkostemp(template, flags) mkstemp(template)
-+#endif
-+
-+/*
-  * MAXHOSTNAMELEN replacement
-  */
- static inline size_t get_hostname_max(void)
--- 
-1.9.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
deleted file mode 100644
index 5773d7e..0000000
--- a/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-The FHS indicates that /etc must be capable of being mounted R/O.
-
-The FHS also indicates that lock files belong in /var/lock, and /var must
-be R/W as soon as possible during boot.
-
-This patch moves the mtab lock file from the potentially R/O /etc, to the
-R/W /var/lock area.  This lock file is used when mounting disks and making
-other mount adjustments.  The _PATH_MOUNTED_TMP is not adjusted, as failing
-to write to this file does not cause any functional limitations.
-
-(Note, if /etc is R/O, then /etc/mtab should be a symlink to /proc/mounts)
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
---- util-linux-ng-2.16/include/pathnames.h.orig
-+++ util-linux-ng-2.16/include/pathnames.h
-@@ -90,7 +90,7 @@
- # endif
- #endif
- 
--#define _PATH_MOUNTED_LOCK	_PATH_MOUNTED "~"
-+#define _PATH_MOUNTED_LOCK	"/var/lock/mtab~"
- #define _PATH_MOUNTED_TMP	_PATH_MOUNTED ".tmp"
- 
- #ifndef _PATH_DEV
diff --git a/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch b/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
deleted file mode 100644
index 1b0ff79..0000000
--- a/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-This patch adds error() API implementation for non-glibc system C libs
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: util-linux-2.27.1/tests/helpers/test_uuidd.c
-===================================================================
---- util-linux-2.27.1.orig/tests/helpers/test_uuidd.c
-+++ util-linux-2.27.1/tests/helpers/test_uuidd.c
-@@ -23,7 +23,6 @@
-  *
-  *	make uuidd uuidgen localstatedir=/var
-  */
--#include <error.h>
- #include <libgen.h>
- #include <pthread.h>
- #include <stdio.h>
-@@ -39,6 +38,17 @@
- #include "xalloc.h"
- #include "strutils.h"
- 
-+#ifdef __GLIBC__
-+#include <error.h>
-+#else
-+extern void (*error_print_progname)(void);
-+extern unsigned int error_message_count;
-+extern int error_one_per_line;
-+
-+void error(int, int, const char *, ...);
-+void error_at_line(int, int, const char *, unsigned int, const char *, ...);
-+#endif
-+
- #define LOG(level,args) if (loglev >= level) { fprintf args; }
- 
- size_t nprocesses = 4;
-@@ -257,6 +267,56 @@ static void object_dump(size_t idx, obje
- 	fprintf(stderr, "}\n");
- }
- 
-+#ifndef __GLIBC__
-+extern char *__progname;
-+
-+void (*error_print_progname)(void) = 0;
-+unsigned int error_message_count = 0;
-+int error_one_per_line = 0;
-+
-+static void eprint(int status, int e, const char *file, unsigned int line, const char *fmt, va_list ap)
-+{
-+	if (file && error_one_per_line) {
-+		static const char *oldfile;
-+		static unsigned int oldline;
-+		if (line == oldline && strcmp(file, oldfile) == 0)
-+			return;
-+		oldfile = file;
-+		oldline = line;
-+	}
-+	if (error_print_progname)
-+		error_print_progname();
-+	else
-+		fprintf(stderr, "%s: ", __progname);
-+	if (file)
-+		fprintf(stderr, "%s:%u: ", file, line);
-+	vfprintf(stderr, fmt, ap);
-+	if (e)
-+		fprintf(stderr, ": %s", strerror(e));
-+	putc('\n', stderr);
-+	fflush(stderr);
-+	error_message_count++;
-+	if (status)
-+		exit(status);
-+}
-+
-+void error(int status, int e, const char *fmt, ...)
-+{
-+	va_list ap;
-+	va_start(ap,fmt);
-+	eprint(status, e, 0, 0, fmt, ap);
-+	va_end(ap);
-+}
-+
-+void error_at_line(int status, int e, const char *file, unsigned int line, const char *fmt, ...)
-+{
-+	va_list ap;
-+	va_start(ap,fmt);
-+	eprint(status, e, file, line, fmt, ap);
-+	va_end(ap);
-+}
-+#endif /* __GLIBC__ */
-+
- int main(int argc, char *argv[])
- {
- 	size_t i, nfailed = 0, nignored = 0;
diff --git a/meta/recipes-core/util-linux/util-linux_2.27.1.bb b/meta/recipes-core/util-linux/util-linux_2.28.bb
similarity index 44%
rename from meta/recipes-core/util-linux/util-linux_2.27.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.28.bb
index 7549158..fa93b46 100644
--- a/meta/recipes-core/util-linux/util-linux_2.27.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.28.bb
@@ -1,28 +1,18 @@
-MAJOR_VERSION = "2.27"
+MAJOR_VERSION = "2.28"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
 # some upstream changes.  Only do this for native packages.
 OLDHOST = ""
-OLDHOST_class-native = "file://util-linux-native.patch \
-                        file://util-linux-native-qsort.patch \
-			"
+OLDHOST_class-native = "file://util-linux-native-qsort.patch"
 
-SRC_URI += "file://util-linux-ng-2.16-mount_lock_path.patch \
-            file://configure-sbindir.patch \
+SRC_URI += "file://configure-sbindir.patch \
             file://runuser.pamd \
             file://runuser-l.pamd \
             ${OLDHOST} \
-            file://ptest.patch \
-            file://run-ptest \
-            file://avoid_unsupported_sleep_param.patch \
-            file://avoid_unsupported_grep_opts.patch \
-            file://display_testname_for_subtest.patch \
-            file://avoid_parallel_tests.patch \
-            file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "3cd2698d1363a2c64091c2dadc974647"
-SRC_URI[sha256sum] = "0a818fcdede99aec43ffe6ca5b5388bff80d162f2f7bd4541dca94fecb87a290"
+SRC_URI[md5sum] = "e534e6ccc49107e5d31c329af798ef7d"
+SRC_URI[sha256sum] = "395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


