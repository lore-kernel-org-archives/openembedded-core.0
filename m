Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4bB-0006yu-W8
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:59 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633121"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:43 -0800
Message-Id: <5424af5b8a1dae39991998457ccedb992c7ddcf8.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 58/62] valgrind: Update for eglibc 2.15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 08:40:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../valgrind/valgrind-3.7.0/configure-fix.patch    |   25 ++++++++++++++++---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    2 +-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
index a3fce84..1f4bd7e 100644
--- a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
@@ -1,13 +1,16 @@
 To recognize gcc version from poky in configure.in
+Added GLIBC 2.15 stanza to supported GLIBCs
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Shane Wang <shane.wang@intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-diff -r 91a8df96084a configure.in
---- a/configure.in	Fri Dec 23 20:57:01 2011 +0800
-+++ b/configure.in	Fri Dec 23 20:59:21 2011 +0800
-@@ -104,11 +104,13 @@
+Index: valgrind-3.7.0/configure.in
+===================================================================
+--- valgrind-3.7.0.orig/configure.in
++++ valgrind-3.7.0/configure.in
+@@ -104,11 +104,13 @@ AC_MSG_CHECKING([for a supported version
  # 
  # i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
  # i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
@@ -21,3 +24,17 @@ diff -r 91a8df96084a configure.in
               | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`]
  
  is_clang="notclang"
+@@ -779,6 +781,13 @@ case "${GLIBC_VERSION}" in
+ 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.15)
++	AC_MSG_RESULT(2.15 family)
++	AC_DEFINE([GLIBC_2_15], 1, [Define to 1 if you're using glibc 2.15.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 858bf3d..9c53262 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=aee56014c1dd64260a59fd4df38752f6 \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 DEPENDS = "virtual/libx11"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
-- 
1.7.6.5



