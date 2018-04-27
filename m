Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6C0A601F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 06:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3R65hXx016445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Apr 2018 23:05:58 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 26 Apr 2018 23:05:32 -0700
From: <mingli.yu@windriver.com>
To: <alexander.kanavin@linux.intel.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Apr 2018 23:05:32 -0700
Message-ID: <20180427060532.90468-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] boost: update to 1.67.0
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
X-List-Received-Date: Fri, 27 Apr 2018 06:06:39 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Remove the backported patch 0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch
* Remove the patch 0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
  as it already rewritten gcc to use toolset.flags again
  as below:

  commit 12decb3ce680031b915f69902795eec47224fc7d
  Author: Steven Watanabe <steven@providere-consulting.com>
  Date:   Mon Jan 1 12:51:43 2018 -0700

    Rewrite gcc to use toolset.flags again.
* Remove the hardcoded parallel build limit as the
  mechanism already changed as below commit:
  commit 316e26ca718afc65d6170029284521392524e4f8
  Author: Steven Watanabe <steven@providere-consulting.com>
  Date:   Wed Apr 26 14:22:06 2017 -0600

    Remove fixed limit to -j.  Fixes #189.
    * execunix.c: Replace select with poll.
    * execnt.c: Use RegisterWaitForSingleObject when the number of jobs exceeds MAXIMUM_WAIT_OBJECTS.

Reference: https://github.com/boostorg/build/commit/316e26ca718afc65d6170029284521392524e4f8#diff-c88fe8afebc632d0bef2bd5985137af2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...bjam-native_1.66.0.bb => bjam-native_1.67.0.bb} |  2 +-
 .../boost/{boost-1.66.0.inc => boost-1.67.0.inc}   |  4 +-
 meta/recipes-support/boost/boost.inc               |  5 +-
 ...Don-t-set-up-m32-m64-we-do-that-ourselves.patch | 65 ----------------------
 .../boost/{boost_1.66.0.bb => boost_1.67.0.bb}     |  1 -
 ...ge-assert-typo-how-was-this-released-with.patch | 37 ------------
 6 files changed, 5 insertions(+), 109 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.66.0.bb => bjam-native_1.67.0.bb} (81%)
 rename meta/recipes-support/boost/{boost-1.66.0.inc => boost-1.67.0.inc} (85%)
 delete mode 100644 meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
 rename meta/recipes-support/boost/{boost_1.66.0.bb => boost_1.67.0.bb} (83%)
 delete mode 100644 meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.66.0.bb b/meta/recipes-support/boost/bjam-native_1.67.0.bb
