Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R9g6x-00060s-CU
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2011 09:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57738499"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 09:33:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:33:13 +0100
Message-Id: <82b6b2fc8f8eff980628fbcd104bd821051274df.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] qt4: fix generated sdk
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric Bénard <eric@eukrea.com>

- qt4-tools-nativesdk : actually the qmake binary which gets installed
comes from the native recipe. This patch fix this problem by laucnhing
configure twice : once to compile qmake using the right toolchain for
nativesdk, and a second time using the native qmake to compile all the
other tools for the nativesdk. Then we install the right qmake.

- mkspec : the link actually created in qt4-tools-nativesdk's
do_install point to nowhere so remove it and generate the link in
meta-toolchain-qte as it's the only place where we have all the variable
to create it.

- toolchain_create_sdk_env_script_append : we need to add OE_QMAKE_CFLAGS,
OE_QMAKE_CXXFLAGS and OE_QMAKE_LDFLAGS else the sdk won't find these
variables that are inserted by qmake in the Makefiles.

- with this patch, oe-core generates a working meta-toolchain-qte which
can compile a small example and is properly recognized by qtcreator (this
brings oe-core's meta-toolchain-qte to oe-dev's functional state).

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-qt/meta/meta-toolchain-qte.bb  |    7 +++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   22 +++++++++++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index 72d58db..735ccd1 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -10,6 +10,9 @@ QT_DIR_NAME = "qtopia"
 QT_TOOLS_PREFIX = "${SDKPATHNATIVE}${bindir_nativesdk}"
 
 toolchain_create_sdk_env_script_append() {
+    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
     echo 'export OE_QMAKE_CC=${TARGET_PREFIX}gcc' >> $script
     echo 'export OE_QMAKE_CXX=${TARGET_PREFIX}g++' >> $script
     echo 'export OE_QMAKE_LINK=${TARGET_PREFIX}g++' >> $script
@@ -24,4 +27,8 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
     echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+
+    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
+    # and QTCreator
+    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/usr/share/qtopia/mkspecs mkspecs;)
 }
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 6c396a5..097fadc 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -51,10 +51,6 @@ EXTRA_OECONF = "-prefix ${prefix} \
 EXTRA_OEMAKE = " "
 
 do_configure() {
-    if [ ! -e bin/qmake ]; then
-        ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
-    fi
-
     if [ ! -e mkspecs/${TARGET_OS}-oe-g++ ]; then
         ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
     fi
@@ -62,7 +58,16 @@ do_configure() {
     cp ../g++.conf mkspecs/common
     cp ../linux.conf mkspecs/common
 
-    (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    # first launch configure to get qmake compiled for the nativesdk
+    (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || true
+
+    # then backup the binary and start again with a qmake which can run on the build host
+    mv bin/qmake bin/qmake_nativesdk
+    if [ ! -e bin/qmake ]; then
+        ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
+    fi
+
+    (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
 TOBUILD = "\
@@ -91,7 +96,7 @@ do_compile() {
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 bin/qmake ${D}${bindir}/qmake2
+    install -m 0755 bin/qmake_nativesdk ${D}${bindir}/qmake2
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
         install -m 0755 bin/${i} ${D}${bindir}/${i}4
     done
@@ -101,9 +106,4 @@ do_install() {
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do \
         ln -s ${i}4 ${i}; \
     done)
-
-    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
-    # and QTCreator
-    (cd ${D}${bindir}/..; ln -s ${TARGET_SYS}/usr/share/qtopia/mkspecs mkspecs;)
 }
-
-- 
1.7.4.1



