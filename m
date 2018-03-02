Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 562DA788F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 04:44:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 20:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,409,1515484800"; d="scan'208";a="22246124"
Received: from anmitta2-mobl1.png.intel.com ([10.221.22.4])
	by orsmga006.jf.intel.com with ESMTP; 01 Mar 2018 20:44:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:44:17 +0800
Message-Id: <1519965857-14794-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519965857-14794-1-git-send-email-anuj.mittal@intel.com>
References: <1519965857-14794-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 2/2] perf: enable support for libaudit
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
X-List-Received-Date: Fri, 02 Mar 2018 04:44:26 -0000

perf needs audit-python to be able to show syscall names and for
'perf trace' to work.

Enable dependency on audit-python if present in PACKAGECONFIG. It's
disabled by default since audit as of now is in meta-selinux.

Fixes [YOCTO #3343]
Fixes [YOCTO #3358]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d798492..abd9290 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -12,7 +12,7 @@ LICENSE = "GPLv2"
 PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1,perl python"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
@@ -22,6 +22,10 @@ PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
 PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 
+# libaudit support needs python to be present
+PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit python"
+PACKAGECONFIG_CONFARGS += "${@bb.utils.contains_any('PACKAGECONFIG', 'scripting audit', '', 'NO_LIBPYTHON=1', d)}"
+
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
@@ -38,7 +42,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
+inherit ${@bb.utils.contains_any('PACKAGECONFIG', 'scripting audit', 'pythonnative', '', d)}
 inherit python-dir
 export PYTHON_SITEPACKAGES_DIR
 
@@ -111,7 +115,7 @@ do_install() {
 	unset CFLAGS
 	oe_runmake install
 	# we are checking for this make target to be compatible with older perf versions
-	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
+	if ${@bb.utils.contains_any('PACKAGECONFIG', 'scripting audit', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
 		oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
@@ -216,7 +220,7 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-doc += "man"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python python-modules"
+RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python"
 
-- 
2.7.4


