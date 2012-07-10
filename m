Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SohSh-0000q1-QQ
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 22:55:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6AKhxGd000522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2012 13:43:59 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 10 Jul 2012 13:43:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <yocto@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 15:54:38 -0500
Message-ID: <a5c0682f85ac03ea09346d504843d362ab153911.1341953258.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341953258.git.mark.hatle@windriver.com>
References: <cover.1341953258.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: RFC: [PATCH 1/1] toolchain-scripts: Sync the SDK/ADT values to the build system
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
X-List-Received-Date: Tue, 10 Jul 2012 20:55:12 -0000
Content-Type: text/plain

The build system passes specific TUNE (fundamental) flag values to various
tools instead of using a shell wrapper or similar.  It is important that the
build system and ADT/SDK match the behaviors exactly, or we are likely to
have differences in the way build-system and external components are built
leading to configuration, compilation and/or run-time problems.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass |   63 +++++++++++++++++++++++---------
 1 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index bedcd61..bf37ec9 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -14,9 +14,18 @@ toolchain_create_sdk_env_script () {
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
 	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script
-	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
-	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
+	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
+	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
+	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
+	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
+	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
+	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
+	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
+	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=${SDKTARGETSYSROOT}"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
@@ -26,10 +35,10 @@ toolchain_create_sdk_env_script () {
 		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
 		ln -s /usr/local local
 	fi
-	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
+	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
+	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
@@ -49,9 +58,18 @@ toolchain_create_tree_env_script () {
 
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
 
-	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
-	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
+	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
+	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
+	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
+	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
+	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
+	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
+	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
+	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
@@ -61,10 +79,10 @@ toolchain_create_tree_env_script () {
 		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
 		ln -s /usr/local local
 	fi
-	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
-	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
-	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
-	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
+	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
+	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
@@ -83,9 +101,18 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
 	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
-	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
-	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
+	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
+	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
+	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
+	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
+	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
+	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
+	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
+	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=##SDKTARGETSYSROOT##"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
@@ -95,10 +122,10 @@ toolchain_create_sdk_env_script_for_installer () {
 		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
 		ln -s /usr/local local
 	fi
-	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
+	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
+	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
+	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
         echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
-- 
1.7.3.4



