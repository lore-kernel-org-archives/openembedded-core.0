Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOF-00085f-2N
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115416"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:49 -0700
Message-Id: <b4aec021b7ecdbe92a27ef2ce58bc28c9067574f.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 10/45] gmp: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:52:47 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_5.0.4.bb              |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch b/meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..8ff1bcf
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.in:2240: error: automatic de-ANSI-fication support has been removed
+| Makefile.am:28: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: gmp-5.0.4/configure.in
+===================================================================
+--- gmp-5.0.4.orig/configure.in
++++ gmp-5.0.4/configure.in
+@@ -59,7 +59,7 @@ dnl
+ dnl  Note that there's a copy of these options in the top-level Makefile.am,
+ dnl  so update there too if changing anything.
+ dnl
+-AM_INIT_AUTOMAKE([1.8 gnu no-dependencies $(top_builddir)/ansi2knr])
++AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
+ AM_CONFIG_HEADER(config.h:config.in)
+ AM_MAINTAINER_MODE
+ 
+@@ -2236,9 +2236,6 @@ fi
+ echo "      MPN_PATH=\"$path\""
+ 
+ 
+-# Automake ansi2knr support.
+-AM_C_PROTOTYPES
+-
+ CL_AS_NOEXECSTACK
+ 
+ GMP_PROG_AR
+Index: gmp-5.0.4/Makefile.am
+===================================================================
+--- gmp-5.0.4.orig/Makefile.am
++++ gmp-5.0.4/Makefile.am
+@@ -25,7 +25,7 @@
+ # Makefiles in subdirectories, but here we must omit it so automake gives
+ # the actual ansi2knr build rule, not "cd $(top_builddir) && make ansi2knr".
+ #
+-AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies ansi2knr
++AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies
+ 
+ 
+ # Libtool -version-info for libgmp.la and libmp.la.  See "Versioning" in the
diff --git a/meta/recipes-support/gmp/gmp_5.0.4.bb b/meta/recipes-support/gmp/gmp_5.0.4.bb
index 9adcc3f..cb2ca5b 100644
--- a/meta/recipes-support/gmp/gmp_5.0.4.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.4.bb
@@ -2,10 +2,12 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r0"
+PR = "r1"
 
 SRC_URI_append += "file://use-includedir.patch \
-                   file://gmp_fix_for_x32.patch"
+                   file://gmp_fix_for_x32.patch \
+                   file://gmp_fix_for_automake-1.12.patch \
+                   "
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-- 
1.7.7.6



