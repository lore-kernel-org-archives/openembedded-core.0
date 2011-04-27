Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE2-0005Jt-54
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:31:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028160"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:21 -0700
Message-Id: <fd2485ab15ed82cb3dc84b8408e516a932de1bd1.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 17:22:49 +0800
Date: Wed, 27 Apr 2011  0:29:20 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:49 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 02/52] quilt: fix test for target build
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
X-List-Received-Date: Wed, 27 Apr 2011 07:31:56 -0000

From: Qing He <qing.he@intel.com>

fixes [YOCTO #969]

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../quilt/quilt/gnu_patch_test_fix_target.patch    |   26 ++++++++++++++++++++
 meta/recipes-devtools/quilt/quilt_0.48.bb          |    6 +++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch

diff --git a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
new file mode 100644
index 0000000..672155b
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+the test should be skipped for cross compiling.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 026a36c..8af591b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -245,6 +245,7 @@ fi
+ QUILT_COMPAT_PROG_PATH(DIFF, diff)
+ QUILT_COMPAT_PROG_PATH(PATCH, patch)
+ 
++if test "x$cross_compiling" != "xyes"; then
+ # Sun diff and others will not work because GNU patch options are used.
+ AC_MSG_CHECKING([the version of $DIFF])
+ if $DIFF --version 2>/dev/null | grep GNU >/dev/null; then
+@@ -293,6 +294,7 @@ current version of patch from ftp.gnu.org, or if you already have GNU patch
+ then you can supply its path with the '--with-patch=' option.
+ ])
+ fi
++fi
+ 
+ QUILT_COMPAT_PROG_PATH(FIND, find)
+ 
diff --git a/meta/recipes-devtools/quilt/quilt_0.48.bb b/meta/recipes-devtools/quilt/quilt_0.48.bb
index 20a708d..124e2cd 100644
--- a/meta/recipes-devtools/quilt/quilt_0.48.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.48.bb
@@ -2,8 +2,10 @@ require quilt.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
-PR = "r0"
-SRC_URI += "file://aclocal.patch"
+PR = "r1"
+SRC_URI += "file://aclocal.patch \
+            file://gnu_patch_test_fix_target.patch \
+           "
 
 SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
 SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
-- 
1.7.1.1



