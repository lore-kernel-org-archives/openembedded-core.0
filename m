Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPD-00006T-7Y
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115447"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:08 -0700
Message-Id: <06af4ece5ba5681f75121528c8a888a8ed3f87ce.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 29/45] gmp-4.2.1: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  |   48 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..fbd8a39
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
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
+Index: gmp-4.2.1/configure.in
+===================================================================
+--- gmp-4.2.1.orig/configure.in
++++ gmp-4.2.1/configure.in
+@@ -67,7 +67,7 @@ dnl
+ dnl  Note that there's a copy of these options in the top-level Makefile.am,
+ dnl  so update there too if changing anything.
+ dnl
+-AM_INIT_AUTOMAKE([1.8 gnu no-dependencies $(top_builddir)/ansi2knr])
++AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
+ AM_CONFIG_HEADER(config.h:config.in)
+ AM_MAINTAINER_MODE
+ 
+@@ -2022,9 +2022,6 @@ fi
+ echo "      MPN_PATH=\"$path\""
+ 
+ 
+-# Automake ansi2knr support.
+-AM_C_PROTOTYPES
+-
+ GMP_PROG_AR
+ GMP_PROG_NM
+ 
+Index: gmp-4.2.1/Makefile.am
+===================================================================
+--- gmp-4.2.1.orig/Makefile.am
++++ gmp-4.2.1/Makefile.am
+@@ -27,7 +27,7 @@
+ # Makefiles in subdirectories, but here we must omit it so automake gives
+ # the actual ansi2knr build rule, not "cd $(top_builddir) && make ansi2knr".
+ #
+-AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies ansi2knr
++AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies
+ 
+ 
+ # Libtool -version-info for libgmp.la and libmp.la.  See "Versioning" in the
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 280b1ab..49ee59b 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -6,10 +6,12 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://gmp-h.in;startline=6;endline=21;md5=5e25ffd16996faba8c1cd27b04b16099"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
-           file://disable-stdc.patch"
+           file://disable-stdc.patch \
+           file://gmp_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
 SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
-- 
1.7.7.6



