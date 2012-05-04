Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF8-0000Rd-AT
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486048"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:40 -0700
Message-Id: <b2483ef35c98079ac7e247d691f92db6f39286e3.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 34/40] coreutils-native-6.9: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:42:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../coreutils_fix_for_automake-1.12.patch          |   32 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 ++-
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..02730db
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.ac:40: error: automatic de-ANSI-fication support has been removed
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12/protos.m4:12: AM_C_PROTOTYPES is expanded from...
+| /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-linux/coreutils-native-6.9-r2/coreutils-6.9/m4/jm-macros.m4:138: gl_CHECK_ALL_TYPES is expanded from...
+| /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-linux/coreutils-native-6.9-r2/coreutils-6.9/m4/jm-macros.m4:24: coreutils_MACROS is expanded from...
+| configure.ac:40: the top level
+| autom4te: m4 failed with exit status: 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: coreutils-6.9/m4/jm-macros.m4
+===================================================================
+--- coreutils-6.9.orig/m4/jm-macros.m4
++++ coreutils-6.9/m4/jm-macros.m4
+@@ -142,11 +142,6 @@ AC_DEFUN([gl_CHECK_ALL_TYPES],
+   dnl whether functions and headers are available, whether they work, etc.
+   AC_REQUIRE([AC_SYS_LARGEFILE])
+ 
+-  dnl This test must precede tests of compiler characteristics like
+-  dnl that for the inline keyword, since it may change the degree to
+-  dnl which the compiler supports such features.
+-  AC_REQUIRE([AM_C_PROTOTYPES])
+-
+   dnl Checks for typedefs, structures, and compiler characteristics.
+   AC_REQUIRE([AC_C_BIGENDIAN])
+   AC_REQUIRE([AC_C_VOLATILE])
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 8a47a60..bbde63c 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
-PR = "r2"
+PR = "r3"
 DEPENDS = "coreutils-native-${PV}"
 DEPENDS_virtclass-native = "gettext-native"
 
@@ -22,7 +22,9 @@ SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://coreutils-i18n.patch \
            file://coreutils-overflow.patch \
            file://coreutils-fix-install.patch \
-           file://man-touch.patch"
+           file://man-touch.patch \
+           file://coreutils_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI = "${SRC_URI_BASE} file://fix_for_manpage_building.patch"
 SRC_URI_virtclass-native = "${SRC_URI_BASE}"
-- 
1.7.7



