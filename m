Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPZ7h-0006Dc-AL
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:53:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 May 2011 04:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="2225561"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by azsmga001.ch.intel.com with ESMTP; 26 May 2011 04:49:41 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 19:55:31 +0800
Message-Id: <a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306401007.git.lianhao.lu@intel.com>
References: <cover.1306401007.git.lianhao.lu@intel.com>
Subject: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 26 May 2011 11:53:05 -0000

1. change BB_SIGNATURE_HANDLER from basic to basichash.

2. Added following variables for PR service:
USE_PR_SERV: flag of whether to use the network PR service
PRAUTOINX: search index for the network PR service
PKGV/PKGR: version and revision used in package feed

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/bitbake.conf |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 35fd6f8..06f5fd6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -153,9 +153,17 @@ PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
 EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
-EXTENDPV = "${EXTENDPEVER}${PV}-${PR}"
+EXTENDPV = "${EXTENDPEVER}${PV}-${PKGR}"
 P = "${PN}-${PV}"
 
+EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][bb.data.getVar('PRAUTO',d,1) is None]}"
+PRAUTOINX = "${PF}${DISTRO_PR}"
+
+PKGV ?= "${PV}"
+PKGR ?= "${PR}${DISTRO_PR}${EXTENDPRAUTO}"
+EXTENDPKGVER = "${@['','${PKGE\x7d:'][bb.data.getVar('PKGE',d,1) > 0]}"
+EXTENDPKGV ?= "${EXTENDPKGVER}${PKGV}-${PKGR}"
+
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
@@ -163,6 +171,11 @@ SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk
 BPN = "${@base_prune_suffix(bb.data.getVar('PN', d, True), bb.data.getVar('SPECIAL_PKGSUFFIX', d, True).split(), d)}"
 BP = "${BPN}-${PV}"
 
+#
+# network based PR service
+#
+USE_PR_SERV = "${@[1,0][(bb.data.getVar('PRSERV_HOST',d,1) is None) or (bb.data.getVar('PRSERV_PORT',d,1) is None)]}"
+
 # Package info.
 
 SECTION = "base"
@@ -649,6 +662,7 @@ PCMCIA_MANAGER ?= "pcmcia-cs"
 DEFAULT_TASK_PROVIDER ?= "task-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
+DISTRO_PR ?= ''
 
 # Forcefully set CACHE now so future changes to things like 
 # MACHINE don't change the path to the cache
@@ -707,7 +721,7 @@ DISTRO[unexport] = "1"
 TRANSLATED_TARGET_ARCH ??= ${TARGET_ARCH}
 
 # Setup our default hash policy
-BB_SIGNATURE_HANDLER ?= "basic"
+BB_SIGNATURE_HANDLER ?= "basichash"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
-- 
1.7.0.4



