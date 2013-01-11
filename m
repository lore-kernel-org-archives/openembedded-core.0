Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TtfLV-0006JF-Rj
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 15:12:36 +0100
Received: from mail416.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id D9746DC5D25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 15:00:23 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Jan 2013 15:51:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 Jan 2013 15:50:57 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Fri, 11 Jan 2013 14:51:25 +0100
Message-Id: <1357912285-8308-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357912285-8308-1-git-send-email-eric@eukrea.com>
References: <1357912285-8308-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1783706928843107779
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrhedtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrhedtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [PATCH 2/2] add meta-toolchain-qt
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
X-List-Received-Date: Fri, 11 Jan 2013 14:12:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- this allows the creation of a SDK containing all the needed
libraries to develop QT4 for X applications
- the recipes were factorized to share as much code as possible
- binaries generated using the toolchain were run tested on an
ARMv7 target
- both qt & qte toolchains were build tested for qemuarm target
and for an ARMv7 target

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/meta/meta-toolchain-qt.bb          |    5 +++
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |   31 ++++++++++++++=
++++
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |   32 ++------------=
-----
 .../nativesdk-packagegroup-qt-toolchain-host.bb    |    3 ++
 .../nativesdk-packagegroup-qt-toolchain-host.inc   |    6 ++++
 .../nativesdk-packagegroup-qte-toolchain-host.bb   |    5 +--
 .../packagegroup-qt-toolchain-target.bb            |   11 +++++++
 .../packagegroup-qt-toolchain-target.inc           |   33 ++++++++++++++=
++++++
 .../packagegroup-qte-toolchain-target.bb           |   32 ++------------=
-----
 9 files changed, 94 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.bb
 create mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.inc
 create mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-=
qt-toolchain-host.bb
 create mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-=
qt-toolchain-host.inc
 create mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolcha=
in-target.bb
 create mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolcha=
in-target.inc

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.bb b/meta/recipes-qt/=
meta/meta-toolchain-qt.bb
new file mode 100644
index 0000000..a10103a
--- /dev/null
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.bb
@@ -0,0 +1,5 @@
+# Qt toolchain
+QTNAME =3D "qt"
+QT_DIR_NAME =3D "qt4"
+
+require meta-toolchain-qt.inc
diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt=
/meta/meta-toolchain-qt.inc
new file mode 100644
index 0000000..107ba19
--- /dev/null
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -0,0 +1,31 @@
+TOOLCHAIN_HOST_TASK =3D "nativesdk-packagegroup-${QTNAME}-toolchain-host=
 packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_TARGET_TASK =3D "packagegroup-${QTNAME}-toolchain-target"
+TOOLCHAIN_OUTPUTNAME =3D "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSI=
ON}"
+
+require recipes-core/meta/meta-toolchain.bb
+
+QT_TOOLS_PREFIX =3D "${SDKPATHNATIVE}${bindir_nativesdk}"
+
+toolchain_create_sdk_env_script_append() {
+    echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $script
+    echo 'export OE_QMAKE_CC=3D$CC' >> $script
+    echo 'export OE_QMAKE_CXX=3D$CXX' >> $script
+    echo 'export OE_QMAKE_LINK=3D$LD' >> $script
+    echo 'export OE_QMAKE_AR=3D$AR' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=3D${SDKTARGETSYSROOT}/${libdir}' >> =
$script
+    echo 'export OE_QMAKE_INCDIR_QT=3D${SDKTARGETSYSROOT}/${includedir}/=
${QT_DIR_NAME}' >> $script
+    echo 'export OE_QMAKE_MOC=3D${QT_TOOLS_PREFIX}/moc4' >> $script
+    echo 'export OE_QMAKE_UIC=3D${QT_TOOLS_PREFIX}/uic4' >> $script
+    echo 'export OE_QMAKE_UIC3=3D${QT_TOOLS_PREFIX}/uic34' >> $script
+    echo 'export OE_QMAKE_RCC=3D${QT_TOOLS_PREFIX}/rcc4' >> $script
+    echo 'export OE_QMAKE_QDBUSCPP2XML=3D${QT_TOOLS_PREFIX}/qdbuscpp2xml=
4' >> $script
+    echo 'export OE_QMAKE_QDBUSXML2CPP=3D${QT_TOOLS_PREFIX}/qdbusxml2cpp=
4' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=3D${SDKTARGETSYSROOT}/${datadir}/${Q=
T_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export QMAKESPEC=3D${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAM=
E}/mkspecs/linux-g++' >> $script
+
+    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
+    # and QTCreator
+    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/u=
sr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
+}
diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt=
/meta/meta-toolchain-qte.bb
index 7c2ae49..9113f48 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -1,34 +1,6 @@
 # Qt Embedded toolchain
 PR =3D "r6"
