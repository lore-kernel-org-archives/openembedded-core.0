Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QK3mO-0003bc-LY
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 09:24:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2011 00:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="745563863"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2011 00:21:33 -0700
Message-Id: <0002456a563997ba6e69f99733292136a5419d1a.1305098201.git.ke.yu@intel.com>
In-Reply-To: <cover.1305098201.git.ke.yu@intel.com>
References: <cover.1305098201.git.ke.yu@intel.com>
Old-Date: Sun, 8 May 2011 21:09:26 +0800
Date: Wed, 11 May 2011 15:27:49 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 2/5] sqlite: upgrade from 3.7.5 to 3.7.6.2
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
X-List-Received-Date: Wed, 11 May 2011 07:24:20 -0000

From: Yu Ke <ke.yu@intel.com>

- also remove the libtool.patch since it is already in the release version
- update the LIC_FILES_CHKSUM, the license is not changed, just use
  sqlite3.h as more appropriate license file. the original sqlite3.c
  is actually not point to license content.

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-support/sqlite/sqlite3.inc           |    5 ----
 meta/recipes-support/sqlite/sqlite3/libtool.patch |   25 ---------------------
 meta/recipes-support/sqlite/sqlite3_3.7.5.bb      |   10 --------
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb    |   10 ++++++++
 4 files changed, 10 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/libtool.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 92c4930..d8ef8dc 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -6,11 +6,6 @@ DEPENDS = "readline ncurses tcl-native"
 DEPENDS_virtclass-native = "tcl-native"
 LICENSE = "PD"
 
-SRC_URI = "http://www.sqlite.org/sqlite-${PV}.tar.gz \
-	   file://libtool.patch"
-
-S = "${WORKDIR}/sqlite-${PV}"
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-tcl --enable-shared --enable-threadsafe"
diff --git a/meta/recipes-support/sqlite/sqlite3/libtool.patch b/meta/recipes-support/sqlite/sqlite3/libtool.patch
deleted file mode 100644
index ccf9993..0000000
--- a/meta/recipes-support/sqlite/sqlite3/libtool.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: sqlite-3.2.1/Makefile.in
-===================================================================
---- sqlite-3.2.1.orig/Makefile.in	2005-03-23 17:09:39.000000000 +0100
-+++ sqlite-3.2.1/Makefile.in	2005-04-25 23:11:20.000000000 +0200
-@@ -15,7 +15,10 @@
- # The toplevel directory of the source tree.  This is the directory
- # that contains this "Makefile.in" and the "configure.in" script.
- #
--TOP = @srcdir@
-+TOP = $(srcdir)
-+srcdir = @srcdir@
-+top_srcdir = @top_srcdir@
-+top_builddir = .
- 
- # C Compiler and options for use in building executables that
- # will run on the platform that is doing the build.
-@@ -96,7 +99,7 @@
- exec_prefix = @exec_prefix@
- libdir = @libdir@
- INSTALL = @INSTALL@
--LIBTOOL = ./libtool
-+LIBTOOL = @LIBTOOL@
- ALLOWRELEASE = @ALLOWRELEASE@
- 
- # libtool compile/link/install
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.5.bb b/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
deleted file mode 100644
index 212d9e2..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.c;endline=19;md5=c1b8048b783961c3ba387c43fd955dc6"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070500.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3070500"
-PR = "r0"
-
-SRC_URI[md5sum] = "a9604a82613ade2e7f4c303f233e477f"                                                 
-SRC_URI[sha256sum] = "cb5b86926ec9f65882b2dddd244f2d620337d911ec73411863f77e48cf6a2f94"              
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
new file mode 100644
index 0000000..34d1653
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070602.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3070602"
+PR = "r0"
+
+SRC_URI[md5sum] = "f16c08617968b4087b3d591fd575f59f"
+SRC_URI[sha256sum] = "53aa66f30d8ff87230d4173b7979814432b8084da77fba05992223f76593fc81"
-- 
1.7.0.4



