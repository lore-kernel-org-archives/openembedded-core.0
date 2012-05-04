Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF9-0000Y5-Fd
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486055"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:45 -0700
Message-Id: <a1f67e8b86c9a532228fbd4d2dcc1eb302a1c1bf.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 39/40] findutils-4.2.31: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:52 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../findutils_fix_for_automake-1.12.patch          |   23 ++++++++++++++++++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |    6 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch b/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..2d0ddb4
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.in:75: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: findutils-4.2.31/configure.in
+===================================================================
+--- findutils-4.2.31.orig/configure.in
++++ findutils-4.2.31/configure.in
+@@ -72,7 +72,6 @@ dnl gl_EARLY calls AC_GNU_SOURCE anyway.
+ 
+ 
+ AC_ISC_POSIX
+-AM_C_PROTOTYPES
+ 
+ AC_PROG_INSTALL
+ AC_PROG_RANLIB
diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index 0c37836..37da0ce 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -8,10 +8,12 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
-           file://gnulib-extension.patch"
+           file://gnulib-extension.patch \
+           file://findutils_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
 SRC_URI[sha256sum] = "e0d34b8faca0b3cca0703f6c6b498afbe72f0ba16c35980c10ec9ef7724d6204"
-- 
1.7.7



