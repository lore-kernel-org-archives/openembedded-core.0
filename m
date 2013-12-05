Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id E060F6DF7C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 07:58:23 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id BACDF40083;
	Thu,  5 Dec 2013 07:27:58 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 08:58:18 +0100
Message-Id: <1386230298-6835-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1386230298-6835-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1386230298-6835-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: [PATCH] boost: updating to 1.55.0
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
X-List-Received-Date: Thu, 05 Dec 2013 07:58:24 -0000

When updating to 1.55.0, the backport patches for recent versions of
glibc and linking boost-thread to boost-atomic were removed, as they
have been added to the current version.
Although the arm-intrinsics.patch is reported with Status: Backport,
it was not merged to version 1.55.0 yet.

The boost recipe for 1.55.0 was tested intensively for the different
qemu machines with the meta-ros layer, which uses boost in various
recipes. During the compilation, no errors were discovered.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 ...bjam-native_1.54.0.bb => bjam-native_1.55.0.bb} |  0
 .../boost/{boost-1.54.0.inc => boost-1.55.0.inc}   |  4 +-
 meta/recipes-support/boost/boost_1.54.0.bb         |  7 ---
 meta/recipes-support/boost/boost_1.55.0.bb         |  4 ++
 .../files/boost-1.54.0-thread-link_atomic.patch    | 59 ----------------------
 meta/recipes-support/boost/files/glibc.patch       | 26 ----------
 6 files changed, 6 insertions(+), 94 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.54.0.bb => bjam-native_1.55.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.54.0.inc => boost-1.55.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost_1.54.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.55.0.bb
 delete mode 100644 meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
 delete mode 100644 meta/recipes-support/boost/files/glibc.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.54.0.bb b/meta/recipes-support/boost/bjam-native_1.55.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.54.0.bb
rename to meta/recipes-support/boost/bjam-native_1.55.0.bb
diff --git a/meta/recipes-support/boost/boost-1.54.0.inc b/meta/recipes-support/boost/boost-1.55.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.54.0.inc
rename to meta/recipes-support/boost/boost-1.55.0.inc
index 9113c82..7daadb6 100644
--- a/meta/recipes-support/boost/boost-1.54.0.inc
+++ b/meta/recipes-support/boost/boost-1.55.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "15cb8c0803064faef0c4ddf5bc5ca279"
-SRC_URI[sha256sum] = "047e927de336af106a24bceba30069980c191529fd76b8dff8eb9a328b48ae1d"
+SRC_URI[md5sum] = "d6eef4b4cacb2183f2bf265a5a03a354"
+SRC_URI[sha256sum] = "fff00023dd79486d444c8e29922f4072e1d451fc5a4d2b6075852ead7f2b7b52"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost_1.54.0.bb b/meta/recipes-support/boost/boost_1.54.0.bb
deleted file mode 100644
index 9e7a60a..0000000
--- a/meta/recipes-support/boost/boost_1.54.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include boost-${PV}.inc
-include boost.inc
-
-SRC_URI += "file://arm-intrinsics.patch \
-            file://glibc.patch \
-            file://boost-1.54.0-thread-link_atomic.patch \
-           "
diff --git a/meta/recipes-support/boost/boost_1.55.0.bb b/meta/recipes-support/boost/boost_1.55.0.bb
new file mode 100644
index 0000000..b199c88
--- /dev/null
+++ b/meta/recipes-support/boost/boost_1.55.0.bb
@@ -0,0 +1,4 @@
+include boost-${PV}.inc
+include boost.inc
+
+SRC_URI += "file://arm-intrinsics.patch"
diff --git a/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
deleted file mode 100644
index 62af3d1..0000000
--- a/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Link boost_thread with boost_atomic to avoid undefined references to
-boost::atomic::detail::lock_pool::get_lock_for().
-
-From https://svn.boost.org/trac/boost/ticket/9041
-
-Phil Blundell <pb@pbcl.net>
-Upstream-Status: Backport
-
-diff -Nurp boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp
---- boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp	1970-01-01 01:00:00.000000000 +0100
-+++ boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp	2013-08-23 19:51:52.706329968 +0200
-@@ -0,0 +1,14 @@
-+// Copyright (c) 2013, Petr Machata, Red Hat Inc.
-+//
-+// Use modification and distribution are subject to the boost Software
-+// License, Version 1.0.  (See http://www.boost.org/LICENSE_1_0.txt).
-+
-+#include "../../../boost/atomic.hpp"
-+#include "../../../boost/static_assert.hpp"
-+
-+int
-+main(int argc, char *argv[])
-+{
-+  BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);
-+  return 0;
-+}
-diff -Nurp boost_1_54_0/libs/thread/build/Jamfile.v2 boost_1_54_0.pm/libs/thread/build/Jamfile.v2
---- boost_1_54_0/libs/thread/build/Jamfile.v2	2013-06-15 12:35:45.000000000 +0200
-+++ boost_1_54_0.pm/libs/thread/build/Jamfile.v2	2013-08-23 19:52:30.018613408 +0200
-@@ -36,6 +36,7 @@ import os ;
- import feature ;
- import indirect ;
- import path ;
-+import configure ;
- 
- project boost/thread
-     : source-location ../src
-@@ -140,6 +141,8 @@ local rule default_threadapi ( )
- feature.feature threadapi : pthread win32 : propagated ;
- feature.set-default threadapi : [ default_threadapi ] ;
- 
-+exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp ;
-+
- rule tag ( name : type ? : property-set )
- {
-     local result = $(name) ;
-@@ -248,6 +251,12 @@ rule requirements ( properties * )
- {
-     local result ;
- 
-+    if ! [ configure.builds has_atomic_flag_lockfree
-+	   : $(properties) : "lockfree boost::atomic_flag" ]
-+    {
-+        result += <library>/boost/atomic//boost_atomic ;
-+    }
-+
-     if <threadapi>pthread in $(properties)
-     {
-         result += <define>BOOST_THREAD_POSIX ;
diff --git a/meta/recipes-support/boost/files/glibc.patch b/meta/recipes-support/boost/files/glibc.patch
deleted file mode 100644
index c33ea64..0000000
--- a/meta/recipes-support/boost/files/glibc.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-------------------------------------------------------------------------
-r84950 | johnmaddock | 2013-07-04 02:13:23 -0700 (Thu, 04 Jul 2013) | 2 lines
-
-Patch for recent versions of glibc which always assume int64_t support.
-Fixes #8731.
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: boost_1_54_0/boost/cstdint.hpp
-===================================================================
---- boost_1_54_0.orig/boost/cstdint.hpp
-+++ boost_1_54_0/boost/cstdint.hpp
-@@ -41,7 +41,10 @@
- // so we disable use of stdint.h when GLIBC does not define __GLIBC_HAVE_LONG_LONG.
- // See https://svn.boost.org/trac/boost/ticket/3548 and http://sources.redhat.com/bugzilla/show_bug.cgi?id=10990
- //
--#if defined(BOOST_HAS_STDINT_H) && (!defined(__GLIBC__) || defined(__GLIBC_HAVE_LONG_LONG))
-+#if defined(BOOST_HAS_STDINT_H)					\
-+  && (!defined(__GLIBC__)					\
-+      || defined(__GLIBC_HAVE_LONG_LONG)			\
-+      || (defined(__GLIBC__) && ((__GLIBC__ > 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ >= 17)))))
- 
- // The following #include is an implementation artifact; not part of interface.
- # ifdef __hpux
-- 
1.8.3.2


