Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVP-0001Zb-S1
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="640479355"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:26:28 -0700
Message-Id: <c63242fb343c8a541efbb655da3dc3423e58f732.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 23:12:55 +0200
Date: Mon, 09 May 2011 22:26:28 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 30/30] toolchain-qte: include cross-compiler and fix env script
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
X-List-Received-Date: Tue, 10 May 2011 05:29:12 -0000

From: Ilya Yanok <yanok@emcraft.com>

This patch fixes the meta-toolchain-qte recipe:
 1. cross-compiler added to the TOOLCHAIN_HOST_TASK.
 2. Corrected paths in the environment script.
 3. TOOLCHAIN_OUTPUTNAME used instead of SDK_SUFFIX.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-qt/meta/meta-toolchain-qte.bb |   33 ++++++++++++++-------------
 1 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index da0dda7..72fa702 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -1,26 +1,27 @@
 # Qt Embedded toolchain
 PR = "r5"
-TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host"
+TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
+TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
 
 require recipes-core/meta/meta-toolchain.bb
-SDK_SUFFIX = "toolchain-qte"
 
 QT_DIR_NAME = "qtopia"
+QT_TOOLS_PREFIX = "${SDKPATHNATIVE}${bindir_nativesdk}"
 
 toolchain_create_sdk_env_script_append() {
-    echo 'export OE_QMAKE_CC=${TARGET_SYS}-gcc' >> $script
-    echo 'export OE_QMAKE_CXX=${TARGET_SYS}-g++' >> $script
-    echo 'export OE_QMAKE_LINK=${TARGET_SYS}-g++' >> $script
-    echo 'export OE_QMAKE_AR=${TARGET_SYS}-ar' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${SDKPATH}/${TARGET_SYS}/${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${SDKPATH}/${TARGET_SYS}/${includedir}/${QT_DIR_NAME}' >> $script
-    echo 'export OE_QMAKE_MOC=${SDKPATH}/bin/moc4' >> $script
-    echo 'export OE_QMAKE_UIC=${SDKPATH}/bin/uic4' >> $script
-    echo 'export OE_QMAKE_UIC3=${SDKPATH}/bin/uic34' >> $script
-    echo 'export OE_QMAKE_RCC=${SDKPATH}/bin/rcc4' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${SDKPATH}/bin/qdbuscpp2xml4' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${SDKPATH}/bin/qdbusxml2cpp4' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${SDKPATH}/${TARGET_SYS}/${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${SDKPATH}/${TARGET_SYS}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+    echo 'export OE_QMAKE_CC=${TARGET_PREFIX}gcc' >> $script
+    echo 'export OE_QMAKE_CXX=${TARGET_PREFIX}g++' >> $script
+    echo 'export OE_QMAKE_LINK=${TARGET_PREFIX}g++' >> $script
+    echo 'export OE_QMAKE_AR=${TARGET_PREFIX}ar' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=${SDKTARGETSYSROOT}/${libdir}' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT=${SDKTARGETSYSROOT}/${includedir}/${QT_DIR_NAME}' >> $script
+    echo 'export OE_QMAKE_MOC=${QT_TOOLS_PREFIX}/moc4' >> $script
+    echo 'export OE_QMAKE_UIC=${QT_TOOLS_PREFIX}/uic4' >> $script
+    echo 'export OE_QMAKE_UIC3=${QT_TOOLS_PREFIX}/uic34' >> $script
+    echo 'export OE_QMAKE_RCC=${QT_TOOLS_PREFIX}/rcc4' >> $script
+    echo 'export OE_QMAKE_QDBUSCPP2XML=${QT_TOOLS_PREFIX}/qdbuscpp2xml4' >> $script
+    echo 'export OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export QMAKESPEC=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
 }
-- 
1.7.1.1



