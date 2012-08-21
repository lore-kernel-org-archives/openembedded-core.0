Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f16-0005r3-ML
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:32 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8863245pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=F0B7JG+tQZl7Q1GTamDEViFxfjt9qiKVeGKORbaE4uw=;
	b=HvYgNGeqpVniod7BYEanzEtXUtyGioT1o7lom3S3oQgxcssjCgYNMc+vjENDIrh2oA
	izw3yJUTCVkepZiaTBc2iGi3N2Y+RDyRoIcTdCda0ugQ4rOIyhF5aa2U4gMQDHaBbudJ
	8Xx3+bWI4ie3sDiKCn6iDV9u2K8/E9bqmshbFaFxaN1wndwBa3PLWXfCqmimDtx22SYk
	asaKDXwUhTqXJSgKgz4kko/KiV7hMB4klv2hCSMDfsFWNCcldfi8/oNy6t9omznXuih5
	Z0/nXz2oE6YZ5pCmNUYMG/NKN3VZ1RNoYIlQblPPyYq3ogAZH4mgYitjfhTvyW7CpxhV
	7Xrg==
Received: by 10.68.132.228 with SMTP id ox4mr19093348pbb.13.1345518511397;
	Mon, 20 Aug 2012 20:08:31 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:53 -0700
Message-Id: <8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:33 -0000

Now glibc can be compiled with gcc-cross-initial therefore prepare
the stage to drop gcc-cross-intermediate

Also drop arm-nolibfloat.patch should not be needed anymore
half of changes in this patch are meant for OABI which we dont
use anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 -
 .../gcc/gcc-4.7/arm-nolibfloat.patch               |   40 ----------------
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   50 +++++++++++++++-----
 3 files changed, 39 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-nolibfloat.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 4ad4819..3f13385 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -52,7 +52,6 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
            file://306-libstdc++-namespace.patch  \
            file://740-sh-pr24836.patch  \
            file://800-arm-bigendian.patch  \
-           file://arm-nolibfloat.patch  \
            file://gcc-poison-system-directories.patch \
            file://gcc-poison-dir-extend.patch \
            file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-4.7/arm-nolibfloat.patch
deleted file mode 100644
index 901f014..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.7/arm-nolibfloat.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-
-# Dimitry Andric <dimitry@andric.com>, 2004-05-01
-#
-# * Removed the extra -lfloat option from LIBGCC_SPEC, since it isn't needed
-#   anymore.  (The required functions are now in libgcc.)
-# 
-# Fixes errors like
-# arm-softfloat-linux-gnu/3.4.0/../../../../arm-softfloat-linux-gnu/bin/ld: cannot find -lfloat
-# collect2: ld returned 1 exit status
-# make[2]: *** [arm-softfloat-linux-gnu/gcc-3.4.0-glibc-2.3.2/build-glibc/iconvdata/ISO8859-1.so] Error 1
-# when building glibc-2.3.3 with gcc-3.4.0 for arm-softfloat
-
-Index: trunk/gcc/config/arm/linux-elf.h
-===================================================================
---- trunk.orig/gcc/config/arm/linux-elf.h	2012-02-22 12:04:30.644385926 -0800
-+++ trunk/gcc/config/arm/linux-elf.h	2012-02-22 12:04:30.764385931 -0800
-@@ -57,7 +57,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- #define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
- 
-Index: trunk/libgcc/config/arm/t-linux
-===================================================================
---- trunk.orig/libgcc/config/arm/t-linux	2012-02-22 12:11:48.372407121 -0800
-+++ trunk/libgcc/config/arm/t-linux	2012-02-22 12:13:19.868411588 -0800
-@@ -1,6 +1,8 @@
- LIB1ASMSRC = arm/lib1funcs.S
- LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
--	_arm_addsubdf3 _arm_addsubsf3
-+	_negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
-+	_truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
-+	_fixsfsi _fixunssfsi _floatdidf _floatundidf _floatdisf _floatundisf
- 
- # Just for these, we omit the frame pointer since it makes such a big
- # difference.
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 543a94a..be47f85 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -19,12 +19,11 @@ EXTRA_OECONF = "--with-newlib \
                 ${OPTSPACE} \
 		--program-prefix=${TARGET_PREFIX} \
 		--with-sysroot=${STAGING_DIR_TARGET} \
-		--with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
+		--with-build-sysroot=${STAGING_DIR_TARGET} \
 		${EXTRA_OECONF_INITIAL} \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
 		${EXTRA_OECONF_FPU}"
 
-
 GCCCROSS_BUILDSYSROOT = "${B}/tmpsysroot"
 
 do_configure_prepend () {
@@ -39,13 +38,42 @@ do_configure_prepend () {
 do_compile () {
     oe_runmake all-gcc all-target-libgcc
 }
-# fixed limits.h infact includes the so called real limits.h
-# which should come from libc but when we build libc-initial
-# then bunch of configure tests include fixed limits.h which in turn
-# includes real limits.h but this real limits.h is not staged yet
-# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
-# to get rid references to real limits.h
-
-do_install_append () {
-    cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-gcc install-target-libgcc
+
+	# We don't really need this (here shares/ contains man/, info/, locale/).
+	rm -rf ${D}${datadir}/
+
+	# We use libiberty from binutils
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
+
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found. These need to be relative paths so they work in different locations.
+	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
+	install -d $dest
+	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+	done
+	# fixed limits.h infact includes the so called real limits.h
+	# which should come from libc but when we build libc-initial
+	# then bunch of configure tests include fixed limits.h which in turn
+	# includes real limits.h but this real limits.h is not staged yet
+	# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
+	# to get rid references to real limits.h
+	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+}
+#
+# Override the default sysroot staging copy since this won't look like a target system
+#
+sysroot_stage_all() {
+	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
+	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/
+	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/
+	mv ${SYSROOT_DESTDIR}${target_base_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/ || true
+	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
 }
+
+do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
+
-- 
1.7.9.5



