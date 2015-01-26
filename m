Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EB46665C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 15:01:09 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 26 Jan 2015 16:01:03 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 703872800CB;
	Mon, 26 Jan 2015 16:01:03 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Jan 2015 16:01:00 +0100
Message-ID: <1422284460-14390-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] ltp: update to 20150119 release
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
X-List-Received-Date: Mon, 26 Jan 2015 15:01:22 -0000
Content-Type: text/plain

Update LTP to 20150119 release
1. Remove 2 upstreamed patches
2. Add 'expect' to run time dependency and install the tests which
   depend on it.
3. ffsb related configuration problem was fixed in this release.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 ...sts-Fix-bad-priority-inheritance-conditio.patch | 48 -----------------
 ...ltime-tests-Fix-robust-mutex-conditionals.patch | 62 ----------------------
 .../ltp/{ltp_20140828.bb => ltp_20150119.bb}       | 16 +-----
 3 files changed, 2 insertions(+), 124 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-bad-priority-inheritance-conditio.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-robust-mutex-conditionals.patch
 rename meta/recipes-extended/ltp/{ltp_20140828.bb => ltp_20150119.bb} (84%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-bad-priority-inheritance-conditio.patch b/meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-bad-priority-inheritance-conditio.patch
deleted file mode 100644
index 631f926..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-bad-priority-inheritance-conditio.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b601a8d1b39075a5339195fc0a4038f71ec3b49e Mon Sep 17 00:00:00 2001
-From: "Gary S. Robertson" <gary.robertson@linaro.org>
-Date: Wed, 27 Aug 2014 16:23:56 -0500
-Subject: [LTP][PATCH] Realtime tests: Fix bad priority inheritance conditionals
-
-testcases/realtime/lib/librttest.c and
-testcases/realtime/stress/pi-tests/testpi-3.c
-both referenced a non-existent autoconf configuration setting variable.
-Replaced the invalid variable name with the variable actually created
-by autoconf.
-
-Upstream-Status: Backported
-
-Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
----
- testcases/realtime/lib/librttest.c            |    2 +-
- testcases/realtime/stress/pi-tests/testpi-3.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/realtime/lib/librttest.c b/testcases/realtime/lib/librttest.c
-index c175148..3679058 100644
---- a/testcases/realtime/lib/librttest.c
-+++ b/testcases/realtime/lib/librttest.c
-@@ -586,7 +586,7 @@ void *busy_work_us(int us)
- 
- void init_pi_mutex(pthread_mutex_t * m)
- {
--#if HAVE_DECL_PTHREAD_PRIO_INHERIT
-+#if HAS_PRIORITY_INHERIT
- 	pthread_mutexattr_t attr;
- 	int ret;
- 	int protocol;
-diff --git a/testcases/realtime/stress/pi-tests/testpi-3.c b/testcases/realtime/stress/pi-tests/testpi-3.c
-index 30f38f6..e483945 100644
---- a/testcases/realtime/stress/pi-tests/testpi-3.c
-+++ b/testcases/realtime/stress/pi-tests/testpi-3.c
-@@ -365,7 +365,7 @@ int main(int argc, char *argv[])
- 
- 	printf("Start %s\n", argv[0]);
- 
--#if HAVE_DECL_PTHREAD_PRIO_INHERIT
-+#if HAS_PRIORITY_INHERIT
- 	if (!nopi) {
- 		pthread_mutexattr_t mutexattr;
- 		int protocol;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-robust-mutex-conditionals.patch b/meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-robust-mutex-conditionals.patch
deleted file mode 100644
index 1fdd281..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-Realtime-tests-Fix-robust-mutex-conditionals.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 663a14423baea0e05ba79d90d2497dde5e4594bd Mon Sep 17 00:00:00 2001
-From: "Gary S. Robertson" <gary.robertson@linaro.org>
-Date: Thu, 11 Sep 2014 13:02:47 -0500
-Subject: [LTP][PATCH] Realtime tests: Fix robust mutex conditionals
-
-sbrk_mutex, testpi-5, and testpi-6 realtime tests in subdir
-testcases/realtime/func/pi-tests used compile time config variables
-which were not generated by autoconf in order to configure tests
-for robust mutexes.  Changed these conditionals to use the config
-variables actually generated in the autoconf process.
-
-Upstream-Status: Backported
-
-Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
----
- testcases/realtime/func/pi-tests/sbrk_mutex.c |    2 +-
- testcases/realtime/func/pi-tests/testpi-5.c   |    2 +-
- testcases/realtime/func/pi-tests/testpi-6.c   |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/realtime/func/pi-tests/sbrk_mutex.c b/testcases/realtime/func/pi-tests/sbrk_mutex.c
-index 684021f..5c325b4 100644
---- a/testcases/realtime/func/pi-tests/sbrk_mutex.c
-+++ b/testcases/realtime/func/pi-tests/sbrk_mutex.c
-@@ -45,7 +45,7 @@
- #include <unistd.h>
- #include "librttest.h"
- 
--#if defined(HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS) && defined(PTHREAD_MUTEX_ROBUST_NP)
-+#if HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS
- 
- #define NUM_MUTEXES 5000
- #define NUM_THREADS 50
-diff --git a/testcases/realtime/func/pi-tests/testpi-5.c b/testcases/realtime/func/pi-tests/testpi-5.c
-index a1d93cc..70f02fd 100644
---- a/testcases/realtime/func/pi-tests/testpi-5.c
-+++ b/testcases/realtime/func/pi-tests/testpi-5.c
-@@ -69,7 +69,7 @@ int do_test(int argc, char **argv)
- 	pthread_mutexattr_t mutexattr;
- 	int retc, protocol;
- 
--#if HAS_PTHREAD_MUTEXATTR_PROTOCOL_FUNCTIONS
-+#if HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS
- 
- 	if (pthread_mutexattr_init(&mutexattr) != 0)
- 		printf("Failed to init mutexattr\n");
-diff --git a/testcases/realtime/func/pi-tests/testpi-6.c b/testcases/realtime/func/pi-tests/testpi-6.c
-index b3c3e4a..f715eee 100644
---- a/testcases/realtime/func/pi-tests/testpi-6.c
-+++ b/testcases/realtime/func/pi-tests/testpi-6.c
-@@ -41,7 +41,7 @@
- #include <unistd.h>
- #include <librttest.h>
- 
--#if defined(PTHREAD_MUTEX_ROBUST_NP)
-+#if HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS
- pthread_mutex_t child_mutex;
- 
- void *child_thread(void *arg)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/ltp/ltp_20140828.bb b/meta/recipes-extended/ltp/ltp_20150119.bb
similarity index 84%
rename from meta/recipes-extended/ltp/ltp_20140828.bb
rename to meta/recipes-extended/ltp/ltp_20150119.bb
index 0be18a7..b422646 100644
--- a/meta/recipes-extended/ltp/ltp_20140828.bb
+++ b/meta/recipes-extended/ltp/ltp_20150119.bb
@@ -20,15 +20,13 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
-SRCREV = "2c341ad9177f36d9b953e84dee8cf88498286fe5"
+SRCREV = "b6ab85d764339b025526bdaf0b5026a67b3a677a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
     file://make-setregid02-work.patch \
     file://add-knob-for-numa.patch \
-    file://0001-Realtime-tests-Fix-bad-priority-inheritance-conditio.patch \
-    file://0001-Realtime-tests-Fix-robust-mutex-conditionals.patch \
     file://add-knob-for-tirpc.patch \
 "
 
@@ -47,12 +45,6 @@ EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
 # ltp network/rpc test cases ftbfs when libtirpc is found
 EXTRA_OECONF += " --without-tirpc "
 
-# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
-# we explicitly force regeneration of that directory and pass configure options.
-do_configure_append() {
-    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
-}
-
 # The makefiles make excessive use of make -C and several include testcases.mk
 # which triggers a build of the syscall header. To reproduce, build ltp,
 # then delete the header, then "make -j XX" and watch regen.sh run multiple
@@ -67,13 +59,9 @@ do_install(){
 
     # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
-
-    # We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in oe-core
-    # We will add expect for enhancement in future
-    find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect"
 
 FILES_${PN}-dbg += "\
     /opt/ltp/runtest/.debug \
-- 
1.9.1


