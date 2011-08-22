Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QvSpu-0003Kt-4a
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 13:38:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7MBXnC1021408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2011 04:33:49 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 22 Aug 2011 04:33:48 -0700
Message-ID: <1b28a73fd25e40a29659583ee1432f7f3c720b68.1314010928.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1314010928.git.xiaofeng.yan@windriver.com>
References: <cover.1314010928.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 22 Aug 2011 18:59:05 +0800
Date: Mon, 22 Aug 2011 19:34:11 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7MBXnC1021408
Subject: [PATCH 1/1] qt4-x11-demo-image: Fix bug 999
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
X-List-Received-Date: Mon, 22 Aug 2011 11:38:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #999]
Add qt4-x11-demo-image for fixing bug 999

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/palmtop.bbclass                     |   26 ++
 meta/classes/sdk.bbclass                         |   74 ++++
 meta/recipes-qt/images/micro-base-image.bb       |   19 +
 meta/recipes-qt/images/qt4-x11-base-image.bb     |   35 ++
 meta/recipes-qt/images/qt4-x11-demo-image.bb     |   12 +
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   55 +++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |   20 +
 meta/recipes-qt/qwt/files/qt2-fix.patch          |  408 ++++++++++++++++=
++++++
 meta/recipes-qt/qwt/qwt.inc                      |   33 ++
 meta/recipes-qt/qwt/qwt_5.2.1.bb                 |   13 +
 meta/recipes-qt/tasks/task-qt4-x11.bb            |   52 +++
 meta/recipes-qt/tasks/task-sdk-host.bb           |   21 ++
 12 files changed, 768 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/palmtop.bbclass
 create mode 100644 meta/classes/sdk.bbclass
 create mode 100644 meta/recipes-qt/images/micro-base-image.bb
 create mode 100644 meta/recipes-qt/images/qt4-x11-base-image.bb
 create mode 100644 meta/recipes-qt/images/qt4-x11-demo-image.bb
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
 create mode 100644 meta/recipes-qt/qwt/files/qt2-fix.patch
 create mode 100644 meta/recipes-qt/qwt/qwt.inc
 create mode 100644 meta/recipes-qt/qwt/qwt_5.2.1.bb
 create mode 100644 meta/recipes-qt/tasks/task-qt4-x11.bb
 create mode 100644 meta/recipes-qt/tasks/task-sdk-host.bb

