Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R2Jt6-0000NL-RP
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 11:30:13 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 70925A6264;
	Sat, 10 Sep 2011 11:25:05 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Sep 2011 11:25:01 +0200
Message-Id: <1315646701-28916-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Subject: [PATCH] qt4: fix generated sdk
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
X-List-Received-Date: Sat, 10 Sep 2011 09:30:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- qt4-tools-nativesdk : actually the qmkae binary which gets installed
comes from the native recipe. This patch fix this problem by laucnhing
configure twice : once to compile qmake using the right toolchain for
nativesdk, and a second time using the native qmake to compile all the
other tools for the nativesdk. Then we install the right qmake.

- mkspec : the link actually created in qt4-tools-nativesdk's
do_install point to nowhere so remove it and generate the link in
meta-toolchain-qte as it's the only place where we have all the variable
to create it.

- toolchain_create_sdk_env_script_append : we need to add OE_QMAKE_CFLAGS=
,
OE_QMAKE_CXXFLAGS and OE_QMAKE_LDFLAGS else the sdk won't find these
variables that are inserted by qmake in the Makefiles.

- with this patch, oe-core generates a working meta-toolchain-qte which
can compile a small example and is properly recognized by qtcreator (this
brings oe-core's meta-toolchain-qte to oe-dev's functional state).

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/meta/meta-toolchain-qte.bb  |    7 +++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   22 +++++++++++----------=
-
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt=
/meta/meta-toolchain-qte.bb
index 72d58db..735ccd1 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -10,6 +10,9 @@ QT_DIR_NAME =3D "qtopia"
 QT_TOOLS_PREFIX =3D "${SDKPATHNATIVE}${bindir_nativesdk}"
=20
 toolchain_create_sdk_env_script_append() {
+    echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $script
     echo 'export OE_QMAKE_CC=3D${TARGET_PREFIX}gcc' >> $script
     echo 'export OE_QMAKE_CXX=3D${TARGET_PREFIX}g++' >> $script
     echo 'export OE_QMAKE_LINK=3D${TARGET_PREFIX}g++' >> $script
@@ -24,4 +27,8 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_QDBUSXML2CPP=3D${QT_TOOLS_PREFIX}/qdbusxml2cpp=
4' >> $script
     echo 'export OE_QMAKE_QT_CONFIG=3D${SDKTARGETSYSROOT}/${datadir}/${Q=
T_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=3D${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAM=
E}/mkspecs/linux-g++' >> $script
+
+    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
+    # and QTCreator
+    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/u=
sr/share/qtopia/mkspecs mkspecs;)
 }
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-q=
t/qt4/qt4-tools-nativesdk.inc
index 068528e..0ae0af6 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -51,10 +51,6 @@ EXTRA_OECONF =3D "-prefix ${prefix} \
 EXTRA_OEMAKE =3D " "
=20
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
=20
-    (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring=
 qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    # first launch configure to get qmake compiled for the nativesdk
+    (echo o; echo yes) | CC=3D"${CC}" CXX=3D"${CXX}" ./configure ${EXTRA=
_OECONF} || true
+
+    # then backup the binary and start again with a qmake which can run =
on the build host
+    mv bin/qmake bin/qmake_nativesdk
+    if [ ! -e bin/qmake ]; then
+        ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
+    fi
+
+    (echo o; echo yes) | CC=3D"${CC}" CXX=3D"${CXX}" ./configure ${EXTRA=
_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
=20
 TOBUILD =3D "\
@@ -91,7 +96,7 @@ do_compile() {
=20
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 bin/qmake ${D}${bindir}/qmake2
+    install -m 0755 bin/qmake_nativesdk ${D}${bindir}/qmake2
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp=
; do
         install -m 0755 bin/${i} ${D}${bindir}/${i}4
     done
@@ -101,9 +106,4 @@ do_install() {
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp=
; do \
         ln -s ${i}4 ${i}; \
     done)
-
-    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
-    # and QTCreator
-    (cd ${D}${bindir}/..; ln -s ${TARGET_SYS}/usr/share/qtopia/mkspecs m=
kspecs;)
 }
-
--=20
1.7.6