-TOOLCHAIN_HOST_TASK =3D "nativesdk-packagegroup-qte-toolchain-host packa=
gegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-TOOLCHAIN_TARGET_TASK =3D "packagegroup-qte-toolchain-target"
-TOOLCHAIN_OUTPUTNAME =3D "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
-
-require recipes-core/meta/meta-toolchain.bb
-
+QTNAME =3D "qte"
 QT_DIR_NAME =3D "qtopia"
-QT_TOOLS_PREFIX =3D "${SDKPATHNATIVE}${bindir_nativesdk}"
-
-toolchain_create_sdk_env_script_append() {
-    echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
-    echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
-    echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $script
-    echo 'export OE_QMAKE_CC=3D$CC' >> $script
-    echo 'export OE_QMAKE_CXX=3D$CXX' >> $script
-    echo 'export OE_QMAKE_LINK=3D$LD' >> $script
-    echo 'export OE_QMAKE_AR=3D$AR' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=3D${SDKTARGETSYSROOT}/${libdir}' >> =
$script
-    echo 'export OE_QMAKE_INCDIR_QT=3D${SDKTARGETSYSROOT}/${includedir}/=
${QT_DIR_NAME}' >> $script
-    echo 'export OE_QMAKE_MOC=3D${QT_TOOLS_PREFIX}/moc4' >> $script
-    echo 'export OE_QMAKE_UIC=3D${QT_TOOLS_PREFIX}/uic4' >> $script
-    echo 'export OE_QMAKE_UIC3=3D${QT_TOOLS_PREFIX}/uic34' >> $script
-    echo 'export OE_QMAKE_RCC=3D${QT_TOOLS_PREFIX}/rcc4' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=3D${QT_TOOLS_PREFIX}/qdbuscpp2xml=
4' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=3D${QT_TOOLS_PREFIX}/qdbusxml2cpp=
4' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=3D${SDKTARGETSYSROOT}/${datadir}/${Q=
T_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=3D${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAM=
E}/mkspecs/linux-g++' >> $script
=20
-    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
-    # and QTCreator
-    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/u=
sr/share/qtopia/mkspecs mkspecs;)
-}
+require meta-toolchain-qt.inc
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-tool=
chain-host.bb b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-t=
oolchain-host.bb
new file mode 100644
index 0000000..994462d
--- /dev/null
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-h=
ost.bb
@@ -0,0 +1,3 @@
+require nativesdk-packagegroup-qt-toolchain-host.inc
+
+DESCRIPTION =3D "Host packages for Qt SDK"
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-tool=
chain-host.inc b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-=
toolchain-host.inc
new file mode 100644
index 0000000..a3c275f
--- /dev/null
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-h=
ost.inc
@@ -0,0 +1,6 @@
+require recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+
+DESCRIPTION =3D "Host packages for Qt Embedded SDK"
+LICENSE =3D "MIT"
+
+RDEPENDS_${PN} +=3D "nativesdk-qt4-tools"
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-too=
lchain-host.bb b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte=
-toolchain-host.bb
index a3c275f..eadecf5 100644
--- a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-=
host.bb
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-=
host.bb
@@ -1,6 +1,3 @@
-require recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+require nativesdk-packagegroup-qt-toolchain-host.inc
=20
 DESCRIPTION =3D "Host packages for Qt Embedded SDK"
