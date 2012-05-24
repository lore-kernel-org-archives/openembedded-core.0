Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuS-0002x9-SE
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125509"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:20 -0700
Message-Id: <cf49cf3958b24fdb89d57abbf1f1b30c07a06030.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 09/32] gcc: Add plugins package for ARM, fix /usr/incude packaging
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
X-List-Received-Date: Thu, 24 May 2012 21:49:31 -0000

From: Saul Wold <sgw@linux.intel.com>

WARNING: For recipe gcc, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/include
WARNING:   /usr/lib/gcc/arm-poky-linux-gnueabi/4.6.4/plugin/libgcc
WARNING:   /usr/lib/gcc/arm-poky-linux-gnueabi/4.6.4/plugin/libgcc/config
WARNING:   /usr/lib/gcc/arm-poky-linux-gnueabi/4.6.4/plugin/libgcc/config/arm
WARNING:   /usr/lib/gcc/arm-poky-linux-gnueabi/4.6.4/plugin/libgcc/config/arm/bpabi-lib.h
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-package-target.inc |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index 3076670..a499c88 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -1,5 +1,5 @@
 PACKAGES = "\
-  ${PN} ${PN}-symlinks \
+  ${PN} ${PN}-plugins ${PN}-symlinks \
   g++ g++-symlinks \
   cpp cpp-symlinks \
   g77 g77-symlinks \
@@ -40,6 +40,11 @@ FILES_${PN}-symlinks = "\
   ${bindir}/gccbug \
 "
 
+FILES_${PN}-plugins = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
+"
+ALLOW_EMPTY_${PN}-plugins = "1"
+
 FILES_g77 = "\
   ${bindir}/${TARGET_PREFIX}g77 \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
@@ -88,6 +93,7 @@ do_install () {
 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
+	rmdir ${D}${includedir}
 
 	# Hack around specs file assumptions
 	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
-- 
1.7.9.5



