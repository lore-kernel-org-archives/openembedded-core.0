Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D2A8E71A6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945783"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:13 +0300
Message-Id: <179d51201ad5ae0b8eb9024ddb74786751cfd714.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/50] boost: update to 1.65.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a patch to fix bjam-native compile error (due to mistyped
variable name).

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bjam-native_1.64.0.bb => bjam-native_1.65.1.bb} |  3 +-
 .../boost/{boost-1.64.0.inc => boost-1.65.1.inc}   |  4 +-
 ...detail-socket_types.hpp-fix-poll.h-includ.patch | 49 ----------------------
 .../boost/{boost_1.64.0.bb => boost_1.65.1.bb}     |  1 -
 ...ge-assert-typo-how-was-this-released-with.patch | 37 ++++++++++++++++
 5 files changed, 41 insertions(+), 53 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.64.0.bb => bjam-native_1.65.1.bb} (68%)
 rename meta/recipes-support/boost/{boost-1.64.0.inc => boost-1.65.1.inc} (85%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch
 rename meta/recipes-support/boost/{boost_1.64.0.bb => boost_1.65.1.bb} (85%)
 create mode 100644 meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.64.0.bb b/meta/recipes-support/boost/bjam-native_1.65.1.bb
similarity index 68%
rename from meta/recipes-support/boost/bjam-native_1.64.0.bb
rename to meta/recipes-support/boost/bjam-native_1.65.1.bb
index 46013f343b9..92c86a3ef59 100644
--- a/meta/recipes-support/boost/bjam-native_1.64.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.65.1.bb
@@ -5,7 +5,8 @@ SECTION = "devel"
 
 inherit native
 
-SRC_URI += "file://bjam-native-build-bjam.debug.patch"
+SRC_URI += "file://bjam-native-build-bjam.debug.patch \
+            file://0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch"
 
 do_compile() {
     ./bootstrap.sh --with-toolset=gcc
diff --git a/meta/recipes-support/boost/boost-1.64.0.inc b/meta/recipes-support/boost/boost-1.65.1.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.64.0.inc
rename to meta/recipes-support/boost/boost-1.65.1.inc
index dc7b1a9c015..f0ca88ca3e9 100644
--- a/meta/recipes-support/boost/boost-1.64.0.inc
+++ b/meta/recipes-support/boost/boost-1.65.1.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "93eecce2abed9d2442c9676914709349"
-SRC_URI[sha256sum] = "7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332"
+SRC_URI[md5sum] = "41d7542ce40e171f3f7982aff008ff0d"
+SRC_URI[sha256sum] = "9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch b/meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch
deleted file mode 100644
index 8a85aac18fe..00000000000
--- a/meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 40192301130dcd913aa6d9cb9dba9e5f8dbd9d16 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Wed, 24 Aug 2016 21:01:43 +0100
-Subject: [PATCH 1/4] use POSIX poll.h instead of sys/poll.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-POSIX specifies that <poll.h> is the correct header to
-include for poll()
-  http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
-whereas <sys/poll.h> is only needed for ancient glibc (<2.3),
-so let's follow POSIX instead.
-
-As a side-effect, this silences a warning when compiling
-against the musl C-library:
-
-In file included from ./boost/asio/detail/socket_types.hpp:61:0,
-                 from ./boost/asio/ip/address_v4.hpp:21,
-                 from ./boost/asio/ip/address.hpp:21,
-                 from libs/log/src/init_from_settings.cpp:65:
-<sysroot>/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
- #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
-  ^~~~~~~
-
-etc.
-
-Signed-off-by: André Draszik <adraszik@tycoint.com>
----
-Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/12419
- boost/asio/detail/socket_types.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/boost/asio/detail/socket_types.hpp b/boost/asio/detail/socket_types.hpp
-index e8c7109..7e65d3c 100644
---- a/boost/asio/detail/socket_types.hpp
-+++ b/boost/asio/detail/socket_types.hpp
-@@ -58,7 +58,7 @@
- #else
- # include <sys/ioctl.h>
- # if !defined(__SYMBIAN32__)
--#  include <sys/poll.h>
-+#  include <poll.h>
- # endif
- # include <sys/types.h>
- # include <sys/stat.h>
--- 
-2.9.3
-
diff --git a/meta/recipes-support/boost/boost_1.64.0.bb b/meta/recipes-support/boost/boost_1.65.1.bb
similarity index 85%
rename from meta/recipes-support/boost/boost_1.64.0.bb
rename to meta/recipes-support/boost/boost_1.65.1.bb
index d1c20e1d066..9ba56703a5c 100644
--- a/meta/recipes-support/boost/boost_1.64.0.bb
+++ b/meta/recipes-support/boost/boost_1.65.1.bb
@@ -4,7 +4,6 @@ require boost.inc
 SRC_URI += "\
     file://arm-intrinsics.patch \
     file://boost-CVE-2012-2677.patch \
-    file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
     file://boost-math-disable-pch-for-gcc.patch \
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
diff --git a/meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch b/meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch
new file mode 100644
index 00000000000..a75133d2bc6
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch
@@ -0,0 +1,37 @@
+From 5685527364198597f25fc1c6236cb64cbc3de44f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 4 Oct 2017 18:16:08 +0300
+Subject: [PATCH] Fix a strange assert typo; how was this released without
+ noticing?
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tools/build/src/engine/debugger.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/build/src/engine/debugger.c b/tools/build/src/engine/debugger.c
+index 802f262..152a7e6 100644
+--- a/tools/build/src/engine/debugger.c
++++ b/tools/build/src/engine/debugger.c
+@@ -1092,7 +1092,7 @@ static void debug_start_child( int argc, const char * * argv )
+     PROCESS_INFORMATION pi = { NULL, NULL, 0, 0 };
+     STARTUPINFO si = { sizeof( STARTUPINFO ), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+         0, 0, 0, 0, 0, 0 };
+-    assert( DEBUG_STATE == DEBUG_NO_CHILD );
++    assert( debug_state == DEBUG_NO_CHILD );
+     if ( ! CreatePipe( &pipe1[ 0 ], &pipe1[ 1 ], &sa, 0 ) )
+     {
+         printf("internal error\n");
+@@ -1176,7 +1176,7 @@ static void debug_start_child( int argc, const char * * argv )
+     int read_fd;
+     int pid;
+     int i;
+-    assert( DEBUG_STATE == DEBUG_NO_CHILD );
++    assert( debug_state == DEBUG_NO_CHILD );
+     pipe(pipe1);
+     pipe(pipe2);
+     pid = fork();
+-- 
+2.14.1
+
-- 
2.14.1


