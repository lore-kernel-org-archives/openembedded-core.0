Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC3365DB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 13:51:48 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.8)
	with ESMTPS id 377310186; Tue, 08 Apr 2014 09:51:49 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WXWRC-0005Zy-4I; Tue, 08 Apr 2014 14:51:42 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WXWRC-00048W-3T; Tue, 08 Apr 2014 14:51:42 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 14:51:22 +0100
Message-Id: <1396965083-15863-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.9.1
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] cmake: Improve method for not building ccmake
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
X-List-Received-Date: Tue, 08 Apr 2014 13:51:50 -0000

In commit 4bee0a93ed985b38c6b4eb605d8e16f5d7c82d51 I introduced an
unnecessary patch to do something that can easily be done without
patching.

The argument to disable building ccmake can be passed to configure provided
it is preceded by "--".

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb    |  6 +++++-
 meta/recipes-devtools/cmake/cmake.inc                   |  5 ++++-
 .../cmake/cmake/disable-bootstrap-cursesdialog.patch    | 17 -----------------
 3 files changed, 9 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
index d032cb9..638c074 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
@@ -6,8 +6,12 @@ DEPENDS += "bzip2-native zlib-native"
 
 SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
-    file://disable-bootstrap-cursesdialog.patch \
 "
 
 SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
 SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
+
+# Disable ccmake since we don't depend on ncurses
+CMAKE_EXTRACONF = "\
+    -DBUILD_CursesDialog=0 \
+"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a0fcf49..8592a23 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -43,6 +43,9 @@ do_configure_prepend() {
 	sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
 }
 
+# Extra flags to pass to cmake invoked by bootstrap
+CMAKE_EXTRACONF = ""
+
 do_configure () {
-	./configure --prefix=${prefix}
+	./configure --prefix=${prefix} -- ${CMAKE_EXTRACONF}
 }
diff --git a/meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch b/meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch
deleted file mode 100644
index 9d378fb..0000000
--- a/meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Disable building CursesDialog so that cmake-native doesn't have to
-depend on ncurses-native.
-
-Upstream-status: Inappropriate [disable feature]
-
-Signed-off-by: Mike Crowe <mac@mcrowe.com>
-
---- cmake-2.8.12.2/bootstrap~	2014-01-16 17:15:09.000000000 +0000
-+++ cmake-2.8.12.2/bootstrap	2014-04-01 21:27:23.841996822 +0100
-@@ -1578,6 +1578,7 @@ export MAKE
- 
- # Run bootstrap CMake to configure real CMake
- cmake_options="-DCMAKE_BOOTSTRAP=1"
-+cmake_options="${cmake_options} -DBUILD_CursesDialog=0"
- if [ -n "${cmake_verbose}" ]; then
-   cmake_options="${cmake_options} -DCMAKE_VERBOSE_MAKEFILE=1"
- fi
-- 
1.9.1


