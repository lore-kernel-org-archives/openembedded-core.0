Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPF-0000Cj-It
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115454"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:12 -0700
Message-Id: <00ce4b4d072a5fe194aeae4c9d74dc0f0d1a817c.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 33/45] grep-2.5.1a: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../grep-2.5.1a/grep_fix_for_automake-1.12.patch   |   52 ++++++++++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |    7 ++-
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..3ccce5f
--- /dev/null
+++ b/meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.in:33: error: automatic de-ANSI-fication support has been removed
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12/protos.m4:12: AM_C_PROTOTYPES is expanded from...
+| configure.in:33: the top level
+| autom4te: m4 failed with exit status: 1
+...
+| lib/Makefile.am:2: error: automatic de-ANSI-fication support has been removed
+| src/Makefile.am:2: error: automatic de-ANSI-fication support has been removed
+| autoreconf: automake failed with exit status: 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: grep-2.5.1a/configure.in
+===================================================================
+--- grep-2.5.1a.orig/configure.in
++++ grep-2.5.1a/configure.in
+@@ -30,7 +30,6 @@ AC_PROG_RANLIB
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_SYS_LARGEFILE
+-AM_C_PROTOTYPES
+ AC_TYPE_SIZE_T
+ AC_CHECK_TYPE(ssize_t, int)
+ AC_C_CONST
+Index: grep-2.5.1a/lib/Makefile.am
+===================================================================
+--- grep-2.5.1a.orig/lib/Makefile.am
++++ grep-2.5.1a/lib/Makefile.am
+@@ -1,5 +1,5 @@
+ #
+-AUTOMAKE_OPTIONS = ../src/ansi2knr
++AUTOMAKE_OPTIONS = 
+ 
+ SUBDIRS = posix
+ 
+Index: grep-2.5.1a/src/Makefile.am
+===================================================================
+--- grep-2.5.1a.orig/src/Makefile.am
++++ grep-2.5.1a/src/Makefile.am
+@@ -1,5 +1,5 @@
+ ## Process this file with automake to create Makefile.in
+-AUTOMAKE_OPTIONS = ansi2knr no-dependencies
++AUTOMAKE_OPTIONS = no-dependencies
+ 
+ LN = ln
+ 
diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 64064fc..5aecf17 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -5,10 +5,12 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
-           file://uclibc-fix.patch"
+           file://uclibc-fix.patch \
+           file://grep_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "52202fe462770fa6be1bb667bd6cf30c"
 SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92bdd3132"
@@ -17,6 +19,7 @@ inherit autotools gettext
 
 EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
 
+CFLAGS += "-D PROTOTYPES"
 do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
 }
-- 
1.7.7.6



