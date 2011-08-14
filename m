Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDO-0005Pe-58
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387536"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:36 -0700
Message-Id: <6e145bedd214adfc07f03b0905ec608bdeaa84a9.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/12] valgrind: supporting on Linux kernel 3.x
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
X-List-Received-Date: Sun, 14 Aug 2011 23:35:34 -0000

From: Lin Tong <tong.lin@intel.com>

The old valgrind package do not support for Linux kernel 3.x, only for
kernel 2.4 and 2.6. Now adding the configuration to the configure.in
file to support Linux kernel 3.0.

This commit fixes the problem in valgrind [YOCTO #1129]

Signed-off-by: Lin Tong <tong.lin@intel.com>
---
 .../valgrind-3.6.1/fix_unsupporting_kernel_3.patch |   26 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch
new file mode 100644
index 0000000..346ffeb
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch
@@ -0,0 +1,26 @@
+valgrind: Add 3.x statements to "case" for supporting the kernel 3.x
+
+Signed-off-by: Lin Tong <tong.lin@intel.com>
+
+Upstream-Status: Pending
+
+diff --git a/configure.in b/configure.in
+index 3878619..1cb7dc7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -229,10 +229,14 @@ case "${host_os}" in
+         	    AC_MSG_RESULT([2.4 family (${kernel})])
+         	    AC_DEFINE([KERNEL_2_4], 1, [Define to 1 if you're using Linux 2.4.x])
+         	    ;;
++             3.*)
++                    AC_MSG_RESULT([3 family (${kernel})])
++                    AC_DEFINE([KERNEL_3], 1, [Define to 1 if you're using Linux 3.x])
++                    ;;
+ 
+              *) 
+         	    AC_MSG_RESULT([unsupported (${kernel})])
+-        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
++        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6, 3.x])
+         	    ;;
+         esac
+ 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index d5dcdd6..021caa8 100644
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
+           file://fix_unsupporting_kernel_3.patch \
            file://fixed-perl-path.patch"
 
 SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
-- 
1.7.6



