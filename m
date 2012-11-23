Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TbtMk-0006vY-VX
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 14:32:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Nov 2012 05:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,307,1352102400"; d="scan'208";a="223459000"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2012 05:18:13 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 15:18:11 +0200
Message-Id: <1353676691-27305-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] meta-toolchain-qte: add --sysroot option to OE_QMAKE_(CC|CXX|LD)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 13:32:23 -0000

When building a QT application using OE_QMAKE_CC/OE_QMAKE_CXX, the
--sysroot was not included and the compilation would fail. The user had
to add the option manually which was not very user friendly. This
happened only when installing the SDK in another location than the
default one. Since CC/CXX/LD had this option already included, reuse them.

[YOCTO #3409]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-qt/meta/meta-toolchain-qte.bb |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index 20dd354..7c2ae49 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -1,5 +1,5 @@
 # Qt Embedded toolchain
-PR = "r5"
+PR = "r6"
 TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-qte-toolchain-host packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK = "packagegroup-qte-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
@@ -13,10 +13,10 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
     echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
     echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-    echo 'export OE_QMAKE_CC=${TARGET_PREFIX}gcc' >> $script
-    echo 'export OE_QMAKE_CXX=${TARGET_PREFIX}g++' >> $script
-    echo 'export OE_QMAKE_LINK=${TARGET_PREFIX}g++' >> $script
-    echo 'export OE_QMAKE_AR=${TARGET_PREFIX}ar' >> $script
+    echo 'export OE_QMAKE_CC=$CC' >> $script
+    echo 'export OE_QMAKE_CXX=$CXX' >> $script
+    echo 'export OE_QMAKE_LINK=$LD' >> $script
+    echo 'export OE_QMAKE_AR=$AR' >> $script
     echo 'export OE_QMAKE_LIBDIR_QT=${SDKTARGETSYSROOT}/${libdir}' >> $script
     echo 'export OE_QMAKE_INCDIR_QT=${SDKTARGETSYSROOT}/${includedir}/${QT_DIR_NAME}' >> $script
     echo 'export OE_QMAKE_MOC=${QT_TOOLS_PREFIX}/moc4' >> $script
-- 
1.7.9.5



