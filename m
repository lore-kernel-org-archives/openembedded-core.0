Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QbUKJ-0002Ov-0L
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 11:11:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5S97fPc019733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 02:07:41 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 28 Jun 2011 02:07:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 17:05:20 +0800
Message-ID: <158e24d3056ca6887f214c3304f6571cbed6b46b.1309243115.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309243115.git.liezhi.yang@windriver.com>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4 V4] Share gcc work directories
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
X-List-Received-Date: Tue, 28 Jun 2011 09:11:23 -0000
Content-Type: text/plain

This patched is derived from Richard, make gcc use the shared source
directory during the different building:

1) Make gcc-cross, gcc-cross-initial, gcc-cross-intermediate and
   gcc-runtime share the same source directory.

2) The source directory is ${TMPDIR}/work-shared/gcc-${PV}, for example:
   tmp/work-shared/gcc-4.5.1

3) Fix do_clean to clean the shared source directory and stamps

4) gcc uses sed and creates config files against ${S} which means the
   directory should not be shared. Change the way to make it work:

   * The configure option --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS}
     can replace the sed command, see the code in configure:

        if test "x$with_headers" != x; then
          glibc_header_dir=$with_headers

    This has the same effect as the sed command:

    sed -i 's:^\([  ]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\": ...

    so add the --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} to
    gcc-configure-cross.inc( not add to gcc-configure-common.inc, since
    not all the gcc building need this, the one which has its own do_configure
    doesn't need it).

   * Move t-oe from ${T} to ${B}/gcc, so that the patched Makefile.in
     can read it easily, please see the commit for gcc-4.5.1 and
     gcc-4.6.0.

   * Use the defaults.h in ${B}/gcc instead of ${S}/gcc, and the patched
     configure.ac(configure) can read it correctly, please see the
     commit for gcc-4.5.1 and gcc-4.6.0.

   * The gcc-crosssdk.inc used sed to edit ${S}/config/*/linux*.h
     to change the GLIBC_DYNAMIC_LINKER, which made the source
     incompatible. To make the source compatible:
     - Use:
	 sed -i ${S}/gcc/config/*/linux*.h -e \
		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'

	so entries in the files that look like:
	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
	would become
	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
	and we define SYSTEMLIBS_DIR in defaults.h.

	NOTE:
	#define GLIBC_DYNAMIC_LINKER64 (SYSTEMLIBS_DIR "/ld-linux-x86-64.so.2")
	doesn't work in in the following define:
	#define LINUX_DYNAMIC_LINKER \
  		CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
	so use
	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"

5) Add do_configure_prepend to gcc-configure-common.inc and remove the
   one in gcc-crosssdk.inc, this makes it easy to share the source,
   otherwise we need do extra changes in gcc-configure-sdk.inc.

6) Use "cat > file <_EOF" to replace the "echo > file"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           |   32 ++++++++++++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   48 +++++++++++--------
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    6 ---
 4 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index a3fa234..7bf036c 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -37,10 +37,38 @@ ${GNU_MIRROR}/gcc/	http://gcc.get-software.com/releases/ \n \
 #
 gcclibdir = "${libdir}/gcc"
 BINV = "${PV}"
-S = "${WORKDIR}/gcc-${PV}"
-B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
+#S = "${WORKDIR}/gcc-${PV}"
+S = "${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+
+# SS means Shared Stamps directory
+SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}"
+do_fetch[stamp-base] = "${SS}"
+do_unpack[stamp-base] = "${SS}"
+do_patch[stamp-base] = "${SS}"
+
+# SW means Shared Work directory
+SW = "${TMPDIR}/work-shared/gcc-${PV}"
+WORKDIR_task-unpack = "${SW}"
+WORKDIR_task-patch = "${SW}"
 
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
 target_base_libdir ?= "${base_libdir}"
 target_prefix ?= "${prefix}"
