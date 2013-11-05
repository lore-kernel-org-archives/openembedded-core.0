Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9F72B6CEF1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:10:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5M9wNZ005565 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:09:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HfcwvW_rNO1Y
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:09:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5M9u2k005548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:09:57 GMT
Message-ID: <1383689391.6271.181.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Nov 2013 22:09:51 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] toolchain-scripts/meta-environment: Merge toolchain_create_sdk_env_script and the for_installer variant
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
X-List-Received-Date: Tue, 05 Nov 2013 22:10:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having two scripts which do basically the same thing is a nightmare. This merges
them together. It also makes the sysroot location a variable in its own right
which may be more useful for end users wanting to change sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 614f1c0..db0ae17 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -7,18 +7,23 @@ REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
-	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}}
+	includedir=${5:-${includedir}}
+	libdir=${4:-${libdir}}
+	sysroot=${3:-${SDKTARGETSYSROOT}}
+	multimach_target_sys=${2:-${REAL_MULTIMACH_TARGET_SYS}}
+	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-$multimach_target_sys}
 	rm -f $script
 	touch $script
+	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}:$PATH' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
-	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script
-	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
+	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
+	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
+	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
+	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
-	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
 	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
 	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
@@ -28,12 +33,12 @@ toolchain_create_sdk_env_script () {
 	echo 'export NM=${TARGET_PREFIX}nm' >> $script
 	echo 'export M4=m4' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=${SDKTARGETSYSROOT}"' >> $script
+	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDKTARGETSYSROOT"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
-		echo 'export TARGET_CFLAGS="-I${SDKTARGETSYSROOT}${includedir}"' >> $script
-		echo 'export TARGET_LDFLAGS="-L${SDKTARGETSYSROOT}${libdir}"' >> $script
+		echo 'export TARGET_CFLAGS="-I$SDKTARGETSYSROOT'"$includedir"'"' >> $script
+		echo 'export TARGET_LDFLAGS="-L$SDKTARGETSYSROOT'"$libdir"'"' >> $script
 		# Workaround darwin toolchain sysroot path problems
-		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
+		cd ${SDK_OUTPUT}$SDKTARGETSYSROOT/usr
 		ln -s /usr/local local
 	fi
 	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
@@ -41,7 +46,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
 	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
@@ -96,52 +101,6 @@ toolchain_create_tree_env_script () {
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
 }
 
-# This function creates an environment-setup-script for use by the ADT installer
-toolchain_create_sdk_env_script_for_installer () {
-	# Create environment setup script
-	local multimach_target_sys=$1
-	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${multimach_target_sys}
-	rm -f $script
-	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}:$PATH' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
-	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
-	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
-	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
-	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
-	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
-	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
-	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
-	echo 'export AR=${TARGET_PREFIX}ar' >> $script
-	echo 'export NM=${TARGET_PREFIX}nm' >> $script
-	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=##SDKTARGETSYSROOT##"' >> $script
-	if [ "${TARGET_OS}" = "darwin8" ]; then
-		echo 'export TARGET_CFLAGS="-I##SDKTARGETSYSROOT##${target_includedir}"' >> $script
-		echo 'export TARGET_LDFLAGS="-L##SDKTARGETSYSROOT##{target_libdir}"' >> $script
-		# Workaround darwin toolchain sysroot path problems
-		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
-		ln -s /usr/local local
-	fi
-	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
-	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
-	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
-	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
-        echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
-	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
-	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
-	echo 'export ARCH=${ARCH}' >> $script
-	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
-}
-
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 3a71a9b..c7be404 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -24,7 +24,7 @@ do_generate_content() {
 
     toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
 
-    toolchain_create_sdk_env_script_for_installer ${REAL_MULTIMACH_TARGET_SYS}
+    toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS} ${REAL_MULTIMACH_TARGET_SYS} '##SDKTARGETSYSROOT##'  ${target_libdir} ${target_includedir}
 
     # Add version information
     toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}



