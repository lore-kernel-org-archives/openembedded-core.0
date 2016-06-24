Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55F25731AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 09:43:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5O9hqDQ020264
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 02:43:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 24 Jun 2016 02:43:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2016 17:44:00 +0800
Message-ID: <6cfe43925b9f7d7ff9326523c84b0941b718b0a7.1466761342.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466761342.git.Qi.Chen@windriver.com>
References: <cover.1466761342.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] util-linux: upgrade to 2.28
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
X-List-Received-Date: Fri, 24 Jun 2016 09:43:52 -0000
Content-Type: text/plain

Related patches are rebased.

util-linux-ng-2.16-mount_lock_path.patch is removed because there's
no _PATH_MOUNTED_LOCK in the latest codes.

util-linux-native.patch is removed because 2.28 version of util-linux
has taken mkostemp into consideration and provide fallback if mkostemp
fails.

avoid_unsupported_sleep_param.patch is removed and coreutils is added
as a runtime dependency to util-linux-ptest to solve the same problem.

avoid_unsupported_grep_opts.patch is removed and grep is added as a
runtime dependency to util-linux-ptest to solve the sanme problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  4 +-
 .../util-linux/avoid_unsupported_grep_opts.patch   | 57 ----------------------
 .../util-linux/avoid_unsupported_sleep_param.patch | 20 --------
 .../util-linux/display_testname_for_subtest.patch  | 27 ++++++----
 .../recipes-core/util-linux/util-linux/ptest.patch | 16 ++++--
 .../util-linux/util-linux/util-linux-native.patch  | 57 ----------------------
 .../util-linux-ng-2.16-mount_lock_path.patch       | 27 ----------
 .../util-linux/uuid-test-error-api.patch           | 21 +++++---
 .../{util-linux_2.27.1.bb => util-linux_2.28.bb}   | 15 ++----
 9 files changed, 49 insertions(+), 195 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
 rename meta/recipes-core/util-linux/{util-linux_2.27.1.bb => util-linux_2.28.bb} (61%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c0f2540..bac1a37 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
-inherit autotools gettext pkgconfig systemd update-alternatives python3-dir ptest bash-completion
+inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
@@ -282,7 +282,7 @@ python populate_packages_prepend() {
                       extra_depends='', prepend=True, allow_links=True)
 }
 
-RDEPENDS_${PN}-ptest = "bash"
+RDEPENDS_${PN}-ptest = "bash grep coreutils"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
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
index 0eb8810..417ca1d 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -3,16 +3,23 @@ Display testname for subtest
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
 
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
+---
+ tests/functions.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/functions.sh b/tests/functions.sh
+index 5246605..b24dc15 100644
+--- a/tests/functions.sh
++++ b/tests/functions.sh
+@@ -320,7 +320,7 @@ function ts_init_subtest {
+ 
+ 	if [ "$TS_PARSABLE" != "yes" ]; then
+ 		[ $TS_NSUBTESTS -eq 1 ] && echo
+-		printf "%16s: %-27s ..." "" "$TS_SUBNAME"
++		printf "%13s: %-30s ..." "$TS_COMPONENT" "$TS_SUBNAME"
  	fi
  }
+ 
+-- 
+2.8.3
 
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 837f189..0537f7d 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -2,16 +2,22 @@ Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff -ruN a/Makefile.am b/Makefile.am
---- a/Makefile.am	2015-11-12 20:29:46.778396936 +0100
-+++ b/Makefile.am	2015-11-12 20:32:24.342450279 +0100
-@@ -48,7 +48,7 @@
+diff --git a/Makefile.am b/Makefile.am
+index bbaccb1..7d5a6bb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -48,6 +48,7 @@ systemdsystemunit_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
--TESTS =
 +TESTS = $(check_PROGRAMS)
  
  PATHFILES =
+ 
+-- 
+2.8.3
 
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
index 1b0ff79..a6fde5d 100644
--- a/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
+++ b/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
@@ -3,19 +3,23 @@ This patch adds error() API implementation for non-glibc system C libs
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: util-linux-2.27.1/tests/helpers/test_uuidd.c
-===================================================================
---- util-linux-2.27.1.orig/tests/helpers/test_uuidd.c
-+++ util-linux-2.27.1/tests/helpers/test_uuidd.c
+---
+ misc-utils/test_uuidd.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 61 insertions(+), 1 deletion(-)
+
+diff --git a/misc-utils/test_uuidd.c b/misc-utils/test_uuidd.c
+index 36f3b3d..7d579ce 100644
+--- a/misc-utils/test_uuidd.c
++++ b/misc-utils/test_uuidd.c
 @@ -23,7 +23,6 @@
   *
   *	make uuidd uuidgen localstatedir=/var
   */
 -#include <error.h>
- #include <libgen.h>
  #include <pthread.h>
  #include <stdio.h>
-@@ -39,6 +38,17 @@
+ #include <stdlib.h>
+@@ -38,6 +37,17 @@
  #include "xalloc.h"
  #include "strutils.h"
  
@@ -33,7 +37,7 @@ Index: util-linux-2.27.1/tests/helpers/test_uuidd.c
  #define LOG(level,args) if (loglev >= level) { fprintf args; }
  
  size_t nprocesses = 4;
-@@ -257,6 +267,56 @@ static void object_dump(size_t idx, obje
+@@ -256,6 +266,56 @@ static void object_dump(size_t idx, object_t *obj)
  	fprintf(stderr, "}\n");
  }
  
@@ -90,3 +94,6 @@ Index: util-linux-2.27.1/tests/helpers/test_uuidd.c
  int main(int argc, char *argv[])
  {
  	size_t i, nfailed = 0, nignored = 0;
+-- 
+2.8.3
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.27.1.bb b/meta/recipes-core/util-linux/util-linux_2.28.bb
similarity index 61%
rename from meta/recipes-core/util-linux/util-linux_2.27.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.28.bb
index 7549158..27fa88b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.27.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.28.bb
@@ -1,28 +1,23 @@
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
             file://ptest.patch \
             file://run-ptest \
-            file://avoid_unsupported_sleep_param.patch \
-            file://avoid_unsupported_grep_opts.patch \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
             file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "3cd2698d1363a2c64091c2dadc974647"
-SRC_URI[sha256sum] = "0a818fcdede99aec43ffe6ca5b5388bff80d162f2f7bd4541dca94fecb87a290"
+SRC_URI[md5sum] = "e534e6ccc49107e5d31c329af798ef7d"
+SRC_URI[sha256sum] = "395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


