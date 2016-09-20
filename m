Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A1B1960796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 14:57:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 20 Sep 2016 07:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,368,1470726000"; d="scan'208";a="1033708781"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.28.201])
	by orsmga001.jf.intel.com with ESMTP; 20 Sep 2016 07:57:15 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2016 15:57:10 +0100
Message-Id: <1474383430-18324-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] populate_sdk_base: fix support for changing SDKMACHINE settings
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
X-List-Received-Date: Tue, 20 Sep 2016 14:57:15 -0000

Include SDKMACHINE in the tasks stamp information and the name of
the sstate-inputdirs so that changing SDKMACHINE doesn't result in
valid output of the task being deleted when SDKMACHINE is changed.

Without this patch changing SDKMACHINE and building an SDK resulted
in toolchain installers for other  SDKMACHINE's being deleted from
the deploy directoy.

[YOCTO #10275]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6fe0b37..fc4ee8d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -26,7 +26,7 @@ SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
-SDKDEPLOYDIR = "${WORKDIR}/deploy-${PN}-populate-sdk"
+SDKDEPLOYDIR = "${WORKDIR}/${SDKMACHINE}-deploy-${PN}-populate-sdk"
 
 B_task-populate-sdk = "${SDK_DIR}"
 
@@ -125,7 +125,7 @@ SSTATE_SKIP_CREATION_task-populate-sdk = '1'
 do_populate_sdk[cleandirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
-do_populate_sdk[stamp-extra-info] = "${MACHINE}"
+do_populate_sdk[stamp-extra-info] = "${MACHINE} ${SDKMACHINE}"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-- 
2.7.4


