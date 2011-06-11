Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QVIYM-0007KT-OF
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 09:24:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5B7KuaL026577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 00:20:56 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 11 Jun 2011 00:20:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 15:19:42 +0800
Message-ID: <5725a484a4e11d5893b7fdedfe8dad8e7ff33019.1307774199.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1307774199.git.liezhi.yang@windriver.com>
References: <cover.1307774199.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Share gcc work directories
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
X-List-Received-Date: Sat, 11 Jun 2011 07:24:19 -0000
Content-Type: text/plain

This patched is derived from Richard, make gcc use the shared source
directory during the different building:

1) Make gcc-cross, gcc-cross-initial, gcc-cross-intermediate and
   gcc-runtime share the same source directory.

2) The source directory is ${TMPDIR}/work-shared/gcc-${PV}, for example:
   tmp/work-shared/gcc-4.6.0

3) gcc uses sed and creates config files against ${S} which means the
   directory should not be shared. Change the way to make it work.

4) Fix do_clean to clean the shared source directory and stamps

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           |   32 ++++++++++++++++++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   10 +++++-
 2 files changed, 39 insertions(+), 3 deletions(-)

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
index f7b5836..c32242d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -87,7 +87,15 @@ do_configure () {
 	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 	
-	# teach gcc to find correct target includedir when checking libc ssp support
+	# teach gcc to find correct target includedir when checking libc ssp support,
+	# save the files before hack them, so that we can always hack the fresh one.
+	for i in configure.ac Makefile.in defaults.h configure; do
+		[ ! -f ${S}/gcc/$i.orig ] && cp ${S}/gcc/$i ${S}/gcc/$i.orig
+		cp ${S}/gcc/$i.orig ${S}/gcc/$i
+	done
+	# Make sure that ${S}/configure is newer than ${S}/gcc/configure to prevent
+	# auto run autoconf.
+	touch ${S}/configure
 	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure.ac
 	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure
 
-- 
1.7.1