similarity index 81%
rename from meta/recipes-support/boost/bjam-native_1.66.0.bb
rename to meta/recipes-support/boost/bjam-native_1.67.0.bb
index 92c86a3ef5..94f96e62d8 100644
--- a/meta/recipes-support/boost/bjam-native_1.66.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.67.0.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 inherit native
 
 SRC_URI += "file://bjam-native-build-bjam.debug.patch \
-            file://0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch"
+"
 
 do_compile() {
     ./bootstrap.sh --with-toolset=gcc
diff --git a/meta/recipes-support/boost/boost-1.66.0.inc b/meta/recipes-support/boost/boost-1.67.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.66.0.inc
rename to meta/recipes-support/boost/boost-1.67.0.inc
index fe2b8639f7..1c7f94022d 100644
--- a/meta/recipes-support/boost/boost-1.66.0.inc
+++ b/meta/recipes-support/boost/boost-1.67.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "b2dfbd6c717be4a7bb2d88018eaccf75"
-SRC_URI[sha256sum] = "5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9"
+SRC_URI[md5sum] = "ced776cb19428ab8488774e1415535ab"
+SRC_URI[sha256sum] = "2684c972994ee57fc5632e03bf044746f6eb45d4920c343937a465fd67a5adba"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 0461ec6fcf..b447897a0c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -133,9 +133,8 @@ BJAM_TOOLS   = "--ignore-site-config \
 		'--layout=system' \
 		"
 
-# use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater parallelism causes bjam to segfault or to ignore -j
-# https://svn.boost.org/trac/boost/ticket/7634
-BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}"
+# use PARALLEL_MAKE to speed up the build
+BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
diff --git a/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch b/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
deleted file mode 100644
index 26f3cbb051..0000000000
--- a/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From e4d3a7470b307693660d0412732e7266d1738d8c Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 10:29:17 -0700
-Subject: [PATCH 6/6] Don't set up -m32/-m64, we do that ourselves
-
-Upstream-Status: Inappropriate
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
----
- tools/build/src/tools/gcc.jam | 39 ---------------------------------------
- 1 file changed, 39 deletions(-)
-
-diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index e4fc6c32..37914fd0 100644
---- a/tools/build/src/tools/gcc.jam
-+++ b/tools/build/src/tools/gcc.jam
-@@ -337,45 +337,6 @@ rule set-address-model-options ( targets * : sources * : properties * )
-     {
-         local option ;
-         local target-os = [ feature.get-values target-os : $(properties) ] ;
--        if $(target-os) = aix
--        {
--            if $(model) = 32
--            {
--                option = -maix32 ;
--            }
--            else
--            {
--                option = -maix64 ;
--            }
--        }
--        else if $(target-os) = hpux
--        {
--            if $(model) = 32
--            {
--                option = -milp32 ;
--            }
--            else
--            {
--                option = -mlp64 ;
--            }
--        }
--        else
--        {
--            local arch = [ feature.get-values architecture : $(properties) ] ;
--            if $(arch) = power || $(arch) = sparc || $(arch) = x86
--            {
--                if $(model) = 32
--                {
--                    option = -m32 ;
--                }
--                else if $(model) = 64
--                {
--                    option = -m64 ;
--                }
--            }
--            # For darwin, the model can be 32_64. darwin.jam will handle that
--            # on its own.
--        }
-         OPTIONS on $(targets) += $(option) ;
-     }
- }
--- 
-2.15.1
-
diff --git a/meta/recipes-support/boost/boost_1.66.0.bb b/meta/recipes-support/boost/boost_1.67.0.bb
similarity index 83%
rename from meta/recipes-support/boost/boost_1.66.0.bb
rename to meta/recipes-support/boost/boost_1.67.0.bb
index 63b82a5995..eb50899d56 100644
--- a/meta/recipes-support/boost/boost_1.66.0.bb
+++ b/meta/recipes-support/boost/boost_1.67.0.bb
@@ -7,5 +7,4 @@ SRC_URI += "\
     file://boost-math-disable-pch-for-gcc.patch \
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
-    file://0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch \
 "
diff --git a/meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch b/meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch
deleted file mode 100644
index a75133d2bc..0000000000
--- a/meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5685527364198597f25fc1c6236cb64cbc3de44f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 4 Oct 2017 18:16:08 +0300
-Subject: [PATCH] Fix a strange assert typo; how was this released without
- noticing?
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tools/build/src/engine/debugger.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/build/src/engine/debugger.c b/tools/build/src/engine/debugger.c
-index 802f262..152a7e6 100644
---- a/tools/build/src/engine/debugger.c
-+++ b/tools/build/src/engine/debugger.c
-@@ -1092,7 +1092,7 @@ static void debug_start_child( int argc, const char * * argv )
-     PROCESS_INFORMATION pi = { NULL, NULL, 0, 0 };
-     STARTUPINFO si = { sizeof( STARTUPINFO ), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-         0, 0, 0, 0, 0, 0 };
--    assert( DEBUG_STATE == DEBUG_NO_CHILD );
-+    assert( debug_state == DEBUG_NO_CHILD );
-     if ( ! CreatePipe( &pipe1[ 0 ], &pipe1[ 1 ], &sa, 0 ) )
-     {
-         printf("internal error\n");
-@@ -1176,7 +1176,7 @@ static void debug_start_child( int argc, const char * * argv )
-     int read_fd;
-     int pid;
-     int i;
--    assert( DEBUG_STATE == DEBUG_NO_CHILD );
-+    assert( debug_state == DEBUG_NO_CHILD );
-     pipe(pipe1);
-     pipe(pipe2);
-     pid = fork();
--- 
-2.14.1
-
-- 
2.11.0


