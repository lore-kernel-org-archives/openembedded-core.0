Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SEpq9-0004oE-RM
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 00:35:09 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 00:23:55 +0200
Message-Id: <1333405435-10983-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Mon, 02 Apr 2012 22:35:09 -0000

* Fixes communication between gdbserver and gdb-cross
  by using the same expat settings for both recipes.
* Adds missing build dependencies for expat/expat-native.
* Adds missing glibc-thread-db runtime recommendation
  to gdbserver, which was set only for gdb.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* Related mailing list thread:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019029.html

 meta/recipes-devtools/gdb/gdb-common.inc           |    8 +++++---
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    1 -
 meta/recipes-devtools/gdb/gdb-cross.inc            |    2 +-
 meta/recipes-devtools/gdb/gdb-cross_7.4.bb         |    1 -
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 0833a03..a8fca6f 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "gdb - GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE="GPLv3+"
 SECTION = "devel"
-DEPENDS = "ncurses readline ${LTTNGUST}"
+DEPENDS = "expat ncurses readline ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
@@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -36,7 +36,7 @@ B = "${WORKDIR}/build-${TARGET_SYS}"
 
 EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
 
-EXPAT = "--without-expat"
+EXPAT = "--with-expat"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
@@ -63,4 +63,6 @@ do_install_append() {
 
 RRECOMMENDS_gdb_append_linux = " glibc-thread-db "
 RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
+RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db "
+RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db "
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index 8e68c75..b2f39ce 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -4,6 +4,5 @@ require gdb-cross-canadian.inc
 PR = "${INC_PR}.5"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-EXPAT = "--with-expat"
 
 S = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 20db86b..588a208 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -1,6 +1,6 @@
 require gdb-common.inc
 
-DEPENDS = "ncurses-native"
+DEPENDS = "expat-native ncurses-native"
 
 #EXTRA_OEMAKE += "LDFLAGS='${BUILD_LDFLAGS}'"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross_7.4.bb
index eaf8f36..a14d0ba 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.4.bb
@@ -1,7 +1,6 @@
 require gdb-cross.inc
 
 SRC_URI += "file://sim-install-6.6.patch"
-EXPAT = "--with-expat"
 
 PR = "${INC_PR}.0"
 
-- 
1.7.5.4