diff --git a/meta/classes/palmtop.bbclass b/meta/classes/palmtop.bbclass
new file mode 100644
index 0000000..8cbbf80
--- /dev/null
+++ b/meta/classes/palmtop.bbclass
@@ -0,0 +1,26 @@
+# this build class sets up qmake variables to
+#   * build using the Qt Windowing System (QWS)
+#   * use qt
+#   * link against supc++ instead of stdc++ =20
+#   * use threads, if requested via PALMTOP_USE_MULTITHREADED_QT =3D "ye=
s"
+# inherit this class to build programs against libqpe
+# inherit opie if you want to build programs against libopie2
+# don't override EXTRA_QMAKEVARS_POST, if you use inherit this class
+
+inherit qmake2
+
+# special case for DISTRO =3D sharprom
+CPP_SUPPORT_LIB =3D "LIBS-=3D-lstdc++ LIBS+=3D-lsupc++"
+CPP_SUPPORT_LIB_sharprom-compatible =3D "LIBS+=3D-lstdc++"
+EXTRA_QMAKEVARS_POST +=3D "DEFINES+=3DQWS CONFIG+=3Dqt ${CPP_SUPPORT_LIB=
}"
+EXTRA_QMAKEVARS_POST +=3D '${@base_conditional("PALMTOP_USE_MULTITHREADE=
D_QT", "yes", "CONFIG+=3Dthread", "CONFIG-=3Dthread",d)}'
+EXTRA_QMAKEVARS_POST +=3D "${@["LIBS+=3D-lqpe ", ""][(bb.data.getVar('PN=
', d, 1) =3D=3D 'libqpe-opie')]}"
+DEPENDS_prepend =3D "${@["virtual/libqpe1 uicmoc-native ", ""][(bb.data.=
getVar('PN', d, 1) =3D=3D 'libqpe-opie')]}"
+QT_LIBRARY =3D '${@base_conditional("PALMTOP_USE_MULTITHREADED_QT", "yes=
", "qte-mt", "qte", d)}'
+EXTRA_QMAKEVARS_POST +=3D " DEFINES+=3DOPIE_BINDIR=3D'\"${bindir}\"' DEF=
INES+=3DOPIE_LIBDIR=3D'\"${libdir}/opie/lib\"' DEFINES+=3DOPIE_QTDIR=3D'\=
"${libdir}/opie\"' "
+
+PACKAGES =3D "${PN}-dbg ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
+FILES_${PN} +=3D " ${palmtopdir} "
+FILES_${PN}-dbg +=3D " ${palmtopdir}/lib/.debug \
+                     ${palmtopdir}/bin/.debug \
+                     ${palmtopdir}/plugins/*/.debug "
diff --git a/meta/classes/sdk.bbclass b/meta/classes/sdk.bbclass
new file mode 100644
index 0000000..8d5b3dc
--- /dev/null
+++ b/meta/classes/sdk.bbclass
@@ -0,0 +1,74 @@
+#
+# Note this class is deprecated and replaced by nativesdk.bbclass
+#
+
+
+# SDK packages are built either explicitly by the user,
+# or indirectly via dependency.  No need to be in 'world'.
+EXCLUDE_FROM_WORLD =3D "1"
+target_includedir :=3D "${includedir}"
+target_libdir :=3D "${libdir}"
+
+# Save MULTIMACH_ARCH
+OLD_MULTIMACH_ARCH :=3D "${MULTIMACH_ARCH}"
+# Save PACKAGE_ARCH
+OLD_PACKAGE_ARCH :=3D ${PACKAGE_ARCH}
+PACKAGE_ARCH =3D "${BUILD_ARCH}-${OLD_PACKAGE_ARCH}-sdk"
+# Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
+OLD_BASE_PACKAGE_ARCH :=3D "${BASE_PACKAGE_ARCH}"
+BASE_PACKAGE_ARCH =3D "${OLD_BASE_PACKAGE_ARCH}"
+
+STAGING_DIR_HOST =3D "${STAGING_DIR}/${HOST_SYS}-sdk"
+STAGING_DIR_TARGET =3D "${STAGING_DIR}/${OLD_MULTIMACH_ARCH}${TARGET_VEN=
DOR}-${TARGET_OS}"
+
+HOST_ARCH =3D "${BUILD_ARCH}"
+HOST_VENDOR =3D "${BUILD_VENDOR}"
+HOST_OS =3D "${BUILD_OS}"
+HOST_PREFIX =3D "${BUILD_PREFIX}"
+HOST_CC_ARCH =3D "${BUILD_CC_ARCH}"
+#HOST_SYS =3D "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
+HOST_EXEEXT =3D "${BUILD_EXEEXT}"
+
+CPPFLAGS =3D "${BUILD_CPPFLAGS}"
+CFLAGS =3D "${BUILD_CFLAGS}"
+CXXFLAGS =3D "${BUILD_CFLAGS}"
+LDFLAGS =3D "${BUILD_LDFLAGS}"
+
+TOOLCHAIN_OPTIONS =3D ""
+
+# Path prefixes
+prefix =3D "${SDK_PATH}"
+exec_prefix =3D "${prefix}"
+base_prefix =3D "${prefix}"
+
+# Base paths
+export base_bindir =3D "${prefix}/bin"
+export base_sbindir =3D "${prefix}/bin"
+export base_libdir =3D "${prefix}/lib"
+
+# Architecture independent paths
+export datadir =3D "${prefix}/share"
+export sysconfdir =3D "${prefix}/etc"
+export sharedstatedir =3D "${datadir}/com"
+export localstatedir =3D "${prefix}/var"
+export infodir =3D "${datadir}/info"
+export mandir =3D "${datadir}/man"
+export docdir =3D "${datadir}/doc"
+export servicedir =3D "${prefix}/srv"
+
+# Architecture dependent paths
+export bindir =3D "${prefix}/bin"
+export sbindir =3D "${prefix}/bin"
+export libexecdir =3D "${prefix}/libexec"
+export libdir =3D "${prefix}/lib"
+export includedir =3D "${prefix}/include"
+export oldincludedir =3D "${prefix}/include"
+
+FILES_${PN} =3D "${prefix}"
+FILES_${PN}-dbg +=3D "${prefix}/.debug \
+                    ${prefix}/bin/.debug \
+                   "
+
+export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
+
+OVERRIDES =3D. "virtclass-sdk:"
diff --git a/meta/recipes-qt/images/micro-base-image.bb b/meta/recipes-qt=
/images/micro-base-image.bb
new file mode 100644
index 0000000..a960d30
--- /dev/null
+++ b/meta/recipes-qt/images/micro-base-image.bb
@@ -0,0 +1,19 @@
+# micro-base-image
+#
+# Image configuration for the OE Micro Linux Distribuion (micro, micro-u=
clibc)
+#
+
+# Install basic files only
+IMAGE_INSTALL =3D "base-files base-passwd dropbear netbase"
+IMAGE_LINGUAS =3D ""
+
+# Use busybox as login manager
+IMAGE_LOGIN_MANAGER =3D "busybox"
+
+# Include minimum init and init scripts
+IMAGE_DEV_MANAGER =3D "busybox-mdev"
+IMAGE_INIT_MANAGER =3D "sysvinit sysvinit-pidof"
+IMAGE_INITSCRIPTS =3D ""
+
+inherit image
+
diff --git a/meta/recipes-qt/images/qt4-x11-base-image.bb b/meta/recipes-=
qt/images/qt4-x11-base-image.bb
new file mode 100644
index 0000000..8f290c7
--- /dev/null
+++ b/meta/recipes-qt/images/qt4-x11-base-image.bb
@@ -0,0 +1,35 @@
+require micro-base-image.bb
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+
+TOUCH =3D ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib t=
slib-calibrate tslib-tests", "",d)}'
+
+XSERVER ?=3D "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-tslib \
+           xf86-video-fbdev "
+
+DEPENDS +=3D "task-qt4-x11"
+
+RDEPENDS_${PN} +=3D " \
+        task-qt4-x11-base \
+	task-qt4-x11-qwt \
+        "
+
+IMAGE_INSTALL +=3D "\
+	initscripts \
+	kernel-modules \
+	gdbserver \
+	strace \
+	module-init-tools \
+	task-qt4-x11-base \
+	task-qt4-x11-qwt \
+	${TOUCH} \
+	pointercal \
+	${XSERVER} \
+	xauth xhost xset xrandr \
+"
+
+
+#	ttf-liberation-sans ttf-liberation-serif ttf-liberation-mono \
diff --git a/meta/recipes-qt/images/qt4-x11-demo-image.bb b/meta/recipes-=
qt/images/qt4-x11-demo-image.bb
new file mode 100644
index 0000000..771e62b
--- /dev/null
+++ b/meta/recipes-qt/images/qt4-x11-demo-image.bb
@@ -0,0 +1,12 @@
+require qt4-x11-base-image.bb
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+
+IMAGE_INSTALL +=3D "\
+        qt4-demos qt4-examples qt-demo-init \
+        qt4-assistant \
+        qwt-examples \
+"
+
+
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init b/meta/reci=
pes-qt/qt-demo/qt-demo-init/qtdemo-init
new file mode 100644
index 0000000..affb958
--- /dev/null
+++ b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+set -e
+
+if [ -f /usr/bin/qtdemo ]; then
+	QTDEMO=3D"qtdemo > /var/log/Xsession.log 2> &1"
+else
+	QTDEMO=3D"qtdemoE -qws"
+fi
+
+case "$1" in
+  start)
+	echo "Starting qtdemo"
+	if [ -f /etc/profile.d/tslib.sh ]; then
+		source /etc/profile.d/tslib.sh
+	fi
+	if [ -e $TSLIB_TSDEVICE ]; then
+		if [ ! -f /etc/pointercal ]; then
+			/usr/bin/ts_calibrate
+		fi
+		if [ $QTDEMO =3D=3D qtdemo ]; then
+			Xorg &
+			export DISPLAY=3D:0
+			$QTDEMO &
+		else
+			QWS_MOUSE_PROTO=3Dtslib:$TSLIB_TSDEVICE $QTDEMO &
+		fi
+	else
+		if [ $QTDEMO =3D=3D qtdemo ]; then
+			Xorg &
+			export DISPLAY=3D:0
+		fi
+		$QTDEMO &
+	fi
+	;;
+  stop)
+	echo "Stopping qtdemo"
+	if [ $QTDEMO =3D=3D qtdemo ]; then
+		killall Xorg
+		killall qtdemo
+	else
+		killall qtdemoE
+	fi
+	;;
+  restart)
+	$0 stop
+	$0 start
+	;;
+  *)
+	echo "usage: $0 { start | stop | restart }" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-q=
t/qt-demo/qt-demo-init_0.1.bb
new file mode 100644
index 0000000..3b1a92c
--- /dev/null
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Init script for qtdemo"
+LICENSE =3D "MIT"
+SRC_URI =3D "file://qtdemo-init"
+PR =3D "r2"
+
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+
+PACKAGE_ARCH =3D "all"
+
+do_install() {
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
+}
+
+inherit update-rc.d
+
+INITSCRIPT_NAME =3D "qtdemo"
+INITSCRIPT_PARAMS =3D "start 99 5 2 . stop 19 0 1 6 ."
diff --git a/meta/recipes-qt/qwt/files/qt2-fix.patch b/meta/recipes-qt/qw=
t/files/qt2-fix.patch
new file mode 100644
index 0000000..821846a
--- /dev/null
+++ b/meta/recipes-qt/qwt/files/qt2-fix.patch
@@ -0,0 +1,408 @@
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- qwt-4.2.0rc1/include/qwt_global.h~qt2-fix
++++ qwt-4.2.0rc1/include/qwt_global.h
+@@ -58,7 +58,7 @@
+ #define QWT_EXPORT
+ #endif
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+ // Use old QArray instead of QMemArray
+ #define QWT_NO_MEMARRAY=20
+ #endif
+@@ -68,7 +68,7 @@
+ #undef QWT_NO_STL
+ // #define QWT_NO_STL // disable Standard Template Library based classe=
s
+ #if defined(_MSC_VER)
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+ // tmake does not produce the missing -GX flag for exception handling
+ #define QWT_NO_STL
+ #else
+--- qwt-4.2.0rc1/include/qwt_picker.h~qt2-fix
++++ qwt-4.2.0rc1/include/qwt_picker.h
+@@ -89,7 +89,7 @@
+     Q_PROPERTY(ResizeMode resizeMode READ resizeMode WRITE setResizeMod=
e)
+     Q_PROPERTY(bool isEnabled READ isEnabled WRITE setEnabled)
+=20
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     // Unfortunately moc is not aware of #ifdefs. To enable the QPen
+     // attributes as properties uncomment the following lines.
+=20
+--- qwt-4.2.0rc1/src/qwt_text.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_text.cpp
+@@ -337,7 +337,7 @@
+ //! Set the font
+ void QwtRichText::setFont(const QFont &font)
+ {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     d_doc->setDefaultFont(font);
+ #endif
+     QwtText::setFont(font);
+@@ -359,7 +359,7 @@
+ */
+ int QwtRichText::heightForWidth(int width) const
+ {
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     const QFont defaultFont =3D QFont::defaultFont();
+     QFont::setDefaultFont(font());
+ #endif
+@@ -367,7 +367,7 @@
+     const QwtLayoutMetrics metrics(QwtPainter::metricsMap());
+     const int height =3D metrics.heightForWidth(*d_doc, width);
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     QFont::setDefaultFont(defaultFont);
+ #endif
+=20
+@@ -390,7 +390,7 @@
+     painter->save();
+=20
+     painter->setPen(color());
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     const QFont defaultFont =3D QFont::defaultFont();
+     QFont::setDefaultFont(font());
+ #else
+@@ -399,7 +399,7 @@
+=20
+     QwtPainter::drawSimpleRichText(painter, rect, alignment(), *d_doc);
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     QFont::setDefaultFont(defaultFont);
+ #endif
+     painter->restore();
+@@ -407,7 +407,7 @@
+=20
+ QRect QwtRichText::boundingRect(QPainter *painter) const
+ {
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     const QFont defaultFont =3D QFont::defaultFont();
+     QFont::setDefaultFont(font());
+ #endif
+@@ -415,7 +415,7 @@
+     const QwtLayoutMetrics metrics(QwtPainter::metricsMap());
+     const QRect rect =3D metrics.boundingRect(*d_doc, alignment(), pain=
ter);
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     QFont::setDefaultFont(defaultFont);
+ #endif
+=20
+@@ -428,7 +428,7 @@
+     QString rich =3D text;
+=20
+     // By default QwtSimpleRichText is Qt::AlignLeft
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     if (align & Qt::AlignJustify)=20
+     {
+         rich.prepend("<div align=3D\"justify\">");
+--- qwt-4.2.0rc1/src/qwt_push_button.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_push_button.cpp
+@@ -88,7 +88,7 @@
+                 !(d_button->alignment() & Qt::AlignCenter))
+             {
+                 const QRect contentsRect =3D
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+                     d_button->style().subRect(=20
+                         QStyle::SR_PushButtonContents, d_button);
+ #else
+@@ -103,7 +103,7 @@
+                 // Many styles move the label right/down
+                 // when the button is down.
+=20
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+                 const QRect &r =3D *((QRect *)param[0].rect);
+ #else
+                 const QRect r(*param[0].point, param[1].pixmap->size())=
;
+@@ -133,7 +133,7 @@
+                 d_inFilter =3D TRUE;
+=20
+                 d_button->style().drawItem(painter,=20
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+                     pixRect,
+ #else
+                     pixRect.x(), pixRect.y(),=20
+@@ -150,7 +150,7 @@
+                 // We save the position of the icon. We need it later
+                 // to align the label pixmap. Hope that there are no st=
yles
+                 // that paint the pixmap before the icon.
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+                 d_iconRect =3D QRect(*param[0].point, param[1].pixmap->=
size());
+ #else
+                 d_iconRect =3D *param[0].rect;
+@@ -427,7 +427,7 @@
+=20
+     QPainter picPainter(&paintFilter);
+=20
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     // When painting to QPicture the dotted line of the focus rect is
+     // set to solid. ( 06.08.2003 )
+     // So we don=B4t set the Style_HasFocus flag and paint the focus re=
ct
+@@ -459,7 +459,7 @@
+=20
+     paintFilter.play(painter);=20
+=20
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     if (hasFocus())
+     {
+         // Paint the focus rect on top of the button label.
+--- qwt-4.2.0rc1/src/qwt_layout_metrics.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_layout_metrics.cpp
+@@ -212,7 +212,7 @@
+ QRect QwtMetricsMap::translate(
+     const QWMatrix &m, const QRect &rect)=20
+ {
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     return m.map(rect.normalize());
+ #else
+     return m.mapRect(rect);
+@@ -227,7 +227,7 @@
+ QPointArray QwtMetricsMap::translate(
+     const QWMatrix &m, const QPointArray &pa)=20
+ {
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     return m.map(pa);
+ #else
+     return m * pa;
+--- qwt-4.2.0rc1/src/qwt_slider.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_slider.cpp
+@@ -353,7 +353,7 @@
+     {
+         const QRect rect =3D d_sliderRect;
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+         style().drawFocusRect(painter, rect, colorGroup());
+ #else
+         style().drawPrimitive(QStyle::PE_FocusRect, painter,
+--- qwt-4.2.0rc1/src/qwt_counter.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_counter.cpp
+@@ -330,7 +330,7 @@
+     // QLineEdit::minimumSizeHint is for one char. Subtracting
+     // the size for the char we get all the margins, frames ...
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     w +=3D d_valueEdit->minimumSizeHint().width() - fm.maxWidth();
+ #else
+     w +=3D 2 * d_valueEdit->frameWidth() +=20
+--- qwt-4.2.0rc1/src/qwt_paint
++++ /dev/null
+--- qwt-4.2.0rc1/src/qwt_painter.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_painter.cpp
+@@ -201,7 +201,7 @@
+     QColorGroup cg;
+     cg.setColor(QColorGroup::Text, painter->pen().color());
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     const QFont defaultFont =3D QFont::defaultFont();
+     QFont::setDefaultFont(painter->font());
+ #endif
+@@ -220,7 +220,7 @@
+=20
+     text.draw(painter, scaledRect.x(), y, scaledRect, cg);
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     QFont::setDefaultFont(defaultFont);
+ #endif
+ }
+--- qwt-4.2.0rc1/src/qwt_dial.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_dial.cpp
+@@ -491,7 +491,7 @@
+         // because round objects doesn=B4t cover all pixels.
+=20
+         QRect br =3D boundingRect();
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+ #ifdef _WS_WIN32_
+         // Qt-230-NC draws ellipses not as nicely as Qt-2.3.x on X Wind=
ows
+         br.setTop(br.top()-1);
+@@ -1044,7 +1044,7 @@
+ {
+     if ( isReadOnly() )
+     {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->ignore();
+ #endif
+         return;
+@@ -1078,7 +1078,7 @@
+             setValue(maxValue());
+             break;
+         default:;
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+             e->ignore();
+ #endif
+     }
+--- qwt-4.2.0rc1/src/qwt_knob.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_knob.cpp
+@@ -279,7 +279,7 @@
+     {
+         QRect r =3D rect();
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+         style().drawFocusRect(painter, r, colorGroup());
+ #else
+         style().drawPrimitive(QStyle::PE_FocusRect, painter,
+--- qwt-4.2.0rc1/src/qwt_arrbtn.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_arrbtn.cpp
+@@ -58,7 +58,7 @@
+ QRect QwtArrowButton::labelRect() const
+ {
+     QRect r =3D
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+         style().buttonRect(rect().x(), rect().y(),
+         rect().width(), rect().height());
+ #else
+@@ -71,7 +71,7 @@
+     if ( isDown() )
+     {
+         int ph, pv;
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+         style().getButtonShift(ph, pv);
+ #else
+         ph =3D style().pixelMetric(
+@@ -135,7 +135,7 @@
+     }
+     p->restore();
+=20
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     if ( hasFocus() )
+     {
+         const QRect focusRect =3D =20
+@@ -218,7 +218,7 @@
+     if ( d_arrowType =3D=3D Qt::UpArrow || d_arrowType =3D=3D Qt::DownA=
rrow )
+         sz.transpose();
+=20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+     int bm =3D style().buttonMargin() - 1;
+     sz +=3D QSize(2 * bm, 2 * bm);
+ #else
+--- qwt-4.2.0rc1/src/qwt_wheel.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_wheel.cpp
+@@ -453,7 +453,7 @@
+     {
+         QRect r =3D rect();
+    =20
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+         style().drawFocusRect(painter, r, colorGroup());
+ #else
+         style().drawPrimitive(QStyle::PE_FocusRect, painter,
+--- qwt-4.2.0rc1/src/qwt_plot_canvas.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_plot_canvas.cpp
+@@ -195,7 +195,7 @@
+=20
+ void QwtPlotCanvas::drawFocusIndicator(QPainter *painter, const QRect &=
rect)
+ {
+-#if QT_VERSION < 300
++#if QT_VERSION < 0x030000
+         style().drawFocusRect(painter, rect, colorGroup());
+ #else
+         style().drawPrimitive(QStyle::PE_FocusRect, painter,
+--- qwt-4.2.0rc1/src/qwt_sldbase.cpp~qt2-fix
++++ qwt-4.2.0rc1/src/qwt_sldbase.cpp
+@@ -115,7 +115,7 @@
+ {
+     if ( isReadOnly() )
+     {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->ignore();
+ #endif
+         return;
+@@ -166,7 +166,7 @@
+ {
+     if ( isReadOnly() )
+     {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->ignore();
+ #endif
+         return;
+@@ -274,7 +274,7 @@
+ {
+     if ( isReadOnly() )
+     {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->ignore();
+ #endif
+         return;
+@@ -304,7 +304,7 @@
+ {
+     if ( isReadOnly() )
+     {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->ignore();
+ #endif
+         return;
+@@ -341,7 +341,7 @@
+ {
+     if ( isReadOnly() )
+     {
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->ignore();
+ #endif
+         return;
+@@ -370,7 +370,7 @@
+                 increment =3D 1;
+             break;
+         default:;
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+             e->ignore();
+ #endif
+     }
+--- qwt-4.2.0rc1/examples/realtime_plot/scrollbar.cpp~qt2-fix
++++ qwt-4.2.0rc1/examples/realtime_plot/scrollbar.cpp
+@@ -154,7 +154,7 @@
+ int ScrollBar::extent() const
+ {
+     int dim;
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+     dim =3D style().pixelMetric(QStyle::PM_ScrollBarExtent, this);
+ #else
+     const QSize sz =3D style().scrollBarExtent();
+--- qwt-4.2.0rc1/examples/event_filter/colorbar.cpp~qt2-fix
++++ qwt-4.2.0rc1/examples/event_filter/colorbar.cpp
+@@ -48,7 +48,7 @@
+         const QRgb rgb =3D pm.convertToImage().pixel(e->x(), e->y());
+    =20
+         emit selected(QColor(rgb));
+-#if QT_VERSION >=3D 300
++#if QT_VERSION >=3D 0x030000
+         e->accept();
+ #endif
+     }
diff --git a/meta/recipes-qt/qwt/qwt.inc b/meta/recipes-qt/qwt/qwt.inc
new file mode 100644
index 0000000..8a1fe02
--- /dev/null
+++ b/meta/recipes-qt/qwt/qwt.inc
@@ -0,0 +1,33 @@
+DESCRIPTION =3D "Qt Widget Extension for Technical Applications"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+
+# LGPLv2.1 + some exceptions
+LICENSE =3D "QWTv1.0"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt"
+
+S =3D "${WORKDIR}/qwt-${PV}"
+
+do_configure_prepend() {
+	sed -i -e 's:RELEASE_SUFFIX      =3D :RELEASE_SUFFIX      =3D ${QT_LIBI=
NFIX} :' *.pri
+	sed -i -e s:lqwt:lqwt${QT_LIBINFIX}:g -e s:/usr/local/qwt-$\${QwtVersio=
n}:${prefix}:g *.prf
+	sed -e 's/#CONFIG     +=3D QwtExamples/CONFIG     +=3D QwtExamples/g' -=
i qwtconfig.pri
+	sed -i -e s:/usr/local/qwt-${PV}:${D}${prefix}:g ${S}/*.pri
+}
+
+do_install() {
+	oe_runmake -e install
+	install -d ${D}${datadir}/doc/${PN}
+	mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
+	cd ${S}/examples
+	install -d ${D}/${bindir}
+	cd ${S}/examples/bin${QT_LIBINFIX}/
+	for i in * ; do
+		cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
+	done
+}
+
+PACKAGES_prepend =3D "${PN}-examples "
+FILES_${PN}-examples =3D "${bindir}/*"
+
diff --git a/meta/recipes-qt/qwt/qwt_5.2.1.bb b/meta/recipes-qt/qwt/qwt_5=
.2.1.bb
new file mode 100644
index 0000000..b20229f
--- /dev/null
+++ b/meta/recipes-qt/qwt/qwt_5.2.1.bb
@@ -0,0 +1,13 @@
+LICENSE =3D "LGPL"
+PR =3D "r1"
+
+inherit qt4x11
+
+require qwt.inc
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af42051=
c88"
+
+SRC_URI[qwt.md5sum] =3D "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[qwt.sha256sum] =3D "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fb=
e88524eb698e11ac569f"
+
+RPROVIDES_${PN}-dev =3D "libqwt-dev"
diff --git a/meta/recipes-qt/tasks/task-qt4-x11.bb b/meta/recipes-qt/task=
s/task-qt4-x11.bb
new file mode 100644
index 0000000..dcedd58
--- /dev/null
+++ b/meta/recipes-qt/tasks/task-qt4-x11.bb
@@ -0,0 +1,52 @@
+DESCRIPTION =3D "QT4-X11 base Image Feed"
+PR =3D "r1"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+inherit task
+
+PACKAGES +=3D " \
+	${PN}-base \
+	${PN}-qwt \
+"
+
+RDEPENDS_${PN}-base =3D " \
+	busybox \
+	libx11 \
+	qt4-x11-free \
+        libqt3support4 \
+        libqtclucene4 \
+        libqtcore4 \
+        libqtdbus4 \
+        libqtgui4 \
+        libqthelp4 \
+        libqtmultimedia4 \
+        libqtnetwork4 \
+        libqtscript4 \
+        libqtscripttools4 \
+        libqtsql4 \
+        libqtsvg4 \
+        libqttest4 \
+        libqtwebkit4 \
+        libqtxml4 \
+        qt4-fonts \
+        qt4-plugin-iconengine-svgicon \
+        qt4-plugin-imageformat-gif \
+        qt4-plugin-imageformat-ico \
+        qt4-plugin-imageformat-jpeg \
+        qt4-plugin-imageformat-mng \
+        qt4-plugin-imageformat-svg \
+        qt4-plugin-imageformat-tiff \
+        qt4-plugin-phonon-backend-gstreamer \
+        qt4-plugin-script-dbus \
+        qt4-plugin-sqldriver-sqlite \
+"
+
+RRECOMMENDS_${PN}-base =3D " \
+        libqtxmlpatterns4 \
+"
+
+RDEPENDS_${PN}-qwt =3D "\
+        qwt \
+"
diff --git a/meta/recipes-qt/tasks/task-sdk-host.bb b/meta/recipes-qt/tas=
ks/task-sdk-host.bb
new file mode 100644
index 0000000..3707259
--- /dev/null
+++ b/meta/recipes-qt/tasks/task-sdk-host.bb
@@ -0,0 +1,21 @@
+#
+# Copyright (C) 2007 OpenedHand Ltd
+#
+
+DESCRIPTION =3D "Host packages for the standalone SDK or external toolch=
ain"
+PR =3D "r3"
+LICENSE =3D "MIT"
+ALLOW_EMPTY =3D "1"
+
+inherit sdk
+
+PACKAGES =3D "${PN}"
+
+RDEPENDS_${PN} =3D "\
+    binutils-cross-sdk \
+    gcc-cross-sdk \
+    gdb-cross-sdk \
+    pkgconfig-sdk \
+    opkg-sdk \
+    libtool-sdk \
+    "
--=20
1.7.0.4



