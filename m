Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgXK8-0008UC-HF
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:24:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 00:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,519,1304319600"; d="scan'208";a="26624982"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 00:20:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 00:20:04 -0700
Message-Id: <6afa19c8b049d42c67f009e6f616deb8a5c6f882.1310455097.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310455097.git.sgw@linux.intel.com>
References: <cover.1310455097.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310455097.git.sgw@linux.intel.com>
References: <cover.1310455097.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] gcc: Fix packaging correctly
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
X-List-Received-Date: Tue, 12 Jul 2011 07:24:04 -0000

[YOCTO #1233]

This fix directly packages the contents in  and adds the lib*.so
correctly to the -dev package.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |    9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index a880111..56064b5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r6"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index 69abf72..9a91a7f 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -14,10 +14,12 @@ FILES_${PN} = "\
   ${bindir}/${TARGET_PREFIX}gcc \
   ${bindir}/${TARGET_PREFIX}gccbug \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
@@ -26,6 +28,8 @@ FILES_${PN}-dbg += "\
 "
 FILES_${PN}-dev = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
 "
 FILES_${PN}-symlinks = "\
   ${bindir}/cc \
@@ -80,7 +84,6 @@ do_install () {
 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.so
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
 
 	# Hack around specs file assumptions
-- 
1.7.3.4



