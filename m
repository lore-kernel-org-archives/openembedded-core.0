Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QXuvK-0002cj-1l
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 14:46:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5IChJ6p015688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 05:43:19 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 18 Jun 2011 05:43:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jun 2011 20:41:32 +0800
Message-ID: <9c2c65efd1f1bc9d5e974d08f13292f784d1fc3e.1308391365.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308391365.git.liezhi.yang@windriver.com>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6 V3] Share gcc work directories
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
X-List-Received-Date: Sat, 18 Jun 2011 12:46:50 -0000
Content-Type: text/plain

This patched is derived from Richard, make gcc use the shared source
directory during the different building:

1) Make gcc-cross, gcc-cross-initial, gcc-cross-intermediate and
   gcc-runtime share the same source directory.

2) The source directory is ${TMPDIR}/work-shared/gcc-${PV}, for example:
   tmp/work-shared/gcc-4.6.0

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

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           |   32 ++++++++++++++++++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   33 ++++++++-----------
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 ++-
 3 files changed, 47 insertions(+), 22 deletions(-)

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
index f7b5836..c543aae 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -88,25 +88,20 @@ do_configure () {
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 	
 	# teach gcc to find correct target includedir when checking libc ssp support
-	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure.ac
-	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure
-
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
+	mkdir -p ${B}/gcc
+	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
+	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
+	echo "#ifndef STANDARD_INCLUDE_DIR" >> ${B}/gcc/defaults.h.new
+	echo "#define STANDARD_INCLUDE_DIR \"${SYSTEMHEADERS}\"" >> ${B}/gcc/defaults.h.new
+	echo "#endif" >> ${B}/gcc/defaults.h.new
+	echo "#ifndef STANDARD_STARTFILE_PREFIX_1" >> ${B}/gcc/defaults.h.new
+	echo "#define STANDARD_STARTFILE_PREFIX_1 \"${SYSTEMLIBS}\"" >> ${B}/gcc/defaults.h.new
+	echo "#endif" >> ${B}/gcc/defaults.h.new
+	echo "#ifndef STANDARD_STARTFILE_PREFIX_2" >> ${B}/gcc/defaults.h.new
+	echo "#define STANDARD_STARTFILE_PREFIX_2 \"${SYSTEMLIBS1}\"" >> ${B}/gcc/defaults.h.new
+	echo "#endif" >> ${B}/gcc/defaults.h.new
+	echo "#endif /* ! GCC_DEFAULTS_H */" >> ${B}/gcc/defaults.h.new
+	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
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
-- 
1.7.1



