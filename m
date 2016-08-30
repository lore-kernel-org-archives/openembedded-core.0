Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 40EA073219
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 30 Aug 2016 02:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="1022174817"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2016 02:31:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id D3C2D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:31:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:50 +0300
Message-Id: <313b9f5227fb9ebee516d5a26523804ed537b650.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 17/18] image: populate_sdk_base: set stamp-extra-info flag
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:23 -0000

This flag is used in the name of sstate manifest.

Setting it to predetermined value for image_complete and populate_sdk
tasks should help to get correct manifest filenames when processing
runQueueTask events.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass             | 1 +
 meta/classes/populate_sdk_base.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8e84b1b..49fe500 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -280,6 +280,7 @@ do_image_complete[dirs] = "${TOPDIR}"
 do_image_complete[umask] = "022"
 do_image_complete[sstate-inputdirs] = "${DEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_image_complete[stamp-extra-info] = "${MACHINE}"
 addtask do_image_complete after do_image before do_build
 
 # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 1914a3b..ede3a7b 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -122,6 +122,7 @@ fakeroot python do_populate_sdk() {
 
 do_populate_sdk[sstate-inputdirs] = "${DEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
+do_populate_sdk[stamp-extra-info] = "${MACHINE}"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-- 
2.1.4


