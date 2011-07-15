Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhiKm-0006g7-5Z
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:21:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2011 06:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,535,1304319600"; d="scan'208";a="28373923"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2011 06:17:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 14:17:18 +0100
Message-Id: <d80cbd0588059d397c293912467f67aeb460e9cb.1310735644.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310735644.git.paul.eggleton@linux.intel.com>
References: <cover.1310735644.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310735644.git.paul.eggleton@linux.intel.com>
References: <cover.1310735644.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes: remove obsolete classes
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
X-List-Received-Date: Fri, 15 Jul 2011 13:21:37 -0000

All of these classes are currently unused in oe-core and meta-oe; several
are no longer in use even in OE classic:

* base_srpm.bbclass
* ccdv.bbclass
* flow-lossage.bbclass
* patcher.bbclass
* singlemachine.bbclass
* tmake.bbclass
* xlibs.bbclass

patcher.bbclass and singlemachine.bbclass probably still work but it is
unlikely that anyone is still using them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base_srpm.bbclass     |   20 ---------
 meta/classes/ccdv.bbclass          |   21 ----------
 meta/classes/flow-lossage.bbclass  |    5 --
 meta/classes/patcher.bbclass       |    7 ---
 meta/classes/singlemachine.bbclass |   15 -------
 meta/classes/tmake.bbclass         |   77 ------------------------------------
 meta/classes/xlibs.bbclass         |    7 ---
 7 files changed, 0 insertions(+), 152 deletions(-)
 delete mode 100644 meta/classes/base_srpm.bbclass
 delete mode 100644 meta/classes/ccdv.bbclass
 delete mode 100644 meta/classes/flow-lossage.bbclass
 delete mode 100644 meta/classes/patcher.bbclass
 delete mode 100644 meta/classes/singlemachine.bbclass
 delete mode 100644 meta/classes/tmake.bbclass
 delete mode 100644 meta/classes/xlibs.bbclass

