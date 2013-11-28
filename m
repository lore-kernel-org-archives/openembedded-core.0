Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 35FF16D7D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 12:48:10 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 28 Nov 2013 13:48:06 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 5944E28508B;
	Thu, 28 Nov 2013 13:48:06 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Nov 2013 13:48:05 +0100
Message-ID: <1385642885-25407-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] kmod: avoid parallel-tests
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
X-List-Received-Date: Thu, 28 Nov 2013 12:48:11 -0000
Content-Type: text/plain

buildtest-TESTS and runtest-TESTS targets are required by ptest.
In order to have those targets in automake 1.13.4, serial-tests
should be specified since parallel test is assumed by default
and serial-tests is optional.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |    2 +-
 .../kmod/kmod/avoid_parallel_tests.patch           |   21 ++++++++++++++++++++
 .../kmod/kmod/remove_parallel_tests.patch          |   18 -----------------
 3 files changed, 22 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 8a18547..f8d5bac 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -23,7 +23,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://run-ptest \
            file://ptest.patch \
-           file://remove_parallel_tests.patch \
+           file://avoid_parallel_tests.patch \
            file://fix-seperatebuilddir.patch \
           "
 
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
new file mode 100644
index 0000000..4c37d44
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -0,0 +1,21 @@
+Avoid parallel-tests as it remove
+buildtest-TESTS and runtest-TESTS targets required by ptest.
+In automake 1.13.4 parallel-tests is assumed by defauls.
+In order to have buildtest-TESTS and runtest-TESTS targets
+serial-tests is now required
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Inappropriate (disable feature incompatible with ptest) 
+
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-09-02 15:05:18.662366800 +0200
++++ b/configure.ac	2013-11-28 09:26:49.557066764 +0200
+@@ -8,7 +8,7 @@
+ AC_CONFIG_SRCDIR([libkmod/libkmod.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules
+-	tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
++	tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
+ AC_PROG_CC_STDC
+ AC_USE_SYSTEM_EXTENSIONS
+ AC_SYS_LARGEFILE
diff --git a/meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch
deleted file mode 100644
index ee19428..0000000
--- a/meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Avoid parallel-tests as it remove
-buildtest-TESTS and runtest-TESTS targets
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Inappropriate (disable feature incompatible with ptest) 
-
-diff -ruN a/configure.ac b/configure.ac
---- a/configure.ac	2013-09-02 15:05:18.662366800 +0200
-+++ b/configure.ac	2013-09-02 15:05:49.557066764 +0200
-@@ -8,7 +8,7 @@
- AC_CONFIG_SRCDIR([libkmod/libkmod.c])
- AC_CONFIG_AUX_DIR([build-aux])
- AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules
--	tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
-+	tar-pax no-dist-gzip dist-xz subdir-objects color-tests])
- AC_PROG_CC_STDC
- AC_USE_SYSTEM_EXTENSIONS
- AC_SYS_LARGEFILE
-- 
1.7.10.4