+
+CLEANFUNCS += "workshared_clean"
+# The do_clean should be exclusive since share ${S}
+do_clean[lockfiles] = "${TMPDIR}/stamps/work-shared/gcc-${PV}.clean.lock"
+
+python workshared_clean () {
+	"""clear the source directory"""
+	dir = bb.data.expand("${SW}", d)
+	bb.note("Removing " + dir)
+	oe.path.remove(dir)
+
+	"""clear the the stamps in work-shared"""
+	dir = "%s.*" % bb.data.expand(d.getVarFlag('do_fetch', 'stamp-base', True), d)
+	bb.note("Removing " + dir)
+	oe.path.remove(dir)
+}
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index f7b5836..9f5ba33 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -61,6 +61,34 @@ SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
+do_configure_prepend () {
+	# Change the default dynamic linker path, only useful for SDK, other's value
+	# are not changed according to the SYSTEMLIBS_DIR
+	sed -i ${S}/gcc/config/*/linux*.h -e \
+		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
+
+	SYSTEMLIBS_DIR=`dirname ${SYSTEMLIBS}`
+	[ "$SYSTEMLIBS_DIR" = "/" ] && SYSTEMLIBS_DIR=""
+	# teach gcc to find correct target includedir when checking libc ssp support
+	mkdir -p ${B}/gcc
+	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
+	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
+	cat >>${B}/gcc/defaults.h.new <<_EOF
+#ifndef STANDARD_INCLUDE_DIR
+#define STANDARD_INCLUDE_DIR "${SYSTEMHEADERS}"
+#endif
+#ifndef STANDARD_STARTFILE_PREFIX_1
+#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
+#endif
+#ifndef STANDARD_STARTFILE_PREFIX_2
+#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
+#endif
+#define SYSTEMLIBS_DIR "$SYSTEMLIBS_DIR"
+#endif /* ! GCC_DEFAULTS_H */
+_EOF
+	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
+}
+
 do_configure () {
 	# Setup these vars for cross building only
 	# ... because foo_FOR_TARGET apparently gets misinterpreted inside the
@@ -86,27 +114,7 @@ do_configure () {
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
 	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
-	
-	# teach gcc to find correct target includedir when checking libc ssp support
-	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure.ac
-	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure
 
-	# splice our idea of where the headers live into gcc's world
-	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${T}/t-oe
-	sed 's%^tmake_file=.*$%& ${T}/t-oe%' < ${S}/gcc/Makefile.in >${S}/gcc/Makefile.in.new
-	mv ${S}/gcc/Makefile.in.new ${S}/gcc/Makefile.in
-	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${S}/gcc/defaults.h.new
-	echo "#ifndef STANDARD_INCLUDE_DIR" >> ${S}/gcc/defaults.h.new
-	echo "#define STANDARD_INCLUDE_DIR \"${SYSTEMHEADERS}\"" >> ${S}/gcc/defaults.h.new
-	echo "#endif" >> ${S}/gcc/defaults.h.new
-	echo "#ifndef STANDARD_STARTFILE_PREFIX_1" >> ${S}/gcc/defaults.h.new
-	echo "#define STANDARD_STARTFILE_PREFIX_1 \"${SYSTEMLIBS}\"" >> ${S}/gcc/defaults.h.new
-	echo "#endif" >> ${S}/gcc/defaults.h.new
-	echo "#ifndef STANDARD_STARTFILE_PREFIX_2" >> ${S}/gcc/defaults.h.new
-	echo "#define STANDARD_STARTFILE_PREFIX_2 \"${SYSTEMLIBS1}\"" >> ${S}/gcc/defaults.h.new
-	echo "#endif" >> ${S}/gcc/defaults.h.new
-	echo "#endif /* ! GCC_DEFAULTS_H */" >> ${S}/gcc/defaults.h.new
-	mv ${S}/gcc/defaults.h.new ${S}/gcc/defaults.h
 	oe_runconf
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 346d164..36edb81 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -2,7 +2,9 @@ require gcc-configure-common.inc
 
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 
-EXTRA_OECONF += " --enable-poison-system-directories "
+EXTRA_OECONF += " --enable-poison-system-directories \
+		  --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
+		"
 
 EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_exec_prefix} \
 		      --with-gxx-include-dir=${target_includedir}/c++ \
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 6e7d5a7..0fd82a6 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -8,9 +8,3 @@ GCCMULTILIB = "--disable-multilib"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc-nativesdk gettext-native"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
-
-do_configure_prepend () {
-	# Change the default dynamic linker path to the one in the SDK
-	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
-	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
-}
-- 
1.7.1



