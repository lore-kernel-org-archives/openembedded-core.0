Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QN0Sv-000623-5A
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:28:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 May 2011 03:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,236,1304319600"; d="scan'208";a="438964513"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2011 03:24:23 -0700
Message-Id: <439b9cfa6032b7c51b326a7cf888d83fd55d1305.1305800693.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Old-Date: Wed, 18 May 2011 21:06:01 +0800
Date: Thu, 19 May 2011 18:29:25 +0800
To: openembedded-core@lists.openembedded.org
From: Lianhao Lu <lianhao.lu@intel.com>
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
X-List-Received-Date: Thu, 19 May 2011 10:28:25 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

1. change BB_SIGNATURE_HANDLER from basic to basichash.

2. Added following variables for PR service:
USE_PR_SERV: flag of whether to use the network PR service
PRFORMAT: format of revision to be used in tasks package_write_xxx.
PRAUTOINX: search index for the network PR service

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/bitbake.conf |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0af672..381f301 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -153,8 +153,13 @@ PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
 EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
-EXTENDPV = "${EXTENDPEVER}${PV}-${PR}"
+EXTENDPV = "${EXTENDPEVER}${PV}-${PRFORMAT}"
 P = "${PN}-${PV}"
+EXTENDPREXTRA = "${@['.${PREXTRA\x7d',''][bb.data.getVar('PREXTRA',d,1) is None]}"
+EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][bb.data.getVar('PRAUTO',d,1) is None]}"
+PRAUTOINX = "${PF}${EXTENDPREXTRA}"
+PRFORMAT = "${PR}${EXTENDPREXTRA}${EXTENDPRAUTO}"
+
 
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
@@ -163,6 +168,11 @@ SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk
 BPN = "${@base_prune_suffix(bb.data.getVar('PN', d, True), bb.data.getVar('SPECIAL_PKGSUFFIX', d, True).split(), d)}"
 BP = "${BPN}-${PV}"
 
+#
+# network based PR service
+#
+USE_PR_SERV = "${@[1,0][(bb.data.getVar('PRSERV_HOST',d,1) is None) or (bb.data.getVar('PRSERV_PORT',d,1) is None)]}"
+
 # Package info.
 
 SECTION = "base"
@@ -707,7 +717,7 @@ DISTRO[unexport] = "1"
 TRANSLATED_TARGET_ARCH ??= ${TARGET_ARCH}
 
 # Setup our default hash policy
-BB_SIGNATURE_HANDLER ?= "basic"
+BB_SIGNATURE_HANDLER ?= "basichash"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
-- 
1.7.0.4



