Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5F3577DA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 10:20:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9CAKLeC005732
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 12 Oct 2017 03:20:22 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 12 Oct 2017 03:20:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 12 Oct 2017 06:20:19 -0400
Message-ID: <1507803619-77353-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] screen: fix configure failed while build dir contains "yes"
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
X-List-Received-Date: Thu, 12 Oct 2017 10:20:21 -0000
Content-Type: text/plain

While the name of build dir contains "yes", the AC_EGREP_CPP
test always return true.

We rarely use "yes;" to name build dir, so s/yes/yes;/g
could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...c-fix-configure-failed-while-build-dir-ha.patch | 108 +++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.6.1.bb       |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch

diff --git a/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch b/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
new file mode 100644
index 0000000..e8db12c
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
@@ -0,0 +1,108 @@
+From 4b258c5a9078f8df60684ab7536ce3a8ff207e08 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 12 Oct 2017 10:03:57 +0000
+Subject: [PATCH] configure.ac: fix configure failed while build dir contains "yes"
+
+While the name of build dir contains "yes", the AC_EGREP_CPP
+test always return true.
+
+We rarely use "yes;" to name build dir, so s/yes/yes;/g
+could fix the issue
+
+Upstream-Status: Pending
+
+Signed-off-by: Jian Kang <jian.kang@windriver.com>
+---
+ configure.ac | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 12996cd..4765af6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -128,7 +128,7 @@ fi
+ 
+ 
+ AC_CHECKING(for Ultrix)
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#if defined(ultrix) || defined(__ultrix)
+    yes;
+ #endif
+@@ -145,7 +145,7 @@ dnl ghazi@caip.rutgers.edu (Kaveh R. Ghazi):
+ dnl BBN butterfly is not POSIX, but a MACH BSD system.
+ dnl Do not define POSIX and TERMIO.
+ AC_CHECKING(for butterfly)
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#if defined(butterfly)
+   yes;
+ #endif
+@@ -156,7 +156,7 @@ if test -n "$ULTRIX"; then
+   test -z "$GCC" && CC="$CC -YBSD"
+ fi
+ AC_CHECKING(for POSIX.1)
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#include <sys/types.h>
+ #include <unistd.h>
+ main () {
+@@ -173,14 +173,14 @@ AC_TRY_COMPILE(
+ #include <fcntl.h>], [int x = SIGCHLD | FNDELAY;], , AC_DEFINE(SYSV))
+ 
+ AC_CHECKING(for sequent/ptx)
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#ifdef _SEQUENT_
+   yes;
+ #endif
+ ], LIBS="$LIBS -lsocket -linet";seqptx=1)
+ 
+ AC_CHECKING(SVR4)
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [main () {
+ #if defined(SVR4) || defined(__SVR4)
+   yes;
+@@ -200,9 +200,9 @@ fi
+ AC_CHECK_HEADERS([stropts.h string.h strings.h])
+ 
+ AC_CHECKING(for Solaris 2.x)
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#if defined(SVR4) && defined(sun)
+-  yes
++  yes;
+ #endif
+ ], LIBS="$LIBS -lsocket -lnsl -lkstat")
+ 
+@@ -697,7 +697,7 @@ else
+ pdir='/dev'
+ fi
+ dnl SCO uses ptyp%d
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#ifdef M_UNIX
+    yes;
+ #endif
+@@ -880,7 +880,7 @@ fi
+ )
+ 
+ if test -z "$load" ; then
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#if defined(NeXT) || defined(apollo) || defined(linux)
+   yes;
+ #endif
+@@ -1112,7 +1112,7 @@ AC_CHECKING(syslog in libbsd.a)
+ AC_TRY_LINK(, [closelog();], AC_NOTE(- found.), [LIBS="$oldlibs"
+ AC_NOTE(- bad news: syslog missing.) AC_DEFINE(NOSYSLOG)])])
+ 
+-AC_EGREP_CPP(yes,
++AC_EGREP_CPP(yes;,
+ [#ifdef M_UNIX
+    yes;
+ #endif
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/screen/screen_4.6.1.bb b/meta/recipes-extended/screen/screen_4.6.1.bb
index 84baae9..bcd83a2 100644
--- a/meta/recipes-extended/screen/screen_4.6.1.bb
+++ b/meta/recipes-extended/screen/screen_4.6.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
+           file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch \
           "
 
 SRC_URI[md5sum] = "132c893aabfaf2020074790215c8cacd"
-- 
2.8.1


