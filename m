Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 31D6373204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:04:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 31 Aug 2016 04:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; d="scan'208";a="872948281"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 31 Aug 2016 04:04:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 40D826A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 04:03:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 14:02:54 +0300
Message-Id: <c131674e14272392623937d4ed8f4dc619ef8818.1472641071.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472641071.git.ed.bartosh@linux.intel.com>
References: <cover.1472641071.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472641071.git.ed.bartosh@linux.intel.com>
References: <cover.1472641071.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 5/6] populate_sdk_base: put populate_sdk under sstate control
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
X-List-Received-Date: Wed, 31 Aug 2016 11:04:18 -0000

Adding populate_sdk task to SSTATE_TASKS should make sstate machinery
to generate manifest for deployed sdk artifacts and do final deployment
to SDK_DEPLOY.

Set stamp-extra-info flag for do_populate_sdk task. This flag is used
in the name of sstate manifest. Setting it to predetermined value for
populate_sdk task should help to get correct manifest filenames when
processing runQueueTask events.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 1b9aafc..40743a2 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -26,7 +26,7 @@ SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
-DEPLOYDIR = "${SDK_DEPLOY}"
+DEPLOYDIR = "${WORKDIR}/deploy-${PN}-populate-sdk"
 
 B_task-populate-sdk = "${SDK_DIR}"
 
@@ -117,6 +117,11 @@ fakeroot python do_populate_sdk() {
 
     populate_sdk(d)
 }
+SSTATETASKS += "do_populate_sdk"
+SSTATE_SKIP_CREATION_task-populate-sdk = '1'
+do_populate_sdk[sstate-inputdirs] = "${DEPLOYDIR}"
+do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
+do_populate_sdk[stamp-extra-info] = "${MACHINE}"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-- 
2.1.4


