Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Pzxub-0005Pj-Ra
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 22:05:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Mar 2011 14:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,195,1299484800"; d="scan'208";a="403731517"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 16 Mar 2011 14:03:56 -0700
Message-Id: <c428a625c2f88234e6b8deab11afc91d95fb3408.1300309327.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1300309327.git.nitin.a.kamble@intel.com>
References: <cover.1300309327.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 15 Mar 2011 06:36:54 -0700
Date: Wed, 16 Mar 2011 14:03:56 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] m4: bring back GPLv2 version 1.4.9 of m4 recipe
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
X-List-Received-Date: Wed, 16 Mar 2011 21:05:46 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Note: Downgrading of m4 would require rebuilding of the autoconf
Fixed circular depedency with the newer autoconf

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/m4/m4-native_1.4.9.bb        |   12 +++
 .../m4/m4/fix_for_circular_dependency.patch        |   75 ++++++++++++++++++++
 meta/recipes-devtools/m4/m4_1.4.9.bb               |   18 +++++
 3 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/m4/m4-native_1.4.9.bb
 create mode 100644 meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
 create mode 100644 meta/recipes-devtools/m4/m4_1.4.9.bb

diff --git a/meta/recipes-devtools/m4/m4-native_1.4.9.bb b/meta/recipes-devtools/m4/m4-native_1.4.9.bb
new file mode 100644
index 0000000..fa871b3
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4-native_1.4.9.bb
@@ -0,0 +1,12 @@
+require m4_${PV}.bb
+inherit native
+
+INHIBIT_AUTOTOOLS_DEPS = "1"
+DEPENDS += "gnu-config-native"
+
+do_configure()  {
+	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.sub .
+	install -m 0644 ${STAGING_DATADIR}/gnu-config/config.guess .
+	oe_runconf
+}
+
diff --git a/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch b/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
new file mode 100644
index 0000000..ba51d87
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
@@ -0,0 +1,75 @@
+The older GPLv2 m4 does not work well with newer autoconf. It causes the 
+circular dependency as seen bellow.
+  Removing this m4 file which was needed only forl older autoconf
+
+| configure.ac:34: error: AC_REQUIRE: circular dependency of AC_GNU_SOURCE
+| /build_disk/poky_build/build1/tmp/work/i586-poky-linux/m4-1.4.9-r0/m4-1.4.9/m4/extensions.m4:19: AC_USE_SYSTEM_EXTENSIONS is expanded from...
+| ../../lib/autoconf/specific.m4:310: AC_GNU_SOURCE is expanded from...
+| /build_disk/poky_build/build1/tmp/work/i586-poky-linux/m4-1.4.9-r0/m4-1.4.9/m4/gnulib-comp.m4:21: M4_EARLY is expanded from...
+| configure.ac:34: the top level
+| autom4te: /build_disk/poky_build/build1/tmp/sysroots/x86_64-linux/usr/bin/m4 failed with exit status: 1
+| aclocal: /build_disk/poky_build/build1/tmp/sysroots/x86_64-linux/usr/bin/autom4te failed with exit status: 1
+| autoreconf: aclocal failed with exit status: 1
+
+Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/03/16
+
+Index: m4-1.4.9/m4/extensions.m4
+===================================================================
+--- m4-1.4.9.orig/m4/extensions.m4
++++ m4-1.4.9/m4/extensions.m4
+@@ -6,53 +6,10 @@
+ # gives unlimited permission to copy and/or distribute it,
+ # with or without modifications, as long as this notice is preserved.
+ 
+-# This definition of AC_USE_SYSTEM_EXTENSIONS is stolen from CVS
+-# Autoconf.  Perhaps we can remove this once we can assume Autoconf
+-# 2.61 or later everywhere, but since CVS Autoconf mutates rapidly
+-# enough in this area it's likely we'll need to redefine
+-# AC_USE_SYSTEM_EXTENSIONS for quite some time.
+-
+-# AC_USE_SYSTEM_EXTENSIONS
+-# ------------------------
+-# Enable extensions on systems that normally disable them,
+-# typically due to standards-conformance issues.
+-AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
+-[
+-  AC_BEFORE([$0], [AC_COMPILE_IFELSE])
+-  AC_BEFORE([$0], [AC_RUN_IFELSE])
+-
+-  AC_REQUIRE([AC_GNU_SOURCE])
+-  AC_REQUIRE([AC_AIX])
+-  AC_REQUIRE([AC_MINIX])
+-
+-  AH_VERBATIM([__EXTENSIONS__],
+-[/* Enable extensions on Solaris.  */
+-#ifndef __EXTENSIONS__
+-# undef __EXTENSIONS__
+-#endif
+-#ifndef _POSIX_PTHREAD_SEMANTICS
+-# undef _POSIX_PTHREAD_SEMANTICS
+-#endif
+-#ifndef _TANDEM_SOURCE
+-# undef _TANDEM_SOURCE
+-#endif])
+-  AC_CACHE_CHECK([whether it is safe to define __EXTENSIONS__],
+-    [ac_cv_safe_to_define___extensions__],
+-    [AC_COMPILE_IFELSE(
+-       [AC_LANG_PROGRAM([
+-#	  define __EXTENSIONS__ 1
+-	  AC_INCLUDES_DEFAULT])],
+-       [ac_cv_safe_to_define___extensions__=yes],
+-       [ac_cv_safe_to_define___extensions__=no])])
+-  test $ac_cv_safe_to_define___extensions__ = yes &&
+-    AC_DEFINE([__EXTENSIONS__])
+-  AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
+-  AC_DEFINE([_TANDEM_SOURCE])
+-])
+ 
+ # gl_USE_SYSTEM_EXTENSIONS
+ # ------------------------
+ # Enable extensions on systems that normally disable them,
+ # typically due to standards-conformance issues.
+ AC_DEFUN([gl_USE_SYSTEM_EXTENSIONS],
+-  [AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])])
++  [])
diff --git a/meta/recipes-devtools/m4/m4_1.4.9.bb b/meta/recipes-devtools/m4/m4_1.4.9.bb
new file mode 100644
index 0000000..94c8bde
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4_1.4.9.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Traditional Unix macro processor"
+DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
+compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
+GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
+	file://examples/COPYING;md5=1d49bd61dc590f014cae7173b43e3e5c"
+
+PR = "r0"
+SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
+	file://fix_for_circular_dependency.patch "
+
+SRC_URI[md5sum] = "1ba8e147aff5e79bd2bfb983d86b53d5"
+SRC_URI[sha256sum] = "815ce53853fbf6493617f467389b799208b1ec98296b95be44a683f8bcfd7c47"
+
+inherit autotools
+
+EXTRA_OEMAKE += "'infodir=${infodir}'"
-- 
1.7.3.4