-LICENSE =3D "MIT"
-
-RDEPENDS_${PN} +=3D "nativesdk-qt4-tools"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-targ=
et.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
new file mode 100644
index 0000000..738ca82
--- /dev/null
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
@@ -0,0 +1,11 @@
+DESCRIPTION =3D "Target packages for Qt SDK"
+
+QTLIBPREFIX =3D ""
+
+require packagegroup-qt-toolchain-target.inc
+
+RDEPENDS_${PN} +=3D " \
+        qt4-x11-free-dev \
+        ${@base_contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev'=
, '', d)} \
+        ${@base_contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-dev'=
, '', d)} \
+        "
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-targ=
et.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.i=
nc
new file mode 100644
index 0000000..8413eec
--- /dev/null
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -0,0 +1,33 @@
+LICENSE =3D "MIT"
+
+inherit packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
+
+RDEPENDS_${PN} +=3D " \
+        packagegroup-core-standalone-sdk-target \
+        qt4${QTLIBPREFIX}-mkspecs \
+        libqt${QTLIBPREFIX}multimedia4-dev \
+        libqt${QTLIBPREFIX}phonon4-dev \
+        libqt${QTLIBPREFIX}3support4-dev \
+        libqt${QTLIBPREFIX}clucene4-dev \
+        libqt${QTLIBPREFIX}core4-dev \
+        libqt${QTLIBPREFIX}dbus4-dev \
+        libqt${QTLIBPREFIX}designercomponents4-dev \
+        libqt${QTLIBPREFIX}designer4-dev \
+        libqt${QTLIBPREFIX}uitools4-dev \
+        libqt${QTLIBPREFIX}gui4-dev \
+        libqt${QTLIBPREFIX}help4-dev \
+        libqt${QTLIBPREFIX}network4-dev \
+        libqt${QTLIBPREFIX}script4-dev \
+        libqt${QTLIBPREFIX}scripttools4-dev \
+        libqt${QTLIBPREFIX}sql4-dev \
+        libqt${QTLIBPREFIX}svg4-dev \
+        libqt${QTLIBPREFIX}test4-dev \
+        libqt${QTLIBPREFIX}webkit4-dev \
+        libqt${QTLIBPREFIX}xml4-dev \
+        libqt${QTLIBPREFIX}declarative4-dev \
+        libqt${QTLIBPREFIX}xmlpatterns4-dev \
+        libsqlite3-dev \
+        expat-dev \
+        "
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-tar=
get.bb b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.=
bb
index 7b65bcc..9c3b22c 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
@@ -1,35 +1,7 @@
 DESCRIPTION =3D "Target packages for Qt Embedded SDK"
-LICENSE =3D "MIT"
=20
 PR =3D "r5"
=20
-inherit packagegroup
-
-PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
-
-RDEPENDS_${PN} +=3D " \
-        packagegroup-core-standalone-sdk-target \
-        qt4-embedded-mkspecs \
-        libqt-embeddedmultimedia4-dev \
-        libqt-embeddedphonon4-dev \
-        libqt-embedded3support4-dev \
-        libqt-embeddedclucene4-dev \
-        libqt-embeddedcore4-dev \
-        libqt-embeddeddbus4-dev \
-        libqt-embeddeddesignercomponents4-dev \
-        libqt-embeddeddesigner4-dev \
-        libqt-embeddeduitools4-dev \
-        libqt-embeddedgui4-dev \
-        libqt-embeddedhelp4-dev \
-        libqt-embeddednetwork4-dev \
-        libqt-embeddedscript4-dev \
-        libqt-embeddedscripttools4-dev \
-        libqt-embeddedsql4-dev \
-        libqt-embeddedsvg4-dev \
-        libqt-embeddedtest4-dev \
-        libqt-embeddedwebkit4-dev \
-        libqt-embeddedxml4-dev \
-        libsqlite3-dev \
-        expat-dev \
-        "
+QTLIBPREFIX =3D "-embedded"
=20
+require packagegroup-qt-toolchain-target.inc
--=20
1.7.10.4



