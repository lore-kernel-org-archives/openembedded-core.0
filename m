Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 048356D2DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 10:56:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA6Asu7G021935 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Nov 2013 10:56:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PyCwvqaVc8l8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 10:56:06 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA6AtxVq021956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Nov 2013 10:56:01 GMT
Message-ID: <1383735355.6271.190.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Nov 2013 10:55:55 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] toolchain-scripts/meta-environment: Further cleanup code duplication
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
X-List-Received-Date: Wed, 06 Nov 2013 10:56:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was still duplicated code in toolchain-scripts, this further cleans
up the functions to remove it. The now unused includedir parameter is also
dropped.

The final scripts do end up reordered slightly and the sysroot is parametrised
for the IDE scripts which is an improvement but should have no functional
difference.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 07e6fbf..b9f2aea9 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -7,7 +7,6 @@ REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
-	includedir=${5:-${includedir}}
 	libdir=${4:-${libdir}}
 	sysroot=${3:-${SDKTARGETSYSROOT}}
 	multimach_target_sys=${2:-${REAL_MULTIMACH_TARGET_SYS}}
@@ -19,33 +18,12 @@ toolchain_create_sdk_env_script () {
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
-	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
-	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
-	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
-	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
-	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
-	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
-	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
-	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
-	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
-	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
-	echo 'export AR=${TARGET_PREFIX}ar' >> $script
-	echo 'export NM=${TARGET_PREFIX}nm' >> $script
-	echo 'export M4=m4' >> $script
-	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDKTARGETSYSROOT"' >> $script
-	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
-	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
-	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
-	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
-	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
-	echo 'export ARCH=${ARCH}' >> $script
-	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
+
+	toolchain_shared_env_script
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
@@ -57,14 +35,21 @@ toolchain_create_tree_env_script () {
 	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
-
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
+	echo 'export SDKTARGETSYSROOT=${STAGING_DIR_TARGET}' >> $script
+	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
+	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
+
+	toolchain_shared_env_script
+}
 
-	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
-	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
-	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+toolchain_shared_env_script () {
+	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
-	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
 	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
 	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
@@ -72,15 +57,13 @@ toolchain_create_tree_env_script () {
 	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
 	echo 'export AR=${TARGET_PREFIX}ar' >> $script
 	echo 'export NM=${TARGET_PREFIX}nm' >> $script
+	echo 'export M4=m4' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
 	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
 	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
-	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index c7be404..41b87b5 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -24,7 +24,7 @@ do_generate_content() {
 
     toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
 
-    toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS} ${REAL_MULTIMACH_TARGET_SYS} '##SDKTARGETSYSROOT##'  ${target_libdir} ${target_includedir}
+    toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS} ${REAL_MULTIMACH_TARGET_SYS} '##SDKTARGETSYSROOT##'  ${target_libdir} 
 
     # Add version information
     toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}



