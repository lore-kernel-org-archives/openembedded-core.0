Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qrpe0-0001o2-5g
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 13:11:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Aug 2011 04:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,361,1309762800"; 
   d="scan'208";a="6485552"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Aug 2011 04:06:42 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 19:08:08 +0800
Message-Id: <97c4024de968587057456dccd19c1949e062bd79.1313146924.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <072a8b51ac04e8a2b58246cd4eedff3b6e8befd2.1313146924.git.lianhao.lu@intel.com>
References: <072a8b51ac04e8a2b58246cd4eedff3b6e8befd2.1313146924.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313146924.git.lianhao.lu@intel.com>
References: <cover.1313146924.git.lianhao.lu@intel.com>
Subject: [PATCH v2 BUG #1236 2/2] eglibc: Modify ldd script according to multilib config.
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
X-List-Received-Date: Fri, 12 Aug 2011 11:11:17 -0000

Bug fixing [YOCTO #1236].

1. Collect all the values for RTLDLIST for the current multilib
configuration to modify the ldd scripts.

2. Collect all the values for KNOWN_INTERPRETER_NAMES for the current
multilib configuration. Set the correct ld.so names for ldconfig to deal
with the multilib configuration.
---
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 ++++++
 meta/recipes-core/eglibc/eglibc-ld.inc             |   54 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc                |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   13 ++++-
 4 files changed, 84 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc

diff --git a/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
new file mode 100644
index 0000000..1542b1b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Replace the OECORE_KNOWN_INTERPRETER_NAMES with the value of 
+variable EGLIBC_KNOWN_INTERPRETER_NAMES.
+
+Lianhao Lu, 08/01/2011
+
+--- libc/elf/readlib.c.orig	2011-08-12 17:05:51.864470837 +0800
++++ libc/elf/readlib.c	2011-08-12 17:06:39.346942074 +0800
+@@ -52,6 +52,7 @@
+ #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
+   SYSDEP_KNOWN_INTERPRETER_NAMES
+ #endif
++  OECORE_KNOWN_INTERPRETER_NAMES
+ };
+ 
+ static struct known_names known_libs[] =
diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc b/meta/recipes-core/eglibc/eglibc-ld.inc
new file mode 100644
index 0000000..b3eb46e
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-ld.inc
@@ -0,0 +1,54 @@
+def ld_append_if_tune_exists(d, infos, dict):
+	tune = d.getVar("DEFAULTTUNE", True) or ""
+	libdir = d.getVar("base_libdir", True) or ""
+	if dict.has_key(tune):
+		infos['ldconfig'].add('{"' + libdir + '/' + dict[tune][0] + '",' + dict[tune][1] + ' }')
+		infos['lddrewrite'].add(libdir+'/'+dict[tune][0])
+
+def eglibc_dl_info(d):
+	ld_info_all = {
+		"mips": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mipsel": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64el-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"mips64el-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
+		"powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
+		"powerpc64-nf": ["ld64.so.1", "FLAG_ELF_LIBC6"],
+		"core2": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
+		"core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
+		"x86": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
+		"x86-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
+		"i586": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
+	}
+
+	infos = {'ldconfig':set(), 'lddrewrite':set()}
+	ld_append_if_tune_exists(d, infos, ld_info_all)
+
+	#DEFAULTTUNE_MULTILIB_ORIGINAL
+	original_tune=d.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL",True)
+	if original_tune:
+		localdata = bb.data.createCopy(d)
+		localdata.setVar("DEFAULTTUNE", original_tune)
+		ld_append_if_tune_exists(localdata, infos, ld_info_all)
+
+	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+	for item in variants.split():
+		localdata = bb.data.createCopy(d)
+		overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+		localdata.setVar("OVERRIDES", overrides)
+		bb.data.update_data(localdata)
+		ld_append_if_tune_exists(localdata, infos, ld_info_all)
+	infos['ldconfig'] = ','.join(infos['ldconfig'])
+	infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
+	return infos
+
+EGLIBC_KNOWN_INTERPRETER_NAMES = "${@eglibc_dl_info(d)['ldconfig']}"
+RTLDLIST = "${@eglibc_dl_info(d)['lddrewrite']}"
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 9088d02..fe9f8ba 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -1,4 +1,5 @@
 require eglibc-common.inc
+require eglibc-ld.inc
 
 STAGINGCC = "gcc-cross-intermediate"
 STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 915eb32..f382448 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r12"
+PR = "r13"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -18,6 +18,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://generate-supported.mk \
            file://glibc_bug_fix_12454.patch \
            file://ppc-sqrt.patch \
+           file://multilib_readlib.patch \
 	   "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
@@ -83,6 +84,7 @@ do_move_ports() {
 
 do_patch_append() {
 	bb.build.exec_func('do_fix_ia_headers', d)
+	bb.build.exec_func('do_fix_readlib_c', d)
 }
 
 # We need to ensure that all of the i386 and x86_64 headers are identical
@@ -172,6 +174,10 @@ do_fix_ia_headers() {
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/user.h ${S}/sysdeps/unix/sysv/linux/i386/sys/user.h
 }
 
+do_fix_readlib_c () {
+	sed -i -e 's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_NAMES}#' ${S}/elf/readlib.c
+}
+
 do_configure () {
 # override this function to avoid the autoconf/automake/aclocal/autoheader
 # calls for now
@@ -201,6 +207,11 @@ do_compile () {
 			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
 		done
 	)
+	echo "Adjust ldd script"
+	[ -z "${RTLDLIST}" ] && return
+	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
+	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
+
 }
 
 require eglibc-package.inc
-- 
1.7.0.4



