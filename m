Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f1E-0005r3-3n
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:40 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8863245pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JPNo6CuYmpLYKv4tYFKqjaWZDYYAdgb3uqTk/vX3tAQ=;
	b=kEuONAEC4yEfQYBl6dxMCrtWl6GKtb3sKO3mSU/frg7nllttzmYoSCxGMsyjTuRaBL
	vFXlK4+EDlCIBPWFaNGEsw85fIGzK08RLXE9wazl4k+pL9lReboNvqC2rzC/YMNFGBuA
	ncoI61LmTGRMfpFWBTA0Qe2JOdYCFFT2rkguDUAIoLc1o7VmPYiZvLUDK3zwKThtSYb5
	eefEunAItTlVrG2CspnX7PRAsHKhDkKwJFblN8jIHbsvDykz/IO1qJ9knyiWmfHN5QBG
	GKNfYXg164hX2sSqh9oYOFLn47QPkWm4pUMlJOIlEsIO/GIegqphKEVHcrmT1bM0myAl
	rqfw==
Received: by 10.68.238.74 with SMTP id vi10mr17727865pbc.48.1345518518849;
	Mon, 20 Aug 2012 20:08:38 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:58 -0700
Message-Id: <d668fe08d52ed619301c8e0a14c3b8957f6dbcb9.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 8/9] gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:40 -0000

These recipes arent used anymore so delete them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-cross-intermediate.inc                 |   68 --------------------
 .../gcc/gcc-cross-intermediate_4.7.bb              |    3 -
 .../gcc/gcc-crosssdk-intermediate.inc              |    9 ---
 .../gcc/gcc-crosssdk-intermediate_4.7.bb           |    3 -
 4 files changed, 83 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.7.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb

diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
deleted file mode 100644
index e06926d..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ /dev/null
@@ -1,68 +0,0 @@
-DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
-DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate"
-PACKAGES = ""
-
-INHIBIT_DEFAULT_DEPS = "1"
-INHIBIT_AUTOTOOLS_DEPS = "1"
-
-CROSS_TARGET_SYS_DIR_append = ".${PN}"
-
-# This is intended to be a -very- basic config
-# sysroot is needed in case we use libc-initial
-#
-# Glibc won't compile with gold, and building glibc is the whole point of
-# this recipe.   So we select ld.bfd explicitly here if gold is the distro's 
-# preferred linker.
-EXTRA_OECONF = "--enable-shared \
-		--disable-multilib \
-		--disable-threads \
-		--enable-languages=c \
-                ${OPTSPACE} \
-		--program-prefix=${TARGET_PREFIX} \
-		--with-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
-		--with-build-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
-		${EXTRA_OECONF_INTERMEDIATE} \
-		${EXTRA_OECONF_FPU} \
-		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
-
-do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
-
-do_compile () {
-    oe_runmake
-}
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	install -d ${D}${target_base_libdir}/
-	osdir=`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} -print-multi-os-directory`
-	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/$osdir/* ${D}${target_base_libdir}/
-
-	# We don't really need this (here shares/ contains man/, info/, locale/).
-	rm -rf ${D}${datadir}/
-
-	# We use libiberty from binutils
-	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
-	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
-
-	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
-	# found. These need to be relative paths so they work in different locations.
-	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
-	install -d $dest
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
-		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
-	done
-}
-
-#
-# Override the default sysroot staging copy since this won't look like a target system
-#
-sysroot_stage_all() {
-	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
-	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/
-	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/  
-	mv ${SYSROOT_DESTDIR}${target_base_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/ || true
-	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
-}
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.7.bb
deleted file mode 100644
index 69ae7f7..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.7.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-cross_${PV}.bb
-require gcc-cross-intermediate.inc
-
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
deleted file mode 100644
index ed5d5e8..0000000
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit crosssdk
-
-SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
-SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
-SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
-
-DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native"
-DEPENDS += "virtual/${TARGET_PREFIX}libc-initial-nativesdk"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate-crosssdk"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb
deleted file mode 100644
index eacbc9e..0000000
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-cross-intermediate_${PV}.bb
-require gcc-crosssdk-intermediate.inc
-EXTRA_OECONF += " --with-native-system-header-dir=${SYSTEMHEADERS} "
-- 
1.7.9.5



