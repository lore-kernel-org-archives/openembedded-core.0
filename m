Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 46FCA600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 10:07:04 +0000 (UTC)
Received: by lbcmx3 with SMTP id mx3so7350669lbc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 03:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cd9B5UkFLU9AulbzPhclQpk4Vb+IQznZS+yBP32Wi7o=;
	b=NVE+S77WJgLA2K/moh9n6YKyvZ5P/GJV4K4fFn0Lk4lx3DvGBmH3hMQ8KpGZB9Dfdi
	qK0hreDO+744gdN0PaN7yY+J7Pih/6tP+Lgs0eEtui5yzaitLl2TrjbZm1NUPmHmEr6K
	1FWza6iovVV4GEKMsKftHN3bdCRUjrPl+zZLWsiiBykRY0eFH0YHJNWRPUa91GgFDjLn
	+ogcuwSUFdAxDQ66O7h3sp9nSDxjRfCFtuaNMJCXiCg5HcnON5VEncdoCVLSbzsSLtob
	5D75PL5KSbTzwvCw0VAVlGdB40ttT37ClQb1E8h3MwX7HGV59fHJLFEzAn8XfiRnNp3d
	iQMQ==
X-Received: by 10.152.43.69 with SMTP id u5mr11047750lal.119.1433844424358;
	Tue, 09 Jun 2015 03:07:04 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id rg6sm1278098lbb.23.2015.06.09.03.07.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 03:07:03 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: "mike . looijmans @ topic . nl" <mike.looijmans@topic.nl>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:07:01 +0200
Message-Id: <1433844421-17272-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] opencv: Upgrade to 3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jun 2015 10:07:05 -0000

-Support for new PACKAGECONFIGS
-Merge with opencv-samples

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../recipes-support/opencv/opencv-samples_2.4.bb   |  39 -------
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |  99 ----------------
 meta-oe/recipes-support/opencv/opencv_3.0.bb       | 125 +++++++++++++++++++++
 3 files changed, 125 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
 delete mode 100644 meta-oe/recipes-support/opencv/opencv_2.4.bb
 create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb

diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
deleted file mode 100644
index 9d862fe910f7..000000000000
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
-SECTION = "libs"
-LICENSE = "BSD"
-
-DEPENDS = "opencv"
-
-LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
-"
-SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
-SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
-          "
-PV = "2.4.3+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    cd samples/c
-    install -d ${D}/${bindir}
-    install -d ${D}/${datadir}/opencv/samples
-
-    cp * ${D}/${datadir}/opencv/samples || true
-
-    for i in *.c; do
-        echo "compiling $i"
-        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .c` $i `pkg-config --libs opencv` || true
-        install -m 0755 `basename $i .c` ${D}/${bindir} || true
-        rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true
-    done
-    for i in *.cpp; do
-        echo "compiling $i"
-        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .cpp` $i `pkg-config --libs opencv` || true
-        install -m 0755 `basename $i .cpp` ${D}/${bindir} || true
-        rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true
-    done
-}
-
-FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*" 
-FILES_${PN} += "${bindir} ${datadir}/opencv"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
deleted file mode 100644
index 27546161d21f..000000000000
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ /dev/null
@@ -1,99 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
-SECTION = "libs"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
-
-ARM_INSTRUCTION_SET = "arm"
-
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
-
-SRCREV = "2c9547e3147779001811d01936aed38f560929fc"
-SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4"
-
-PV = "2.4.11+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-# Do an out-of-tree build
-OECMAKE_SOURCEPATH = "${S}"
-OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
-
-EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-                 -DBUILD_PYTHON_SUPPORT=ON \
-                 -DWITH_GSTREAMER=OFF \
-                 -DWITH_1394=OFF \
-                 -DCMAKE_SKIP_RPATH=ON \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-"
-
-PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)}"
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
-PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
-PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
-PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-
-inherit distutils-base pkgconfig cmake
-
-export BUILD_SYS
-export HOST_SYS
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${PN}-apps python-opencv"
-
-python populate_packages_prepend () {
-    cv_libdir = d.expand('${libdir}')
-    cv_libdir_dbg = d.expand('${libdir}/.debug')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-    pn = d.getVar('PN', 1)
-    metapkg =  pn + '-dev'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ] 
-    packages = d.getVar('PACKAGES', 1).split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
-}
-
-PACKAGES_DYNAMIC += "^libopencv-.*"
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-
-ALLOW_EMPTY_${PN} = "1"
-
-INSANE_SKIP_python-opencv = "True"
-SUMMARY_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-do_install_append() {
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-
-    # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" ]; then
-        mv ${D}/usr/lib/* ${D}/${libdir}/
-        rm -rf ${D}/usr/lib
-    fi
-}
diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
new file mode 100644
index 000000000000..53067d4e6e80
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -0,0 +1,125 @@
+SUMMARY = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
+
+ARM_INSTRUCTION_SET = "arm"
+
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 oracle-jse-jdk ant"
+
+SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
+SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
+SRCREV_FORMAT = "opencv"
+SRC_URI = "git://github.com/Itseez/opencv.git;nobranch=1;name=opencv \
+	   git://github.com/Itseez/opencv_contrib.git;nobranch=1;destsuffix=contrib;name=contrib"
+
+PV = "3.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
+		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+                 -DWITH_1394=OFF \
+                 -DCMAKE_SKIP_RPATH=ON \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+"
+
+PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l tbb samples\
+                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)}"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
+PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
+PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[oracle-java-amd64] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,oracle-jse-jdk ant,"
+PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
+PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+
+inherit distutils-base pkgconfig cmake
+
+export BUILD_SYS
+export HOST_SYS
+export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export PYTHON="${STAGING_BINDIR_NATIVE}/python"
+export JAVA_HOME="${STAGING_DIR_TARGET}/usr/share/java/"
+export ANT_DIR="${STAGING_DIR_TARGET}/usr/share/ant/"
+
+TARGET_CC_ARCH += "-I${S}/include "
+
+PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+
+python populate_packages_prepend () {
+    cv_libdir = d.expand('${libdir}')
+    cv_libdir_dbg = d.expand('${libdir}/.debug')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+    pn = d.getVar('PN', 1)
+    metapkg =  pn + '-dev'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    packages = d.getVar('PACKAGES', 1).split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
+
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
+            metapkg_rdepends.append(pkg)
+    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+
+}
+
+PACKAGES_DYNAMIC += "^libopencv-.*"
+
+FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
+FILES_${PN}-dbg += "${libdir}/.debug"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+FILES_${PN}-doc = "${datadir}/OpenCV/doc"
+FILES_${PN}-java = "${datadir}/OpenCV/java"
+FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
+FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
+FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
+
+INSANE_SKIP_${PN}-apps = "staticdev"
+INSANE_SKIP_${PN}-java = "libdir"
+INSANE_SKIP_${PN}-java-dbg = "libdir"
+
+ALLOW_EMPTY_${PN} = "1"
+
+INSANE_SKIP_python-opencv = "True"
+SUMMARY_python-opencv = "Python bindings to opencv"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-opencv = "python-core python-numpy"
+
+do_install_append() {
+    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
+    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
+
+    # Move Python files into correct library folder (for multilib build)
+    if [ "$libdir" != "/usr/lib" ]; then
+        mv ${D}/usr/lib/* ${D}/${libdir}/
+        rm -rf ${D}/usr/lib
+    fi
+
+    install -d ${D}${datadir}/OpenCV/samples/bin/
+    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
+}
-- 
2.1.4


