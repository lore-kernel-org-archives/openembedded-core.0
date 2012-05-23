Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDK-0006Ll-Az
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507185"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:42 -0700
Message-Id: <0652c360ce866c8627ded89751664942e8150477.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 27/30] grep-2.5.1a: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:10 -0000

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
1.7.7



