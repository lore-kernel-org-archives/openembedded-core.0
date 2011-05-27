Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqYB-0003fP-40
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 23:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="9785641"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 23:26:28 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:46 +0800
Message-Id: <abf0f702d8f1cd1d9c02c9a6ae0fd6ffa198ce2b.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 02/11] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Fri, 27 May 2011 06:29:36 -0000

1. change BB_SIGNATURE_HANDLER from basic to basichash.

2. Added following variables for PR service:
USE_PR_SERV: flag of whether to use the network PR service
PRAUTOINX: search index for the network PR service
PKGE/PKGV/PKGR: epoch, version and revision used in package feed.
EXTENDPKGV: full package version string used in package relationships.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/bitbake.conf |   23 +++++++++++++++++++----
 1 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d307385..4fcf4f6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -153,9 +153,18 @@ PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
 EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
-EXTENDPV = "${EXTENDPEVER}${PV}-${PR}"
+EXTENDPV = "${EXTENDPEVER}${PV}-${PR}{DISTRO_PR}"
 P = "${PN}-${PV}"
 
+EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][bb.data.getVar('PRAUTO',d,1) is None]}"
+PRAUTOINX = "${PF}${DISTRO_PR}"
+
+PKGV ?= "${PV}"
+PKGR ?= "${PR}${DISTRO_PR}${EXTENDPRAUTO}"
+PKGE ?= "${@['','${PE\x7d'][bb.data.getVar('PE',d,1) > 0]}"
+EXTENDPKGEVER = "${@['','${PKGE\x7d:'][bb.data.getVar('PKGE',d,1).strip() != '']}"
+EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
+
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
@@ -163,6 +172,11 @@ SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk
 BPN = "${@base_prune_suffix(bb.data.getVar('PN', d, True), bb.data.getVar('SPECIAL_PKGSUFFIX', d, True).split(), d)}"
 BP = "${BPN}-${PV}"
 
+#
+# network based PR service
+#
+USE_PR_SERV = "${@[1,0][(bb.data.getVar('PRSERV_HOST',d,1) is None) or (bb.data.getVar('PRSERV_PORT',d,1) is None)]}"
+
 # Package info.
 
 SECTION = "base"
@@ -241,7 +255,7 @@ FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
                 ${base_libdir}/*.a ${base_libdir}/*.o"
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
-RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPV})"
+RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
 
 DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
             ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${PN}/.debug \
@@ -253,7 +267,7 @@ FILES_${PN}-dbg = "${@bb.data.getVar(['DOTDEBUG-dbg', 'DEBUGFILEDIRECTORY-dbg'][
 
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
-RRECOMMENDS_${PN}-dbg = "${PN} (= ${EXTENDPV})"
+RRECOMMENDS_${PN}-dbg = "${PN} (= ${EXTENDPKGV})"
 
 FILES_${PN}-locale = "${datadir}/locale"
 
@@ -650,6 +664,7 @@ PCMCIA_MANAGER ?= "pcmcia-cs"
 DEFAULT_TASK_PROVIDER ?= "task-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
+DISTRO_PR ?= ''
 
 # Forcefully set CACHE now so future changes to things like 
 # MACHINE don't change the path to the cache
@@ -708,7 +723,7 @@ DISTRO[unexport] = "1"
 TRANSLATED_TARGET_ARCH ??= ${TARGET_ARCH}
 
 # Setup our default hash policy
-BB_SIGNATURE_HANDLER ?= "basic"
+BB_SIGNATURE_HANDLER ?= "basichash"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
-- 
1.7.0.4



