Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qo5Yz-0001m1-LY
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 05:22:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2011 20:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,304,1309762800"; d="scan'208";a="34780060"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2011 20:18:15 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 11:20:16 +0800
Message-Id: <b0597a93a5a64161e4f264e039e9cc546ebc38cc.1312254789.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <405488d8e6aba944a745f7cf807e20b8ac87872d.1312254789.git.lianhao.lu@intel.com>
References: <405488d8e6aba944a745f7cf807e20b8ac87872d.1312254789.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312254789.git.lianhao.lu@intel.com>
References: <cover.1312254789.git.lianhao.lu@intel.com>
Subject: [PATCH 2/3] eglibc: Modify ldd script according to multilib config.
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
X-List-Received-Date: Tue, 02 Aug 2011 03:22:38 -0000

Part fix of [YOCTO #1236].

1. Collect all the values for RTLDLIST for the current multilib
configuration to modify the ldd scripts.

2. Collect all the values for KNOWN_INTERPRETER_NAMES for the current
multilib configuration.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/utils.bbclass              |   10 ++----
 meta/recipes-core/eglibc/eglibc-ld.inc  |   49 +++++++++++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc     |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb |    6 +++-
 4 files changed, 58 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index f8adaea..ef4d8fb 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -361,13 +361,9 @@ def all_multilib_tune_values(d, var, unique=True):
 	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
 	for item in variants.split():
 		localdata = bb.data.createCopy(d)
-		#Fix ME. OVERRIDES not work, we have to set DEFAULTTUNE to TUNENAME
-		#overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-		#localdata.setVar("OVERRIDES", overrides)
-		if localdata.getVar("BBEXTENDVARIANT", True) == item:
-			tunename=localdata.getVar("TUNENAME", False) or ""
-		else:
-			tunename=localdata.getVar("TUNENAME_virtclass-multilib-" + item, False) or ""
+		overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+		localdata.setVar("OVERRIDES", overrides)
+		tunename=localdata.getVar("TUNENAME_virtclass-multilib-" + item, False) or localdata.getVar("TUNENAME", False) or ""
 		if tunename != "":
 			localdata.setVar("DEFAULTTUNE", tunename)
 		value = localdata.getVar(var, True) or ""
diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc b/meta/recipes-core/eglibc/eglibc-ld.inc
new file mode 100644
index 0000000..235ba6c
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-ld.inc
@@ -0,0 +1,49 @@
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
+	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+	for item in variants.split():
+		localdata = bb.data.createCopy(d)
+		overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+		localdata.setVar("OVERRIDES", overrides)
+		tunename=localdata.getVar("TUNENAME_virtclass-multilib-" + item, False) or localdata.getVar("TUNENAME", False) or ""
+		if tunename != "":
+			localdata.setVar("DEFAULTTUNE", tunename)
+			ld_append_if_tune_exists(localdata, infos, ld_info_all)
+	
+	infos['ldconfig'] = ','.join(infos['ldconfig'])
+	infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
+	return infos
+
+EGLIBC_KNOWN_INTERPRETER_NAMES = "${@eglibc_dl_info(d)['ldconfig']}"
+RTLDLIST = "${@eglibc_dl_info(d)['lddrewrite']}"
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 1b2e630..0ed4359 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -1,4 +1,5 @@
 require eglibc-common.inc
+require eglibc-ld.inc
 
 STAGINGCC = "gcc-cross-intermediate"
 STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 41fe7c7..b1bfbf1 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r9"
+PR = "r10"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -199,6 +199,10 @@ do_compile () {
 			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
 		done
 	)
+
+	echo "Adjust dynamic loader list to ${EGLIBC_DYNAMIC_LOADERS}"
+	[ -z "${RTLDLIST}" ] && return
+	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\).*$#\1"${RTLDLIST}"#'
 }
 
 require eglibc-package.inc
-- 
1.7.0.4



