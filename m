Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63F5D73D12
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOWgK026727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:22 -0700
Message-ID: <443782338d40e86e0669258709a18c48bdb3b5d5.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] strace: 4.9 -> 4.10
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

Updated patches:
Makefile-ptest.patch
strace-add-configure-options.patch

Fixed:
debugedit: netlink_unix_diag: canonicalization unexpectedly shrank by one character

It was because oe_runmake -C ${TESTDIR} buildtest-TESTS didn't set OS
and ARCH, which caused "-I<foo>//" in gcc options, and would cause
debugedit error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{strace-4.9 => strace}/Makefile-ptest.patch    |    8 +++----
 .../strace/{strace-4.9 => strace}/git-version-gen  |    0
 .../strace/{strace-4.9 => strace}/run-ptest        |    0
 .../strace-add-configure-options.patch             |   24 +++++++-------------
 .../strace/{strace_4.9.bb => strace_4.10.bb}       |    8 +++----
 5 files changed, 15 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/Makefile-ptest.patch (90%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/git-version-gen (100%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/run-ptest (100%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/strace-add-configure-options.patch (70%)
 rename meta/recipes-devtools/strace/{strace_4.9.bb => strace_4.10.bb} (84%)

diff --git a/meta/recipes-devtools/strace/strace-4.9/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
similarity index 90%
rename from meta/recipes-devtools/strace/strace-4.9/Makefile-ptest.patch
rename to meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index df01310..f360301 100644
--- a/meta/recipes-devtools/strace/strace-4.9/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -10,7 +10,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 054f85b..9aec566 100644
+index e73958c..5f0dfee 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -6,7 +6,7 @@ AC_INIT([strace],
@@ -23,11 +23,11 @@ index 054f85b..9aec566 100644
  AC_CANONICAL_HOST
  
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 922452a..b17837f 100644
+index ff5e136..984bdb6 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -37,3 +37,21 @@ TEST_LOG_COMPILER = $(srcdir)/run.sh
- EXTRA_DIST = init.sh run.sh sigaction.awk $(TESTS)
+@@ -101,3 +101,21 @@ EXTRA_DIST = init.sh run.sh \
+ 	     $(TESTS)
  
  CLEANFILES = $(TESTS:=.tmp)
 +
diff --git a/meta/recipes-devtools/strace/strace-4.9/git-version-gen b/meta/recipes-devtools/strace/strace/git-version-gen
similarity index 100%
rename from meta/recipes-devtools/strace/strace-4.9/git-version-gen
rename to meta/recipes-devtools/strace/strace/git-version-gen
diff --git a/meta/recipes-devtools/strace/strace-4.9/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
similarity index 100%
rename from meta/recipes-devtools/strace/strace-4.9/run-ptest
rename to meta/recipes-devtools/strace/strace/run-ptest
diff --git a/meta/recipes-devtools/strace/strace-4.9/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
similarity index 70%
rename from meta/recipes-devtools/strace/strace-4.9/strace-add-configure-options.patch
rename to meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
index 15e37bc..e48e4b3 100644
--- a/meta/recipes-devtools/strace/strace-4.9/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
@@ -5,24 +5,16 @@ Upstream-Status: Pending
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 ---
- configure.ac | 27 ++++++++++++++++++++++++++-
- 1 file changed, 26 insertions(+), 1 deletion(-)
+ configure.ac |   26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 054f85b..8ed49f1 100644
+index e73958c..9099370 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -238,7 +238,6 @@ AC_CHECK_HEADERS(m4_normalize([
- 	poll.h
- 	scsi/sg.h
- 	stropts.h
--	sys/acl.h
- 	sys/asynch.h
- 	sys/conf.h
- 	sys/epoll.h
-@@ -250,6 +249,18 @@ AC_CHECK_HEADERS(m4_normalize([
- 	sys/uio.h
+@@ -270,6 +270,18 @@ AC_CHECK_HEADERS(m4_normalize([
  	sys/vfs.h
+ 	sys/xattr.h
  ]))
 +
 +AC_ARG_ENABLE([acl],
@@ -39,9 +31,9 @@ index 054f85b..8ed49f1 100644
  AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
                   [], [], [#include <stddef.h>
  #include <sys/socket.h>
-@@ -649,6 +660,20 @@ if test "x$st_cv_have___builtin_popcount" = xyes; then
- 		  [Define to 1 if the system provides __builtin_popcount function])
+@@ -745,6 +757,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes; then
  fi
+ AC_SUBST(dl_LIBS)
  
 +AC_ARG_ENABLE([aio],
 +	[AS_HELP_STRING([--enable-aio], [turn on libaio support])],
@@ -60,6 +52,6 @@ index 054f85b..8ed49f1 100644
  AC_PATH_PROG([PERL], [perl])
  
  dnl stack trace with libunwind
--- 
+--
 1.9.1
 
diff --git a/meta/recipes-devtools/strace/strace_4.9.bb b/meta/recipes-devtools/strace/strace_4.10.bb
similarity index 84%
rename from meta/recipes-devtools/strace/strace_4.9.bb
rename to meta/recipes-devtools/strace/strace_4.10.bb
index cce130d..416c387 100644
--- a/meta/recipes-devtools/strace/strace_4.9.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "885eafadb10f6c60464a266d3929a2a4"
-SRC_URI[sha256sum] = "095bfea5c540b91d297ccac73b21b92fd54a24599fd70395db87ff9eb7fd6f65"
+SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
+SRC_URI[sha256sum] = "e6180d866ef9e76586b96e2ece2bfeeb3aa23f5cc88153f76e9caedd65e40ee2"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
@@ -23,8 +23,6 @@ PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
 
-export INCLUDES = "-I. -I./linux"
-
 TESTDIR = "tests"
 
 do_configure_prepend() {
@@ -37,7 +35,7 @@ do_install_append() {
 }
 
 do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} buildtest-TESTS
+	oe_runmake -C ${TESTDIR} buildtest-TESTS OS=linux ARCH="${TARGET_ARCH}"
 }
 
 do_install_ptest() {
-- 
1.7.9.5


