Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 792E86A4D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:03:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A83nfh015313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:03:49 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 01:03:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 16:03:40 +0800
Message-ID: <a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373443071.git.hongxu.jia@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Wed, 10 Jul 2013 08:03:51 -0000
Content-Type: text/plain

Network Security Services (NSS) is a set of libraries designed to support
cross-platform development of security-enabled client and server applications.
Applications built with NSS can support SSL v2 and v3, TLS, PKCS 5, PKCS 7,
PKCS 11, PKCS 12, S/MIME, X.509 v3 certificates, and other security standards.

[YOCTO #4096]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/nss-fix-support-cross-compiling.patch    |  71 +++++++++
 .../files/nss-no-rpath-for-cross-compiling.patch   |  26 ++++
 meta/recipes-support/nss/files/nss.pc.in           |  11 ++
 meta/recipes-support/nss/nss.inc                   | 170 +++++++++++++++++++++
 meta/recipes-support/nss/nss_3.15.1.bb             |   9 ++
 5 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss.pc.in
 create mode 100644 meta/recipes-support/nss/nss.inc
 create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb

diff --git a/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch b/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
new file mode 100644
index 0000000..f0b3550
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
@@ -0,0 +1,71 @@
+nss: fix support cross compiling
+
+Let some make variables be assigned from outside makefile.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ nss/coreconf/Linux.mk   | 12 +++++++++++-
+ nss/coreconf/arch.mk    |  2 +-
+ nss/lib/freebl/Makefile |  6 ++++++
+ 3 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
+--- a/nss/coreconf/Linux.mk
++++ b/nss/coreconf/Linux.mk
+@@ -16,11 +16,21 @@ ifeq ($(USE_PTHREADS),1)
+ 	IMPL_STRATEGY = _PTH
+ endif
+ 
++ifndef CC
+ CC			= gcc
++endif
++
++ifdef CXX
++CCC			= $(CXX)
++else
+ CCC			= g++
++endif
++
++ifndef RANLIB
+ RANLIB			= ranlib
++endif
+ 
+-DEFAULT_COMPILER = gcc
++DEFAULT_COMPILER = $(CC)
+ 
+ ifeq ($(OS_TARGET),Android)
+ ifndef ANDROID_NDK
+diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
+index 6557348..b722412 100644
+--- a/nss/coreconf/arch.mk
++++ b/nss/coreconf/arch.mk
+@@ -37,7 +37,7 @@ OS_TEST := $(shell uname -m)
+ ifeq ($(OS_TEST),i86pc)
+     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
+ else
+-    OS_RELEASE := $(shell uname -r)
++    OS_RELEASE ?= $(shell uname -r)
+ endif
+ 
+ #
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 0d293f1..678f506 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -36,6 +36,12 @@ ifdef USE_64
+ 	DEFINES += -DNSS_USE_64
+ endif
+ 
++ifeq ($(OS_TEST),mips)
++ifndef USE_64
++	DEFINES += -DNS_PTR_LE_32
++endif
++endif
++
+ ifdef USE_ABI32_FPU
+ 	DEFINES += -DNSS_USE_ABI32_FPU
+ endif
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch b/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
new file mode 100644
index 0000000..7661dc9
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
@@ -0,0 +1,26 @@
+nss:no rpath for cross compiling
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ nss/cmd/platlibs.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
+--- a/nss/cmd/platlibs.mk
++++ b/nss/cmd/platlibs.mk
+@@ -18,9 +18,9 @@ endif
+ 
+ ifeq ($(OS_ARCH), Linux)
+ ifeq ($(USE_64), 1)
+-EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
++#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
+ else
+-EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
++#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
+ endif
+ endif
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-support/nss/files/nss.pc.in b/meta/recipes-support/nss/files/nss.pc.in
new file mode 100644
index 0000000..200f635
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss.pc.in
@@ -0,0 +1,11 @@
+prefix=OEPREFIX
+exec_prefix=OEEXECPREFIX
+libdir=OELIBDIR
+includedir=OEINCDIR
+
+Name: NSS
+Description: Network Security Services
+Version: %NSS_VERSION%
+Requires: nspr >= %NSPR_VERSION%
+Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
+Cflags: -IOEINCDIR
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
new file mode 100644
index 0000000..87cba38
--- /dev/null
+++ b/meta/recipes-support/nss/nss.inc
@@ -0,0 +1,170 @@
+SUMMARY = "Mozilla's SSL and TLS implementation"
+DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
+designed to support cross-platform development of \
+security-enabled client and server applications. \
+Applications built with NSS can support SSL v2 and v3, \
+TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
+v3 certificates, and other security standards."
+HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
+SECTION = "libs"
+
+LICENSE = "MPL-1.1 GPL-2.0 LGPL-2.1"
+
+LIC_FILES_CHKSUM = "file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=6bf96825e3d7ce4de25621ae886cc859"
+SRC_URI = "\
+    file://nss-fix-support-cross-compiling.patch \
+    file://nss-no-rpath-for-cross-compiling.patch \
+"
+SRC_URI_append_class-target += "\
+    file://nss.pc.in \
+"
+inherit siteinfo
+PR = "r0"
+DEPENDS = "sqlite3 nspr zlib nss-native"
+DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
+RDEPENDS_${PN} = "perl"
+
+TD = "${S}/tentative-dist"
+TDS = "${S}/tentative-dist-staging"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile_prepend_class-native() {
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
+    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
+}
+
+do_compile() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="gcc"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+    export FREEBL_LOWHASH=1
+
+    export LIBDIR=${libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
+        OS_TEST=mips
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    fi
+
+    make -C ./nss CCC="${CXX}" \
+        OS_TEST=${OS_TEST} \
+}
+
+do_install() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="gcc"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+
+    export LIBDIR=${libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
+        OS_TEST=mips
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    fi
+
+    make -C ./nss \
+        CCC="${CXX}" \
+        OS_TEST=${OS_TEST} \
+        SOURCE_LIB_DIR="${TD}/${libdir}" \
+        SOURCE_BIN_DIR="${TD}/${bindir}" \
+        install
+
+    install -d ${D}/${libdir}/
+    for file in ${S}/dist/*.OBJ/lib/*.so; do
+        echo "Installing `basename $file`..."
+        cp $file  ${D}/${libdir}/
+    done
+
+    for shared_lib in ${TD}/${libdir}/*.so.*; do
+        if [ -f $shared_lib ]; then
+            cp $shared_lib ${D}/${libdir}
+            ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename $shared_lib .1oe)
+        fi
+    done
+    for shared_lib in ${TD}/${libdir}/*.so; do
+        if [ -f $shared_lib -a ! -e ${D}/${libdir}/$shared_lib ]; then
+            cp $shared_lib ${D}/${libdir}
+        fi
+    done
+
+    install -d ${D}/${includedir}/nss3
+    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
+
+    install -d ${D}/${bindir}
+    for binary in ${TD}/${bindir}/*; do
+        install -m 755 -t ${D}/${bindir} $binary
+    done
+}
+
+do_install_append_class-target() {
+    install -d ${D}${libdir}/pkgconfig/
+    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
+
+    # Create a blank certificate
+    mkdir -p ${D}/etc/pki/nssdb/
+    touch ./empty_password
+    certutil -N -d ${D}/etc/pki/nssdb/ -f ./empty_password
+    chmod 644 ${D}/etc/pki/nssdb/*.db
+    rm ./empty_password
+}
+
+FILES_${PN} = "\
+    ${sysconfdir} \
+    ${bindir} \
+    ${libdir}/lib*.chk \
+    ${libdir}/lib*.so \
+    "
+FILES_${PN}-dev = "\
+    ${libdir}/nss \
+    ${libdir}/pkgconfig/* \
+    ${includedir}/* \
+    "
+FILES_${PN}-dbg = "\
+    ${bindir}/.debug/* \
+    ${libdir}/.debug/* \
+    "
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/nss/nss_3.15.1.bb b/meta/recipes-support/nss/nss_3.15.1.bb
new file mode 100644
index 0000000..7b06f00
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.15.1.bb
@@ -0,0 +1,9 @@
+require nss.inc
+
+SRC_URI += "\
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_15_1_RTM/src/${BPN}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "fb68f4d210ac9397dd0d3c39c4f938eb"
+SRC_URI[sha256sum] = "f994106a33d1f3210f4151bbb3419a1c28fd1cb545caa7dc9afdebd6da626284"
+
-- 
1.8.1.2


