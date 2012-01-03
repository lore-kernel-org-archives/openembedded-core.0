Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr9-0004L1-Ha
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:20 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752156"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:09 -0800
Message-Id: <7f58d1e670470e76077102629efabe91e5c2b9bf.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 023/113] valgrind: upgrade to 3.7.0
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:20 -0000

From: Shane Wang <shane.wang@intel.com>

This patch is to upgrade valgrind to 3.7.0.
The licenses are changed from "Copyright (C) 2000-2010 Julian Seward. All rights reserved." to "Copyright (C) 2000-2011 Julian Seward. All rights reserved."

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../valgrind/valgrind-3.7.0/configure-fix.patch    |   23 ++++++++++++++++++++
 .../fix_issue_caused_by_ccache.patch               |    0
 .../fix_unsupporting_kernel_3.patch                |    0
 .../fixed-perl-path.patch                          |    0
 .../{valgrind_3.6.1.bb => valgrind_3.7.0.bb}       |   13 ++++++-----
 5 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fix_issue_caused_by_ccache.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fix_unsupporting_kernel_3.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fixed-perl-path.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.6.1.bb => valgrind_3.7.0.bb} (71%)

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
new file mode 100644
index 0000000..a3fce84
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
@@ -0,0 +1,23 @@
+To recognize gcc version from poky in configure.in
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+diff -r 91a8df96084a configure.in
+--- a/configure.in	Fri Dec 23 20:57:01 2011 +0800
++++ b/configure.in	Fri Dec 23 20:59:21 2011 +0800
+@@ -104,11 +104,13 @@
+ # 
+ # i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
+ # i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
++# ARCH-VENDOR-OS-gcc (GCC) VERSION Copyright
+ #
+ [gcc_version=`${CC} --version \
+              | head -n 1 \
+              | $SED 's/i686-apple-darwin10//' \
+              | $SED 's/i686-apple-darwin11//' \
++             | $SED 's/.*GCC[^0-9]*//' \
+              | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`]
+ 
+ is_clang="notclang"
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_issue_caused_by_ccache.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_issue_caused_by_ccache.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_issue_caused_by_ccache.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_issue_caused_by_ccache.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_unsupporting_kernel_3.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_unsupporting_kernel_3.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.1/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/fixed-perl-path.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.6.1/fixed-perl-path.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.7.0/fixed-perl-path.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
similarity index 71%
rename from meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 021caa8..03cdd28 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -3,19 +3,20 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=b4765f122b7672cdf9b2e8fd75a33172 \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=13a71cedba99112334d8596162aec37e \
+                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=0ef036a7ddce4cdc738d65d63b3e8153 \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=aee56014c1dd64260a59fd4df38752f6 \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 DEPENDS = "virtual/libx11"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
            file://fix_unsupporting_kernel_3.patch \
-           file://fixed-perl-path.patch"
+           file://fixed-perl-path.patch \
+           file://configure-fix.patch"
 
-SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
-SRC_URI[sha256sum] = "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
+SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
+SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-- 
1.7.6.4



