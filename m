Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qgvj6-0006Nq-Ho
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:27:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jul 2011 02:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,524,1304319600"; d="scan'208";a="27345036"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2011 02:23:31 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 13 Jul 2011 17:22:23 +0800
Message-Id: <db81af015b2dd10654b905b2a1ee9b053ca8dca6.1310548638.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310548638.git.ke.yu@intel.com>
References: <cover.1310548638.git.ke.yu@intel.com>
In-Reply-To: <cover.1310548638.git.ke.yu@intel.com>
References: <cover.1310548638.git.ke.yu@intel.com>
Subject: [PATCH 2/2] libzypp: fix for non /usr/lib libdir case
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
X-List-Received-Date: Wed, 13 Jul 2011 09:27:28 -0000

this patch has two fixes:
1. the src tool/CMakeLists.txt has hardcode "lib", so add a patch to fix it
2. the recipe has hardcode "-DLIB=lib", so replace it with libdir

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../libzypp/libzypp/hardcode-lib-fix.patch         |   22 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    5 ++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch b/meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
new file mode 100644
index 0000000..c11f5c5
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
@@ -0,0 +1,22 @@
+tools/CMakeLists.txt: replace the hardcode "lib"
+
+replace the hardcode "lib" with LIB_INSTALL_DIR
+this will work with non /usr/lib libdir case
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+Index: libzypp/tools/CMakeLists.txt
+===================================================================
+--- libzypp.orig/tools/CMakeLists.txt
++++ libzypp/tools/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ 
+ ADD_SUBDIRECTORY( package-manager )
+ 
+-INSTALL( FILES notify-message DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/zypp" )
++INSTALL( FILES notify-message DESTINATION "${LIB_INSTALL_DIR}/zypp" )
+ 
+ ## ############################################################
+ 
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 824f7a1..6555bd4 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN} = "sat-solver"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -23,6 +23,7 @@ SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
 	   file://config-release.patch \
 	   file://libzypp-pokyarch.patch \
 	   file://fix_for_compile_wth_gcc-4.6.0.patch \
+          file://hardcode-lib-fix.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
@@ -33,7 +34,7 @@ SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
 FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
 FILES_${PN}-dev += "${datadir}/cmake"
 
-EXTRA_OECMAKE += "-DLIB=lib"
+EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.7.0.4



