Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAwL6-0006eB-LW
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:43:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2012 21:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120759948"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2012 21:34:06 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 12:31:52 +0800
Message-Id: <1cc4f7300f53bb661522756ce6d8b56c9f17198e.1332474082.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
References: <c1505ead113c0bac42d2481bbd75e1bf367bbfd2.1332474082.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332474081.git.lianhao.lu@intel.com>
References: <cover.1332474081.git.lianhao.lu@intel.com>
Subject: [PATCH 5/5] libgcc: corrected -nativesdk package namings.
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
X-List-Received-Date: Fri, 23 Mar 2012 04:43:00 -0000

1. Corrected the -nativesdk package namings.

2. Fixed package QA warnings:
WARNING: QA Issue: non -staticdev package contains static .a library:
libgcc-nativesdk-dev path
'/work/x86_64-nativesdk-pokysdk-linux/libgcc-nativesdk-4.6.3+svnr184847-r23/packages-split/libgcc-nativesdk-dev/opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/x86_64-pokysdk-linux/4.6.4/libgcc.a'
WARNING: QA Issue: non -staticdev package contains static .a library:
libgcc-nativesdk-dev path
'/work/x86_64-nativesdk-pokysdk-linux/libgcc-nativesdk-4.6.3+svnr184847-r23/packages-split/libgcc-nativesdk-dev/opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/x86_64-pokysdk-linux/4.6.4/libgcc_eh.a'

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc   |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.6.bb |   11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 99c30a6..d40a534 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r23"
+PR = "r24"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 04e2877..6e557d5 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -3,11 +3,14 @@ require gcc-${PV}.inc
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
 PACKAGES = "\
   ${PN} \
   ${PN}-dev \
   ${PN}-dbg \
-  libgcov-dev \
+  libgcov${PKGSUFFIX}-dev \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
@@ -15,7 +18,7 @@ FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
-FILES_libgcov-dev = " \
+FILES_libgcov${PKGSUFFIX}-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
 
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
@@ -48,6 +51,6 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 
 BBCLASSEXTEND = "nativesdk"
 
-INSANE_SKIP_libgcc-dev = "staticdev"
-INSANE_SKIP_libgcov-dev = "staticdev"
+INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
 
-- 
1.7.0.4



