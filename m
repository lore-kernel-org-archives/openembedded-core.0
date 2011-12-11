Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIO-0003re-Tv
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045463"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:48 -0800
Message-Id: <f783189fa11584b53a424d3ce1d6015daa170106.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/26] x86 tune: fix TUNE_PKGARCH definition for proper PACKAGE_ARCH
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
X-List-Received-Date: Sun, 11 Dec 2011 22:55:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

rpmbuild can not handle the PACKAGE_ARCH of these kinds:
	x86_64-x32, core2-64, core2-64-x32

With these kinds of PACKAGE_ARCH the --target parameter of rpmbuild
becomes like: core2-64-x32-poky-linux-gnux32 ; And rpmbuild extracts
%_target (arch) wrongly as core2 generating these kinds of rpms with
incorrect filenames: zip-3.0-r0.core2.rpm

So this commit fixes the issue by making PACKAGE_ARCH like this:
	x86_64_x32, core2_64, core2_64_x32
Now --target parameter of rpmbuild becomes like:
core2_64_x32-poky-linux-gnux32 ; And rpmbuild extracts %_target (arch)
correctly as core2_64_x32 generating these kinds of rpms with correct
filenames: zip-3.0-r0.core2_64_x32.rpm

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |    4 ++--
 meta/conf/machine/include/tune-core2.inc     |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index ee91983..0931c26 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -45,5 +45,5 @@ PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
 AVAILTUNES += "x86-64-x32"
 TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
 BASE_LIB_tune-x86-64-x32 ?= "libx32"
-PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64-x32"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
+PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64_x32"
+TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "_x32", "", d)}"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 565a39c..7cde511 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -1,5 +1,5 @@
 DEFAULTTUNE ?= "core2"
-TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "core2", "core2-64", d)}"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "core2", "core2_64", d)}"
 
 require conf/machine/include/tune-i586.inc
 
@@ -16,9 +16,9 @@ PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
 BASE_LIB_tune-core2-64 ?= "lib64"
-PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
+PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2_64"
 
 AVAILTUNES += "core2-64-x32"
 TUNE_FEATURES_tune-core2-64-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} core2"
 BASE_LIB_tune-core2-64-x32 ?= "libx32"
-PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-64-x32"
+PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2_64_x32"
-- 
1.7.6.4



