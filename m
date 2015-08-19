Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 29D8065CBC;
	Wed, 19 Aug 2015 12:18:34 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so1896099lbb.0;
	Wed, 19 Aug 2015 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=pgXWfNYKUSz4o496s+fUsmcQbgTOHr8FHnkcNfaoc48=;
	b=0wypCCqrvZuboG/9gBag6aVsibntUhoaoZRAJBkw+S6OMdBm+WUydkZCLFl/K7kTJB
	su3xd42Ti9Z7ayy7fjfarQXfHozfKwLsa0uBtFZX1ze0xCv1ziEKeSgd1pMjTTm0mxIQ
	Va8z61+BKpmZI9Wzn2QYK1a7BjzgalobYlQ6NABHQpAEJcdPmghi3kbF840aQcoToN22
	Dgj5jPkVAd9d26BTDGJc0uJOcezySmk7l196vKC2YJ1rUM5YTFjDUovLjQ/0nXKaus6h
	Zo8RpG3Kim3jSm9lyFKiYGx8YU30B6YyEislsKeDl+B713yyCAWtQQm7Fez/+T0yzCK0
	ZaSQ==
X-Received: by 10.112.219.70 with SMTP id pm6mr10782253lbc.41.1439986713686;
	Wed, 19 Aug 2015 05:18:33 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id ba19sm169321lab.0.2015.08.19.05.18.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 05:18:32 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Aug 2015 14:18:31 +0200
Message-Id: <1439986711-27572-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] Opencv: Add OpenCV 3.0
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
X-List-Received-Date: Wed, 19 Aug 2015 12:18:35 -0000

-Support for new PACKAGECONFIGS
-Merge with opencv-samples

Since it is not backward compatible with 2.x and cannot be installed in
parallel it has a DEFAULT_PREFERENCE of -1.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v3: Changes requested by Martin Jansa <martin.jansa@gmail.com>
-Select java dependencies via packageconfig

 meta-oe/recipes-support/opencv/opencv_3.0.bb | 128 +++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
new file mode 100644
index 000000000000..e929f82c8762
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -0,0 +1,128 @@
+SUMMARY = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
+
+ARM_INSTRUCTION_SET = "arm"
+
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
+
+SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
+SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
+SRCREV_FORMAT = "opencv"
+SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
+	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
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
+PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l gstreamer samples tbb\
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
+PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
+PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+
+inherit distutils-base pkgconfig cmake
+
+export BUILD_SYS
+export HOST_SYS
+export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export PYTHON="${STAGING_BINDIR_NATIVE}/python"
+export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
+export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
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
+    metapkg =  pn
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
2.5.0