diff --git a/meta/classes/base_srpm.bbclass b/meta/classes/base_srpm.bbclass
deleted file mode 100644
index aea6335..0000000
--- a/meta/classes/base_srpm.bbclass
+++ /dev/null
@@ -1,20 +0,0 @@
-inherit base package rpm_core
-
-SPECFILE="${RPMBUILDPATH}/SPECS/${PN}.spec"
-
-base_srpm_do_unpack() {
-	test -e ${SRPMFILE} || die "Source rpm \"${SRPMFILE}\"does not exist"
-	if ! test -e ${SPECFILE}; then
-		${RPM} -i ${SRPMFILE}
-	fi
-	test -e ${SPECFILE} || die "Spec file \"${SPECFILE}\" does not exist"
-	${RPMBUILD} -bp ${SPECFILE}
-}
-
-base_srpm_do_compile() {
-	${RPMBUILD} -bc ${SPECFILE}
-}
-
-base_srpm_do_install() {
-	${RPMBUILD} -bi ${SPECFILE}
-}
diff --git a/meta/classes/ccdv.bbclass b/meta/classes/ccdv.bbclass
deleted file mode 100644
index 8c8306c..0000000
--- a/meta/classes/ccdv.bbclass
+++ /dev/null
@@ -1,21 +0,0 @@
-python () {
-    if bb.data.getVar('PN', d, 1) in ['ccdv-native']:
-        if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, 1):
-            bb.data.setVar("DEPENDS", '%s %s' % ("ccdv-native", bb.data.getVar("DEPENDS", d, 1) or ""), d)
-            bb.data.setVar("CC", '%s %s' % ("ccdv", bb.data.getVar("CC", d, 1) or ""), d)
-            bb.data.setVar("BUILD_CC", '%s %s' % ("ccdv", bb.data.getVar("BUILD_CC", d, 1) or ""), d)
-            bb.data.setVar("CCLD", '%s %s' % ("ccdv", bb.data.getVar("CCLD", d, 1) or ""), d)
-}
-
-def quiet_libtool(bb,d):
-	deps = (bb.data.getVar('DEPENDS', d, 1) or "").split()
-	if 'libtool-cross' in deps:
-		return "'LIBTOOL=${STAGING_BINDIR_NATIVE}/${HOST_SYS}-libtool --silent'"
-	elif 'libtool-native' in deps:
-		return "'LIBTOOL=${B}/${HOST_SYS}-libtool --silent'"
-	else:
-		return ""
-
-CCDV = "ccdv"
-EXTRA_OEMAKE_append = " ${@quiet_libtool(bb,d)}"
-MAKE += "-s"
diff --git a/meta/classes/flow-lossage.bbclass b/meta/classes/flow-lossage.bbclass
deleted file mode 100644
index 00e6bf0..0000000
--- a/meta/classes/flow-lossage.bbclass
+++ /dev/null
@@ -1,5 +0,0 @@
-# gcc-3.4 blows up in gtktext with -frename-registers on arm-linux
-python () {
-    cflags = (bb.data.getVar('CFLAGS', d, 1) or '').replace('-frename-registers', '')
-    bb.data.setVar('CFLAGS', cflags, d)
-}
diff --git a/meta/classes/patcher.bbclass b/meta/classes/patcher.bbclass
deleted file mode 100644
index c8a1b03..0000000
--- a/meta/classes/patcher.bbclass
+++ /dev/null
@@ -1,7 +0,0 @@
-# Now that BitBake/OpenEmbedded uses Quilt by default, you can simply add an
-#	inherit patcher
-# to one of your config files to let BB/OE use patcher again.
-
-PATCHCLEANCMD = "patcher -B"
-PATCHCMD = "patcher -R -p '%s' -n '%s' -i '%s'"
-PATCH_DEPENDS = "${@["patcher-native", ""][(bb.data.getVar('PN', d, 1) == 'patcher-native')]}"
diff --git a/meta/classes/singlemachine.bbclass b/meta/classes/singlemachine.bbclass
deleted file mode 100644
index c685ce3..0000000
--- a/meta/classes/singlemachine.bbclass
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Emulates the old mode of OE operation where only one machine can be targetted.
-#
-
-MULTIMACH_TARGET_SYS = "${TARGET_SYS}"
-MULTIMACH_HOST_SYS = "${HOST_SYS}"
-
-STAMP = "${TMPDIR}/stamps/${PF}"
-WORKDIR = "${TMPDIR}/work/${PF}"
-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}"
-STAGING_DIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}"
-PKGDATA_DIR = "${STAGING_DIR}/pkgdata"
-STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
- 
-
diff --git a/meta/classes/tmake.bbclass b/meta/classes/tmake.bbclass
deleted file mode 100644
index dbd0bf2..0000000
--- a/meta/classes/tmake.bbclass
+++ /dev/null
@@ -1,77 +0,0 @@
-DEPENDS_prepend="tmake "
-
-python tmake_do_createpro() {
-	import glob, sys
-	from bb import note
-	out_vartranslate = {
-		"TMAKE_HEADERS": "HEADERS",
-		"TMAKE_INTERFACES": "INTERFACES",
-		"TMAKE_TEMPLATE": "TEMPLATE",
-		"TMAKE_CONFIG": "CONFIG",
-		"TMAKE_DESTDIR": "DESTDIR",
-		"TMAKE_SOURCES": "SOURCES",
-		"TMAKE_DEPENDPATH": "DEPENDPATH",
-		"TMAKE_INCLUDEPATH": "INCLUDEPATH",
-		"TMAKE_TARGET": "TARGET",
-		"TMAKE_LIBS": "LIBS",
-	}
-	s = data.getVar('S', d, 1) or ""
-	os.chdir(s)
-	profiles = (data.getVar('TMAKE_PROFILES', d, 1) or "").split()
-	if not profiles:
-		profiles = ["*.pro"]
-	for pro in profiles:
-		ppro = glob.glob(pro)
-		if ppro:
-			if ppro != [pro]:
-				del profiles[profiles.index(pro)]
-				profiles += ppro
-				continue
-			if ppro[0].find('*'):
-				del profiles[profiles.index(pro)]
-				continue
-		else:
-			del profiles[profiles.index(pro)]
-	if len(profiles) != 0:
-		return
-
-	# output .pro using this metadata store
-	try:
-		from __builtin__ import file
-		profile = file(data.expand('${PN}.pro', d), 'w')
-	except OSError:
-		raise FuncFailed("unable to open pro file for writing.")
-
-#	fd = sys.__stdout__
-	fd = profile
-	for var in out_vartranslate.keys():
-		val = data.getVar(var, d, 1)
-		if val:
-			fd.write("%s\t: %s\n" % (out_vartranslate[var], val))
-
-#	if fd is not sys.__stdout__:
-	fd.close()
-}
-
-tmake_do_configure() {
-	paths="${STAGING_DATADIR}/tmake/qws/${TARGET_OS}-${TARGET_ARCH}-g++ ${STAGING_DATADIR}/tmake/$OS-g++"
-	if (echo "${TARGET_ARCH}"|grep -q 'i.86'); then
-		paths="${STAGING_DATADIR}/tmake/qws/${TARGET_OS}-x86-g++ $paths"
-	fi
-	for i in $paths; do
-		if test -e $i; then
-			export TMAKEPATH=$i
-			break
-		fi
-	done
-
-	if [ -z "${TMAKE_PROFILES}" ]; then
-		TMAKE_PROFILES="`ls *.pro`"
-	fi
-	tmake -o Makefile $TMAKE_PROFILES || die "Error calling tmake on ${TMAKE_PROFILES}"
-}
-
-EXPORT_FUNCTIONS do_configure do_createpro
-
-addtask configure after do_unpack do_patch before do_compile
-addtask createpro before do_configure after do_unpack do_patch
diff --git a/meta/classes/xlibs.bbclass b/meta/classes/xlibs.bbclass
deleted file mode 100644
index 7271d7b..0000000
--- a/meta/classes/xlibs.bbclass
+++ /dev/null
@@ -1,7 +0,0 @@
-LICENSE= "BSD-X"
-SECTION = "x11/libs"
-
-XLIBS_CVS = "${FREEDESKTOP_CVS}/xlibs"
-
-inherit autotools pkgconfig
-
-- 
1.7.4.1



