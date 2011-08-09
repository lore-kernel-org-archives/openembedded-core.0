Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tong.lin@intel.com>) id 1QqhPh-0004TB-5z
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 10:11:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2011 01:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,342,1309762800"; d="scan'208";a="35911909"
Received: from yocto-build1.sh.intel.com (HELO localhost) ([10.239.48.127])
	by orsmga002.jf.intel.com with ESMTP; 09 Aug 2011 01:06:14 -0700
From: Lin Tong <tong.lin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 16:30:50 +0800
Message-Id: <b88f61a1da4e2e8ca52bddc442e03db104f4c5d9.1312869726.git.tong.lin@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1312869726.git.tong.lin@intel.com>
References: <cover.1312869726.git.tong.lin@intel.com>
In-Reply-To: <cover.1312869726.git.tong.lin@intel.com>
References: <cover.1312869726.git.tong.lin@intel.com>
Subject: [PATCH 1/1] valgrind: supporting Linux kernel 3.0
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
X-List-Received-Date: Tue, 09 Aug 2011 08:11:49 -0000

    The old valgrind package do not support for Linux kernel 3.0, only for kernel 2.6 and 2.4
    Now adding the new configuration to the configure.in file to support Linux kernel 3.0

    This commit fixes the problem in valgrind[YOCTO #1129]

    Signed-off-by: Lin Tong <tong.lin@intel.com>
---
 .../valgrind-3.6.1/fix_3.0_kernel_support.patch    |   26 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.patch b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.patch
new file mode 100644
index 0000000..54fc481
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.patch
@@ -0,0 +1,26 @@
+valgrind:Add "3.0.*" statement to the "case" statement for supporting the kernel 3.0.* .
+
+Signed-off-by: Tong Lin <tong.lin@intel.com>
+
+Upstream-Status: Pending
+
+diff --git a/configure.in b/configure.in
+index 3878619..f09720e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -229,10 +229,13 @@ case "${host_os}" in
+         	    AC_MSG_RESULT([2.4 family (${kernel})])
+         	    AC_DEFINE([KERNEL_2_4], 1, [Define to 1 if you're using Linux 2.4.x])
+         	    ;;
+-
++             3.0.*)
++                    AC_MSG_RESULT([3.0 family (${kernel})])
++                    AC_DEFINE([KERNEL_3_0], 1, [Define to 1 if you're using Linux 3.0.x])
++                    ;;
+              *) 
+         	    AC_MSG_RESULT([unsupported (${kernel})])
+-        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
++        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6, 3.0])
+         	    ;;
+         esac
+ 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index d5dcdd6..6ce2a00 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=13a71cedba99112334d8596162aec37e \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 DEPENDS = "virtual/libx11"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
+           file://fix_3.0_kernel_support.patch \
            file://fixed-perl-path.patch"
 
 SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
-- 
1.7.0.4



